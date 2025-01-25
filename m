Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA918C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 12:15:25 +0000 (UTC)
Received: from sonic315-13.consmr.mail.bf2.yahoo.com (sonic315-13.consmr.mail.bf2.yahoo.com [74.6.134.123])
 by mx.groups.io with SMTP id smtpd.web11.8477.1737807323998980638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 04:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=BtT3DWIW;
 spf=neutral (domain: yahoo.com, ip: 74.6.134.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737807323; bh=ik2MZ2WkIYD0G/xW92+2hux4RdeN9QlRooE6i2ycs9s=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=BtT3DWIWWLsI+zzGImbDCmRwe3KZCLID5ehyvKEdn9pRMBO4UGCGR44N0Klwobnqhy2ja01kDNJvM3s70kPUEZY4R2F7xsRaH+/hLXLjNOHGtHNci1+NygRBBVvwrKbvx4tASdFbN0KkXGt3pke4AD46OJ8zLnNEU5mwyCNSFVhj7RpeMDjrJpODFYcoyGDBP5G351j/4gD2p7XrsdDQLLNP0Sx9ww15Oba+SkCU95uxMhUH+5yrnqIaRVdgA6fyJZcRcQTyTqxap81sZ3sE/Y7tVADxDucAmR2SgW7FrnCLdMX+6OpE8fGDrf/UgULRMmdoOQ2t31XyTJD9v+gung==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737807323; bh=Gt4cEIHl8Uh6ajyCNGlDczLKxJZjj/fXQBFrfFsjQy5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ICZdBLPCP0GncXzifnCN7WaqxgLxyuU9LiDAi0ZZ/c//pKP6KqEFTRrX9ULwnmu8dhzlCSOSNRxIz+njPx45FIvfh+O+KunExwrBfOVVQu8qXpGLp+zIwQWOEYOQqicd6rZ9V+qNI1CKXZhOWSF85W4ZF3qHFtyRnetqNyXgZh9xBIVIS9VdT/W3/EIabpUYN7NKVdYWWDgzY6nvRMXigZ/3NDozvAUQDc1iIjHNAY19uxSk61ThCblinr3wrlptLDLnNx6sT/sDhi/rdUWpTTNnJSweVXAenPTCSMZxgHt3ViLOFrdmUDk+MwSCH2URecwn5W887/WGBoz+phjUsA==
X-YMail-OSG: 3jejKqEVM1mYkq7In81pAZ38aLzlADrydoEH.3cFk6uqpxllbYqbWJF8J5sKaSR
 6agMh_jexjyVG9aJWOGGsMvmSY6.sAKvuYSIQ4RDPv8TcnPFyb8r2xsbFAONvpxwVSP7yOwHU.4l
 Y8GeWv.2DuHoXeFDm8fcXgw.RFSkD.68ohqFLdM6G9YpG90uRkFtMyNu43KqDsdpRDtM3Ahk4F0L
 ZmWkC.Wk83h5T98tNkZlGeuBif3XkxirBf6rcbtrH5MrjGZ.97bVehCF9X9UzJl2al6oQNuz.vGu
 JKMuECZRKpzZzO2.KXjhiBIOin31bR.0OoMRyiAlWuXT0YYRWWge_g2RpGY3Vw3YKJR3XHfA_9HF
 rsNzpblBb44WIjiWYWrlf4Cfx6dYRFwuYZZkuRpVrb4RiH.PK5Ke5Zt9EH_pl_pF7cAE7C0vWY9M
 HS6HUIRuAtU0.t_whJfE8nzktYDUeNZ2wQl5kUhfO7y_D0AaRAy3BYjNPame.uLYogfGEF_M7ZMJ
 V2Ro8zllgehM1xdn2G4ZtK63Cv2CTrAjvzBNSlkoHMup2bQGB8YjGfuO7bcJy_SG6txLuRHgZwdM
 a6kICQZ9BhCF8qvF8MNh2EqfOjpzurItPKnunBz.rijgz.7s8PdUMLbCxUwQc2cK4iWxdr3TVgrx
 G0NpuwFSGaxjwfrVW8LI4nZqLWD5rAGkVng.UgjpaPF5WzZObxXjtY9TeBrNmO6iRpw1jKHDtZWl
 XYQjn_PLTB5f6pAY2N7CPSn0wkBtbjUclc3t0mgzsn9IMUm8.M7yqsZqIUDGADGPIzdZMjC11JvO
 DtoeP23HxGaJA_yrpU9NEyvABwoCf5DiZylibAiBTRDedJifONHs2g_vgePbqNJmZHmj6CLIoGhR
 p1qMh26AMaAdr1Mm9Xbzcmf59qZkSbss8IM3tzFYiohxIriMv0Jfn7c1hVuQTgwpRPyddBXqd.Rr
 aJ9Aes4MwlAoblxrpKHcZnhmjjM8VIKWoN6YOoMoqKt7e88g.3LgkosNA2wlkJQjn1nYEi.dE9xR
 LswSzbUkKS8WlSRb3k6TV.Y0mZUXoR.Ow4mxzLFeyZPvvVRRhN44G3.nOovfKaCTxRb3__aLnZkW
 wUBL5BgDQmYWE8Yh4K5.Z4zSYOw30rW_JOUHzxYUW46unBzR4a.3YAjvEVMTLJQDV5EsJiClUZ6S
 KuZQqNAb3kzqajG9bHppDPz9imAq2NOUpeODNg378gGUDuHKUYxFQS0x2EjSzlBSgdM61KqlOsf2
 8TVjopQU3.OOVEXIfkhlFXjSK5tf_f1lJibxwOllZ5u2ZBtkG8otSnpMlF9XPq3wLU55a9wv3EYa
 61Xh7iuB8IrUkvMIYTczpkcOEmgsrOvpILMAoaVl.75nBPXs50F6D2roZQGiU6mn70HvTBWcamw4
 9xXnOl1eX9f0Hyv4T7fp3.mIYW7M9VFevLiD1cxbJa7YAY4LZlc972S8KN1GPIkASxwMtYMX4HPq
 YumdESF.bXzZSxOQVtYkxFDCF3zLYTH1tSJxrgUaviJOzcX5kVByYG4cQmIAc7t5wPPvALF8UyTm
 EKFcaUCD6BjPzOpwNgUlmqwogaqzTEjC17L3QxKDmgx40fzqQGyV1CZi0rmljEwYHzup_orD8.lr
 pz.zcSu41pQyXmHCx5qzGBxnkxIullY_FD72sB7P2KFWdqqmc0.9fdpv.KkM_Z_0ZjaenNrOGrSp
 mm7xBZ6V4aaaVo403gkZqosOJCv86w1MQCb_CaMpprYg7L7TuLAEZOmpv9VCgKG8YgqpavOrpFPs
 g1EeZlRohW2i1Lj1.tnEAHt3NFErrpEYBgn.iNfWrh631p4MYGD_iwudl4scBSGGd8EaD.rWw1gh
 l38Xo2Jival6HGPo7WU32H3qCrdEf6brEl3o7RyoiFizPxuvcxJtYBFH.TV3Xj9LUalO1m7b_e1a
 DJXyoteuDiwGqOM6U4GbBxPYqv_Uw9vHpt859GqTsK3II5p9r84MO5bOY_mDanIiOpbqVotayEx0
 3eczg5lTIPMCPJsGvIGXFcOv5m77cpqqlJsjVFB2k9XCcko26R4SGUXPTdmSoT9wVeZBvAI07f6P
 6hEt9L7guXXAyTl8AqiZnWTEi8OgzQbuwNBodgeynp2IO6wR6EduF5.zj2qLC0sQw.8d9lIXNMKR
 vy7RZqc4iO1XDdwiC4dG2heek4QIcPfjqNi5Ejv73LpuvUfdRQl7GEExxwuHXoE0GdWfWC1dNrTR
 ZKf3JlfLRNt2Zm6UGsl0avqsvAhKciuq.GtYYtp53ofQPjjwUwTENEPlJJMU-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: f1d062da-c4cb-40dc-bfc3-097f9f2b9dd7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Sat, 25 Jan 2025 12:15:23 +0000
Received: by hermes--production-ir2-c694d79d9-nk5dk (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b7dfa71c8dc9c0387567541b87becbc3;
          Sat, 25 Jan 2025 12:15:17 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-devel@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	randy.macleod@windriver.com,
	Christos Gavros <gavrosc@yahoo.com>
Subject: [meta-oe][PATCH] android-tools-native: dependency with android-tools-conf-native
Date: Sat, 25 Jan 2025 13:14:40 +0100
Message-Id: <20250125121440.9150-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250125121440.9150-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 12:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115078

Building of android-tools-native aborted due to
missing dependency with android-tools-conf-native.
Fixed by extending android-tools-conf-configfs_1.0.bb recipe to build native

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 .../android-tools/android-tools-conf-configfs_1.0.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
index a91229f908..f473d22849 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -36,3 +36,4 @@ FILES:${PN} += " \
 
 PROVIDES += "android-tools-conf"
 RPROVIDES:${PN} = "android-tools-conf"
+BBCLASSEXTEND = "native"
-- 
2.34.1


