Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92155D4A5F4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 11:29:13 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10618.1768719047759570003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 22:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xu6OyfjC;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4214; q=dns/txt;
  s=iport01; t=1768719047; x=1769928647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rDYDt7Sd0pphJxh0D+9MUCbzJlWyxe3EV6+w5hUKMm0=;
  b=Xu6OyfjC6qtNeQyLWcBKrmQYEeb5s0bOnaPduAITekzyXxt/hlqGlpsB
   PnQCaNa31PwyGbEIDt8EPNVL2SlMkpGJJV7SS1ZLVlIUUUCX8Oqv6YVto
   24xl6zeITJboJf7DjXTtmqNIC17joNiAZwSfywwOfneKaqNv1sWd1veNO
   tJIHUXhJKsRAUZf09QOuzvlu2cayStnBv3IHHggJ2dkl3qIgG96iXuS1y
   KYqq5sRIBpBT1s+c2TqW422C/3b9v157p025hpvDUu7w+DG9lgtKV5eG2
   koun2FRMVmIDI8/tfa6+c+75xleMIWDP/KYlZa1x94aexMKyYhiwF06Xs
   A==;
X-CSE-ConnectionGUID: J+07gfqCRUKPHoleMBUjiA==
X-CSE-MsgGUID: TMa1Km4EQti0Yhbr5GPbzw==
X-IPAS-Result: =?us-ascii?q?A0BhAgCJgWxp/5T/Ja1aglmCSA9xXkNJlkuBFp0HgX8PA?=
 =?us-ascii?q?QEBDz0UBAEBhQeMegImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECASoLARgBLSwDAQJaIyGDAgGCcwMRsgaBeTOBAYMoA?=
 =?us-ascii?q?T8CQ0/bJQELFAGBOIU7iBdYGAGEeCcbG4FygRWCcnaBBYFcAQGIJASCIoEOg?=
 =?us-ascii?q?WmBLRwQkFtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQobBwWBMwaBL?=
 =?us-ascii?q?YdRD4kweGcDCxgNSBEsNxQbBD5uB48cR4ItAYEOASoBBXYEgS0ekweST6EOC?=
 =?us-ascii?q?iiDdIwelToaM4QElBWSUguYe44JllCEaIFoPIFHCwdwFYMiCUkZD444g2mBf?=
 =?us-ascii?q?4JZwHMlMgI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:SkDLY6hX75iO7QRLIRSiJUBzX161MBEKZh0ujC45NGQN5FlHY01je
 htvUDqDOq7bNmP1LdggOYzj/UMA7ZGDx982HgBlpCkwEXhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsvvc8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU6ub4oDm9X3
 sYlCwgtaRSOosiLwrOSH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9JoDaG58FwRjGz
 o7A11jcC0g5MYCy8CaEqkOsjPWSshvxSp1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:Cfd6wa37sMfhl6KWG73cQAqjBLkkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZq/z/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AcX8LC2vifpIRKRly9unxACeI6IsHMSWCw3nJCHW?=
 =?us-ascii?q?FKl5JT7mYbHWt+qJNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AeDkgugy2mrso647e7O4LKnJfJpKaqJiLARkulMk?=
 =?us-ascii?q?rgtWFbR1wMS3Aowy9UJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,235,1763424000"; 
   d="scan'208";a="448628766"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Jan 2026 06:50:46 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id AD23518000269;
	Sun, 18 Jan 2026 06:50:46 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 54292CC1288; Sat, 17 Jan 2026 22:50:44 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH] php 8.2.29: CVE-2025-14177
Date: Sat, 17 Jan 2026 22:50:37 -0800
Message-ID: <20260118065038.326233-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 11:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123569

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/php/php-src.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
Type: Security Fix
CVE: CVE-2025-14177
Score: 7.5
Patch: https://github.com/php/php-src/commit/c5f28c7cf0a0

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../php/php/CVE-2025-14177.patch              | 84 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
new file mode 100644
index 0000000000..6b5ffe0029
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
@@ -0,0 +1,84 @@
+From 7aac95c5280ea395ccfcd624cae7e87749ff6eeb Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+ndossche@users.noreply.github.com>
+Date: Tue, 25 Nov 2025 23:11:38 +0100
+Subject: [PATCH] Fix GH-20584: Information Leak of Memory
+
+The string added had uninitialized memory due to
+php_read_stream_all_chunks() not moving the buffer position, resulting
+in the same data always being overwritten instead of new data being
+added to the end of the buffer.
+
+This is backport as there is a security impact as described in
+GHSA-3237-qqm7-mfv7 .
+
+CVE: CVE-2025-14177
+Upstream-Status: Backport [https://github.com/php/php-src/commit/c5f28c7cf0a0]
+
+(cherry picked from commit c5f28c7cf0a052f48e47877c7aa5c5bcc54f1cfc)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ ext/standard/image.c                  |  1 +
+ ext/standard/tests/image/gh20584.phpt | 39 +++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+ create mode 100644 ext/standard/tests/image/gh20584.phpt
+
+diff --git a/ext/standard/image.c b/ext/standard/image.c
+index 2bd5429efac..15761364c34 100644
+--- a/ext/standard/image.c
++++ b/ext/standard/image.c
+@@ -403,6 +403,7 @@ static size_t php_read_stream_all_chunks(php_stream *stream, char *buffer, size_
+ 		if (read_now < stream->chunk_size && read_total != length) {
+ 			return 0;
+ 		}
++		buffer += read_now;
+ 	} while (read_total < length);
+ 
+ 	return read_total;
+diff --git a/ext/standard/tests/image/gh20584.phpt b/ext/standard/tests/image/gh20584.phpt
+new file mode 100644
+index 00000000000..d117f218202
+--- /dev/null
++++ b/ext/standard/tests/image/gh20584.phpt
+@@ -0,0 +1,39 @@
++--TEST--
++GH-20584 (Information Leak of Memory)
++--CREDITS--
++Nikita Sveshnikov (Positive Technologies)
++--FILE--
++<?php
++// Minimal PoC: corruption/uninitialized memory leak when reading APP1 via php://filter
++$file = __DIR__ . '/gh20584.jpg';
++
++// Make APP1 large enough so it is read in multiple chunks
++$chunk = 8192;
++$tail = 123;
++$payload = str_repeat('A', $chunk) . str_repeat('B', $chunk) . str_repeat('Z',
++$tail);
++$app1Len = 2 + strlen($payload);
++
++// Minimal JPEG: SOI + APP1 + SOF0(1x1) + EOI
++$sof = "\xFF\xC0" . pack('n', 11) . "\x08" . pack('n',1) . pack('n',1) .
++"\x01\x11\x00";
++$jpeg = "\xFF\xD8" . "\xFF\xE1" . pack('n', $app1Len) . $payload . $sof .
++"\xFF\xD9";
++file_put_contents($file, $jpeg);
++
++// Read through a filter to enforce multiple reads
++$src = 'php://filter/read=string.rot13|string.rot13/resource=' . $file;
++$info = null;
++@getimagesize($src, $info);
++$exp = $payload;
++$ret = $info['APP1'];
++
++var_dump($ret === $exp);
++
++?>
++--CLEAN--
++<?php
++@unlink(__DIR__ . '/gh20584.jpg');
++?>
++--EXPECT--
++bool(true)
+-- 
+2.43.5
+
diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes-devtools/php/php_8.2.29.bb
index 08cece1c17..015d83c291 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
+           file://CVE-2025-14177.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.44.1


