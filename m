Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B338AFC619B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 11:54:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62355.1767614031177502474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 03:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c0n32U9U;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so69972675e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767614029; x=1768218829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/4vGjbzXale8t0+tVw6uN64/KH4r5FUs/rNfMCeXLI=;
        b=c0n32U9UuTtCm5TJPhF7Dzl8wi8FJMv4dA2SLyV1G+RA0Cl11TQiXPYYiGQBAgraYO
         b3q6bYfO/CYSkyWzLuStuUhO+fWKyEshS+7yZfZpLV53X5PC5QbU9gKHYE8iXaRhXpNi
         lyNhCr9iEAbs0Msxd0iG73Z/ylC9X0TOxWCXfIJsFy1FgSlinbeYuZkuTLwDR/M4hW4P
         ESaKwHO9jHm2UiOi9eAwcq39SrFRWuBZd+zZ+RKBTK/Erv4WFEeIDxw6z/L5jQVFliRc
         R1eVpB6lwm6fdNK4lDbSXOvVSTolkx4fCIbo8njprh13XYEwe9JLsUjLZHkmgVaKg6kD
         QUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614029; x=1768218829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/4vGjbzXale8t0+tVw6uN64/KH4r5FUs/rNfMCeXLI=;
        b=poLv94fuy/mOXwWi7LqqNRsT2u0wZJ+HFaf4IR0x+mmnO4REsaShWge4zRT9jdE4mX
         v2b2Xm6ipg6gvrm77vCv6fadoQQyuP2f0uvOlAa4wMJqdkfRYEd9hZrfzMrctTrJHhAb
         Ru4jc8x9buYqxcY6gwgW4y8C/vkzUc/oOoLRPyXwXvUoPBPdaB1/Vb/hMQM3S9PJocJ5
         d39X3XmiqrL2bSCWOug9VY1Gtz1DgJv22dqe69plJ2SZGi4bJf4BMJ+hktYzazGu8TtY
         Qdb3ZMzXzqV+52der7aEGtx35SlnAVzipEa7dxifxI8JfnuenvatZ4TyxgTi2bpQ+w1O
         bl9w==
X-Gm-Message-State: AOJu0YxIc2in8KktWC7mUdLWcABjHBO2njJPa18/FrXYvOUqH3FLFvyK
	FWzIGzr9t76jWVuV2pzUQ9ZyOpJxCKYsmvUM2bNex88aSZHik1g7IMAi8IYcLA==
X-Gm-Gg: AY/fxX46cTod6zof3vrefuhnIF/r2eiOMmuNXJO1DlE1HTlK2gO8koaKglz4YVbcUvE
	3xck0YslP2+8Fa+H1B2xn0wiV0B1Rv7Ug8bPvozntXVu3Lcy4B1GPiRdb1wjlaLzT6Fo3piMg1R
	iID2dyPfUxDnvUIOYTOdND5Io+pvXydAbQrwaQnyc1UZMcqo/u0Hro2KiXBh+ago7uYdr3aQ07V
	q6qiTsEuOMysxDBO7bKl9SHioobqw9FUvH/SsOOXJdua/OFZmF4CaIhTOZrxouWD10LDgVUn66o
	KKaEpHKytsKzbEQA1cV5GW1ItT4X4QyrMev9Cjm5yq3ME27/lKhcfuhHrGc9pGfRzweBOAoQshk
	hphxP/1SaYbZ3P0VuLdgQxGX5P4vHhs3HoZTk9Qq5fgNUE8da83lHCESQ2T3dYBHXTOhBJp5YFC
	gV27b7++Fv
X-Google-Smtp-Source: AGHT+IEL75wYX50YYKK5fLFe3OMM/JWAt/sMuI+4tBAOfTQagi3kwCoBD3F2zW5b2Qpx4VyukrQo5g==
X-Received: by 2002:a05:600c:46ce:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47d1953c020mr536349365e9.2.1767614029290;
        Mon, 05 Jan 2026 03:53:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm99300617f8f.40.2026.01.05.03.53.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:53:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/5] python3-configobj: ignore CVE-2023-26112
Date: Mon,  5 Jan 2026 12:53:44 +0100
Message-ID: <20260105115346.3385811-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105115346.3385811-1-skandigraun@gmail.com>
References: <20260105115346.3385811-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123154

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-26112

The fix[1] is already included in the recipe version (5.0.9),
the CVE can be marked as patched.

[1]: https://github.com/DiffSK/configobj/commit/7c618b0bbaff6ecaca51a6f05b29795d1377a4a5

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index bd4764f4de..b2fea46cd6 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += " \
 	python3-pprint \
 	python3-six \
 "
+
+CVE_STATUS[CVE-2023-26112] = "fixed-version: the current version (5.0.9) is already fixed"

