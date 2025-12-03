Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33170D1BDEC
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27237.1764797396501442639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mr5SfkuH;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so2240805e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797395; x=1765402195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52oPpncL+OoD4XMO9xhNqZ2o9h4OJJwBJMoHaM59IrU=;
        b=mr5SfkuHoC3UGSUp5drqC0TyKcu/OX8eDr9g+DbVh0o0bgyqNIReQl7liwK0CB4Az+
         ebrsD5X/a6brGjvmQvJCM5B5+muHh1Hd+JEOSe0sfNoSSAw+owiXZKsaryNaTaOsd52Y
         GoHip5OUz7JQeCCBnR+RxLE1OiUuaDwvRFTa/S557Ki103pyYPf7eL98ez1UyadEEFNt
         6HLVejZIbcMK5bnD1ljEcJ/TKOHVolkEm1l9R/mWZY1cWt079Rq5U8X0fyeNPl048Z04
         S+TiGeDgec3SzxhsyErjQUBmmJWyFxDgJV5rIwXaUlo4OYeaH4Z3FoUqb+abCpYTZ7pW
         Yh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797395; x=1765402195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52oPpncL+OoD4XMO9xhNqZ2o9h4OJJwBJMoHaM59IrU=;
        b=SbNiM8H+nHQTVhiyQIcvL4FW2+bMF7i4lzqykSw4BN43ZOHWJE4xb2ClHxensxEO7T
         d6WuOf6zxidQXDF0QZ7ZOpQ5gZF+b74P6IWxNTwYh2T8Hir5Jj1AJOwaZq7KZPyZnb8K
         UFx8L0VJvHdxv/JlY/EsQtYWBFADa0YfxJ7J2HdayuJkpItPRteCPxEIeE2cG++/RiLt
         2TPdGcXqYEwnb/UmsRRDl3OFOu2ZKOAdKwZGjg6HLGw90JepMEGc7L8E2WmVAnpiUwUO
         GCqhT+Wvz2ptqtupj/lhu2BqbVQuoapavCwGgbS5KMBskoJ+/h1ooZeHjeUGIAxSK35s
         5SAw==
X-Gm-Message-State: AOJu0YwU57GNGv3feI6eIaFb9b/9rdwX6t7mev0nRZsDr+xdR7puR62A
	eQYIl/TMHfhe14aJn14mKH48I9ur8zCc7rlsUcYbOUdPLBfRlh2boDsb0xFVMQ==
X-Gm-Gg: ASbGncu6kUzu60YCbXeBauCwWr1hE6ZOCj35SNTMz9zRjcuGmqRtzdbzEano1V6tjhc
	LI3ApBG6/838qAj0Ziy2Y39gcuDQ7nn1wdcm+Q9rW+JkTd/ZH9o/5HVj8t34BI0kEJDp0wUs1H4
	/7ulPs1xJYgx2BxdbqaNJCqvTAT2LN0UfuollzEPo8HQetV6BGcCiGtOzeNiSHfcaMr5JhSmVI4
	tEYu/HJAD+p9QPrtzlwsahy4uUb/jTa4aLXycCG0pQH3oSv7gDUVyvC2vhIoErhpq27fQxBR35E
	B1V0z76y3KMeo/rZVwgb5tynk8IwWL0s8MkX37CuxxNW2CbUvkBISUtsHoiFnNwd4VHwT212SuM
	9kwmO0nbReqM4HsCh/ivvfj3NYI+j2Y/6Qeqq/hqu+c9nnRgw12OdqBZQW8MTS2mH3/klvXOZL/
	Zxzat9XkJv
X-Google-Smtp-Source: AGHT+IEYjQ7ALMiw2C6uid41oxxJmx94gBiN9rxa7xmV8FJee/x32kZPIXvy39adjzJ65/mtm58Bqg==
X-Received: by 2002:a05:600c:3505:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4792f244197mr4681395e9.1.1764797394741;
        Wed, 03 Dec 2025 13:29:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 07/12] xrdp: patch CVE-2022-23482
Date: Wed,  3 Dec 2025 22:29:44 +0100
Message-ID: <20251203212949.4046524-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122285

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23482

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23482.patch            | 69 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
new file mode 100644
index 0000000000..5c22701d35
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
@@ -0,0 +1,69 @@
+From bb9766c79f24a0238644e273bbcdcb2c9d2df1bf Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 11:05:46 +0000
+Subject: [PATCH] CVE-2022-23482
+
+Check minimum length of TS_UD_CS_CORE message
+
+CVE: CVE-2022-23482
+Upstream-Status: Backport[https://github.com/neutrinolabs/xrdp/commit/bb9766c79f24a0238644e273bbcdcb2c9d2df1bf]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_sec.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/libxrdp/xrdp_sec.c b/libxrdp/xrdp_sec.c
+index 691d4f04f3..084fca6b8d 100644
+--- a/libxrdp/xrdp_sec.c
++++ b/libxrdp/xrdp_sec.c
+@@ -1946,6 +1946,17 @@ xrdp_sec_send_fastpath(struct xrdp_sec *self, struct stream *s)
+ static int
+ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ {
++#define CS_CORE_MIN_LENGTH \
++    (\
++     4 +            /* Version */ \
++     2 + 2 +        /* desktopWidth + desktopHeight */ \
++     2 + 2 +        /* colorDepth + SASSequence */ \
++     4 +            /* keyboardLayout */ \
++     4 + 32 +       /* clientBuild + clientName */ \
++     4 + 4 + 4 +    /* keyboardType + keyboardSubType + keyboardFunctionKey */ \
++     64 +           /* imeFileName */ \
++     0)
++
+     int version;
+     int colorDepth;
+     int postBeta2ColorDepth;
+@@ -1956,7 +1967,12 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ 
+     UNUSED_VAR(version);
+ 
+-    /* TS_UD_CS_CORE requiered fields */
++    /* TS_UD_CS_CORE required fields */
++    if (!s_check_rem_and_log(s, CS_CORE_MIN_LENGTH,
++                             "Parsing [MS-RDPBCGR] TS_UD_CS_CORE"))
++    {
++        return 1;
++    }
+     in_uint32_le(s, version);
+     in_uint16_le(s, self->rdp_layer->client_info.width);
+     in_uint16_le(s, self->rdp_layer->client_info.height);
+@@ -1994,6 +2010,10 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               clientName);
+ 
+     /* TS_UD_CS_CORE optional fields */
++    if (!s_check_rem(s, 2))
++    {
++        return 0;
++    }
+     in_uint16_le(s, postBeta2ColorDepth);
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_UD_CS_CORE "
+               "<Optional Field> postBeta2ColorDepth %s",
+@@ -2138,6 +2158,7 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               "<Optional Field> desktopOrientation (ignored)");
+ 
+     return 0;
++#undef CS_CORE_MIN_LENGTH
+ }
+ 
+ /*****************************************************************************/
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index ff14cf8397..29245f3747 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
+           file://CVE-2022-23482.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

