Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24BEC52D7C
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 22:56:32 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.198695.1724021784942599348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hfWaSuTQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so2575100b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 15:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724021784; x=1724626584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGmje1PxQj1IPEcIKAfAFe2U5gcE0azlMdGTHs53Wfc=;
        b=hfWaSuTQs1kmFPBakSiyIwnuOaknA219w26BKuMYlYN5KPCcV/3+QD2vT3Tvde9etd
         yKrmuEcHtpL7TO+tXG458XGGdVWfHUISCrK9t1UxA/vIqbqP6aEiDQ0i/bXaCHKtcajF
         GspE5O8jL5dWl2kk7ZgmTEbzrO1VE5d4HPMzPxQDrp4Uv8XsJjmZcpO02vek54J7WjqT
         fcXh29HpfUY9Lp0z83DxlPcfCqcogxgX74FDgZqyLDfi7X27dXINp1YVoByoK1TC/1Ro
         b1Q+DIbkC0vps0+f/6fn3mKJshhSsFVWWQWjKJ2M10ZUFCRFPLCb6J033uSEvhta+JQg
         MZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724021784; x=1724626584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGmje1PxQj1IPEcIKAfAFe2U5gcE0azlMdGTHs53Wfc=;
        b=ZckejOkiWUK4tdmMLH6ljHgIFBun+7kXQItcerWuUAD2m2vIrWMPbxziVTKZRjwtoi
         z/1+4Rhh77ZuTLlfJuwZddacwOQISNFJ21MlmMmFTSSKOh4dUiBEMlFto+7MT01xbtqi
         IistzXHzwLyst87SsMY+lot99oz33O82EGY55CrSqJxhjkBhSuWE0/1r2IU6EDiJYcy2
         olPUJ1UuRHsnVFkDnCkyu7/Nhr74toC+pU3m+XkpLdHIVHM9wJU17JQ41gdl6IE/DpA1
         /U9gvbz9Hd2xq5Ng38M4AXPNghDkGcN5OnExE/zqzvvyV6N5T/dIGgqZo/td2xoPBfpi
         kWdA==
X-Gm-Message-State: AOJu0YxIx24aE70LiJZaZ9jnrUJ7bT9rBoX2aJCMlZW4dm2ZwILM+6k5
	SifA3pf2ViDZPrbn5sU1Uyy4UXsUVrKUEPHVxoU5Gk8lshQB5EKALOxenw==
X-Google-Smtp-Source: AGHT+IECIQRJ70B3Nq7MKyZmOZ5BBZY6F/RZGHTBlBHxvuaHxdW2ZWAEdUKPz+eYd4MjQ0nPfHhULQ==
X-Received: by 2002:a05:6a00:2e8f:b0:70d:2ac8:c838 with SMTP id d2e1a72fcca58-713c4df30c7mr8846574b3a.4.1724021784043;
        Sun, 18 Aug 2024 15:56:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61c6730sm6564146a12.26.2024.08.18.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 15:56:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/5] fwknop: Specify target locations of gpg and wget
Date: Sun, 18 Aug 2024 15:56:17 -0700
Message-ID: <20240818225620.2226473-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818225620.2226473-1-raj.khem@gmail.com>
References: <20240818225620.2226473-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111840

This fixes emitting buildpaths into binary and also
fixes the issue where these tools wont exist on
the paths they were found on build machine

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
index c9f9596eb4..0e7998b6dc 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
@@ -12,7 +12,9 @@ SRC_URI[sha256sum] = "a4ec7c22dd90dd684f9f7b96d3a901c4131ec8c7a3b9db26d0428513f6
 
 DEPENDS = "libpcap gpgme"
 
-EXTRA_OECONF = " --with-iptables=${sbindir}/iptables"
+EXTRA_OECONF = "--with-iptables=${sbindir}/iptables \
+				--with-gpg=${bindir}/gpg \
+				--with-wget=${base_bindir}/wget"
 
 do_configure:prepend () {
 	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/config

