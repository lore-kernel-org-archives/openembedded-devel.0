Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.383.1626798680564968829
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d2m4tI31;
 spf=pass (domain: linaro.org, ip: 209.85.128.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f49.google.com with SMTP id p15-20020a05600c358fb0290245467f26a4so2435576wmq.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIc7AI7POzOySnW+CUgewvYHNXSm/ODPyzdhwSNovM0=;
        b=d2m4tI31Rsq8Ug7MyKdT2CZyvviObpAbUVr96Qq14B0f+DmTd7eMa/H+k24ki2WsZy
         YOLo718rAPAfkFE4qKzuaj776TNBd5EnZyS6dF1Pa18y/W3NdVHv0wLrby4Nu2APc42/
         Bj690/4jtG4AMfej7962vK2PrajSBS3G7Wi7thiiVrsWzvsQZAlhOWKuZUjGRZ+GqioE
         i9wqjHCjW6RUr0zb+BVtNtmtnT2Pw9nLAypmhufZes0vTckb/NkQ0HpztLxo4ap0zy43
         lTusnZT7vbEm0pJT2kdMKhxZePUDtH5tNaZIPZrLdWbaKKV6/5gxfogzdX+qBW1NriSX
         Qyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIc7AI7POzOySnW+CUgewvYHNXSm/ODPyzdhwSNovM0=;
        b=pNl6bhRoka1/MhiiDCGYnFBF/ExpZMdc01qACgtYZ3weO00fU0u6PWElrvTqGdzsNb
         UuMFXd0vWSyygupjZGyJZmcfftI38phgGdw2WsodglLkPro0JCATDR9ozLeByhmAWw7g
         d4SUVTX4ql0PTT7c8hPeNeXILuycTkBPuXF0TzvlYalhdigyRPmK69VHwW3Dbby6hNG1
         D4xCjyDX2P7lfE0hurN5Mqb6BACkogqjNC4EEt+T0TTaEHQomZC7fczIY7k71BATohNO
         1e2M5e/8ODHv7qwTOCsTcRQf0s5qoVhIs1OM4ZaVIhQV21OiNyt1ilV8sbHAWZlmfVbQ
         8Log==
X-Gm-Message-State: AOAM5332q40saphzVyIRwlpY7j4id8K51fAK68pxVdXjfOOS5QwHwQtl
	d57Sh79+zoBlbFXIm20rHIJa2Q==
X-Google-Smtp-Source: ABdhPJw+OqGKQiiKHlq/ivzEwfLZTGA6k6BSkDF4skldlSfdt4w+1YNSLzONR8Yhd6OXqRiZaPTgTw==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr38700020wme.42.1626798678963;
        Tue, 20 Jul 2021 09:31:18 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id l39sm2256731wms.1.2021.07.20.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:31:17 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 5/5] ostree: Do not check for meta-python
Date: Tue, 20 Jul 2021 18:30:52 +0200
Message-Id: <20210720163052.11295-6-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
References: <20210720163052.11295-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a (non trivial) cherry pick from
(cherry picked from commit b9ede0cb182ab095c863a6a5154bbe259a33f5c0)

python3-pyyaml was moved from meta-python to meta-oe, so that we could
apply this specific patch which breaks basic YP compatible check
script.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index 86407459b..c1f43feb6 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest += " \
     util-linux \
     xz \
     ${PN}-trivial-httpd \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
+    python3-pyyaml \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
-- 
2.29.2

