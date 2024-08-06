Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500EAC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2880.1722934013670700503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aOFcxolN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934014; x=1754470014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tG2R8A00mr3N28O2Xq2QZpNaiSsjPX26twgiCMu09d8=;
  b=aOFcxolNie3KK6Ll6Fr42OJPTeBxCfWdNFWl5hlNjLejy3+hHqGZ7jmy
   sdKhNhIURgo7ovWLh+5z4QYlo2F+sKFNiTQMbHij7RW575yiTSUljlfAU
   mubP6qVwimaq/1NVlZ9BduvNndZaas9MeUGYw75XygjPdiMER5bLGRIbz
   odnI0HdNia6T2BvcyYRS7G09AINUEf0zUBWkM94qMjA5suVgoiAajJvgw
   tzMDsxhc7dNe5Z8A1muBn09bGM0aRealYOfTCxHpJC5RPdvTa+mTGa7Gc
   8/iE62/VALhwLMm81f1WcAk/vRq7+Y/Xnvja4Ms47cLMvFGy3mxcoA95F
   w==;
X-CSE-ConnectionGUID: fMWC079ESg62a1Aulp6o3Q==
X-CSE-MsgGUID: y6q7fIUGT+iLRC1mj9Dujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169912605"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169912605"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E3B7D424E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A0A3CBF3DD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42F8EE5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4EC11A0002;
	Tue,  6 Aug 2024 16:46:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/60] cmark: upgrade 0.31.0 -> 0.31.1
Date: Tue,  6 Aug 2024 16:45:37 +0800
Message-Id: <1722933994-32549-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrWDeWlmLz+4ifPnbdZW8rTYoZAunPkjRRiiJEfSJJWoaH43hS8Kg3GP09d
	nQV2a4TKWbE42LgYGbxdlqsvj3w6mbX/Rl4PkvxR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111520

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/cmark/{cmark_0.31.0.bb => cmark_0.31.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.31.0.bb => cmark_0.31.1.bb} (89%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.31.0.bb b/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
similarity index 89%
rename from meta-oe/recipes-support/cmark/cmark_0.31.0.bb
rename to meta-oe/recipes-support/cmark/cmark_0.31.1.bb
index ce8b4cd49..1edb95e45 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.31.0.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.31.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
-SRCREV = "8fbf029685482827828b5858444157052f1b0a5f"
+SRCREV = "bb3678d7a73cb02d35c8876ecd097072636200a8"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.34.1


