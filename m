Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DA5C0219A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30513.1735032447879890117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZYC9/wip;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032451; x=1766568451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uTLNIujxIKwdPqQFIFSTeie7gQ5RNLU34JFZ97o4M1w=;
  b=ZYC9/wipe44G7ZbMvnYrWg9OWQ6AA8RLHbU9Hvrws2KesyNb7duM7DvH
   WZI9sDzQbfpN3FX+tkykIW2cDhUEpvhcpNH685Urrqt0md2axx/0ATDOG
   YEB0HS2Rzh8HPcagweT4F63qet89Fv1YmaK7waYeYgfWzaTo27kUBLEI7
   +kg7jrK1J3IkV4mwzJlOwX00bBf/Dwnwvx9W/zdYzRpGldgSkCPl//NrO
   yKhmziB7B3rbL6NirUxx7nC5MU9mJEq3YdpONraJXmbzl6wzOmLerYKrB
   lrQ3OK6icw1ocVdkvdnfzXeDYa3dljTp8U20OjtO4ON0yvAqBzBbk8jC7
   g==;
X-CSE-ConnectionGUID: DO9oOrdJQGW49YFGexZ2Hg==
X-CSE-MsgGUID: FLCSUNy1SaWE3Ut7l5B8Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809920"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809920"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31E1FD4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 03A34D5B40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8952A6BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F5A41A0071;
	Tue, 24 Dec 2024 17:27:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 59/67] python3-typer: upgrade 0.14.0 -> 0.15.1
Date: Tue, 24 Dec 2024 17:26:53 +0800
Message-Id: <1735032421-13513-59-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SkiGlzQ/MQdk3dyIm9Pdvs/vWSrJOagpcHr7M7o7MBXOLEm
	zKtYAFIWpFYZMEVCZV/yOdvaOHpHo5l02WqeDiUNQcE8ZV5d4DS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114528

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://typer.tiangolo.com/release-notes/#docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-typer_0.14.0.bb => python3-typer_0.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.14.0.bb => python3-typer_0.15.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.14.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.15.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.15.1.bb
index 4074f31eb8..6206427a70 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.15.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/tiangolo/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "af58f737f8d0c0c37b9f955a6d39000b9ff97813afcbeef56af5e37cf743b45a"
+SRC_URI[sha256sum] = "a0588c0a7fa68a1978a069818657778f86abe6ff5ea6abf472f940a08bfe4f0a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


