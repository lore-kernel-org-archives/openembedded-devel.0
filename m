Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146F2C02191
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:54:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.47419.1737968083575297754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 00:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/0E4FCT;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso866100166b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737968082; x=1738572882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=U/0E4FCTpwTk/k/xW6uFDfccmwxdZkXz/9MCkbqSDyjkbLT0sozkV9cHJaHVSdlFl9
         gZH3HSSe0ttZNvYStIP+0D/UZi6EF8VBOkIup5wFjCZpt/aVArGdmG18NDb51A3om+YL
         vc2Rx9+pHvSp6fYxK12jl/1gn87HKJ2dtRuuZYBune5hkxG27xOT2+g910Wczg7gY7jY
         nw3wZU4kWj/M55F/w7eqZ6JXCAKHmVTvxtu4MMJB+iwsQaclwroyD1/ZI5w0EPP2ojVx
         vED1XDeyUWhChejp2k3SJs/uNCYhMIrusU6/cVmqTavbuwvtG1BrcmSLlJO6GlIOjGiT
         JN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968082; x=1738572882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgL/MWkyPWn8EMnrS+R2bO/mPx+210UH3ezVRBlcidk=;
        b=Z/mpCXe3JDZKXIk2AJo7CuzGRcNRRhStT+tBqzPr4OwylpIiMhYGSZ+R73PDKu4Z+R
         /XD0n5NdJ29Vkh5nWVtixcWRUzzc0vG/EysPF6T9Y5yvWqMXyR8gD0Gt87TWvy9p4fu5
         E+X+Rs+ZoNvYsqzmx4h7IKOzGqbVeoVwWL0lLkT7Ei9qx+VLispQ+Dw+WuQ/9pJrC6ky
         HKm4G4h4zlh/OEokuIWoudyqM/9nPM3BBxXzstKMaR2a5iPQ/3MyrwRCrdan7Nj5+UIU
         JG+Em4vaMH9ePqWOCKqt0ZRp6NgNagsJMRlgpkVtfVIzvbKipI7ze0HBeKxz1zfa2/g+
         dUaw==
X-Gm-Message-State: AOJu0YwWrOdrwZVyc9GuwJUKAwXHvmAAYt/Bb6Qf1ZA3067weL281bH9
	Rdk8SJ/5VYBbjZwbGBicx8lA+SFebiIXhrbVvlKEGn5vMqXkbD/q/E+N4g==
X-Gm-Gg: ASbGncuGAfrJBTagGz6bUhs9YfQiZjk2gGKVQO6tjhkOilBBfbOGpbdIxSjtDl5v063
	4y7JjRE08FD3jYvoV544OzDHQ+TVCz/YAIrQ3aRRB4jVx+m0P+JWyZjQrlFt9ssJujQU+VRno57
	qjyaog3VE0U4uRV4CQgKsDW0msp4OE1zRnofX+cuENtYbMMzrhAz7jBGSYuvHHhq3qxBRwm9AvT
	pnHyGCiZdyesaz04PloHJ3a1dPrQk+rHQTH01Sew+NWfnqVYEDdL33yr/kC9wAOWB1APHBeYH7k
	YKw4vz8+cc8QhjQJrTsp6i+8u1eYNZZOIzLbEMegAWBQmDPz
X-Google-Smtp-Source: AGHT+IGxvuB1A3yW2FH8Hvz7ZtSnXzbVc5x3iXbCDFZBDxGPSscrfGCxb4WVy4e5qtGJJXVfe3bJwg==
X-Received: by 2002:a17:907:60d2:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-ab38b10cfbfmr3432063466b.18.1737968081592;
        Mon, 27 Jan 2025 00:54:41 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6760b76b7sm542137466b.87.2025.01.27.00.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 00:54:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/3] lapack: add PACKAGECONFIG for cblas
Date: Mon, 27 Jan 2025 09:54:36 +0100
Message-ID: <20250127085437.54643-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127085437.54643-1-martin.jansa@gmail.com>
References: <20250127085437.54643-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 08:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115107

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index 4357515b71..aafcdef681 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -24,6 +24,7 @@ S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
+PACKAGECONFIG[cblas] = "-DCBLAS=ON,-DCBLAS=OFF"
 
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', ' -DBUILD_TESTING=ON', '', d)} \
-- 
2.48.1


