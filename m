Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D386CD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 11:48:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5129.1780141732814988437
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 04:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MdqnsnN6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49068493267so45865065e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 04:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780141731; x=1780746531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igwDM0Qvm+eXK2YugKAo2H7HRfcM3WdDCpZlFORSJRM=;
        b=MdqnsnN6BhfJhw+fg4zWVf3f6XgFMaS0Q1i6PUuOfXda06RMcja7eRvgg/QmtpLNSP
         TGxDYORkj3qmo8AN5fZh6lTjw4q0r0MRHQ4OvVmJSL7haZatzW8ND+iNvDi3vZLrEbt7
         jNhqUcWw6mK5KJbG+uEsbtBJLuNpBtjLMW8mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141731; x=1780746531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igwDM0Qvm+eXK2YugKAo2H7HRfcM3WdDCpZlFORSJRM=;
        b=R+CYszQxi9MHuyj2VKBk8Cg/XKAf49FfuJ06XX8IS4GRPpSBzcAMFiuZDqk6UkFkfz
         uePUSZTFxX6RsTNL4s81cgta2swrt2JKJcSNXk9b3f9Px5+VaTOax2UmaRgmcfqnn1Rb
         RBn3NvwC91m68RCyepBWHsTWXnR03tQc8JVI0Ga4tLWZoBxBkAwru0WBuXlC7AlnBYl2
         tsEaOJAuaohfXsWtqS8I7gQe1JeV4jXwskiDutnG6ljFZFUvlIJ1zqiOvuficPaSaWFM
         kTMP5j0nrc6tFlFllzZ4PvD3w9UZElktZYdhuB62vUE5F5JysG/Z8rb8D2ywQh6Qym5B
         GdHg==
X-Gm-Message-State: AOJu0YxXaWfOmhvGqzvCsBwpAaVC1D7HUglJSryRfOx9fZ+bU1Q0nQRP
	KEEF8vDjmXBO6CEUxp28Z4wPfMcCcnTiMaq4mdgpiog7kh3QkxqHIG3uTuY6QG1/Nv1STPQk2ge
	QGVsqgfc=
X-Gm-Gg: Acq92OFfR0knA3V/JF9wyobWGpmY1Ot4u3m4FhDkuCIlXkFLYFPGLcf+/ASIKpnqh3Q
	BDwXttor863GCLH3DlF2y694RAuNIRP14aD4mFJC0Ww1E69UFJLkhfxdFyt711HnplQSoALq+vx
	cTaB84/B0b6yyFFpbgN+fMpxwLxr4XIyqqdD/QM+ifOIhqOmJrDJxKh5ON8RH2oIeDQn4Dx7N+h
	vDKFaU5ITJJL9Nyor4EjaI6ey7J+kxHfAP3buoiz8nY4CnfBdEohU6iQDWFFN/EN80hPRLv1rPY
	0Kfd/TY6PSyxzEfXxokzV84J6E0OWf+7Y9t6m2GrK+1AqcXDsb4PKne+UFrS6R9yeRtom8mjt+1
	Dwqh8da1SjWzId9CeP3cHG+bsUxGRuf/yJgiJrlfW89yAKnoG6QwP6xOAUBZAuDF8thNYNVvjGm
	ijIIIFpcpknV3C5kcluSiwL5OGPRX70NEpWp6P3p/c5rcP
X-Received: by 2002:a05:600c:4da4:b0:48f:f7cc:f703 with SMTP id 5b1f17b1804b1-490a2943b2cmr39357645e9.30.1780141730751;
        Sat, 30 May 2026 04:48:50 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm110021255e9.15.2026.05.30.04.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:48:50 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] memcached: upgrade 1.6.41 -> 1.6.42
Date: Sat, 30 May 2026 12:48:25 +0100
Message-ID: <20260530114825.3936122-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 11:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127296

From: Filipe Pires <filipe.pires@konsulko.com>

---
 .../memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.41.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.42.bb
index e41ebdb171..28d8ba3cf9 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "e097073c156eeff9e12655b054f446d57374cfba5c132dcdbe7fac64e728286a"
+SRC_URI[sha256sum] = "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.49.0


