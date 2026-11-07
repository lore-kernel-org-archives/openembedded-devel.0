Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12015.1794070350073749798
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pPqsBKd5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so845203f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070348; x=1794675148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZU/Q/NTbfrWyzg6S9dKWyDLS/qWxNJ78FuqF97TZ4c=;
        b=pPqsBKd5en/F5xOxfvnOm+lCcmwFNfg/rz4Gkn2HKN/vgWfqxGSXwTiBwdF2sJ3aHg
         IAvNvVKF4tavoMBaywT8eLgZlkGJeSlDIcevHcXRaHKh6iZWvJdIvBX549Ccl181mGnW
         5fRVhG0PxMUvxD4GigJlvjyNvOBDnHEwDqsZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070348; x=1794675148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZU/Q/NTbfrWyzg6S9dKWyDLS/qWxNJ78FuqF97TZ4c=;
        b=rn/uxcVnGtYoCRZZMW5MKU7Vbjcv0VYblyp5pNFAl+Or7JIht+iILwlch/nKE8Xuil
         BzvrPoKF0zYxJbMNhPwuEDOwIJ05exHIPoCSxGmHaRKvbMt7c1AKibjoXAExSKLMSbv1
         HITATWxY80Uxl/Te3j6nqpQzXIelOjwSuxnEabobblQG2GmRwXG9+RIKq36gFz59hCIP
         gNmUzHP6a9hjpJe5Nyob9tttlw/03VLpBruYsPz9c01myleADIhoiUZmIS6RR/DXjvGg
         b6ozJ80KFORYIzB/BPj91VHFNZdZ3+bimoygTCH+yhQOJBvjskvVqSg+h5s4d6Jc9TbI
         ieJQ==
X-Gm-Message-State: APuU4Z/nwsbvxP/gpzvlBvuw0bZOhGkMgsB135Qbtm1NxfxuT5IucSZf
	mbgryCCX3GBQaOLAyg3u3B8Z5GpIsFNwtMUMVk6rNg6n0M8arnAwE+BGuXiUXGQcUkfmoLYkxYU
	L9YNg
X-Gm-Gg: AYBFou1J9TYywo+5Fo41DSKPX5iyepTLJpV/co9rZH4/vJiRTfW9Nv6A7CbYsxpJZrz
	S7YIMu732ThY56tv+0GLXjexu2i9vsNo9KYC343ag6mlN2aknIHd+LxKBZxdXx31WFSkjYjlnaY
	dAGu4WJN1ChXAXS420wNtF5cjdwPk1Ko8ELGnfPs5xIL3vXovt7CGEAA3E4ZKP/h1OqPpBqrCwZ
	W9C+zrKAWYVijvQOK/cy4yPEXBE5ZjohSEuIw7Ql+Sp5eslbuKY7TeRKt3Sf3KcDKczxMlqDjqI
	eBxTqICDSNmZ/tubtyDrrccmXvSe1MqALxOOffmPBAuFW4Eoy8NskVXp8A+aRmk4hM082aOYeos
	4jrhyaFmlA61jiaP97J9UJa+yT84o2ly+DKepBk8r92muE2xbWudRa+Pf0H/wEdUfyCQNd3C+21
	MMfu+8mC6RmbiDvqSPhllec2eGXN4vsmeTooRF26yOV0RDlxD0fHzkqMLUgoDyxPNhq/qeyamqo
	a+5Z63swPNG4tFZ34srAc1TfdAdczuPH2PYMIR2JabshxDfr0HQFK4Vfk8ndudWgFXablKOZoMH
	k17kAP9uxbR+MZVSdHx9j2Ws2oohnJTKnjot/p1qimpqTz4TCuAlZIwknz+/RA2jFtHsLZ75GTZ
	+OnRk+o2xOzjQTR+6Vdt/WCHhjYQ6zWvGMpGBgXAeq+f+GEcT9h9mAg==
X-Received: by 2002:a05:6000:420f:b0:492:905a:8b22 with SMTP id ffacd0b85a97d-492905a8bf7mr11382055f8f.2.1794070348354;
        Sat, 07 Nov 2026 08:52:28 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 05/22] feh: Upgrade 3.12.4 -> 3.13.1
Date: Sat,  7 Nov 2026 18:52:04 +0200
Message-ID: <20261107165221.122340-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131990
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.13.1:

- Improve behaviour of --scale-down in tiling window managers.
  Newly loaded images should now no longer flicker.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.12.4.bb => feh_3.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.12.4.bb => feh_3.13.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.12.4.bb b/meta-oe/recipes-graphics/feh/feh_3.13.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.12.4.bb
rename to meta-oe/recipes-graphics/feh/feh_3.13.1.bb
index 4df5a53300..89c807973c 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.12.4.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.13.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "97e89bb2cf5ada41e8c8e916ea4d7d64c51faaae4847f00fcc088fa06e1b5ca1"
+SRC_URI[sha256sum] = "785cd3bf51e05f6bb86ab0d649b7ed20e31892eb635bc5a25c963bf934088445"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.47.3

