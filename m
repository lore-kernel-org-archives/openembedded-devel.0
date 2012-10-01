Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhLy-0008LI-P3
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:14 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so2963566wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=A+XbC8tlpI95NgJ3jxqSiyktTEC5JHdxwwHNvIE9pk4=;
	b=Ic/lv8ImB6LQCV+Be9Hzjgf0Jf94h/GB6H5Ql/Qsujf80SKUPpnHzIH93EEZQ4iXto
	FI8MbvopHz5M1K8cnxV3dKl9emMpEaHd3EiJK1lhj1wdXfow4G6RQXBQyDSY6vWwZMH/
	q7iy2hT7iuD79Z6bKrpUXWUxtlLZQPoxgGETi/MQZhGqb+7Yz0xu5Rztfl1oK5VGJZOn
	JwaH2fcVugEahM6cmz/f2AxI73sypo8JtfK55Ksz7NZWm2IC7JYa4bEysHijfu4rs5nc
	fsOS3AZPA/QmKxDo4XGYBn9eXXvrMj/9CFTthtSp9spsvlz+cdZfwO0Xngqb4hmOhAoJ
	CEng==
Received: by 10.180.107.163 with SMTP id hd3mr15115238wib.19.1349102360014;
	Mon, 01 Oct 2012 07:39:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm18944613wiy.11.2012.10.01.07.39.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:47 +0200
Message-Id: <ba6d1aa39be7e2e50dbe05397e817c2070e31c41.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] azy: fix do_configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 14:52:14 -0000

* something changed in override/prepend expansion and azy-native now had do_configure_prepend applied too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index 0b333ae..a7889d6 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -12,16 +12,17 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += " --disable-mysql-tests"
 
-do_configure_prepend() {
+do_configure_class-target() {
   sed -i "s#\./lemon#${STAGING_BINDIR_NATIVE}/lemon#g" ${S}/src/bin/Makefile.am
   sed -i "s#\$(top_builddir)/src/bin/azy_parser -H -p -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g" ${S}/src/tests/Makefile.am
   sed -i "s#\$(top_builddir)/src/bin/azy_parser -eHn -m#${STAGING_BINDIR_NATIVE}/azy_parser -eHn -m#g" ${S}/src/tests/identi.ca/Makefile.am
+  efl_do_configure
 }
-do_configure_virtclass-native() {
+do_configure_class-native() {
   efl_do_configure
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
   install -d ${D}/${bindir}
   install -m 0755 ${S}/src/bin/lemon ${D}/${bindir}
 }
-- 
1.7.12



