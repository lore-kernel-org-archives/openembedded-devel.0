Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34B4C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:06:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.1694.1666055207718087469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HO/yTk5F;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055206; i=@fujitsu.com;
	bh=Ayf7eXX4L9vALHbEkKgJujFXq3fcNPTbSBMCD302Als=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HO/yTk5FL/XcNwtN+674u/SjK+Cq3lk3ZkG/GzBFvZhKq6GpfY6ZaQy0Q8KoBrHjm
	 3pzpfHoMUWrO5iyPjV1SNEedYKW1DmzkhzhRO9WDS4jRLlWp8NO6+G4+x2ojxKophp
	 YqDfpJrcCbR5aeTbAk5Mq3gJ9sNIRinb0izIEq/qM6DPWQdfnNHizUbWRdbL9cAc3U
	 fAgP2uJxWfcVMynXAUwkwJvye83qZ0azKmtAOvSqsebsitvT1XsrThoBkEgqKi7Bma
	 GJRy+UIGSOZTpGkSurk8DxUg1LJ91Zp2DIlGQ5Xsw4GpWk8cvlNcTRBOhMe5b/mFGS
	 1TK9n7G78OtKg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWVf5j2+
  yweoThhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+e9+ZC1ZwVKybsYO9gfE0excjF4eQwENG
  iSXL97BBOFeYJH6/vMgM4exhlHg5aQdrFyMnB5uAmsT0WzfAbBEBfYmls/cwg9jMAioSL373A
  I3i4BAWcJfYtScEJMwioCpxeGoDI4jNK+AoMffeFLBWCQEFiSkP34O1cgo4SfxreghmCwHVTL
  y0gAWiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGukV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxCVAmsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwdFOKFb7vYOxe+kfvEKMkB5OSKG/HDN9kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8H
  T+AcoJFqempFWmZOcA4gklLcPAoifBGnQFK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnN
  fwN1CRAEhRRmke3AhYTF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMz75ifQFJ7MvBK4Ta+
  AjmACOiJjvxfIESWJCCmpBibZbGUhno+nUi6kzDPVF32XFzTjWZnFnFML6/gmveX/dV/o8IV1
  H+49/HzlpfPeKU/+ZT17cn3Wy1nraj/ryLLFfD0jnykps3uCUej8APd/Uk+OeUSuEBI4kCN2f
  sa+7rQ/+zu2T+wLaN16+N0N051fpk1vWVxXYLJl3XpfvVLRym3M/HOTPyTc51+5XtqHdY1CVh
  6vgljRxAPWOTs27ygtmnW9zvaFXIlFS52+hceGW5OP25y6P0PYY+6ci2lf7LiasiVO7GNW0JR
  pc/j8YO3Fc5E34p/lRqxwa8vdUbDli8PVZw+utBtX/X5v3r7TdfOt0KvtKYVvfPMmv1s/7WGz
  65qIr77Ldh11+LZpnsSsz0osxRmJhlrMRcWJAGIkMVpkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1666055203!280134!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28367 invoked from network); 18 Oct 2022 01:06:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:06:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 88A5C151
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7C4CC150
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:06:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:06:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] debootstrap: upgrade 1.0.127 -> 1.0.128
Date: Tue, 18 Oct 2022 09:06:15 +0800
Message-ID: <1666055176-8001-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
References: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99210

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{debootstrap_1.0.127.bb => debootstrap_1.0.128.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.127.bb => debootstrap_1.0.128.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
index 5e0a488429..4d13aa66c8 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.127.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.128.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "45887cf0582e6d16598e50713278d16b2272d02bdd117a9876e98277300dabd4"
+SRC_URI[sha256sum] = "09e7f8795fee894b77994213ee3a588e9d8f96ddf5f93afdec91e9a137aa7866"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.25.1


