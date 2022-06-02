Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C232C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:39:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.1726.1654133940740970211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v7vWsQLI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133938; i=@fujitsu.com;
	bh=ZJmKa3npcbhZ+9AHGeo/53ElPXvebox43EBAp7WSaPk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v7vWsQLIfMCZYkyPHv4rmcGbhDzo8zwUWZa2+kaf/hT7DMVxNqqPAW05TRpwqHVT0
	 dErdGI2zbGXRPDmnaDciivrByevDZoeDf4UifPp2I58bP8YVTEE4X/MB6h9+FfFsS4
	 IFNeODXsisDAqgqfzI1EqoaoarXqlwmYfheuoT3sgNj4thy/bA22nWV2dHKbTiIARu
	 OgVko08XLiMDhhaEXAEY0vlX/TEf7d1DFkexGj65xXw/aJhGaqA/CQgsd+9H9AR7Of
	 IC4PopM/UzZ8+cNdD81NgmLyPZpDBmC59YrykV50mmmi2s70bcmVEpG1QejrRlX56B
	 JQWccWD5X9oaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLtJZEa
  Swad+XouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP5x6lMBXO4KhY8mszcwLiAs4uRi0NI4Amj
  ROPPVmYI5wKTxLPGLrYuRk4gZz+jxITF8iA2m4CuxIsfi1lAbBEBfYmls/cwg9jCAr4Sz7pfs
  4PYLAIqEntfTAOzeQU8JOY0fQOrkRBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eAEU5wCqUZSYPV
  0eorxC4vXhS1CtahJXz21insDINwtJ9ywk3QsYmVYx2iQVZaZnlOQmZuboGhoY6Boamupamuk
  aGRroJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZfSnHCpR2M6/b90jvE
  KMnBpCTKu9NxepIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV4P4RlJQoJFqempFWmZOcBYgElLc
  PAoifDmMQKleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolznsJZIYASFFGaR7cCFhcXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsLjHIhnsy8ErhNr4COYAI64tq3KSBHlCQipKQamNr
  yZs1NExT1KC75yFX6Re7KkiTPdPF1Vyd+PnfUPm7/tCKVer767IT8tEnha0WD13nV6Nw5LTuR
  VeNGSNOWMF997V9rnteZb+u3nlZ04ZmA34MPIaaTqg9LxTuYJzDPri+XqPvdk/V27v8VkQG/L
  s5JaN5w4PEWprvTzpm0zYlbf+OfXekF//UGxk5XhGO293OaL/tubXIw/Zz1jMuqtouanG2zgo
  +u6rqqpZIckLDuY/CRtlT71x8uLl0378PpEsck/zj3bdfD/4QxNttsZ7EQXdlm4KLwKObHxkk
  x7yLWhoW/Ct0wcbNwdfjjV84yrkZlRufLjgq+XumzqCDrjFvDm3W8idWTlS5ZvVTapcRSnJFo
  qMVcVJwIAEkrK+RGAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-728.messagelabs.com!1654133937!432324!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11011 invoked from network); 2 Jun 2022 01:38:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:38:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 99D94100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:57 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8DC11100180
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:57 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:38:41 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.19.2 -> 2.19.3
Date: Thu, 2 Jun 2022 09:38:32 +0800
Message-ID: <1654133912-29532-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:39:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97377

Changelog:
===========
Fix
----
    Correctly read STK volumes in v3 (#805) (9b739ab)

Other
-----
    Include py.typed in package (#815) (ba63485)
    Add GA token (#814) (c9a2852)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-imageio_2.19.2.bb => python3-imageio_2.19.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.19.2.bb => python3-imageio_2.19.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb b/meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb
index b792b9885..86229322b 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.19.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "46e1e74128837d2a1ebc87476b7f73978b69a128fa238bc989b625a9819bd9b3"
+SRC_URI[sha256sum] = "0c9df80e42f2ee68bea92001e7fcf612aa149910efe040eb757f5ce323250ae1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


