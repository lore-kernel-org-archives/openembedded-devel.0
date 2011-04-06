Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7N1J-0003cL-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:19:18 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so888220fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Qjql1SCW5q21IjJR1Kh10ZKYBZQbZ+SJJgmOFbUYF38=;
	b=v/KyNsNaYIXzTcG6pnsjtoiRBesQpsHa6SK9Srs7P7dPi/dCHK5Mh15xfNozEVSHlJ
	skXPhgvL70Mkn6XXRgDgyjLl67PFB8JGEwUwu7GxOa/7aJCpKiECNMAvbi9fBwREM3PT
	mJiAAthkvrmNUM0c6ElIrc+y/EIrneiUB7v60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GFv+CvfWi740gyyxnezAZiZey4FLvLwg58Kf643/HSpwMkds6Q94D2l4zfM52VjQY7
	Qcb72cTZscZ9BwoEagVF8BggPG5+w6rYFBoY8TwUFXQLp8eVrDYNp92o3PjJiw7bmuxj
	ZX6LRPb5q2oVPCPQILeLhEVA6jegk+zv78x9Y=
Received: by 10.223.63.212 with SMTP id c20mr669873fai.37.1302074230082;
	Wed, 06 Apr 2011 00:17:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b18sm82086fak.8.2011.04.06.00.17.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:17:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:17:03 +0200
Message-Id: <013ae010f6f5ebf5356cbe484f424b2e19a93f56.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 8/8] azy: disable mysql tests
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
X-List-Received-Date: Wed, 06 Apr 2011 07:19:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index c7ee1f4..bd4268c 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -8,6 +8,8 @@ SRCREV = "${EFL_SRCREV}"
 # to provide native lemon binary
 BBCLASSEXTEND = "native"
 
+EXTRA_OECONF += " --disable-mysql-tests"
+
 do_configure_prepend() {
   sed -i "s#\./lemon#${STAGING_BINDIR_NATIVE}/lemon#g" ${S}/src/bin/Makefile.am
   sed -i "s#\$(top_builddir)/src/bin/azy_parser -H -p -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g" ${S}/src/tests/Makefile.am
-- 
1.7.4.1



