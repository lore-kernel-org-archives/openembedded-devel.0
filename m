Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187A6C25B78
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6686.1714628974573610003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lSXr7k8g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628976; x=1746164976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=axHih6PFSoaDKTOpJiE5FqYkR557hv5S/akKp27+4u8=;
  b=lSXr7k8gENT2hsVHzwt3dvg88yFMIW25phrGyy0vQvJHsJUTGf9qRLFs
   GE/qgc53kzodFYP/kgBTQpfGak6gYyVoxSBlrUXKTUy2bHIGfWPi7HJgK
   8pkqsvJYIKzhr3ZkhjJbKYhC3uJh8Dtg84ITv580oo8YHm/SU8mh7T1jK
   da+mwrwfLOM3iTulyuOXlDQmTDMIE2QKYCp8p+r3znhd3vRcENJV7S53b
   jdTLl9medndOjBZmR2YcMIVWcLjQP7yCVLMuRrhG0IFbVThX5W9kQIVyM
   YAoND8b0lI0kSfB08mJ1yAaRs4yGV2BIVunXa1S8raEs6ZqABNr/FVg5Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281968"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281968"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7BD0E8FBD
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 269FAD5B51
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE0D7223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6BA8C1A0002;
	Thu,  2 May 2024 13:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/30] qcbor: upgrade 1.2 -> 1.3
Date: Thu,  2 May 2024 10:48:24 -0400
Message-Id: <20240502144829.241208-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--8.309600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yc5sKZgBbe5FpxAd6mi1Ga23Stk62MqiCH6n
	Yzcz2aO7ASI+oQT4NGpatsDGACw+J1aBvJpACoM8e015woyPLfY/2Qj6F/US6tsR/Qrmuhw1n+n
	rvjaMDYG6s3pcSyWQTZ+lLx92IzG5Y6Il5j+kaFc4hD0Y/Y/a70yQ5fRSh265MHDHnR8cUQLTI4
	8G/UH1dpR1R/1BwwfR5p98cjyQCaLshae+2j71nZ1U1lojafr/EITY2UGMiNy0TybP6vL8lCGOn
	vl4tWofWyXEB937q1d5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8Kq+t5hTYAdo7wre
	NwWRWuWnC/rQYk1/4B4tnb1g0YDQwSxytdWZQvg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110228

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Update the LICENSE file from README.md to LICENSE

Changelog:
==========
- Floating-point conversion between half, single and double-precision for
  subnormal values and NaN payloads is completed. These are relatively obscure
  unused parts of IEEE754 floats.
- QCBOREncode_GetErrorState() can now be called after QCBOREncode_Finish() and
  it will always return the correct error.
- User-defined error codes are now supported. The error state can be set with
  the new function QCBORDecode_SetError().
- Fixed a rare condition where QCBORDecode_ VGetNext() would not set the
  Item.uDataType to QCBOR_TYPE_NONE on error.
- Function naming changed to better avoid name collision. This includes internal
  functions. This is to compensate for C not having name spaces like C++.
- Documentation correctly describes mixing of traversal cursor used by GetNext
  with fetch by label in entered maps
- Some increase in test coverage
- A bunch of "TODO:" items were addressed. Most result in no change to the code,
  just changes to documentation and test coverage.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/qcbor/{qcbor_git.bb => qcbor_1.3.bb}   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_git.bb => qcbor_1.3.bb} (79%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.3.bb
similarity index 79%
rename from meta-oe/recipes-extended/qcbor/qcbor_git.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.3.bb
index a87454fa9..f90e814f7 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_git.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.3.bb
@@ -6,13 +6,11 @@ DESCRIPTION = " \
 HOMEPAGE = "https://github.com/laurencelundblade/QCBOR"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README.md;beginline=442;endline=463;md5=b55643261d6d221dac2b7a395105af62"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=498c298542365dfcfe29948c72a5849b"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master"
 
-SRCREV = "44754f738c6534a4304a83d4c6e97b3d3193d887"
-
-PV = "1.2+git"
+SRCREV = "1eba85dbbe78fc1938f8aba2112ba1b228caed30"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


