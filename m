Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1934.1795162105177296886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NfDWOomF;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38587f3de36so678212eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 00:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162104; x=1795766904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n85nBPkFgmTnYNFnwDZdbuQAmH2+RsUON4wAZD4O7HE=;
        b=NfDWOomFF4VuAKT9MOK6RsZtD0ZUR9Rr1qBtty/Co6kLd/jw17IwhqjAJ6tZQaNkvK
         729v8UOz5SC+DyVQ9IJxa6eCNya+Yq/HHdDcxNCPs+shkMuw6ZeLX3eJirovkat5J8M3
         AGV2uV9ZCLCvgPcOaUZ+a/Yau8uCYsRfpzkOXgAf9pgUnO5eRg4C6PMB1BKXVE/2h3+C
         YwlP3YJU1Y/8UeN3hfy1e5evlzH88dknEaAVAU1bVDa0meDiOIPYYc7rUBSOTeLDWuA3
         fMm+c85bj5V8CEzTQsA0ADvFcOBB9C+Q++yYguoA2TjMU7mXRmLTKeNAJdkIu8NwMvwO
         aoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162104; x=1795766904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85nBPkFgmTnYNFnwDZdbuQAmH2+RsUON4wAZD4O7HE=;
        b=zQukFGXI8LsHsG6eY2/HpeCoWiKAIXoQOqEH5Ai9996OwadtcQ6kBl9bHJjRc6SGwU
         C8RW3tt4CLxXbmQPI/1zKns0dfbiEBwqHK+oH1g7mKnpYZbOd2ifMaoadUcZezZqcrNq
         MPqPRNf6NbFNWR5QuWn+VePmT9GBsUkPTexjYU8LwBj3qn1uC7qkdmYefzD85jp1FC8j
         76A9X+8PC64t9nW5BS6liSeeYz0c8SDW2FBmv3EvdLsHM4RvcKYOibZNnWBV2IrK3Vry
         oipGI8ayqFGDd+kS8+dzhJAEbmB+4UrGFbEwi62D/yX/c+N3pGGc8mA28CSMcDTuJVsN
         F2NQ==
X-Gm-Message-State: APuU4Z/5zLqh5M/6RecuHnPFu1+7KyT71CPW+i9ndV4E8cDANCEl4U4Y
	E6rHbH7L4KBP3p5BJO9zv7G1eDTtyBM/zkoEGijUvFR/C9k5MWt/ZICRp4ZSsPa+
X-Gm-Gg: AZFdTZdQM8IFqX9oryZ8uw6EMXkDVsmIcTvLCkM8Jn1plV27HAPIyNCcqFUCU9YXWMV
	MHCgoPmrvw1WSEloJsW4RCsD/2Ihsbwkp4soo0eKplGTXWkdOwlNkHtiQgxJdfzqm/HnYwU6/fT
	BOAJxRbDDwi+kWyjUPFyqcBShNdWPZMljHhpqJfPaQ4otci2S8/HAFoOtxBwUDZhZ9BvMoV26vn
	Lc6hzGxceFVhWIVqS5AT1oMWIvHm7Czq2rOuZPxc+THkQDLpg2QVaJgrQ++vcqoOSGfaxvIf/lo
	+rrAgoQylB+3xIiGut5a132mWKLLT6F0r8E9cyki//dHHhosMDaGDgoUhqzvREQoF3bwsUR9JJs
	X7MNRjavGPAXdPa54acGySDz+97RHlTRIA/PhCx5JfSlSWX7dMIvZ1mWqmVLZgxod+hmPfLsVfh
	Uvek8OLJCfLQZROv6ZgG0Nl+8pBqsjJHV6hjV6Xk+F3/1Tfx62MNVutpcU9jwGuOR1861BURNTg
	2jutAX5Koh0S3/8KtxCVd39U9YjS9+2CVV3gdhQnku+2+UztOJ366MvLYv9rFrtGKhMU4oEARCx
	RdZA0M9gUHRWZqTCypC92BFkYS/eTNAwIzMM3sOvuVsEduDo3i72wyCwT8uz+JaMSuUv3sphm1w
	C/G1DmMOJcD7RiKy02/RO3u9ZWZO9DyaiZUoVyrsVYbpoRo0lybZHalYfdlvT8SdfHyxZsrviaY
	gR0UFdU0d/Azrs4KC3qhyjeffJczRUOa201RPjcQ5akKHF3EODtK4OYtZSiH/iYMsnHk+5PQY2O
	F2+rt+MsXTWmO2kBC/8/1K69TA1zuqg/fZcR65Ut4A4z6anIrQ6bZ8QHsn2xHkNSJ2crnACtB7N
	kX4z
X-Received: by 2002:a05:7301:6285:b0:369:f182:8e99 with SMTP id 5a478bee46e88-38570554684mr2250338eec.35.1795162104394;
        Fri, 20 Nov 2026 00:08:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm5947954eec.14.2026.11.20.00.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:08:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/5] libsigrokdecode: Link with python 3.15 embed library
Date: Fri, 20 Nov 2026 00:08:17 -0800
Message-ID: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 08:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132765
Content-Type: text/plain; charset="utf-8"

configure.ac only knows about python-3.x-embed up to 3.14, so with Python
3.15 it falls back to python-3.8 >= 3.8 style pkg-config modules that do
not pass -lpython3.15. libsigrokdecode.so is then left with undefined
Py* references and sigrok-cli fails to link with lld:

  ld.lld: error: undefined reference: PyImport_AppendInittab

Add python-3.15-embed, plus python3-embed as a fallback for later
versions.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-configure.ac-add-py-3.10-support.patch             | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
index 2961d23bd9..c039714cfa 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -6,9 +6,11 @@ Subject: [PATCH] configure.ac: add py 3.10/11 support
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>

-Update to include Python 3.14 support.
+Update to include Python 3.15 support, and fall back to python3-embed
+for newer versions.

 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -22,7 +24,7 @@ index 4802f35..2eb47a6 100644
  # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
  SR_PKG_CHECK([python3], [SRD_PKGLIBS],
 -	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
-+	[python-3.14-embed], [python-3.13-embed], [python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.15-embed], [python-3.14-embed], [python-3.13-embed], [python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python3-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
  AS_IF([test "x$sr_have_python3" = xno],
  	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])

