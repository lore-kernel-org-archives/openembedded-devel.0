Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713B0CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:36 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46615.1790553807614917770
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IyWV8UUz;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so10564885ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553807; x=1791158607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/je+j4Wx/yTZ+Dm9EBsh8dPAbwrGpkxxDbsNIU9LTs=;
        b=IyWV8UUzEYURC8XVrWGi5KeNCI+k1/ZAjbOTtsrwGj4plzWJrmemCEJM+xjUC86MHv
         n/kJSckQVFxi/jMq0pJ//AGuYofhxfgM8R3efzEv7sT1wcWB1bmflNXpiImBMtWpoJPg
         xpmVb1FnFjiyjZvxRw4KQXwBFn+DT5ftyhSPatQx222LW3tURhKHbQfJTi4ioo52qpi/
         GEByFp5lO9f3FtzrsYKXHFB32ic9trVQ3Q6O2Yci7cvny5Ffn3pyFgOOG2tS/33Ulzki
         8nifNbU4OaOl1T7AId8mQm2P5ypkY9BGr4xf2M9cjYHvGbfnhG75N7ASxiu6q761+js4
         FPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553807; x=1791158607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/je+j4Wx/yTZ+Dm9EBsh8dPAbwrGpkxxDbsNIU9LTs=;
        b=Bl8vl4NmUd8HMOg+KiRBmO9QiG8gPGgsxM13As2+vyrAnS+VnvCHHAZEOCkeC4YB+W
         e/iz8EUxuSYIYDFdc9Aa38861nC/Or98op3VmZqEbW1frm6ZllSEbFmMd+yANdkguCuY
         143n7JhD2CIImF0L5ItKlbYknN8b0hbyNoRtSvF9EOrz784piFxZRX5SklgYICe6tJ9+
         GYn4oXB9+OMB/RuCO3CvQqQ2oxGO34rW4OzgsXsZFXsNggzWyBpcdZCSCJZQx/jjP5D2
         er7GVZcuoZvPagHXJaSJkK9YZfK9kNQoUdRpAyShOW7rgB0qF2kBNRstzaCOlNr/89Db
         pKZg==
X-Gm-Message-State: AFq9FYLVKZ5a+uzdlLImYPadpy/k3PbMeAxPN+jQJbBJA15FcmUHjQDf
	OydglWJHU16DK3rj2sERF4VmJXG0Is/xpoROHeLWxeYU7o3pAySVP0yCK3Wl8Q==
X-Gm-Gg: AYBFou0zexYZnTSHaOwhNPQLBCIq8djSjaCm/zY0xes2CKtC7mPCeaPzValzo5klLOK
	nX5oKumzU805JdCUK/lO2q8VMkHX8OM1fD4JUy8KrbUJRjzLd49L1fcBg7nKaHzsu2cT3na0EAZ
	H1e9ilxk/MJEgEfMl8IpH/Wseztct7rYLwOHtzngpYRxZ16tEpeCxbNkWg734P6CAuTND3P6yKm
	CmcmGMLiTOekRges7rYn8vYtsuzY9KnZqlo0UFdJJZO/4mjhldP0rireC+LNAGiLexkI7iRRxac
	2Y27mtPE1SqYSf0wyq3ackvy4SFYTfYVr7jaUUj3mFOwGOpoAXqSzus1+hWrmm83orGK7wPU2U2
	CwwOZEbFLpmLQ6YCIb6YU9sZL91o9AttcFWF/qNvD/58OblpDX+K0c67pH7V7FlZPfiKqp8LQ1q
	thSSycPvRkDn/WsWrKSthv1+k/vgNSGxcs9J7guqXQMCXiHyx9xCVai4d1RYqLfyMtklXkhzHYF
	7bxRYAo/srbyt+WE0/KWqgZTQj7sr9kLA==
X-Received: by 2002:a17:902:ec8b:b0:2dd:c053:82f6 with SMTP id d9443c01a7336-2df7deb7a71mr93224375ad.45.1790553806828;
        Sun, 27 Sep 2026 17:03:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 9/30] python3-bitarray: upgrade 3.10.1 -> 3.11.0
Date: Mon, 28 Sep 2026 13:02:41 +1300
Message-ID: <20260928000302.2528437-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130396

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ilanschnell/bitarray/blob/3.11.0/CHANGE_LOG

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-bitarray_3.10.1.bb => python3-bitarray_3.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.10.1.bb => python3-bitarray_3.11.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb
index f6516b1833..c3c1bb6d68 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.11.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "c33e48906407ab3d0edb96cc5ab2a599bda5dd04704ebcd9b3e0eedce7310e0a"
+SRC_URI[sha256sum] = "bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8"
 
 inherit python_setuptools_build_meta pypi
 

