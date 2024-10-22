Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79C2CCFA11
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.21953.1729612097300948065
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pz2P2IaO;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e2f4c1f79bso48283297b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612096; x=1730216896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQ3IvoDEL1vbxAjXUYQDwkc3EUZLeDjG9NMql5nILO4=;
        b=Pz2P2IaOcGhZijIo10glP9LPF1vCNgoBJn0WSN/inlt3bKbNkR2oLFiOpiKXsA+EcH
         olXuUa5F0proJ4q6GQBnkug4hm8nyae9vX2u1SnduUfbtk9jwJf341q7zAznZrHNdcoc
         y5/ED33dYBLMIG16fPn5FUG68GjWxYuoOB32R/pNaOEHE1hqe43scjvLKD5ekNiKML9D
         60BTzQ2um1ar0fyMj5HqOUumN8lFzjD/jhdRYtlhPJ69BvFXQEG2wMpLiilslXAn2h9L
         KzUOgGCnRSorqsfIh5X+OFo6qOWQeWK/vZzYP1ephxtTpTVGvZGsIfKVgcbVohPaGlJp
         g4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612096; x=1730216896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQ3IvoDEL1vbxAjXUYQDwkc3EUZLeDjG9NMql5nILO4=;
        b=vm0PLyVGClXRZykc3EFb6g3kXTXzAsfeIzFCebYbygG5F/9ogR/90Unz74IIXq+Zr+
         K0n429BDpS4vXIFDVmXV56rF4etLCHJMg8ERvNNVZbNON6zGg3zibZlgTfA7QVyMs8wt
         feVWoNxz0u04ea/aXvRsYkq9BjzY+Cm3IBNwKgnIYGqrVf2ANS1Fc68d4QLsMb0wSWcm
         cELFCw0SCAEg8YaBSCX52/b1aF9Aoab4dOkWXbeD6YAti0K9UjtWtaJj83nTVYkqEIen
         R4fo5G5ZdllneGXFJbu3v88gudE6jJwW9N5juQfcRgXlYVoMKQwo0yK9LAkXv4q1IxeX
         R5RA==
X-Gm-Message-State: AOJu0YxwFmJyICMxBYPgTbsALbcuhX3K0fgFhS6z2hr5w3HyuAup9lfI
	Nk+WlUR13BOcvLCui+1Dk1mw0YDimAKsErujMUmiah5h9qp5FDAhMy/0NA==
X-Google-Smtp-Source: AGHT+IELmNtHjCYdeZTGP0FrWbuB91NLVPGTw0BM9UgiVBY0ioLO5WKaKuE1jmzoDIKyZ2bgEiaHgw==
X-Received: by 2002:a05:690c:91:b0:6e5:a8ce:dd0a with SMTP id 00721157ae682-6e7d82af7b1mr27161407b3.35.1729612096057;
        Tue, 22 Oct 2024 08:48:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 33/46] librole-tiny-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:51 -0400
Message-ID: <20241022154729.20331-34-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113124

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
index c5efc1535..8ccd269e6 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ee45591befa3d0b1094ac75d282b6ba"
 SRC_URI[sha256sum] = "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
-- 
2.43.0


