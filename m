Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8938.1793358207736470563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=S+E6i8ME;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c418e215671so67684266b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358206; x=1793963006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIbrZRSmvMS8RNpgfQ5LR9XT7xwOFQcdSrotiMz5Mm0=;
        b=S+E6i8MEC8YLcjsGp0HzIgnWZXXbfLvK9Z/iwEBQoJPHxNq+tb9mPL0tBV4UOPelUB
         vZNOphNOj5K0FBjXJ9ixCcibnT398FgOaIv+OLayFJ8KsF/DWC0sD+oaTkE9o2eBXw6N
         DqZqbH9pRyBKQQAZSsq2ceXb18IXfRitDg9zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358206; x=1793963006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIbrZRSmvMS8RNpgfQ5LR9XT7xwOFQcdSrotiMz5Mm0=;
        b=FWhldP3extqqqpgfplxEW2p5l6zDhrY7yri8YR3FLBiPCMRUnIRBX+ZUzClfkdzLWz
         vEhULEV0dF/wRl8+0Je1Vk15nPg3p72LNl6h5jvOHeGnR78O/uW+1Oi/PH2hNBTM7N/J
         /w/qOaro9Y8aTcQcDWeFoiYTqwNRDgoD6XZEAqWe/qAV5k4P0TosJh5g7yDdm7DshSg3
         ZqXplFbyepZ8ML5Q2HUM3W5wtGfE/LfHW2v2WQlWUNxNvx1uKsPRkAB5uW0249pKn+cD
         8rWFi6ULytTjBvdG65mAoKIyeB8i3eiKDAE2+qSonmYTDBc72hGU7Jx/RxAghwLHRcm2
         p0kw==
X-Gm-Message-State: AFq9FYLj/+hxTLq9s6tL/ZQqzmC0WZEvV8j12oEEkYVfjtmuTXBjBUQI
	pY2y7e6LwLML0iQGSvfdENMkWdmc3eBe78uqzLjK829lqKJ2OAnqw6iZIiUsyT3y5t2LDKLsu/5
	UwSdG
X-Gm-Gg: AYBFou2ZGntkMZP0vu0CvWsTL59Ea4hP/YoLnCzXCSH6apkSbb6dV7wSEY3Ef9o04hq
	FRiJfpAPUu6v0TQ0C2bthiEGOy/6X+qqC6jzheZyWNx9J7scYRqxZk03SMmMMiMyZmGxlp4Vkqj
	HCG8TwPxmm3NMMj0njNf3x6HAxryfqh1CumYX9VSdT5lyhwkbybGnt+5nSuP6xAWt5qCguoaTQI
	veI3pzENxUsrdXTgvpISUxteHlPNG50yycxAt9uibxzg/9Lf+MGwpEA3bLzLE5DE+k37Zn8FmuD
	pXS5PfRT8tmPvRPnC/l21xWxJRIMLTNAJJ8wbL72RKHWiZKpmYZNKcuqOQa5qaYLoLhVN33eWCL
	nn3Qm2ZEjMkXX9cGHFq8BEuq6dDNp+uMiUx6u7lJPEV143hcBGbAJPJIbxXcewSC7XmqvN+61BW
	1CBrtMrA1yBl3SHG8fH3+u2Ym0QKV9aRIIQ2NpaWBGaJS45EUTVnAJCIpei6Mh2ySy3d0Y43V0w
	k1Oz5SYap7VOYIeDBy+iW+y+bvSOfWEUta9lEg6sqaKKfITQCC8eMDADoJHL1GRhk9nTIEkoI4s
	cNsY45GpnXNSscW+H7hldEDbnFisP1Knw5awZf36Bw6+8eabn/lE+KsISXzRGO7M+8mGQGup9r6
	vG3UlYM9uVcaUt9TnM73pkhfER8d1ToT8iuq69LlsFnzuJ9CLQL2ze2thnXzyaOAE54Dz/fZN2a
	4=
X-Received: by 2002:a17:906:4788:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c4ca7ab3286mr159624866b.30.1793358205711;
        Fri, 30 Oct 2026 04:03:25 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/25] python3-nodeenv: Upgrade 1.11.0 -> 1.11.1
Date: Fri, 30 Oct 2026 13:02:55 +0200
Message-ID: <20261030110309.1124614-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131693
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.11.1:

- fix(nodeenv): skip node.js pre-releases for latest and ranges

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nodeenv_1.11.0.bb => python3-nodeenv_1.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nodeenv_1.11.0.bb => python3-nodeenv_1.11.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb b/meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb
index 02963937db..766f734777 100644
--- a/meta-python/recipes-devtools/python/python3-nodeenv_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nodeenv_1.11.1.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a9e238ffae5bb6447dbac6291e1dc3a3"
 
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "3ce8fe5b71d16e8af7039ca65257354100bc772965d6bc549070649e53b1b146"
+SRC_URI[sha256sum] = "d7fa027c1df437bdd974b0502a8dc76fa1b3183e369ac9539602bc6bab9100ba"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.47.3

