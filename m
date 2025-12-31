Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D405EE57DF
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81867.1767167682204215589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+fzOuey;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so89200295e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167681; x=1767772481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXZa8q/pUHZ5KFTolE7yRKke48iKzA970L3C07Ji+nY=;
        b=X+fzOuey0hljphCVcOEkM+oUEl/T05GrVi2lCaB0ZR+jHXRt1tD+1L7FSd89M4HbC1
         1t42Tw44SUgbe0SCUSaPOrMXQtv+u15hr+BFlGBBgk81bMgVDcq0kAPY5cecwEiwIDtc
         fT+wQnbB1qRjMrsJRbra7TJUzOmid2YslyET63mLX5tW1mKI5hL71IcvwudmXeTHKx7m
         YJV6YC2P1PaNumsajyyZ62T59ohxokv5iH7+A0G+SK/oVavDZoveXjTF3JWzAMblQtEW
         8IjZsGbqegZcnHL8i33Gw4o1a9zAAJ1taOt3TvwPCOVUQPJnfLETT3sodVRxUKNbo4uZ
         lWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167681; x=1767772481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hXZa8q/pUHZ5KFTolE7yRKke48iKzA970L3C07Ji+nY=;
        b=gvr/yoU+cyzVOJ5zyx6Y/gwf/CmFRpFxO3yFo4SUKX01BxeFKq20/tTk2xzCDMmaJv
         01EGeeGUp/8uVeI169cSCl4mIBFRNzulYbeFxpz0+sFrH/SBpGgx0hauHh09oAbNk4Wx
         B10Th/+Asvs1X+hq3uVxJid1066Fs1uCqoakkGmSPf/hfu9V1i1HIHtasM4nX1URZnB1
         t8tV95Vyl/gMMuJjjFB1xxFDse1jv6W2XX4sb1lovnANC0t0Lk+Bh//Frq99A52OW/ap
         Pyf9xF1iUVU4b+8S5QIS3Bw0jvVr69r5IS6dOWoomF05D/J5tyNZ3KZmUCYLSL3akvPV
         zzHA==
X-Gm-Message-State: AOJu0Yxz42aTCi5KOeT3iupdYj6Y2Lp4XNBPXSoYlnDnHrX5Z6ZXoaMi
	lNO9n8bipQBOLzeRVzwgPKf66GgWmgx29ifEKIaUpaGKBpSih/1yfD/ofBEExg==
X-Gm-Gg: AY/fxX4TpAFRkS4/DyH337+xzEL6CdtaXi/imUp/B/5Qz7Fgs0WbwXQk+7fO4fMYLTw
	iYz7pnXgQE3qPcT3LV0BvyhxSTlVWzTvq+n1Zl1NL6BwTIEw3n9sAjlN1fzHPDQ3wkdRn6u1xc+
	h7kZVi7y68kHIwbjqGGu5Bl3LpGHZAOTCsUgmjzA7fDf/RiN9VEeaIZsYO1md7WeKuyV3U+YNG7
	iUp/9tJb8IDJKBtO9SiAfMyfPgbqjHgkGDebZRt/+NkG7q5/SpVHAKm0asQWVi+sWQw1AFhoJDJ
	VT8RzKRTVJeM0fh+DYReER8qo8FWVuJu6sjlnEKMNBHbLeNrVYA9FFO2p1obRtQTZTwZl28b/zp
	XIdPZW6Za8wCZ9WE837c/NWs/ejEQZfl4Mk9FjS4ssWyWlwsF4RlVuw/k/ScEhMp7XKUvOS9lNO
	1dBWE3PWDz4m1NUtNkwds=
X-Google-Smtp-Source: AGHT+IGoxB4CAwnPP1gtlRFvQu0kfv6yS3GgB3xHOjgh/DcJs3z981YLPWKXD4MJ7C/JHypnXJg8qg==
X-Received: by 2002:a05:600c:3b12:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-47d244d4ab0mr383806985e9.24.1767167680488;
        Tue, 30 Dec 2025 23:54:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/34] python3-autobahn: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:06 +0100
Message-ID: <20251231075436.771395-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123044

The only CVE stored in the CVE db is tracked with "crossbar" vendor,
which makes the default python:autobahn CPE to not match.

Set the CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'autobahn';
CVE-2020-35678|crossbar|autobahn|||20.12.3|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
index 45d2fd5e8c..922252e83d 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
 SRC_URI[sha256sum] = "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
 
+CVE_PRODUCT = "autobahn"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \

