Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 57C1E73FFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:38:34 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so39140852wgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Bm+6p0ve6aa67nyIfx2iaEcx1c9r8GU0NkewMhfMnOo=;
	b=CCt5XSREWEdLtS2agrVl8mhUDv0n6oENijLWWqxWDDlBvErR7xuyKmitcvVwI1LHA4
	bKiPGo4DAe8hQtoDGUt5Hqa9jb0kq0NO81fz4W4jhJb8bge8EtGGpFiHyCTVyqBhU70Z
	jnUCYX6Q1VOBzkJyAN8667stc/rXqiOmP9vV4aRegCPzLvWuo45F9JnVh7DQ8KNNkEPo
	9OR3EDj7oTaxG0wmwTdYUkK5pKqVyZPKg8k6xLTMFfRRytsr5cJKroNuUHLrAl0Pe2FP
	Q3HBzexK5RB6st60guW6N4HhZ0S1lxNofM2rMypmJkyFvxbeGfT/zvcgVZXt0gMlC/oh
	zAOg==
X-Received: by 10.180.216.103 with SMTP id op7mr23093108wic.90.1431373115939; 
	Mon, 11 May 2015 12:38:35 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	vz8sm24253522wjc.27.2015.05.11.12.38.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 12:38:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:38:26 +0300
Message-Id: <1431373106-7016-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431373106-7016-1-git-send-email-dbaryshkov@gmail.com>
References: <1431373106-7016-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 3/3] obexpush: fix compilation error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 19:38:37 -0000

Newer glibc is strict on passing mode argument to open() call if O_CREAT
has been specified. Provide reasonable mode argument to fix compilation
error.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-support/obexpush/files/fix-open.patch | 18 ++++++++++++++++++
 recipes-support/obexpush/obexpush_1.0.0.bb    |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 recipes-support/obexpush/files/fix-open.patch

diff --git a/recipes-support/obexpush/files/fix-open.patch b/recipes-support/obexpush/files/fix-open.patch
new file mode 100644
index 0000000..1280daf
--- /dev/null
+++ b/recipes-support/obexpush/files/fix-open.patch
@@ -0,0 +1,18 @@
+Index: obexpush/opd/main.c
+===================================================================
+--- obexpush.orig/opd/main.c
++++ obexpush/opd/main.c
+@@ -562,11 +562,11 @@ int main(int argc, char **argv,char *env
+ 			dup2(fd, 0);
+ 			close(fd);
+ 
+-			fd = open("_opd_msgs.txt", O_RDWR | O_CREAT);
++			fd = open("_opd_msgs.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+ 			dup2(fd, 1);
+ 			close(fd);
+ 
+-			fd = open("_opd_errs.txt", O_RDWR | O_CREAT);
++			fd = open("_opd_errs.txt", O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
+ 			dup2(fd, 2);
+ 			close(fd);
+ 
diff --git a/recipes-support/obexpush/obexpush_1.0.0.bb b/recipes-support/obexpush/obexpush_1.0.0.bb
index 5018728..0cb18cd 100644
--- a/recipes-support/obexpush/obexpush_1.0.0.bb
+++ b/recipes-support/obexpush/obexpush_1.0.0.bb
@@ -8,6 +8,7 @@ PR = "r7"
 
 SRC_URI = "http://www.caside.lancs.ac.uk/bt/obexpush.tar.gz \
            file://add-obextool.patch \
+           file://fix-open.patch \
            file://init \
            file://opd_args"
 S = "${WORKDIR}/obexpush"
-- 
2.1.4


