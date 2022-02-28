Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29537C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:08:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.19975.1646057280349625267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tc8lV4Bn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057278; i=@fujitsu.com;
	bh=WU1Ijabqr4OGm8StDeZ8C+mKLsUgnBHIJ1Tpx4LfSqA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tc8lV4BnxAbKPwdrCiwUqbS+CBC4S5py3mnxgO3sghzBiA47oOAa1SRAG21d3N4KY
	 V0PwSYd8ERX56Ig+xw9d5k5lyw35Rn+eADnn8pUdE0+kAYZDf1tzcdfD/SFhXCdDK7
	 FkjeU9WH9SiSycz2H2BKaNSsEdkg6bDdjiHagUiWFRGw3lWGCvuBSHRAsN4Y7xsHxI
	 TnP8uEzVUqRiv/f33KP9OMMuIvNSuNS3cE3yHOnyrdLbXvpMY7p3Nn2zLDaS49UTi1
	 qXONPQ+NSBh3nMHcqsIZaTw/kB6eqN8x8/z+PRlWAK4tm0Ag3by6m13mj4yTqt4T7q
	 ALZfHo838o2Qw==
Received: from [100.115.66.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 21/90-24566-E37DC126; Mon, 28 Feb 2022 14:07:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSdfuuky
  SwepTfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bOnSeYCo5yVfR8fsHcwHics4uRi0NI4Amj
  xIQP31ggnAtMEj2nTzNDOCcYJR43rQRyODnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw97F
  yMHh7CAo8TMCSkgYRYBVYkP/1ezg9i8Ak4SWw53g9kSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itE0qykzPKMlNzMzRNTQ
  w0DU0NNU1M9O1NNNLrNJN1Est1U1OzSspSgTK6iWWF+ulFhfrFVfmJuek6OWllmxiBIZmSrFT
  wg7GR30/9Q4xSnIwKYnycnZJJgnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4O08JpMkJFiUmp5ak
  ZaZA4wTmLQEB4+SCO/Ty0Bp3uKCxNzizHSI1ClGRSlxXsurQAkBkERGaR5cGyw2LzHKSgnzMj
  IwMAjxFKQW5WaWoMq/YhTnYFQS5r0IMoUnM68EbvoroMVMQIv/BkuBLC5JREhJNTAtPfjyxvM
  TzI+0FcwiZDtnKqxn9Fvp/6lPtGlaWyKb0o+2spmPMs2/vNvwuPfj2zXX4w1vMl2xuHDws8XL
  pXP/PfkVzmqrITrRRGDuHh3bnRbNXeUH8s/Fc0pP/C2+LMuV0VGVd2PexiRfZXszq4XL5WQvC
  FdwMxsWmDTlK84M/bXaLIev9k+U6PTiI4oRJfyCsduUln0MsAp7euTvFfsXT426BUqDJzYpZ6
  s1MJ566Hcv7l2O+uNF3TGfdd/m3oleqnczdbZpnM/8zDe2Oi3lBXPFJHdGMV3dLTKt/rXKEu/
  p91e6Hmq2lw/9+72qZt0VmcvTBS6zZUo0rZf659axa26iVdDtfY4zN77XlVViKc5INNRiLipO
  BABqd7lsSAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-532.messagelabs.com!1646057277!46441!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30858 invoked from network); 28 Feb 2022 14:07:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:07:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BC3D610044C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:07:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A450100354
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:07:57 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:07:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.88 -> 0.1.90
Date: Mon, 28 Feb 2022 22:07:36 +0800
Message-ID: <1646057257-36047-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 14:08:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95569

Automatic LUT creation for conversions from &lt;24bpp of colorant componants,
SIMD builds for x86_64 micro-architecture levels and ARM neon, pre-defined
CIE Lab u8 and CIE Lab u16 formats. Fix bug of an unlocked non-locked mutex,
which started failing on some platforms.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.88.bb => babl_0.1.90.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.88.bb => babl_0.1.90.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.88.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.88.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
index 8a09fdf0e5..cf10a5ce80 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.88.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
@@ -15,6 +15,6 @@ CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4f0d7f4aaa0bb2e725f349adf7b351a957d9fb26d555d9895a7af816b4167039"
+SRC_URI[sha256sum] = "6e2ebb636f37581588e3d02499b3d2f69f9ac73e34a262f42911d7f5906a9243"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


