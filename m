Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1BBE69EA6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8215.1733185028024875654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LjhHNXtH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185028; x=1764721028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C5cKtyfI1Ev6aQmjAXnuVtak4tkZhQyuKguDshJcq/Q=;
  b=LjhHNXtH9cE/iWmOlQVLiKPJ4zXoIB5npU3t64dqAbk8/e4YAp4n1aH7
   AXDbBzsiT1i9marHhE3ShMdxFIQX3eLIYavwMjl/EAEz+upyyWDMXs2ee
   icblg1p5S3nLEuw/sR8aSvTjI805Al1lYcK368oVBYxaOtnaoyJ4ibdzE
   eJEoKzj0zuIGC9wRHy1I3+smKv4XozYmp0tkw0ME8sHgg/grXwdfpPypP
   8MuD86alPeTA41+TtMQ7SU//JCMhsElO2AvKLF0U4yy0s4IOWyfrtbdcx
   YL738DnPft2w1cAE3kT9Q0FM4E3CymhJ+PIL40hz7yP17HRwpTwPbFv2P
   A==;
X-CSE-ConnectionGUID: NgxTijASQ4++94mw3nbkYQ==
X-CSE-MsgGUID: 7kTAD2dDQTKPBoriv3fdaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161830282"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161830282"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC73E60B0
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB133BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6868C6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 084161A0071;
	Tue,  3 Dec 2024 08:17:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/34] python3-twine: upgrade 5.1.1 -> 6.0.1
Date: Tue,  3 Dec 2024 08:16:35 +0800
Message-Id: <1733184999-27041-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-0.794600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr5sPqcQkI8pvVtKZKT0dQ2r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AGAD6h6FZmEV42zm1Zi+MJlNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6Mux
	1oF3Y6wTGObJGfeTyNnW/h0bjGlsa3jKq9sgIm18EYayYkz4enriSFSmDhNnXca0Qy86iXUcfyz
	isI1xdz70H+G5Ymn7iCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a regression where twine check would fail to expand wildcards, e.g. twine check 'dist/*'.
- Restore support for pkginfo 1.11

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-twine_5.1.1.bb => python3-twine_6.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_5.1.1.bb => python3-twine_6.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_5.1.1.bb b/meta-python/recipes-devtools/python/python3-twine_6.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_6.0.1.bb
index 13ddc08cd0..9eb9c76de1 100644
--- a/meta-python/recipes-devtools/python/python3-twine_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_6.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "9aa0825139c02b3434d913545c7b847a21c835e11597f5255842d457da2322db"
+SRC_URI[sha256sum] = "36158b09df5406e1c9c1fb8edb24fc2be387709443e7376689b938531582ee27"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


