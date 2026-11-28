Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2331.1795842025718974543
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QcjAj72L;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=905; q=dns/txt;
  s=iport01; t=1795842025; x=1797051625;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w+ec2n3G6XMitXxIDwibJ00+mVzTVQdJfpSrKIRzhbs=;
  b=QcjAj72LO863yxvzWLTncr6kvlCNcW8+lFudJfmyqdgYUv8pVHu5OF6u
   K+XSJAO1QFw5bSFDsOhFQFiSuCBnpDBz87T0vqpDbC3DacKiwGJ+NI5RH
   KU9LOxT3pxaRgjemydCmPH6oxUlWC3jTTc6EubFOM0+Jwctk0hMNcem1i
   HJUqXWccl/PUwb9KRbnhERWDVc0s0R1gmTTwOIGHzPia+1Cks8nMsXJ9q
   OY9ZB6GiBh7P3JKYR47sLOWtzIbK8NETlL97PQCHx4Qsk97AG9HvWdj/+
   /3p6RnZ/clZ8Lvz+U2Xxi3R4P1usO4l6KvAy7e99wbGcFubIuMEbiBBgI
   w==;
X-CSE-ConnectionGUID: 1Wjc1XL6Tu+tXslz0yEvKA==
X-CSE-MsgGUID: zrR2qBYWTsCjcUIesDmeLw==
X-IPAS-Result: =?us-ascii?q?A0BXAwBiXgpr/8xK/pBaglmDTGBDSZQqoE2Bfg8BAQEPM?=
 =?us-ascii?q?SAEAQGTKgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBACwEYAYE5g0YBgnQDug6BeTOBAYMpAYFU2UuBdBWBOI1ndQGEficbgUlEg?=
 =?us-ascii?q?RWDaoUQhXkEgxwSmQZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA1uBKyZeIYEGgXYCglGCAAIBRkEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0McjkQMBwkLwUXJjwbB4EMJx0bFw4CKAYVI?=
 =?us-ascii?q?QtDGA1IESw3FRkEPm4HlBKDHIEPllKReqERhCuMJJU6GjOqc5kIpFyEaoFoP?=
 =?us-ascii?q?IFZMxoIGxWDIglKGQ/gfyYyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:w3Ukx6tBllTP8/YJeMaejdBabefnVANfMUV32f8akzHdYApBsoF/q
 tZmKWiEaPeJajbzft9zbIu29UwA6JLVydBgSAJprHs8EiwbgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwo9l1Cjh+0
 aIkNXMRXguHlbqn7ayYY7w57igjBJGD0II3s3x6iDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgt/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGISNJYTRFJoN9qqej
 nDcxT7gKCAlCMe0yzG403+3qurCuTyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjNCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:G7Jx7akSuXX6wgraGmuGYRZA3CXpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AClhqI2rvCPLQS28/RVfAfdHmUZkacHaE/FOOH1L?=
 =?us-ascii?q?7FVZyTK/NWHKO24oxxg=3D=3D?=
X-Talos-MUID: 9a23:9+N3dwRj4kLmzYqXRXT+ngs4Le1Z3Ji1I0IGrLQLoOWBOAhvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="60703970"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:00:23 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id EE5E7180006DD
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:00:22 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 91A1ECC1611; Fri, 27 Nov 2026 21:00:21 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][blacksail][PATCH 0/1] php: upgrade 8.5.12 -> 8.5.13
Date: Fri, 27 Nov 2026 21:00:19 -0800
Message-Id: <20261128050020.4130975-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133395
Content-Type: text/plain; charset="utf-8"

In addition to the CVEs listed in the cherry-picked master commit,
PHP 8.5.13 fixes CVE-2026-129538 (PHP-CGI PATH_INFO handling) and
CVE-2026-128090 (PHAR OpenSSL signature verification), as documented
in the PHP 8.5.13 changelog. Both fixes are included by this version
upgrade; no separate source patches are needed.

Jason Schonberg (1):
  php: upgrade 8.5.12 -> 8.5.13

 ...onfigure.ac-don-t-include-build-libtool.m4.patch |  9 +++------
 ...-ext-phar-Makefile.frag-Fix-phar-packaging.patch |  9 +++------
 .../php/php/0003-iconv-fix-detection.patch          |  6 +++---
 .../php/0004-pear-fix-Makefile.frag-for-Yocto.patch | 13 +++++--------
 ...-not-generate-phar.php-during-cross-compil.patch |  5 +----
 .../php/{php_8.5.12.bb => php_8.5.13.bb}            |  2 +-
 6 files changed, 16 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.12.bb => php_8.5.13.bb} (99%)

-- 
2.35.6

