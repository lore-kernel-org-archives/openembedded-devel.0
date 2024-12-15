Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D230E77186
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 18:36:24 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.40713.1734287780214034428
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 10:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B0TkDN2Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso2451151276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734287779; x=1734892579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HowMzID34hgb1UCyDHViLl3S26kmtrY5xwfXP9j8EM=;
        b=B0TkDN2Zpd8C7gSiIEdV1ciHV5kgBW0gTLLOdmQcJ4GY2oL3CJ6HYsGjy5m3LUD0F2
         hhco3Ul2u6++sgTCFyWNuSKH5luCmd+fCQgy41VvYzhlqzDq2+sykmyvPp3ObVFSJT1m
         fzbXs9x9A2W9SkJntKAp7aPqjDXhOPe1n6oSc9eBFuXfyaxuM4d1HITqwUuLcRIusKU5
         jQTuPiY1vvoZL3VtA5+3t3CLOUoTe6iCyB9JErj6kLjUXBNBu415JPwR76Skb97/neT6
         cRTnmOwl+A78FyPf44pBwgvLSAe1/Cka3C50xzYQCGhWjapFOW4PkGRlgQIB0MTs2Mrb
         tZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734287779; x=1734892579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HowMzID34hgb1UCyDHViLl3S26kmtrY5xwfXP9j8EM=;
        b=M/5G41d0aNmxyfgvW+W2/yFQylnNlBHkECBEnZfu4+Oz1M8vNlEbh5MFJlQusiRDsZ
         rJRUcdFY5dMNKUJeP36xRzao0kyxdV7kx496y91e/0rVwiHzPSJnFaUjl+Z7YKJVBIer
         0nN7IGBptMHnrrO6r2b+Wwvvq/bcwFC5SYemu7PAG6jcAkA5NEL+/vfFwE8W8H5OGak6
         w7qbLGTBX6bG3SlLD0YE14LGan2cS+McXMAFHp0Bh8I+zLs5GF/v8yw+KEJVjQxG+CF2
         1AhBt+E5cJoqayEwezLeMWkFXmi5kxtY53Vg++aD6ZoGsrwTEliPIUly29zLKwmb/LYx
         Lz0g==
X-Gm-Message-State: AOJu0Yxvw1RZa9MTUjlogP6+nbpWzwnw1dywEnBt829tc+BT1zHeaTYp
	mF7cN84rIIelg2hX1w6puLdMaLwpW3K5XWTh86u5V0nCDnOpsvYdGKBM3VaL
X-Gm-Gg: ASbGnctPmfJPUPlw5kKsIyQzT8wHHNu0nQjXE45HHxGNW6vVzYMjK69N+sClbEeVdYM
	XpyRJpPzulkvkXfqNY1C2fNGA77eAiQLeOVlo3AuOIb7K+3uLcsWx4sw7m03+vEUwgmAfxgMkuG
	oh+vWJLaW13RYbo8NExAdRJAebyqG6YkmtR+twUYnHC6hTDWc6zJf+2Gmjdd1K3ITXWJxPdhd+3
	DRNOu42Qh1cjNcqWHfQ78P43zQ7024M9aIWAOrIvcahas2Qll2Bt8kb9OCt72ZLHhfxWw==
X-Google-Smtp-Source: AGHT+IG8ornReQ5Vw7m5XPmGdF8JqsxFxWLtzauGQDHE+6SA7/8R579gHggnn1PZT5XBg/eb5I3UnA==
X-Received: by 2002:a05:6902:70b:b0:e38:87bf:8e61 with SMTP id 3f1490d57ef6-e434f83f44bmr7731143276.27.1734287779292;
        Sun, 15 Dec 2024 10:36:19 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:a906:ba5:bc1d:da36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47035366easm985356276.18.2024.12.15.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 10:36:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 4/5] wireshark: use inherit_defer for conditional cases
Date: Sun, 15 Dec 2024 13:36:15 -0500
Message-ID: <20241215183616.7218-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215183616.7218-1-akuster808@gmail.com>
References: <20241215183616.7218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114320

From: Ghislain Mangé <ghislain.mange@smile.fr>

Conditionnal inherit may be missed when PACKAGECONFIG qt5 is activated
after this inherit, eg in .bbappend. see patch [0]

[0]: https://lists.openembedded.org/g/bitbake-devel/message/16815

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97318e27ebf9f528acf77fb0759c332bd83adb4b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 3fa293d0cd..9c93fd026c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 # these next two options require addional layers
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.43.0


