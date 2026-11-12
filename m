Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8128.1794465755570175840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=p5YyTIfx;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1594525a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465755; x=1795070555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bsW8j7HAytgikzzI1ua+c4jPojaTum3bkwKxsiFqlM=;
        b=p5YyTIfxGJvHkZpuGmj5zA/DIh1XUDxDJC1z3mwI3oBQRb4uVP//J/HTNPN84u5yHd
         g8He/p/auZbAd6Ken3ixnzWS829l+zRPbTot8s1o0bT8Hpxa8ZT898SMcMhTyD4ZZwjd
         AHJV9v+1Iwyfp/Ucilq3vTli+w+IwgMjjk+Lh8lPbtWtLKQq3eUqd5w+vz6b79OIm1Qp
         8HvdPucL+XQTRIOXF3MUoYteESiI24x4FED6nz8+kkD2H5Q/X2lT6OTf7DCvd25koaq+
         AhMYq/NkxhWT6Xb9MBmfFp9TzPxw5SQ7NHGsPb6zO5ZauNDjsim9g/sRPefRIjRJVrYY
         BN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465755; x=1795070555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bsW8j7HAytgikzzI1ua+c4jPojaTum3bkwKxsiFqlM=;
        b=Uy3M9D8W2himw/YEOJueLyu7D4PDvE24wbOVnSYXX5ay6oePJNUuv04ng1FFM3V8aK
         VcfoB8O+sXaKhSkzVXRRtwgrfAA5nMI/PMHji0RRCmqDpWm/aayWUMgELAFs1IiKwD/m
         7cLUoEMjilz3SAatGXC9F21+xZzSkP2Wms9A+UXeQd/k0dpjZhh0pC/LCMwCWgaorn5V
         swtfPbFwlSwrhSXiZ4ERIhmyRCgko3diOkcmxRvo8E87HaYU/eksegwVyJxf+g1crKTX
         moNk9hJM9FRgX12NQnphkOrnsGvmmqOa23PeaxKWPb1aqnEHm+nK0rEry37Pc+lLWHwb
         BZPw==
X-Gm-Message-State: APuU4Z+S6RIeulocNLbpPx+nwWxeJQ6GKpFbWMe49Tp+1atID/VZiZa/
	IcbRIv8fqanso0EBHcjAzVzCd1opQoe8j/cKjDSqzglrbQT5MSbqu/VaNPSWfA==
X-Gm-Gg: AYBFou2PMp8pmK2yG8vsMxoQqTFSPHEWH8HaKPr59V8z40uA1YWhzDDNKcUGCuG4/1l
	PUUaIQ1MOycX/lpVvVeWug1yJRel/iBfbyd+/O/zSKDkhgPguOxB3yB09aUvtQ18Dy80blPWLZc
	7jVbi74biHtNWWHPqr03eewjUKhoBM8dg9ivbo0t1fDy/I8JtBORCzNkYLXys7fXS5AY9/3I+rO
	cXj/bEQMJ414hSaIZ29qEVspcM+9w+BiuAjQklinJ8IsdGPq1VieplzCuGHv6Y6O3QertFshdje
	OXQOFBiEbRLse/y8OOp5MQHQTOt2s4SAHf5fpx540CRTnXK/QpQWPt/SUJqEEh0Gu94hVUpVi/i
	bGXNTsvBcjTMhTZ+SdVgkO4JTmt3pzejZGcdd35/KC3RycHQip4iUmTUUZVbiaHrnj5J9Z9tTrd
	tghgRqtL40K+O9ck94GU1NZWOFko5UWK248TjMkEKFbzwP7JY2WTBiPM1x93NrwIoBCBCDFL6sj
	cb22+BZUw5bdCG8fLmrS4YYDT1u2VHZAu1qzDvC5LcAf1xMN27vjP6x3LUenn2uzWmslp3nBSxQ
	MqsQJr3K/NdnaNxA3VlXtcdKrjE5m0d4CEYNE/4IoHwEivvNIkWLx2+0MK7TsGfZlxpvvdZhfVJ
	GyPcvhmq8I5s1O3RconsTjFPLlnCtB4NpfwmLv4dlA1oQawhUju7QVE3EKrDcOPBpxtSNgPP13Y
	Cdcqo26RqXtK6Pqu9AIaAVgY+lIS6B1R31wxvu84eBbjCvoSgbLIkZ/TUewQK1pijgoPsYdXYuY
	PzEaPdnGiuJRKY28Nz8/qG+ovmz45PfdehrpZiJ1XMnIfGXYkZeEax1WAmGf0MBLSdDnuDJO92c
	CqhktnjIZDNWVKPcw8GhsaL8xQ==
X-Received: by 2002:a17:90b:4ac2:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b182f22fdcmr4217308a91.32.1794465754977;
        Wed, 11 Nov 2026 22:42:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 06/24] weechat: upgrade 4.10.2 -> 4.10.4
Date: Wed, 11 Nov 2026 22:42:06 -0800
Message-ID: <20261112064225.2410019-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132175
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../weechat/{weechat_4.10.2.bb => weechat_4.10.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.2.bb => weechat_4.10.4.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.4.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.4.bb
index 01565119e4..9d2b314ddd 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.10.2.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6fcd05f350c808a4206d6951af36a9eec11b145b6a1a2a8a2b29dd3502e07022"
+SRC_URI[sha256sum] = "9b67a869330f34498f08dcab49edc1c54e9a8af136188d30d5ed1fb8257106da"
 
 inherit cmake pkgconfig python3targetconfig
 
