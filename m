Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37921.1795594072273662385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nAgEQCVs;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so8057211eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594072; x=1796198872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt/VeeJ90euMLeM+y04VGaw4lip10+GeEHdtP3RdICo=;
        b=nAgEQCVsDaqBPs5JMGF8ykZc52xdFSu8EF+NNAKZlYFgC+puwgKgn1ZgSva12/D2c7
         Gagt5waqhJEeCUcoo+JOoggpuU1fWpt8jmtVvmsC8lmZNlz0ZmCCRBi2UlDC7flrEgly
         0x1XCnNfXvvBJq2DJg6uZz/+DHS4rD8KBWGZ3wPWuWOqZkfOnP/NeOVBuMk8BQMfdbJC
         0H1aAsaaWbwPjc2o0waxMTflTVYlRAPwYRu+bu2nNPYKVE+vTn3pXA/GYI4clY+0rbQc
         dFb/SzezXhv2QVseaqlEmurMb0iZ68SeyULKBy1+eXh8rsYNFZ6Qj4NMkfkIMNlvYjhe
         BWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594072; x=1796198872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt/VeeJ90euMLeM+y04VGaw4lip10+GeEHdtP3RdICo=;
        b=MsuBJwP9ht0gGrVXHyFF7voi597STg0RAF9+cAXMGGM9eoY2vm3l9QbKPm7CkFaSnw
         tI/jloPbooLHte2XzmuOYLcaClIuJzrztOZXCDAxk7Cf6HjT+NeFy4rk/SyxSIIUAjzX
         g6nb/iBR/7zPuY1PGtnk6p9HUUsmd223qt61Nqqd/7lJ05XHpnY5cvmepFzxYKxIYUZh
         yhJmXtaY8CDBn9motpfTsyO199S98eEUO4citLA8LoCOO7PJANLExf4mr7Ll1MIoYZnW
         djV4lOSTYSdIa9IIWSFGfMSzNbD1WacG6cQiUKNOIB2WsawwOgGxve5og29aCDc9e5Jp
         4zUQ==
X-Gm-Message-State: APuU4Z9znEeJJd7SLbCmiCXeuCQ9kAAf9m4lsPhym3Wu2Tp/l8UGXc/4
	jtGI1Nojk1hg8wa0c4Qap/EDiHtPbGggq3Zlk9FE+eieaWAdLb2JIGhEwWUMhDrJ
X-Gm-Gg: AZFdTZccajemZJpvBdYg8Y6serY8b+ZjC2QUrGmQzV8yeRnfcZJECsj4D+aMyHb+qxy
	dPmQznZFBnZpJpjDzgtMIavOmiqhpWY3NLqt4Zr8u8nRXZRhcsbjId2YQbGOKJL1v0ZnBL4zQbl
	sAz6FmtrZKKKFd2p5iHe8Lgn9jz7Pkaikankfik5StckYIS2xM9nDX9x+6UTbfA+SguwS1JMqvS
	h1/bcfx9SjebS6B6iCuYxW4O/rZgXPHTDM7bSn4mnR9zCiH6UoyDB2JugibcqGxCpqW0Sz+ZnPw
	P0XifAum4pqEOJgS215vdv1HlzQ/VcfsXV7AveLy86uQLbYVDAgFIUlSoijhEsnQZM/v+KfbQ7g
	506/69c2CwaackflHH8h+vYY2JXBaEeovdXEQv6gxbrIBG6QEeTcqiLbPAQoCd7lmmy1mXZkd1S
	l6AZ8SET6aPNIwILA+SzZNmw/4USMoQ+n5z/hE3RpGYcnfIO3jF+FdTQ3l6SCV1bzsqCui7Yi7j
	Qv/W52x4jkuKaW7CQvPYEDoRq7VuWFXUcuvhef/FdOgfe0R0sESZk8xdJE/a8YVtqAIojFt5z7j
	Wr3tVM2Zoiv4RZgC8o8x3OVWTWn2TR7fbDhw8UpHJbiFYyTFeFlKpUQ5MkrHyJjLIPV+MSdgpLt
	EwUf75qg30Nefv1aSIrGZxz1vCco6ohnLYM82Fz7A1wUXyfI8TiAme6v27THPZAvJ3wQYB/CJhD
	5ULldp7Imsa+6NugapLAfp0Cox8mdDDvQfYXBZtMUHg4eDX0sgJUZ10UTwYbYUIKHmUpGkYq0iy
	ArYZugABUPUoqGRul7kUm+Ruvg8uowmXofyUsZT0Y82QITcm6kBPUxEtNiQ7wFnDLPRBtv5yjpj
	eoJv
X-Received: by 2002:a05:7300:d941:b0:385:4b9:18e9 with SMTP id 5a478bee46e88-3856f94f874mr18433978eec.18.1795594071587;
        Wed, 25 Nov 2026 00:07:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/55] pam-plugin-ldapdb: upgrade 1.3.1 -> 2.0.0
Date: Wed, 25 Nov 2026 00:06:22 -0800
Message-ID: <20261125080732.2419614-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133009
Content-Type: text/plain; charset="utf-8"

- Security: reject usernames containing DN metacharacters so they cannot
  alter the generated binddn, and disable LDAP referral chasing so
  credentials are not sent to referred hosts
- Use LDAPv3 explicitly and ldap_sasl_bind_s instead of the deprecated
  ldap_simple_bind_s
- New timeout= option for connection and bind timeouts (default 10 s);
  unknown, duplicate or malformed module arguments are logged
- Behavior change: uri and binddn are required, binddn must contain %s,
  and directory errors return PAM_AUTHINFO_UNAVAIL
- Fix LDAP handle and file-descriptor leaks per authentication, range-
  check minimum_uid/maximum_uid, and stop exceptions crossing the PAM C
  interface
- Makefile honors CXXFLAGS, adds hardening flags and detects the PAM
  module directory

The project moved to github.com/smackysnacks/pam_ldapdb. Fetch the
v2.0.0 tag and add an upstream check.

2.0.0 uses struct timeval without including <sys/time.h>, which breaks the musl build; add a patch for it. Anchor UPSTREAM_CHECK_GITTAGREGEX to release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nclude-sys-time.h-for-struct-timeval.patch | 32 +++++++++++++++++++
 .../pam/pam-plugin-ldapdb_1.3.1.bb            | 21 ------------
 .../pam/pam-plugin-ldapdb_2.0.0.bb            | 25 +++++++++++++++
 3 files changed, 57 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
 delete mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
 create mode 100644 meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb

diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
new file mode 100644
index 0000000000..8d0025e0e7
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb/0001-Include-sys-time.h-for-struct-timeval.patch
@@ -0,0 +1,32 @@
+From ac86beda314368dead44083a99cece306e72fed7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 01:10:11 -0800
+Subject: [PATCH] Include sys/time.h for struct timeval
+
+pam_ldapdb.cpp uses struct timeval for the LDAP network timeout.
+glibc headers pull in <sys/time.h> indirectly, musl does not, so
+the build fails with:
+
+  pam_ldapdb.cpp:55:20: error: variable has incomplete type 'struct timeval'
+
+Include it explicitly.
+
+Upstream-Status: Submitted [https://github.com/smackysnacks/pam_ldapdb/pull/15]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pam_ldapdb.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pam_ldapdb.cpp b/pam_ldapdb.cpp
+index 6b73ca5..cccc33b 100644
+--- a/pam_ldapdb.cpp
++++ b/pam_ldapdb.cpp
+@@ -3,6 +3,7 @@
+ #include <pwd.h>
+ #include <stdexcept>
+ #include <string>
++#include <sys/time.h>
+ #include <syslog.h>
+ #include <utility>
+ 
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
deleted file mode 100644
index 2886137b7d..0000000000
--- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "PAM searchless LDAP authentication module"
-HOMEPAGE = "https://github.com/rmbreak/pam_ldapdb"
-BUGTRACKER = "https://github.com/rmbreak/pam_ldapdb/issues"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=41ab94182d94be9bb35e2a8b933f1e7d"
-
-DEPENDS = "libpam openldap"
-
-inherit features_check
-REQUIRED_DISTRO_FEATURES = "pam"
-
-SRCREV = "3e026863cad1fd45c760ee1bc93ef4f0606cc852"
-SRC_URI = "git://github.com/rmbreak/pam_ldapdb;branch=master;protocol=https"
-
-
-do_install () {
-    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
-}
-
-FILES:${PN} += "${base_libdir}/security/pam_ldapdb.so"
diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb
new file mode 100644
index 0000000000..709d798133
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_2.0.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "PAM searchless LDAP authentication module"
+HOMEPAGE = "https://github.com/smackysnacks/pam_ldapdb"
+BUGTRACKER = "https://github.com/smackysnacks/pam_ldapdb/issues"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41ab94182d94be9bb35e2a8b933f1e7d"
+
+DEPENDS = "libpam openldap"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "pam"
+
+SRCREV = "f8ad9921f94d683d9cd40566694709308a12ae71"
+SRC_URI = "git://github.com/smackysnacks/pam_ldapdb;branch=master;protocol=https;tag=v${PV} \
+           file://0001-Include-sys-time.h-for-struct-timeval.patch \
+           "
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+
+do_install () {
+    oe_runmake install DESTDIR=${D} PAMDIR=${base_libdir}/security
+}
+
+FILES:${PN} += "${base_libdir}/security/pam_ldapdb.so"
