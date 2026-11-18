Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10964.1795003162921951537
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dmBMUvGb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9277145e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795003161; x=1795607961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUMv/ec9Nu3RQNCIdqoRAXpW8vJigja3+N/B1zpv6so=;
        b=dmBMUvGbijrQHV9qxMcV61USiS5VkbBYcB6WmdcgVPa0+Y/YPmrosQfC6rcySZaA0I
         jcLp6Z8fd09VSBfU3TQkjfhk7MzpB8B7WZK5SB9A57w2P9Xah4T0MBdlbjCCrPfRL7Y7
         B9ZORx5T1E1COLb8qtep1S3PYS/1hvu8Q6d+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003161; x=1795607961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUMv/ec9Nu3RQNCIdqoRAXpW8vJigja3+N/B1zpv6so=;
        b=0x6xWPgzlAkZtwAlamqbCWcQPOaYUow/SqRRPQW2YAcEnPY3nvrv+4EckO7er+s0aH
         uSBBqyFbOx8NIz1QQPtfRQgpcYRlkL40vbCNmsmV9L3xSfequZzUSkej6/8PMmnZ2q+9
         1WguRhFMzzYEPd5Oki2fxMF3We+2h0FUvAz0TvJ548vx3OZzASW8R8Cie4XlhTqiJSLp
         yU3R9c9ltz9491KJrwi9o18sJM34ZzTOwYmYH+X9gBeOw33iTg7MqbIIy6jsAJSmfwes
         55ZLObP/J+bOySBMhSDV4X3kaNnmVxpuggakj9sFaFtJ3A2CJ7MSYoMciYYdVuz2RvDi
         Gn/g==
X-Gm-Message-State: APuU4Z/UtZq0AaOV48n35Ud9M+bSmMurIv5IE1r4T485hRdrxvxoqaHq
	gxCHY6G1kPaAEo37ffulfDq3FJIh9US/w0va1/izlD+rwVljeLZcEoQ1qujBo8pEe7wFCA22rjF
	tS3HU
X-Gm-Gg: AYBFou02NNVcZOEURB/ufP/s+rbxz/e6wRwWA9G0po8oyOg0jNSTtu4S5Ksyw4Fo2Ke
	DsKDQ1k8bs3UHz9RICHgrshXLMufopJfR/I+0rT1nXfCbbTk1sm1Seutt/ruNjrDjNS5LWn4ib8
	PVRZob6boSxDhU41yrAmvD3AXrxsuoulk59xKrW7iy/tWBd9kDMCfS1A512F2Mwo71UtJArf+lV
	Um8FLTOPA1rRR0TrXqzBEHMy1SEDUNHH9AA6MiCDVNRPnP3hdQ4oRH4fusy53sSKCbBqdWaMR8R
	WnU1OS3m1e58ERAl/v04AYq4PgcthZxDoIlzypWiOJj+ClX4D5KocYDCjqhqDeH5w4m2jNep7iZ
	rgVZpzo8CR6lyNclYtb4qlnPLLHpCoDeIVsoa9OcAFOcUFgccb4CsBwmdfYnNGmBhfN7qSqvNnH
	7DZe36Tv9sUMo1Jgvekjt74OroN42fCxPf2pSVvGifgaS1F0D/KMzHYWVd84o3KMBs30nckOVvN
	964pyCG9RIftktBC2JiUkUMSBNPXfSzlfRQQcPmEmVEyXPqarUuoKEKy3BTUOn8DUXGiIWW8moC
	YGTv2CYOkcms5opqdIpZOFOcPFly0y/2cWLehotHoLkxy8X1aB7WfBzidLJhq8P0ObzbwF4Val6
	ZUurQcmQxRa2jww4zHS6NzbQLXEIGQUUwnVsvYmz6sBOqSnqQjqAa3w==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb7da23baemr45757445e9.15.1795003161056;
        Wed, 18 Nov 2026 03:59:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm61328365e9.11.2026.11.18.03.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:59:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH 1/3] mimic: Look up flite and rateconv licenses in meta-oe
Date: Wed, 18 Nov 2026 13:59:11 +0200
Message-ID: <20261118115918.905269-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132648
Content-Type: text/plain; charset="utf-8"

With the new layer format, LICENSE_PATH is set per layer in
conf/layervars.conf, so recipes in meta-multimedia no longer see
the licenses shipped by meta-oe. Add the meta-oe licenses directory
to LICENSE_PATH to fix:

ERROR: mimic_1.3.0.1.bb: QA Issue: mimic: LICENSE contains a
reference to license(s) LicenseRef-flite, LicenseRef-rateconv for
which no generic license was found [license-format]

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index 38c615f493..c2ba6cc58f 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -18,6 +18,9 @@ LICENSE = " \
 "
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2c2c7371b58b9cdeae0dc68846fe9f1"
 
+# The flite and rateconv licenses are provided by meta-oe
+LICENSE_PATH += "${LAYERDIR_meta-oe}/licenses"
+
 DEPENDS = "curl-native libpcre2"
 
 SRCREV = "adf655da0399530ac1b586590257847eb61be232"
-- 
2.47.3

