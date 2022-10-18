Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A3EC43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:08:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.1751.1666055305048248092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ODY6R9p5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055303; i=@fujitsu.com;
	bh=zdfH5am61uVPENTYRd3lhkup5Wx+HQ4z3wnRKwNudqA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ODY6R9p56aHy51LPeUpcgz35rvOvbnM2if3Z5Kp7glfi7ft03jBMa5PAwogotPcrC
	 zggb4v28OVydXQplIZCmd9E06eSTvtCulFC3lV1vOeW+rCQ+4fEGozWNXnps51Nsgm
	 6kmZsfgyYaEBUrOshI5kaQloeFctPUILx+1mXhVdEPofXUAGeg7v5O4OjvV9iXdB5S
	 bHzjyuNWqY2zgRZZAho3os8upLq55LtGgLlhE86i23VT0yprwpOrSyP8c2TwRmwkTj
	 nfyd5G/XVbuitCdL8rqSDgDUKYfpOFhPDyZIe+Ja4hGgV/qsA2tL3f1yCb6adbADSt
	 97OY90nRvJ5JA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpNv2xzf
  Z4E63lMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHq6RyWghaOiv7GpWwNjEvZuxi5OIQEHjJK
  NP1pZYVwrjBJTJ01lxHC2cMocebOKpYuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQU8JJbuvAlWzyKgKjH/1wpGEJtXwFHi7aa1YHEJAQWJKQ/fg/VyCjhJPN25AGymEFDN6f
  ln2CHqBSVOznzCAjFfQuLgixfMEL2KErMvN0PNqZCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNfQWC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHxTihVn7GD8t+yP3iFGSQ4mJVHejhm+yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  Dt+AOUEi1LTUyvSMnOAsQSTluDgURLhjToDlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  jv6d9ARQIgRRmleXAjYHF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb+ovoCk8mXklcJt
  eAR3BBHRExn4vkCNKEhFSUg1MBZ+v7bz4R3U727aG/rPVvWanvKf9lD8psqlfunBN1AG3BXI/
  Cuz1Vl9U3Ot5kEfxpv13pqN6URnlLjs81jIZZ57/tGqu51Gj6Xvk1garBQddWry8ZIHunS1MW
  dq8IoryL2dy+/JsqNuiNiGor/qV1aPgQCa3LXskfVeY5qfv3/81+oq95P5ve7oWNzKp/wxbd2
  /FNK6m7kUGrpnllbMnzfPg8ErRn5/+VUxEmVHX9PD6uCeW2RHOvNIaa8s2VV37G7KVf3Xww6c
  JVauX737ydKqvVPUOptlH1tjMPpbXXMyW0mCXsNJ5VrfpbPsz102r+4458hUJHlHSrt51+K5J
  YWNEfEQs98/TJwviC4yUWIozEg21mIuKEwETwu0zZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1666055302!11282!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3300 invoked from network); 18 Oct 2022 01:08:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:08:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 268531AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1B5821AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:08:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.33.1 -> 1.33.2
Date: Tue, 18 Oct 2022 09:07:54 +0800
Message-ID: <1666055276-8042-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
References: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99214

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.1.bb => nbdkit_1.33.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.1.bb => nbdkit_1.33.2.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb
index 322f89c22b..ad7b9a6fab 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "9ebc70dae82220f962167b1668fd2af6de886b16"
+SRCREV = "9e2fdefc1ba4c883c5e6aa4f32ab21777980a978"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


