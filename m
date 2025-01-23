Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19BFC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 21:14:43 +0000 (UTC)
Received: from sonic313-14.consmr.mail.bf2.yahoo.com (sonic313-14.consmr.mail.bf2.yahoo.com [74.6.133.124])
 by mx.groups.io with SMTP id smtpd.web11.23083.1737666879092974428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 13:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=sYL/L+nK;
 spf=neutral (domain: yahoo.com, ip: 74.6.133.124, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737666878; bh=iOW98lcaLwZxlwlQiK/Z+YiV02k3hvksGDQI2E3gjbk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=sYL/L+nKvfC0kGJMFAulPTD5ssZJAcC+txHBXOgw/hOYWebM4OETIKWFoww3xNrvQJ7cMf2o9kfDAJdy2rVyHZKcp4UrbU5RlpB2jFDl7H1g2SG1exqQI3wfZBPP+eeSNSju+0ZfErRzrqer/sl2ptAEhwLdaOrNqCTQ2U4ItGugEv0IsjoT+YIk9UlSfGap1lcwxcJp54udEC2qbKGrGpQwunBrbh5I3gdGTvpccEiRb9Fk3xjKpRL2GF076YKmTP9oEjiKRTm/1BcVO0Fu8LOfoxZxphuQfFJ6GxwTF47VPGwxjTq8SB/4ANWQqy2/5SUT+D28wamhE4Kk5ASInA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737666878; bh=v2OuE0cVeLOnwZor3PseJ9yGHg4jbOVvob9rZQOwKfC=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=eg5Hh2xvMXYZk/8LGcxks8ldYtIKjEirY+AddVRy9L40BrHWxmlR8CzCXY8fxDlfoYfp6hNKkBRSMZUZPV8nrjPqIfmZtIxvzDP10CS7TDJmGHhEXQ5u/g6IWM+lc2fuqUQpLY1+06ZZqqY7iaKiQmMlHmlNFDM3iPZfM8cwGyIbqOnZ2d9miFFWmgY6dZ75HVlncfa/cRa+GcmK+pN8UA0adFdnuYXUj3mIYgKvd5Kcvs6aWCULMp4GkJjKOYZTjwRqiJ4YQ4pBv7TISsFq6YW/OSqNCJSK5kqkdnKBsFGjDv02DycAuPnqoaVkpppJuhRxv+7wfpbJ8gRxz3zJrQ==
X-YMail-OSG: Io6Upo4VM1lxC9mtH88r.Uxzj1I0zBWDu8mVrCip5R271HQ_fsJkw6VRLtzvm2.
 g7.NB0ICBiRNxH_1I5y5jrrq2GgB2Nq9B5AIhDn8z6jUyP3lhN4zop_tN8rdOS4sR8gU2djzOKmd
 tqUi8gh0EeY81vsm57NycDZqStlxLb2k9vN4_f8Pl5WITWv3qrivwSjqVDw3ZlL6AVXmauYrei4B
 WBkySoho0yo8rSBXsX.l9MZBbE0hLFs9LF3lPMMqdJB_V.AHlJQci3xKrbWShaE_062Bg3Ggzowv
 SHMtSBYI_ArGMAxqi33vTdc3ISzxjbZn9M1vyNYAhdimY08sFXte_Emy.HY7BzHqWq0KJTlHNG3x
 3r9hQ5yt6nEwMHmxXUKjdUAtF6_Do_C9Cg7gHhleWScyRIsTLs3jz3qVhYP2.GOQIc4SXxStdQbj
 QovEXT8sbzLtYafYoRjQnV0UtOfBYK5pQIeNFeeKO6yLpMImD0IpQCcJsHz8URCh.0VnkeG6zTBB
 wgbjh7BTCKEEr3tE7sXdObgkv0OQDV6GeFDJt_qzhMlMMFr55scZKA2W0D2NqR4BE6Du58dPi0K_
 6Q43n8deYlzJo15sFHlCljbcZGkR5fw.FS9nkLHNcU7LrUly0M4GRuIqV1HhczxYiCfzXjTPGaAH
 lnY3HU7aH9OykMxqW3Wc3Pxf5vVX8Yy9VCmmVRgWooptIvvNX7LXJwGjZ6Ez_8hmO6k1Yoy6UU6k
 DoUnrnN4TKS5JwbonkKjO2y_fj7YvtcDj4EsenzuyRJSLOPDo0_fxUy5FUo13pWuv65kcx0.u8OX
 DvBAvnw_PJtNiqwL7cXAd80VNWOjVSw_OY.8M0Am1rryiZqwB7HgGB6UIEcKkFWkE01TT9HdtBpD
 99nS.x41qhPs_IW5vuZCU49Xxx3NlbPpgWeghPcJaBZJC4olDfhPmNYNdMN70o7h76GKxCOKbk_2
 3O39ZuFtfjBYXlLe6RhdP2v7nb79MDpqeGcGJnIGtwI7OXsyNGxfrYrJQAsW4TiBYgNXusrI0KhV
 GtyD4ZAQNGCwcY5wz02.vTn4W7HhmxpQoHk2gc68TXMxExTLM.2UQRCEJCI3e0u2l9svaV_rDl4W
 h2GtcOxMZj2zQhztIYvvVIEX2y7siMLTH2EFeGUDkxL2wF8hjhKjBlprrW64GJ.z2teUTY_o.SQp
 4zrlCfMKuyRlrZv0PkI0PtOIWQmcGRoKHsynbN5rSn6fp_GrtdV9wnt6emDAEHfhvhqI2.Eugy1w
 elJ4SnePfoph8oMy90H8NU_U3Mo7KDtV5J6S2b4JY6nVsHpsrh8QEc73uB1nnLL7sRQQYl6tuLbO
 g36VGkSIVNPriTAIRCKMBKL58nJi_txCLazK45Mib9KMfKdh6WGeXPL5W3DQLnuHgG6wtI9v9DEH
 A72E1IG471hdCapg4Cf_C9pL2BuVZ19KkXzc4D10aF2EhgeM1_2QKSyPpPO1EbyXOdWiI_ywwF4T
 KCTsOA0DupuborG8s0nOpdq20bhd.TCNffKaO4gHZpduLPwizVFVm.yb4ba1ylMUxHNWYnHRuOgr
 UpIz840KuW1dGRSU3dPFu2Gv47zeqYNlcGeKWP7gzDLbp8lAvj65LFBNlArBjKdNhOIk7x2oh79K
 921aRKp3Utb8Vcr.I6ov1kq6TJiS4yRwVjubJPsAbNPwhRPmsqMC6TKGHcc6dW_5tWBxfTRECNPI
 AkGFTr0mTccTjXvvy6Yx_6VSPL1f6LWjhF0OgJ9DhUObTLw3taDuho2yMmQZK4bk_rJcQUrvz0Zl
 g6ROzrCa3wZBDCaYLUaA.1KzSW_YDjeLmhPXVBSFfAP0iQorA8Y8YtMDjgQs.HgofazFErbzTbsa
 9C6jcmr7aa.W5Ib0hZzKIM_egmvbwIZTXWocrosCaCkb7UNYjVrrOZOJcjn_czLLpReQj6X1WGY4
 Y5FU1_tg3sxt.dHuqjgt.2quhbw7gFbIy5nGg7OPl33It58s4BPBcmtWjBO42JZWydcil5oIUShE
 3RJyQu9uFAPSxhIbj9dTwM5ANtIKbYQbZ9hFrHEIClRt088h9U_0IG6DyvDPt8mXXU9BHP2o0IQR
 Jv905TcPNYk.7YclMW85wLq2Vnz5ArrOPvnjCmvBxeqhbMQihABgrVqGZ0b31FBaHKFIdvd2zUDb
 wWUo7KaacFVeQ3c8.tNmBH8xu7AKKlDFxNpmE.sAf8DlIKpiB1SMF6S0p9xUyj64110opCd4aCwl
 QEQFYgnmwpiCByav4yY.iyXRl0oca2hZu.0SMXv2Sad5FSuHsrTaUntoQNUQ-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 6fa61390-196f-476b-9ca0-5c2681ec8a16
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.bf2.yahoo.com with HTTP; Thu, 23 Jan 2025 21:14:38 +0000
Received: by hermes--production-ir2-c694d79d9-f7l2b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID eeea869000d924651aba36fe67e4946d;
          Thu, 23 Jan 2025 21:14:33 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	randy.macleod@windriver.com,
	Christos Gavros <gavrosc@yahoo.com>
Subject: [meta-oe][PATCH] nativesdk-pistache: dependency with brotli
Date: Thu, 23 Jan 2025 22:13:37 +0100
Message-Id: <20250123211337.9457-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250123211337.9457-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 21:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115037

Building of nativesdk-pistache aborted due to
missing dependency with brotli.
Fixed by extending brotli recipe to build nativesdk

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
index 83f44833b..32524094c 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -20,4 +20,4 @@ do_install:append () {
 	done
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


