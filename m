Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3853.1794729099477953146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PbooXLIA;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so3567022eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729099; x=1795333899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4EUsvGkHOBX+kFEY7nsyomgOtbLou2SYPS5PfTDds8=;
        b=PbooXLIABKQ0RwOqa4yFPpsLdEcjpMIUx+fKGFlT2TZLOMPrw31zSQEZE+K5vGbtrW
         WseuZYYSgaWpOrX78NxSR2sPA/hZmH4s58f2i+YlfyF2eyexrsJ18Qdy40uzN5vRXC5m
         VvwCimC1aAvVRasu8cQJ3cFqOCP5IXwPIosRv8XWEjs21M8J/Xl0fSJo8Kq5EHlYDYbC
         qbEoyKnxKObr3SGEFkFmUuf6SbKgjTasixpxamn+biQz4mLZzk/7ujupU7StyQ+YO5PZ
         57EpfMubOsOPttxq8KOyf3O2/HnCjKOYWM1fDrwUC8Q+qVmOgyjaN9NOYrxC+Z2dZ2ug
         udYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729099; x=1795333899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4EUsvGkHOBX+kFEY7nsyomgOtbLou2SYPS5PfTDds8=;
        b=vXhfdzo81eidUyH8N57I8skk8tPTByMU8eCJ2xUbJVHPPXQ+iGzSB0I7c+3Pi7oCro
         Xc3q6jrvANRJZ2JIoQ/P1VZiEZvrWALLpJFJ29SY+42HWbBa0+kP7pvHfkwFiHtieAR4
         vE4yMWN4RQeoOXYXI7YoHdMoZnucY7jgIlji54V8Qn6bqH/NOsTgA55XI9DYjd+6voQ7
         k+tZLswhglq39XAGwPO9l2gTk7Y9JKX6cAk5y2OX6VSbM+wllUYp3evcpE2tXYmkzi4R
         dkSkv722s10HFyMZISiLc+lIEyZLka433xcm0dmv9tRpPQ+eXS2CbY6+L9iFtmX+Kg09
         0suA==
X-Gm-Message-State: APuU4Z8BO6gMnYSVwO7R0uEW8JUuUJBQx15RJ5YM1PC4yQiYbERRQELE
	O10NmOvWBpIrVBewRdhoPgFHZcUZ+Su9PDhUXD9jX5vAm7LwpIO4QMgH+uTlm1jx
X-Gm-Gg: AYBFou2eY88W5VSnSWUggKdhZoFeNMZipKWW1J7zr0aR9OScaU1EjpSlykrUsy6wAh5
	tM/Qm4OxPeAiu/VsCkm8JCQDjO9wXBtsuXhInQWiGJKzoGp/UXZorlQMx33FkU4QnNZGKh1uAlR
	uCeB1fvxHxmcgn7YVSEMGEjSOW4MwpagrcmjulaembPihOYKEM72vjMqTww8+Uxi+LO78ND9a8o
	3cqOO2oaJ9nfx1cb0xjChPMOkpa+Q6ouxW9Lkxz2eNcDGqM8YJTFBC0bKOViUTzu7C+taAqchkq
	cFVfEfnxDd+C+c1eukaspx6/dHRbJkG2mDFFdYaD1GENyIOpIHVe20qWfP3nP2D7KYu1Mv8FoCZ
	9XwHXwMju3IwhffYT8zLTbMG6jO3mes6YAnhvaxTyPMZDxtqV87HDQlri7/PSCF/DldnmJA8Wgp
	FL7NesMxYkdFQE4fU+PMF5BWf5t9moPEAc8UlLNEnq1VO1S1f5a/Swm4t7oARMsbnUcLA3BeacU
	nqNwG2bebBhiGOfhAaw7BzRHbwgvApwMS2H0uO+0NW0LRAeS5lGKmXv71TjUhqdT5Ey8m2p9lH5
	pIa9eo+c5KBhdKjLuB6EFJDN0mcnUI0WivrKNiGgl8Us7MCw7cPqEFZiMKIRCkCF8Hukl/Jm+ao
	q62OOMZZXBl7fT1tbB7CcTjYndzEZrtS3Jhc2VS9yC7Lmk+H5an9Zi7bn+QWPpCNp/0PE01BB5L
	KnJW1HwlLeZ3AlLq+JsVOORuZDmW8D0CpvecZJ+e8OM1HfkiFPlh8Ko0flTR4ujWGhGL0281DV8
	3yaGFZU3nqua9xdK7gYDq/X2Gg/7is7ubRZlOVOiLAoefBYCosUxGhkllbWxfg8eYTtjw4YSV7u
	aMJA
X-Received: by 2002:a05:7301:628e:b0:37b:e01b:9f15 with SMTP id 5a478bee46e88-37be01b9f58mr2200692eec.24.1794729098775;
        Sat, 14 Nov 2026 23:51:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 84/96] libssh: upgrade 0.11.5 -> 0.12.2
Date: Sat, 14 Nov 2026 23:49:02 -0800
Message-ID: <20261115074918.2932593-84-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132354
Content-Type: text/plain; charset="utf-8"

Refresh 0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch.

ptests pass on qemux86-64.

The libssh-0.12.2 tag is on stable-0.12, not on stable-0.11, so the
fetcher could not find the revision on the given branch. Tested by
building libssh for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...eLists.txt-do-not-search-ssh-sshd-commands.patch | 13 ++++---------
 .../libssh/{libssh_0.11.5.bb => libssh_0.12.2.bb}   |  4 ++--
 2 files changed, 6 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.5.bb => libssh_0.12.2.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
index 4803ff81d8..451ac1a12a 100644
--- a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -10,22 +10,20 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- tests/CMakeLists.txt | 2 ++
+ tests/CMakeLists.txt |    2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 89b95d08..e481534c 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
-@@ -96,6 +96,7 @@ set(TEST_TARGET_LIBRARIES
+@@ -138,6 +138,7 @@
  
  add_subdirectory(unittests)
  
 +if (CLIENT_TESTING OR SERVER_TESTING)
  # OpenSSH Capabilities are required for all unit tests
  find_program(SSH_EXECUTABLE NAMES ssh)
- if (SSH_EXECUTABLE)
-@@ -345,6 +346,7 @@ endif (WITH_PKCS11_URI)
+ find_program(SSH_KEYGEN_EXECUTABLE NAMES ssh-keygen)
+@@ -440,6 +441,7 @@
  file(COPY gss/kdcsetup.sh DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/gss FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE)
  
  message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
@@ -33,6 +31,3 @@ index 89b95d08..e481534c 100644
  
  configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.12.2.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.11.5.bb
rename to meta-oe/recipes-support/libssh/libssh_0.12.2.bb
index d2f5072d1e..7126559901 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.12.2.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.12;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "a09fdd00416e53b6ed436df6ff14339a4f884601"
+SRCREV = "07430deb9b97b751ec5ea5a7fc307f40bf042e0a"
 
 CVE_PRODUCT = "libssh:libssh"
 
