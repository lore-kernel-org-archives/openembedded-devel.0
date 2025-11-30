Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D7AD116F6
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4094.1764531857973575413
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dyg2qpEV;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso300631f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531856; x=1765136656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEuRu+IF6vODhb5mT8Zm++KksdTmNr84/TiJqyy+w/I=;
        b=Dyg2qpEVscWTu9vWfFXCHFlr9W+x3pCqEtue6IRL7kM/xyrctE2Q4m16UBc3hDIRYa
         wMDMND1Te10XUV1B51rpfVbnHe9f21YhGL/tBPTvgmhsmnqEvbZAr/m8BCYbAxSrMk0q
         dNpVo3Ozw1kWBD3LoPmowVuy0eFnKEK1yP59a2Hr0L1L/6oT/OkzXug1LeuLy5+dcjP1
         oWqVpSpHRh5a2JMW5a8c0qIF+pfjRtskPxA8zfvrsMktkSpr/QLKiwecm0KT4QL1/itB
         OWUpGlq1rlo+q762Z6zjgmKlBRTuJNwmk6971yE3d0lzr5iwql5sQIMwoPRnJdBSMvLo
         ucBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531856; x=1765136656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEuRu+IF6vODhb5mT8Zm++KksdTmNr84/TiJqyy+w/I=;
        b=PmldQXvJJ3BXQ7EdXvH9rDOm2QVAlUQezhDV7N2Hs9YL4rM8pU5mhR0dH2ixAHTmjy
         mpqLQE58ujvmEFI9JK68wON+C58KdqeSNtwFHDbL7UDcqj2H64ighvWNuZTEriwFhoF9
         k9YbNmTRc83ppHvt8HZLiJK9+lTTgsEzef4Qo4M0AAaV25Xlx4+i7X0A6m9Kn2EZ/qCf
         WSKmOqQu5vx5PMIFAfkOnRYAneZj+zxaD7mdVuRqLyBYIEjp9the6vle4TFRVz0/n8y6
         hyz6JtxeVL+XaXQxv/anD69DxuVmOjV0HVglG3D9obP8iHVghcGk0OZ9lULGw0JhWuTj
         t2Qg==
X-Gm-Message-State: AOJu0YzevPan+B2YlsMlvg8jq+d3lR48vRx862eumSUD3cY0aTFteKdc
	/5fLSXVByI50MYsxyrHA3N5v5d117rhk4zDqlEl3IgHkMHMFmCPCmsqZXQHFCQ==
X-Gm-Gg: ASbGncu/nUMasW4hsHlvOpV3LzTKQGE4VFKHApr2dBynTwlCeS+di3L5dgg4glxoiAH
	u4XABgcOcJdYikyr/pPCQwtN1VXsLAKM5JgiE/ZVr4pvBc3aWcE/hsFpEhq7gqr5WsGBsrBktCK
	GfcraoeAirWDHIB/5cHMhuOD+/q4ZYawPJciuC366bqYWXKDZ8fxMYlkD3rLKDE0fcT6gRDKQ2/
	67vikO5EDORWAAOg8lHNKyKAOiRosqIfCvrjBd06iO/8VnMufJNvSKX/y1Vat15BQKbPp44TjiR
	YKLot+3RmzRIwJfEFtCQhDEXwsI0FevUeD4UQoFC0V0+TJl6kWGmiIWbxN54WCMhvfAIqGFbdkk
	zl34X+AgV2CaUNf7HdWmv/rUvqevwcFWAIXXubZIWwO59oojFmuuqeg6UYr2herUDNDnX3BLdtp
	2+dmXcqYS8eziAESbRITk=
X-Google-Smtp-Source: AGHT+IENUZjH2KCNnyqEgaadtRvnvWku9zAGXODXF2b4q4RQmolIccyXk1Lwad6JdC9Bd7uiS42/gw==
X-Received: by 2002:a05:6000:2dc5:b0:42b:41dc:1b60 with SMTP id ffacd0b85a97d-42cc1d2e099mr35265157f8f.29.1764531856063;
        Sun, 30 Nov 2025 11:44:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/7] yasm: add alternative CVE_PRODUCT
Date: Sun, 30 Nov 2025 20:44:08 +0100
Message-ID: <20251130194414.2335669-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122174

There are multiple vendors for yasm:

$ sqlite3 ./nvdcve_2-2.db "select distinct vendor, product from products where product = 'yasm';"
tortall|yasm
yasm_project|yasm

Both products refer to the same application

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93f85e4fd2fb124cb047f6b378cf0052a1f102aa)
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index e6e4faa8a9..d1c37cb2ae 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -30,3 +30,5 @@ do_configure:prepend() {
      # Don't include $CC (which includes path to sysroot) in generated header.
      sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
 }
+
+CVE_PRODUCT += "tortall:yasm yasm_project:yasm"

