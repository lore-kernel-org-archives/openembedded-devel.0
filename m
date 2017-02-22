Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5A971DEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:53:59 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A/e0inh/zAQ79Pv9uRHKM819IXTAuvvDOBiVQ1KB2?=
	=?us-ascii?q?2+McTK2v8tzYMVDF4r011RmSDNidsqwP17GempujcFRI2YyGvnEGfc4EfD4+ou?=
	=?us-ascii?q?JSoTYdBtWYA1bwNv/gYn9yNs1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgpp?=
	=?us-ascii?q?POT1HZPZg9iq2+yo9ZDeZwVFiCCgbb5zIxm7ogvcvdQKjIV/Lao81gHHqWZSde?=
	=?us-ascii?q?RMwmNoK1OTnxLi6cq14ZVu7Sdete8/+sBZSan1cLg2QrJeDDQ9LmA6/9brugXZ?=
	=?us-ascii?q?TQuO/XQTTGMbmQdVDgff7RH6WpDxsjbmtud4xSKXM9H6QawyVD+/6apgVR3mhz?=
	=?us-ascii?q?odNzMh8G/ZlNF+gqxYrhymqBNw34HabZqJNPd9ZK7RYckXSXZDU8tXSidPApm8?=
	=?us-ascii?q?b4wKD+cZOehXtZXyp1wVohu5GAKhGPnvxSVHhn/r2601zvouGhzc0gs6BdIBrn?=
	=?us-ascii?q?XVp8jyOacQS++11rPHzTreb/NQxDjy9pPFchEuof6WWbJwcNDexVMzGAPCi1Wd?=
	=?us-ascii?q?sIroNC6b2OQKtmiU9etgVeS3hm4+twF9uDmvxsA0hojJgYIa1kzE9SJhwIYvIt?=
	=?us-ascii?q?24SlB0bsK4EJdKsCGaLYR2T8U/SG9roCY30rkLtYOhcCQX1ZgqxQTTZviDfoSS?=
	=?us-ascii?q?/x7uVOacLDFlj3x/Yr2/nQy98U24x+35Ucm7zUhFozJektnJqnANzxvT6tWbSv?=
	=?us-ascii?q?dl/keuxzKP1wfL5+FKO080k6vaK58nwrEujJYTsEvDETXymEX3lqCabFkr+u+t?=
	=?us-ascii?q?6+j/Y7XmoIGTN5Nshwz6L6gigNGzDfk6PwQUW2WW/f6w2KDj8ED5WLlKi+c5kq?=
	=?us-ascii?q?jdsJDUP8Qboau5DhdX0ok58RawFTim0MkenXYaMl1IYxOHj4fzNFHKIfD3F+2z?=
	=?us-ascii?q?jEirkDdu3/zGJKHuAo3RLnjfl7fsZbF961ZCxwo1099f4olbBa8cL/3uRED+qc?=
	=?us-ascii?q?XUAQInPAyq3ennDM5w1ocfWWKUHq+ZK7nesViQ5u0xJemDeooVty3jJPc4+vHh?=
	=?us-ascii?q?k2I2lUUafamz0psdcGq4Eeh+I0WFfXrshc8MEWAWvgUkUuzqiVqCXCVUZ3apRK?=
	=?us-ascii?q?I95io7CJ64AofGXYChmqCO3CC+HpFMfW9GEEiGEW30eIWcR/cMdCWSL9dkkjMe?=
	=?us-ascii?q?T7ihV44h1Re0uA/40bVnKPHU9TcDuJLs0dh6/ezTlRUo+TNoCMSd1jLFc2YhmX?=
	=?us-ascii?q?sFQTIz1q1zrUFxj1uOz6V8q/hZDsBIofRRXwE3MJTRw+B3B5b1QA2SUM2OTQOE?=
	=?us-ascii?q?S96hCzZ5Z8g4zMIIb0s1I1S4gwKLiyijGbYairqHCbQ1/avY3nG3LMF4nSWVnJ?=
	=?us-ascii?q?I9hkUrF5McfVatgbRyolDe?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H1BgCTiK1Y/5tjdVteHgYMGQYMgyZhg?=
	=?us-ascii?q?QmDW4p6oUmCRIIPgg0aEIV4gnxBFgEBAQEBAQEBAQEBAl8ogjMgDz0QAQEBAQE?=
	=?us-ascii?q?BAQEBIwEBAQEBASMCDYEHDwFGNQImAnKJeQEJrnSCJotFAQsBJYELhUGKD4IAD?=
	=?us-ascii?q?C6CXwWcEIZ0iy8CgkyOQkiSXSYLJ4EAVIcdPzWKFAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2H1BgCTiK1Y/5tjdVteHgYMGQYMgyZhgQmDW4p6oUmCRII?=
	=?us-ascii?q?Pgg0aEIV4gnxBFgEBAQEBAQEBAQEBAl8ogjMgDz0QAQEBAQEBAQEBIwEBAQEBA?=
	=?us-ascii?q?SMCDYEHDwFGNQImAnKJeQEJrnSCJotFAQsBJYELhUGKD4IADC6CXwWcEIZ0iy8?=
	=?us-ascii?q?CgkyOQkiSXSYLJ4EAVIcdPzWKFAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.35,194,1484002800"; d="scan'208";a="162902284"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 22 Feb 2017 13:53:58 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cgWQf-0006ru-PE; Wed, 22 Feb 2017 13:53:57 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cgWQd-0005Y7-57; Wed, 22 Feb 2017 13:53:55 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:53:49 +0100
Message-Id: <1487768029-5984-1-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [meta-browser][PATCH] chromium: disable generate_character_data for qemux86
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
X-List-Received-Date: Wed, 22 Feb 2017 12:54:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chromium-wayland fails with:
  http://errors.yoctoproject.org/Errors/Build/32356/

Root cause seems to be ICU mixing host and target architectures,
same as in: https://bugreports.qt.io/browse/QTBUG-57705

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 0e7250e..0076f3a 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -15,6 +15,7 @@ inherit gettext pythonnative
 
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
 GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+GYP_DEFINES_append_qemux86 = " generate_character_data=0"
 
 do_configure() {
 	cd ${S}
-- 
2.7.4


