Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5ECD915CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:34:17 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s64so769382pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k+bt9c9vYdXj0bNnAheR0YV07inN3BCdc3+qZ6SmmxY=;
	b=HcnjjT0ay8wgp56vFrNTRAU6iYrY7hmlAPBSKFXYGARdePFB4V0TivQVHGLkRZFGla
	Mnw1fXHShluZ8KpgDHG749iMmINwmOmuCJfiJc6gihOlIx+JheOTdexVPB5XceOi+Pmk
	8MwLtgFBEuqcwUdcAmONQx1ikqHjZqLx1BdwJTlrwxlHXuiWqrv4lYq3x8bPZ7VT64rt
	GCOT1A4Nk//FeYUMPUsko/ab5/JA834wxuhUlYXq7GJM8IT7Pp6EW0ZD1vt8HMrdlR23
	8Kwe43miJt+pjO/ahFo94nKnNlJAn9JPTbwDGeSWv1k8iDs4nUCdxt5RO9NPqQ99MUlo
	wsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k+bt9c9vYdXj0bNnAheR0YV07inN3BCdc3+qZ6SmmxY=;
	b=ZkVOyQDjJ5dr1xtFK5KLThY6KDxWvm7nD9LwUf5mOlW1T1tOHgAwXrzVtP45jU8gMh
	2apRtsGbRmjpTF5y3IvaVTD3McTtGD8oSnpc6lcrca939zPZWoS25gu2fsmqZoCWUGXc
	ItmsMNe6MX+/+zDGYermw+hv+lFYzYmYjAvrGu2kCQYf4RhCC7z9bq/sM5ZQnShgAtKw
	BmKzklGcp/KPh2ZLgjEB71YgRt/37P0GlWqWwGrtCAsX0R0oTK3F3JQKx89fj22RjfCd
	Nhz1+ytS4Yx3c/AF5nW7kqk8oixBY4ykJu8CWIn5lEKqYXuLPCavlIrfFQ4R8GAmMmmz
	iXyg==
X-Gm-Message-State: APjAAAVpHRs40PmyJHJU/6ZK3ryPYW1C/oeBlckYIU6XAsuFi6ZJF+1O
	ajV/cDkQs/Ku5D86EbRqWMo1gqaZHok=
X-Google-Smtp-Source: APXvYqwgB1+9cgMZEuqFeMe9GGnwxuHSznQF32b08UykdfEEo3BzqM/+nIMBnaDWsjOB/nyV2ZUwlg==
X-Received: by 2002:a63:f643:: with SMTP id u3mr2021193pgj.291.1579757658380; 
	Wed, 22 Jan 2020 21:34:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id w5sm809925pjt.32.2020.01.22.21.34.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 21:34:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 21:34:18 -0800
Message-Id: <20200123053418.351850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] ntop: Pass PYTHON_CONFIG to configure
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
X-List-Received-Date: Thu, 23 Jan 2020 05:34:17 -0000
Content-Transfer-Encoding: 8bit

This aids cross-building, otherwise configure goes into weeks to find
these especially python-config and starts to poke at host files e.g.
if /etc/debian_release exists then it errors out, but if it does not
then it deploys a workaround and continues build, as a result we see
ntop fail the build on debian-like build hosts but not on others eg.
archlinux

Ensure that linking with libpython happens therefore use
python3-config --libs --embed

Fixes
checking for arm-yoe-linux-gnueabi-python-config... no
checking for python-config... no
Please install python-dev and rerun configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add a patch to add -lpython to linker

 .../ntop/ntop/embed-libs.patch                | 20 +++++++++++++++++++
 .../recipes-support/ntop/ntop_5.0.1.bb        |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ntop/ntop/embed-libs.patch

diff --git a/meta-networking/recipes-support/ntop/ntop/embed-libs.patch b/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
new file mode 100644
index 0000000000..2d1ab73717
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/embed-libs.patch
@@ -0,0 +1,20 @@
+Use --embed option so that it can return libpython as well
+
+% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs --embed
+-lpython3.8 -lcrypt -lpthread -ldl -lutil -lm -lm
+[kraj@apollo /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/ntop/5.0.1-r0/ntop-5.0.1]
+% ../recipe-sysroot-native/usr/bin/python3-native/python3-config --libs
+-lcrypt -lpthread -ldl -lutil -lm -lm
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/configure.in
++++ b/configure.in
+@@ -1463,7 +1463,7 @@ dnl>
+   fi
+ 
+   if test "x$PYTHON_CONFIG" != "x"; then
+-    PYTHON_LIBS="`$PYTHON_CONFIG --libs`"
++    PYTHON_LIBS="`$PYTHON_CONFIG --libs --embed`"
+     if test "x$PYTHON_LIBS" = "x"; then
+       AC_MSG_RESULT(Python[-devel] support is present but misconfigured)     
+     else   
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 2d37969a70..d835e399b3 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
            file://0001-nDPI-Include-sys-types.h.patch \
            file://0001-plugins-Makefile.am-fix-for-automake-1.16.1.patch \
            file://fix-missing-return-from-non-void-function.patch \
+           file://embed-libs.patch \
           "
 SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
 SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
@@ -35,7 +36,7 @@ PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snm
 --disable-snmp,net-snmp,"
 PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
 
-EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
+EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no PYTHON_CONFIG=python3-config"
 
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
-- 
2.25.0


