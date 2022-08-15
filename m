Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B579DC3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:49:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.13719.1660546168748903192
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hL0gMIKN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660546167; i=@fujitsu.com;
	bh=KdARrMzYyEQnWJQ/TG1ZF+WuToIe6kXmC37T4W/wywc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hL0gMIKNmcqZvYbjBkwB2c6y5xayzdKWUdjB3m/9HPleGMIH6RjfVLRg0enx2xe1K
	 D5Iv8ic+oa/qh9cx0eUMLs8sf7G4zkmJs8yHEMCaYcqHXQPlW0cMuf8DdUpQwy9bws
	 JUzFFQNuMT2jOzj97H3SJXQoe2djNjrqkJcrswFIF+a3btxiaFXVmJLyusaCMqtpKa
	 lj1WuqLg2K+MhcQKfnS0bspJrCCimOK54wZ2MqU7GRkSUhKt25cGUg9Bblojkg0vrJ
	 +2KQNrcVlUHWIihjKrh7FZXeHqI6CItsQIu+zNlRYZBM8MH7f06vrzUsqppo59G9Es
	 d9VSmcxykmenw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8OxWbfszc8
  kgyufJC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxpXauYCs6wV3ye84KxgfEtWxcjF4eQwENG
  iY/vHrNAOFeYJDYt2wHl7GGU+LXjK1MXIycHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373s
  HcxcnAIC9hJHDpnAxJmEVCV2HBiBTNImFfAUeLtwkSQsISAgsSUh+/BOjkFnCS6bt8Ds4WASj
  Y07mYEsXkFBCVOznzCAjFdQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9ll
  I2hcwMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1tgBShnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFBnFKslr+D8e/Kn3qHGCU5mJREea9d/JkkxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYLX9BVQTrAoNT21Ii0zBxhRMGkJDh4lEd6+F0Bp3uKCxNzizHSI1ClGS46ps//tZ+
  ZYDiZnfm07wCzEkpeflyolzusBMk8ApCGjNA9uHCzqLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5j0MMoUnM68EbusroIOYgA7Su/sd5KCSRISUVAMT/5Xzl2U3/fzWWPVmYajpem/1TTu9
  T239X/Fw/ufzjW+DMpxCm8xlp+uc/+TD19qRyGlfVLxJ19H71D0np4zXQSu/fTzduLZxwU+2s
  EdLDy5eoMO+dWtX99SfBy+FL3ovo+e5xkIsaeOBjulXA5cKTUk9ufhLmcPs7UHfTI5tufO6Sz
  ptxiw/QYG/bXuyvMIeB63jc3tenyl+q06YuzsmvP7nZ95ulz6TE1EBK54fU3+zOpH/T2FXpfM
  ZlxjPm7sqb212CXp/5eJ+rZ9y2mbrzzG/7Jx9iP8yywWLzQ6FZ9/vU91u8Dn8GO/shgRzZ6bJ
  XA4ycblaSif2LHz9JerZ7G225s3XLLWWqUptOJP6SYmlOCPRUIu5qDgRAIg+0tp1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1660546166!120975!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27164 invoked from network); 15 Aug 2022 06:49:26 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:49:26 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 240A114E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 17DAA14C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:49:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.7 -> 0.8.8
Date: Mon, 15 Aug 2022 14:49:05 +0800
Message-ID: <1660546148-1668-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
References: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:49:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98255

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.7.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.8.bb
index 3441568005..89411cecc9 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
@@ -9,7 +9,7 @@ inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494"
+SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
 
 SECTION = "base"
 
-- 
2.25.1


