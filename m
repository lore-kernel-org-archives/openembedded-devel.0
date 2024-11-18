Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB3DD10F41
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 02:38:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.31031.1731894315670009391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Nov 2024 17:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kYYmSSgm;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: david.sands3@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e681bc315so2502486b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Nov 2024 17:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731894315; x=1732499115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy7piFRqraPeIXSpTXOndACHbWF/roI9/KRTnRnm3y8=;
        b=kYYmSSgmCu5uGhuHu0oo58Yw/AFbabENDIjAVPPlsoBIJAzDqwmkBWmExTv+/9asno
         Gcd0KME1T7Mr8zjFXx1DQXpaH4HJ/qBjxGApPw7HnUKAxXBE1p6BkbDJvnVuTOe4ocoN
         O2mGmqRO2p9Re1oYJSHgyb8Xr07b/d83o/Tm76sJ+INAymTHQiLTh4a460wNmcH4IVjb
         fY6VyX993jSgVcUHEgll0A1pFdpHVCpsUvvRnwsTn+h+aOdA5b9GDSJFlYwDCiYXskAf
         bCN4LHHZOtAYSVYWBlHztR7Tewya+rtvTwzFx2G38lHYVTmOZ3RwMSyOtYsr9Gfowuvb
         9xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731894315; x=1732499115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy7piFRqraPeIXSpTXOndACHbWF/roI9/KRTnRnm3y8=;
        b=PLDqRkYKfZh4IW+C7QPxRdZPVdiWbihBayf8rIBZF5/zur3XtNH+AR3GBKmZ3L89GU
         p26QFHKmt4CQMfDS++MxjwbV5dXR++WMNW3qssUqvHCjb86klpaTXXlNuP4mGqeucu8G
         dhmh7M0V9Tfk4nd43KE+/bl6rrKDl0xQnCpXVzA8zACZrcc2MX5LaDragD9zHehQv41Y
         98CgN3S2dRxPU2V1+JgZzNZwEIi10XX7vHNATKHi8dYggmmeX5Nz+bH+E/4ZAt8MTsbf
         gpseSJYxJjewX/nXxMaFp0798DICI+bhErukrJ0aRZEKft9GbP7StQF5hMKARHQRVi0u
         IVOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMXcifQ+wBD0H64PwSq4wANmYfCztW7jMCXRi7GNQFoKJie9ay/iBNkSV9A6Cmyv5LvLBJIjFqeTBVcLkKldLBekk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkjgTf9TfzC6Ffa9u+kcD8quzCNKraCDlm7vYcVNBT1P1vSNoL
	6tWWllUwq4QYZCONHg8Gws2rHu9DszziLnizCbqTKYsnvkhjlwCD
X-Google-Smtp-Source: AGHT+IEslP+wcMcbm7WTNpVYHXZUvOIvv3Xx6JDZql5rfTLMHcNHQ9XO/RBDjvRBJoP4hbM+n6sfsQ==
X-Received: by 2002:aa7:9dd1:0:b0:724:6702:faa4 with SMTP id d2e1a72fcca58-7246702fb42mr18678803b3a.10.1731894314966;
        Sun, 17 Nov 2024 17:45:14 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:70ae:e501:d81b:1d77:65a6:5f13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72477135ecbsm4959211b3a.84.2024.11.17.17.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 17:45:14 -0800 (PST)
From: David Sands <david.sands3@gmail.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: david.sands3@gmail.com
Subject: [meta-oe][PATCH 1/2] jack: remove jack-utils
Date: Mon, 18 Nov 2024 11:44:58 +1000
Message-ID: <20241118014459.2029441-1-david.sands3@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 02:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113855

This commit removes jack-utils from the jack recipe as it has been broken out into it's own repo from jack v1.9.22 onwards.

Signed-off-by: David Sands <david.sands3@gmail.com>
---
 meta-oe/recipes-multimedia/jack/jack_1.9.22.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
index bb844e4ff..d46391d08 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.9.22.bb
@@ -43,7 +43,7 @@ do_install:append() {
 	fi
 }
 
-PACKAGES =+ "libjack jack-server jack-utils"
+PACKAGES =+ "libjack jack-server"
 
 RDEPENDS:jack-dev:remove = "${PN} (= ${EXTENDPKGV})"
 
@@ -53,7 +53,6 @@ FILES:jack-server = " \
     ${bindir}/jackdbus \
     ${bindir}/jackd \
 "
-FILES:jack-utils = "${bindir}/*"
 
 FILES:${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/*"
 
-- 
2.43.0


