Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id AD75F7892B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:13 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id y5-v6so7210623pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sgVrVRJWhc3TcyBky+M+QzAIim8RcItICQkpt8gXCik=;
	b=cSDxYEZ6gVluC9G4hL6QfcQwD0e5ZWfl3DLf/Ikk53Vq4tbyjzZ//uS/DnuGYVV/WH
	Z9mXrmw5uFrz5mEnWZI8yvJVSAJx8NBCtQbT+9gYbY/5zvjnYbjAWXQQEv7ZufZRFC9k
	D8ctqlomIqd7Z0jRp1yktknMvs7vcr/yHC2xcVoKp8vIxtEXL4zGCa32yvuNoOwozDO8
	cVH/PLJPg+Zihsz+ygADmopjUaKPZHzWGJBFLolbd9mAMBhIjyGezo0nN+rL7rye9qcf
	1hjNR4S5QyKLTel7fqsSi0H8+maPm+FxueDt2XXEgFt8mdbyIMoxkCVzd9NxMZStyn92
	zf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sgVrVRJWhc3TcyBky+M+QzAIim8RcItICQkpt8gXCik=;
	b=mDq69N8MNUQcycHAuITBrR1ElHBTQVc9AC0CCRyLkcHSRNSZBc59W5x/FyBq8Jz/Li
	L/wPxchv4HQbN7Z1P0GfY263INbPFvMTajubKvA4F/M8Lf/PJLmDdb8W8BsMgtBO6bxe
	FzVnY8G+fpxhIkVaBCS5j/l5/pcBp0lncNPybL9NIPgOktES3VXH9T3DFy44k8J0qzeR
	fXqDeH4pU9N/W1KB8X5FoomDw5Nv+ujwlReqZJ21fPySxFlDfZ+J6YAILacOVEw+ic6X
	udp0SYreFrjbFDDbn/fH2fifXMm3uiE921HL0mekwins8eur4WfyjoTHj1BLjQl6Mzm7
	gSqg==
X-Gm-Message-State: AOUpUlEA2cEEn+oRbwE2krBE+fqGLGUSxj1ugQhPkwQV3Cw8zFb7wdvk
	Xg4vFkn/s7ZQ5+DBjU42ZoKkUMif
X-Google-Smtp-Source: AA+uWPxpR55dFQRpZmIOcO+kCuuLYNC5udyuulHdnlFWliAe8/vvbNDWGGB6Njeyt0+pFxlgsQmXBg==
X-Received: by 2002:a62:dbc5:: with SMTP id
	f188-v6mr18229404pfg.182.1534148294225; 
	Mon, 13 Aug 2018 01:18:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:40 -0700
Message-Id: <20180813081742.6961-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/21] cfengine, cfengine-masterfiles: Upgrade to 3.12.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 08:18:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...10.2.bb => cfengine-masterfiles_3.12.0.bb} |  4 +--
 .../cfengine/change-hard-coded-lib-path.patch | 28 -------------------
 .../set-path-of-default-config-file.patch     | 23 ++++++++++++---
 ...{cfengine_3.10.2.bb => cfengine_3.12.0.bb} |  7 ++---
 4 files changed, 24 insertions(+), 38 deletions(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.10.2.bb => cfengine-masterfiles_3.12.0.bb} (87%)
 delete mode 100644 meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.10.2.bb => cfengine_3.12.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
index b52e7cc082..dda6af9c9d 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.10.2.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.12.0.bb
@@ -22,8 +22,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "1247ef4e8f3cee5efa98da50c326e5a4"
-SRC_URI[sha256sum] = "5d18a8d71f451d0b5dd1f5e579452b29b99b664f2bb0827dbba9a615f2764df6"
+SRC_URI[md5sum] = "d59bd8c95620da816c382f749d425860"
+SRC_URI[sha256sum] = "1c50e3d8c702097e13a21258626d936d6ff2e6492e893dfe286ff0d6204d7a65"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch b/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
deleted file mode 100644
index 2295e415cd..0000000000
--- a/meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-projlibdir use a hard coded lib path, this will cause error when build a 64bit
-target. So change it to suitable path.
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 38e2b9c..bc6b996 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,7 +188,7 @@ AS_IF([test x"$enable_fhs" = xyes], [
-   fi
- 
-   sbindir='${exec_prefix}/bin' # /var/cfengine/bin despite being sbin_?
--  projlibdir='${exec_prefix}/lib'
-+  projlibdir='${libdir}'
-   mandir='${exec_prefix}/share/man'
- ])
- 
--- 
-1.7.1
-
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
index b9526f2843..db69f951ca 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
+++ b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
@@ -1,23 +1,38 @@
+From dc270040cb3beb5ca42f864813145c8a68594bad Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 18 Jul 2016 09:06:06 +0800
+Subject: [PATCH] cfengine: add recipe and base policy
+
 Upstream-Status: Inappropriate [configuration]
 
 Set the path of default configure file.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ misc/init.d/cfengine3.in | 12 ++++--------
+ 1 file changed, 4 insertions(+), 8 deletions(-)
+
 diff --git a/misc/init.d/cfengine3.in b/misc/init.d/cfengine3.in
-index d6ae26f..1dee283 100644
+index c584817..12f5803 100644
 --- a/misc/init.d/cfengine3.in
 +++ b/misc/init.d/cfengine3.in
-@@ -101,11 +101,7 @@ if [ -z "$LOCKDIR" ]; then
+@@ -101,14 +101,10 @@ if [ -z "$LOCKDIR" ]; then
  fi
  
  # default control file
 -if [ "$DEBIAN" = "1" ]; then
 -    DEFAULT=/etc/default/cfengine3
+-    INIT_FUNCTIONS=/lib/lsb/init-functions
+-    if [ -e "$INIT_FUNCTIONS" ]; then
+-        . "$INIT_FUNCTIONS"
+-    fi
 -else
 -    DEFAULT=/etc/sysconfig/cfengine3
--fi
 +DEFAULT=/etc/default/cfengine3
++INIT_FUNCTIONS=/lib/lsb/init-functions
++if [ -e "$INIT_FUNCTIONS" ]; then
++    . "$INIT_FUNCTIONS"
+ fi
  
  if [ -f $DEFAULT ]; then
-     . $DEFAULT
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
index b86b0a1f18..aa33a97a4d 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.10.2.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
@@ -16,12 +16,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f8b34828ab373d6b1bb4b0fc60a78494"
 DEPENDS = "attr tokyocabinet"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
-           file://change-hard-coded-lib-path.patch \
            file://set-path-of-default-config-file.patch \
-"
+           "
 
-SRC_URI[md5sum] = "c16baf08189a1af6fcf2e2ff61102992"
-SRC_URI[sha256sum] = "d4fa9ac7276dba7b85d6757aab2f0929ab8d3b115cb0e7b0cf984760347429d7"
+SRC_URI[md5sum] = "33ef12260db4b430352229f37f7cb0e5"
+SRC_URI[sha256sum] = "d71ba98a272390c6fa8bc20e8ea27f0050a0a72a3e6b206a4762b4646be332ec"
 
 inherit autotools systemd
 
-- 
2.18.0


