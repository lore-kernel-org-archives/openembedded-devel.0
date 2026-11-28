Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2399.1795842057748874330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=acA8qJ7F;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=905; q=dns/txt;
  s=iport01; t=1795842057; x=1797051657;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XCowZksrmlWATIylRJ1OmsrPQ9zpsqVMUWWV3PaUa2g=;
  b=acA8qJ7FyK1GTvHbzru/zBJ4G27Rt6HGAgpt3jCwK9aYR2PDe5pNStF2
   IQOTB9XzJrrvy1D9dolICX5ouqwOl/bP17yj/xgwEGjslq+4vdiWCTHNU
   ly/O2B8Lw0K+hwWvxnGBWB/jwEXzdqYrWLePn4E16fAh33XvXPxtpvSs0
   /TitKMbdU0WlNI2lHuqBEWqd+4NRpzEScfzpFx8ae2GLHM1CnWdB1YJCa
   mi6u4Q7jcehAB8YqZH5NXvyrwoCdKQLHe70qzDtkUHC77PFSryoWVpekd
   h740F0QTHQt4ZdErrPPCefIF5v/cb7VQ14PqbeaVlkMxSW5J4W7yIJ6sL
   g==;
X-CSE-ConnectionGUID: HfxIXDjtS62lce8u0Vcu3w==
X-CSE-MsgGUID: 0WcK8NSNSoSvKe7ESl3oyg==
X-IPAS-Result: =?us-ascii?q?A0BXAwAEXwpr/9JK/pBaglmDTGBDSZQqoE2Bfg8BAQEPM?=
 =?us-ascii?q?SAEAQGTKgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBACwEYAYE5g0YBgnQDug+BeTOBAYMpAYFU2UuBdBWBOI1ndQGEficbgUlEg?=
 =?us-ascii?q?RWDaoUQhXkEgxwSmQZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA1uBKyZeIYEGgXYCglGCAAIBRkEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0McjkQMBwkLwUXJjwbB4EMJx0bFw4CKAYVI?=
 =?us-ascii?q?QtDGA1IESw3FRkEPm4HlBKDHIEPllKReqERhCuMJJU6GjOqc5kIpFyEaoFoP?=
 =?us-ascii?q?IFZMxoIGxWDIglKGQ/gfyYyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:5rwTYKtmg6qQkumE7HeCB/r5xOfnVANfMUV32f8akzHdYApBsoF/q
 tZmKWmEP6rYYjb8LtxyPNm/ph4CuJHTxoNmSQBrrCsyEywagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2uhnIFFi9
 +AjdmoJZR3TmrqIy6/gVbw57igjBJGD0II3s3x6iDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYw9/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGISJI4faG5wM9qqej
 jr59EepJCo8D9uk1xmIrV+XgrTIjCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:WwoYv6sZzoFimDXBjFPZeF7d7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:eG84xW6b229P44K/39ss1EAEO/AJcGHmki3UKELoFD5XQ6DOVgrF
X-Talos-MUID: 9a23:oSGjGQkWYPzdy2DAsiQIdno6C8xLs4KVLnsKqosltpapDigrPCaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="64138611"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:00:55 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 331DE1800081A
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:00:55 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id D22DFCC1611; Fri, 27 Nov 2026 21:00:53 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 0/1] php: upgrade 8.5.12 -> 8.5.13
Date: Fri, 27 Nov 2026 21:00:52 -0800
Message-Id: <20261128050053.4132503-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133397
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
2.55.0

