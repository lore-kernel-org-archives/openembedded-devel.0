Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D992DEDE99F
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.18338.1725959013420350134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fHGDdWXL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959013; x=1757495013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=31bDxjnPMLO3EwhMvp2EMpoMjLuJK5OcUWTxfDh29X8=;
  b=fHGDdWXLdt5l+cRN2HdeKKb+OvCyHj7zNWADLfucmQ8dRXacEDSnqF9C
   AG6LbB/xmgZlj8/CIMOHamNvDArU7Dmq8UHOSQ3T8j5LVtytJCQPISYNc
   HFexOrKXW0cqZ4oSF/kcILsbu3cwJobuZNA+G/zDFpj1bcR61HKMGijad
   G04lwobdkQFzJwDDqU+YSVimwCBYLqUsrHpSWJWbgyNxPk7UdneZoxk3X
   AIoLILUOLteWwFYUlh/56H/J1nHCY1KLfeLSAmVafA2MmMasLam0Ldq7r
   6zKm5RqBM6fDgatEIGWydA0qfKV5CrdHGVQ5x6rU7+f+hVfdmUsqUpfrx
   g==;
X-CSE-ConnectionGUID: kW1eVCfWR8CQOV5yJ/IgbA==
X-CSE-MsgGUID: dI4EJpNwSICoHeddAlZkNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152138461"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152138461"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEFDDD8012
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23A97D73A0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B029C6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63EBC1A000B;
	Tue, 10 Sep 2024 17:03:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/42] python3-pefile: upgrade 2023.2.7 -> 2024.8.26
Date: Tue, 10 Sep 2024 17:02:52 +0800
Message-Id: <1725958990-5719-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.737500-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yUIIxwDaU5mrlHLUcNM85dpYC5LPd7BvbXZQ
	BZYK9lVf2wO8wm8URrzvdKUyyZbQ2Hz9R3+almkARcGHEV0WBxDzndiJkHFMhJfHgnfL4gdU7l+
	AnXVI0e2Ekt/L8HtAJ61mm4/cOEK2ZW/urdIQGaASEYfcJF0pRdUEOicf335WVWYnJ14MUqgNoe
	KH3HRbwI7rQo8r780Db+3wWhlEag7BLTSC5Tf0uUocPLxXXRncArRmBtM54pSpTkI0HK8zpVz4T
	5t8xhRdoJlL8aD3eJtzDINIhVngV4ALX2fTNBeIA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfo
	MGP+CwQi+t+0AiFaYjE41bFBKcdLCt0s7GW9leh8LCAHuMHCRgYAPqHoVmYRsp5O052MzLpr/UM
	w7Cm/1+fOVcxjDhcwPcCXjNqUmkUnRE+fI6etkmh9R+ortq9W/2q0cQsDEFy7GBC0LbiQPTCF+i
	HWuErkiK4IqMEDPQO58xv8pW2s/mY5MeLIS1i3tkrQoV02lWeHfdbt0A9T6YpebMSk1UmKlmXPg
	yQocYp5E1G2nFNyeETBf0diyKhk7DIVgUu7mCo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112210

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Close the data attribute before reassigning it
- Floor division (//) does mathematical division with the floor functio…
- Update new dvrt type and Load Config filed adapt to Windows11
- fix PE.get_data
- Fix ambiguous string syntax for PEid parsing regexp
- fixed a memory leak that caused the pe file to be access locked.
- Exphash from sha256 to md5 to match imphash
- More readable calls to superclass
- Fix cache_adjust_FileAlignment to work with files not aligned to 0x200
- [StepSecurity] Apply security best practices
- Create sets using curly brackets
- Change IOError to OSError
- Apply isort to sort all imports
- Remove "OC Patch" comments
- Update tox.ini Python versions
- Use with statement to write to file
- Remove distutils use
- Use chaining comparison operators
- Replace list comprehension with set comprehension
- Use not in operator
- Replace base class name with super()
- Increase readability and consistency
- Tiny comment improvements
- Update oleaut32.py from oleaut32.dll
- Improve parse_rich_header
- Include ordinals for wsock32.dll
- Update ws2_32.py from ws2_32.dll
- Update pefile.py for typo
- Add parsing for IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-pefile_2023.2.7.bb => python3-pefile_2024.8.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python3-pefile_2023.2.7.bb => python3-pefile_2024.8.26.bb} (84%)

diff --git a/meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
similarity index 84%
rename from meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb
rename to meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
index e30b36232..87e651d9d 100644
--- a/meta-oe/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ b/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python PE parsing module"
 DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
 HOMEPAGE = "https://github.com/erocarrera/pefile"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
 
 inherit setuptools3 ptest
-SRCREV = "1ab2807c4eec16041e791d7a6acc68cc23fd5266"
+SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
 SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
            file://run-ptest"
 S = "${WORKDIR}/git"
-- 
2.34.1


