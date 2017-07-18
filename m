Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A3BCA77E91
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a11so1023562pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7dET+T1FiovB/QMNw7jGiVgPRrySUQUUYbgvjrg+CD4=;
	b=FC6/4GxlTBtrAUcH5UKY2ZTU7m3RRFqKqcjpzlENVauI11j5GGeVI4sFwpnNdUdbTc
	mUQX965ab1D5lI8F+9uS7WIRXem0B+hkJEXM8Q7tdkBzXEWI4xp8yKGKdIL0OUov91JX
	M/usGaxMXgt2tjs06wjefhNJGrJHhbrkDzCpAK/IZJXtK3JVG7fD8/vKdBx4iO+wv6lP
	XKDb3J9QPsrIEBb5kY4yh7PslTnuqO3NrVk9MOzHO4Kz3xq6n1FjqvrUqpBku4gIHfhJ
	OVzimuorACt9aBFMcNMkVDucnMdsPCQte20/K5Cz6SmVsrCtBY0zfsB2nc0MF5utYAvc
	snJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7dET+T1FiovB/QMNw7jGiVgPRrySUQUUYbgvjrg+CD4=;
	b=IJBDzC2zKguSzbDYZekMVc/E5r5q85ahznGKRjl1IW1D1eF07xDVq62YeB6s2lmZ46
	Fn9dyvYDT8hQA0Wvf639m1THucN1BFOSyCR/N06+jCbRt/uRJvg/E3hX9qFqATDemM5u
	PiBAiRaD5smgIflroarS9xLsCcS47pjBlgD9kYsyciEZbwIkqzSsNGOQwMOkEplq3OZa
	SVTdMkwnsW3r1fdakcyc//ORRNMP9XeCXLXOBQq/zuRwW14wddZUImDWVfXXktSsDqN4
	EUqnSo4FsgUxMXgXH9epLd/Ec/FqDwJhGjWh3sJJMSdglE/0VS6ZBNkfwOMoe0jgkhfH
	2d7Q==
X-Gm-Message-State: AIVw1125aHF3UpyxI9QivpXSjzZCBYbrCTBVMsBBwMv2S9/PemJhcQ0N
	8cJS9cz8CXvb95DE
X-Received: by 10.99.110.1 with SMTP id j1mr802600pgc.218.1500347432383;
	Mon, 17 Jul 2017 20:10:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:02 -0700
Message-Id: <20170718031013.44536-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/17] postfix: Disable nis support on musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...libc-before-setting-CANT_USE_SEND_RECV_MS.patch | 26 ++++++++++++++++++++++
 .../recipes-daemons/postfix/postfix.inc            |  6 ++++-
 .../recipes-daemons/postfix/postfix_3.1.1.bb       | 11 +++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch b/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
new file mode 100644
index 000000000..6b86e3925
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
@@ -0,0 +1,26 @@
+From 63619acf25151d4dade6d65732722ec4a710a5ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 09:54:25 -0700
+Subject: [PATCH] Check for glibc before setting CANT_USE_SEND_RECV_MSG
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/sys_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index f720e2a..7314c63 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -813,7 +813,7 @@ extern int initgroups(const char *, int);
+ #define KERNEL_VERSION(a,b,c) (LINUX_VERSION_CODE + 1)
+ #endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0)) \
+-	|| (__GLIBC__ < 2)
++	|| (defined(__GLIBC__) && (__GLIBC__ < 2))
+ #define CANT_USE_SEND_RECV_MSG
+ #define DEF_SMTP_CACHE_DEMAND	0
+ #else
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 4c794ffd6..0ec182a05 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -60,6 +60,9 @@ export AUXLIBS-ldap = "\
 export CCARGS-ldap_class-native = ""
 export AUXLIBS-ldap_class-native = ""
 
+export CCARGS-nonis_libc-musl = "-DNO_NIS"
+export CCARGS-nonis = ""
+
 # SASL support -DUSE_LDAP_SASL -DUSE_SASL_AUTH
 # current openldap didn't enable SASL
 export CCARGS-sasl  = "\
@@ -70,10 +73,11 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
+export CCARGS-nonis_libc-musl = "-DNO_NIS"
 # OPT,DEBUG is aready in CFLAGS
 # ignore the OPTS="CC=$CC" in Makefile it will not use the CC=$CC $CCARGS
 EXTRA_OEMAKE += "OPT= DEBUG= OPTS= "
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
index dbbe24ca3..839317d31 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.1.1.bb
@@ -1,4 +1,15 @@
 require postfix.inc
 
+SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+           file://makedefs.patch \
+           file://install.patch \
+           file://main.cf_2.0 \
+           file://postfix \
+           file://internal_recipient \
+           file://postfix.service \
+           file://aliasesdb \
+           file://check_hostname.sh \
+           file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
+           "
 SRC_URI[md5sum] = "40d72ea143af7ab0038c2cee1f483707"
 SRC_URI[sha256sum] = "3deda4c34631970490b1b5fbb559905f93531bf1c7eb00e38b0d0deb1dba9982"
-- 
2.13.3


