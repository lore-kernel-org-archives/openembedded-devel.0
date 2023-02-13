Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392B5C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 06:56:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.9168.1676271403102345878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 22:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jjX/atjl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676271401; i=@fujitsu.com;
	bh=2GqWl/ZJ8yTFurRC2gJMSTjTnu8Qn41AoMDdZllXiiE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jjX/atjloCIna6X9fBJoTAEBCtEZ090DGTimGsdisEakxGHv94n/7voN+KPqUVOm1
	 SkEXs1YNVE7dAbrqDHxnY2hCfThjOnGiWOUFOgdoriL9/j5DDrP8f+WCfJ+TaXi3K9
	 GpRzdkVbdvug7XXzYLTsCyrqC4R/xsdZvDUaZpQWCzz1dZVPpjUY3Wjtdrv7qIEsOh
	 Rt33dg9gVIv9BOe1kBin6UnOH7JSDdTymFIlt9pse/8e1CFBO9gjdOLPNq/ckg3E1z
	 NNt19innFynxM2k9Pb5SIune5vHfe+ARW9Snc6DTQVRTJl9EkcWqG8mGbdQcmSzFiS
	 5uuIU4vmLAcjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWVfj/st
  kgyM/NC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozFn7oZC7p4K772uDQwHuXuYuTiEBJ4wCjR
  /HklM4RzhUli968TrBDOXkaJ7c9OMHUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLGAncejjI6BmDg4WAVWJy4/KQMK8Ak4Sbx+sBxsjIaAgMeXhe7BWTgFniSvz/7GA2EJANQ
  v2nWWCqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaF6cWlSWWqRraK6XVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnFSXd2MO7s+6t3iFGSg0lJlHfh6ZfJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4L90CygkWpaanVqRl5gAjCSYtwcGjJMKbBtLKW1yQmFucmQ6ROsWoKCXOe/IGUEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeU3uAk3hycwrgZv+CmgxE9Dix3xgi0s
  SEVJSDUyNJrtX8S1seHet5ILaSsO/X6x0f905elrauTDD5l/t40Y9HoFCyb31N27+n8SyKHnX
  8dC8q4YJ7xdE25/c4R/zS3g3Q54ho+mzZ2tOe71PNV6yNu3YWrt24/xdD85bflgds687ON1de
  5uP3mNJDvGd3iK1vuu/B2q+Sn3zi4fx9tq5TBunpHdJ7j1Vs97ScnbFSaMalfjKhUvPvlRU19
  061bDv4fX5OpI3DrV//bok/bPatoeiBYoaBW0zz52Xvze/fHfuip039oe1vRO+8+dswKZEv2l
  35ppM7Jz3/LST4LstN1Y4eSVcKvuxU/nX2SSOloQ9G3TLZFem2DxhXGJQ8XXCQ0YRrmTpF1XS
  F3R+KrEUZyQaajEXFScCADsnw9NZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1676271400!664705!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12753 invoked from network); 13 Feb 2023 06:56:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 06:56:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 269CC7C
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1AEA973
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 06:56:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ddrescue: upgrade 1.26 -> 1.27
Date: Mon, 13 Feb 2023 14:56:23 +0800
Message-ID: <1676271384-21122-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676271384-21122-1-git-send-email-wangmy@fujitsu.com>
References: <1676271384-21122-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 06:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101064

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* command_mode.cc (do_commands): Fix flush stdout after each command.
  (Reported by Jeffrey Bosboom).
* New option '-W, --compare-before-write'.
 (Suggested by Kajetan Harald Hinner and Petr Slansky).
* main_common.cc (show_option_error):
  New function showing argument and option name.
* main.cc: Remove synonym '--direct'.
* Use 'long long' instead of 'long' for time variables.
* loggers.cc: Missing '#include <cstdlib>'.
* Fix two compiler warnings reported by Christian Franke.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.26.bb => ddrescue_1.27.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.26.bb => ddrescue_1.27.bb} (93%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb
similarity index 93%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb
index a31911b97..7a71d02dc 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.26.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[sha256sum] = "e513cd3a90d9810dfdd91197d40aa40f6df01597bfb5ecfdfb205de1127c551f"
+SRC_URI[sha256sum] = "38c80c98c5a44f15e53663e4510097fd68d6ec20758efdf3a925037c183232eb"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.34.1


