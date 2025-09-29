Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C7ACAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.52856.1759151084210927144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cGqySA+M;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2ef8e00becso493525966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151082; x=1759755882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5BpWLwLc/nxA3fX/qrx6G6h5VqUiWedWpqNCxm7JH0=;
        b=cGqySA+M+f+Gp5P4/9jXic+lORJ9JvnmyrN3qfoAFAUT52ZcoynxLTt21Z1RuB+YuL
         l3XdD5hUNw4uLmcXiKn8W+sU4AjStVu849YHRcU4TR6nNHPYcWEwXxeZWbouKCTuzDB0
         RKyzsgl4vNjbS5uflp4JQiBOTSv00061xz0lKWsQGdAmpzKUFmXpC2Qe4pCxYXdStQSq
         sUH98/GOrPup6QzM6gV/CNIujxTgj9uY7OEJp21Rb+BEXW84fGxeE9wguJ1CLQG2bkX2
         HUDQ7/jBPLC106zsfWAJWIiNqkRu8ndxXlzosgGnVrZeFYYR3z2ChJz/57D7Ktzut5mb
         MpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151082; x=1759755882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5BpWLwLc/nxA3fX/qrx6G6h5VqUiWedWpqNCxm7JH0=;
        b=ZFNWeOcWEki7ZEMS3he0nooUyaroP97PMIgPgSplVm4KCafkm7X459+I5XhAHaFKid
         yynhOGSaKUKEg8zDv6rKWb0YjBJV5rfR9mvFymWAsxFCcXkVFlTLQL/JZr0vBlIH6dhE
         DcKaZV14lkN328yjML0GX/5eMIt1iB8rtIXGroliiPwQfFDPgD648116mMSkQXdDPH/+
         rqpe3tc6B+cf1QxCKfGSAVogVfE2bNsmgTqFNEZ0JcUoAS+0Z4DtPw1HsEs2W6A0RXri
         rLDn6ccIa3A3oVzW2R6M4Vkvg4p8DIYWxiVKzbLmtZfnUxNLnRNZ6EmTtyCr/sbKqu2E
         pfZw==
X-Gm-Message-State: AOJu0YzPRmDoW03pq7citsaYfU/TtH9Acl3F+jKbbAMhJ9PUii/ev1vw
	DzR/FJwACeDqTAxfqzoynflrsSiEewEMtCH0QhK1UhebmXBMqGn18OTiGItQFg==
X-Gm-Gg: ASbGncs8TwXhMPPN7yraoGDE5u2Ggy8/NBd6AxsvG/fCOFJ5i6TvHaLJbnxsV0taMaZ
	cigLkDJAiBczFCw7FxAYMp0MoHG5jR1+Mppxr4Ivg169No7z4c+ZIa9ALHkYBl4shOAt5XCNqiK
	2R+hy8egC/rBvkR92kyn3zNJWujRdcLTGQi0XPP7tFSVnmkhvYk9COuYNzAN8zfXiUT8/dTnpHr
	f+09Yy7O/pTD+SFgkYgflGoLU0MTlqDgolFjR2LAq3eJNtSnD8GO68o3gbDle9L1bMclWb6WyOp
	Jr1CMQHYLBm3kedb/AjH0uwT8PcL6x4dEEOrlIT/mGe7CeNYU4LS4C/FasH1bIXdHP0hiBceWQ9
	IqP9ySte0dznfc5IgnsvT
X-Google-Smtp-Source: AGHT+IHpdAmhnnG6FuZZDo2FCu+1DitnCUyMkJIt70RVThVYsJjLEkRy2R4/JnjCQTKvuvD+nrvD9A==
X-Received: by 2002:a17:906:391:b0:b3e:151b:849e with SMTP id a640c23a62f3a-b3e151b86d4mr370244466b.10.1759151082397;
        Mon, 29 Sep 2025 06:04:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 17/22] debootstrap: Update SRC_URI to point to valid URL
Date: Mon, 29 Sep 2025 15:04:20 +0200
Message-ID: <20250929130425.2912077-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120030

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2db438f241b966ed8a0d26f52c2fc2fe395cdcc7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index b2a204403e..3e59af8e2e 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex bluez5"
 
-SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
+SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}/obex-data-server-${PV}.tar.gz \
            file://obex-data-server-0.4.6-build-fixes-1.patch \
 "
-SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
 inherit features_check autotools-brokensep pkgconfig

