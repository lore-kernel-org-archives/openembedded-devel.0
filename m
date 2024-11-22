Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CE9E65D25
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:12:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.16899.1732248728699399849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aj9EEwcA;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eeb66727e7so18234727b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248728; x=1732853528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0eFfHb4CBeKtbJ19YcjGTjMqJDVQd8CC5kMu40ZPwg=;
        b=Aj9EEwcArpAyOR2BJGDmcQiJNDNyM8NycU/zJd/dWG0Wx+taNqfBR7iH42XNihAJSw
         8xMQZdYjIZGoCrrb9sZnVypxu/suW3arkAGa4y1S+2Xh+RUerzU72E7CdTWYOUsC2nNP
         mIPpzybl0aZdbzyVN4C2Mx7noU+IjHm7gEMXkw/553zbzJlinuNQ8wQmZW9oQn+811eJ
         aucHo+ESFmWqc+Ml3bWruzHHWLtVj9X6ZTtf9yPWiNrXCG+1c7BIXUd5VWGYjMEhlXAX
         7QaFpvfXaidmhkJY216EYc6u947CsRufG3jk+fPXbF1lvBdmPk6WMcACAxffRTbnzfjd
         6/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248728; x=1732853528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0eFfHb4CBeKtbJ19YcjGTjMqJDVQd8CC5kMu40ZPwg=;
        b=j9VHi4DliYB89zWXJZiZ+YfhAMkz8veby1gErXcXIGvk8v9ICipW3Ru/QAK67Wn3Ku
         AyyofYgIuuYd5EtOX5P+V7TNU13FEkRsd5rU0k235w/dZWeogNn//92ry5Q55tTNfs55
         laGWdM5lgzWITsQD8yvr/b+fK7bCiDqjQxJEJQVim8tSBIO2loEQOVq9IPfm3ARaeWTK
         QtsV8XYfe2VNQdE5u/lz5BtEn9g+luNLMssYAMcneSS/6YPdCyqO+skJHBndY03uXxuu
         HTbUgYqdETQPteDGLA/7o8d9+1xKzD1r71HmiBjk0JtxCMDzvzDPJbUlf9wkqmp1Ar5d
         z6WQ==
X-Gm-Message-State: AOJu0YxQQ6tvAG2yU1P6i1Fau1M7HFiaHx9dXYBSfc5SRF7STmP4xmHK
	u19fxhFATQs/GUfXLhVG0pMvUfnVZgwhIQMQ8o9UjYjav13CGilcX6qzNTgF
X-Gm-Gg: ASbGncsbkIrLMVTk1wps8u7lGHyRrhSxVKTSLxM6Mg/puQVI/BYrUn8CzFzUJYSwDrD
	FNc7uBrkXLe1IR2BoqzyQd9W0BsNnN56qzpecukWVKMzoJaWlzI3vEuLxY3xZ1Z9cJIsvzEsrlW
	nFhIOtXHkJ8JZZ4XSsLVzVEYmVComF2Z2YBfP9Gx5RQRk5DgjeV58MtEfFjNM23D8R7lvnIQL87
	MrkTiISx+YLlvtxLBfAtcpX9yqeD58SWkq2XPXiuB+yVIArOxTAPVtq
X-Google-Smtp-Source: AGHT+IE0xu4cvz/yL082MzV7Vtm16fo+LgaTvGB6w0qFZPTn6cTqszBnL2GxlqPPclSEYVy4hfITqg==
X-Received: by 2002:a05:690c:74c7:b0:6ee:5254:7baf with SMTP id 00721157ae682-6eee08a8b15mr17951677b3.6.1732248727285;
        Thu, 21 Nov 2024 20:12:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:12:06 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 7/7] libmozilla-ca-perl: Upgrade 20240730 -> 20240924
Date: Thu, 21 Nov 2024 23:10:44 -0500
Message-ID: <20241122041044.1111236-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113987

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20240924

    Update from Mozilla repository to 2024-09-24
    Added certificates:
        SecureSign Root CA12 sha256: 3f034bb5704d44b2d08545a02057de93ebf3905fce721acbc730c06ddaee904e
        SecureSign Root CA14 sha256: 4b009c1034494f9ab56bba3ba1d62731fc4d20d8955adcec10a925607261e338
        SecureSign Root CA15 sha256: e778f0f095fe843729cd1a0082179e5314a9c291442805e1fb1d8fb6b8886c3a
        TWCA CYBER Root CA sha256: 3f63bb2814be174ec8b6439cf08d6d56f0b7c405883a5648a334424d6b3ec558

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20240730.bb => libmozilla-ca-perl_20240924.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20240730.bb => libmozilla-ca-perl_20240924.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb
index d94b4eeaf..a5de4f226 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240730.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "55bbee1875a905616e0c39457245f94f8173227fbe906f643673f5adadedf863"
+SRC_URI[sha256sum] = "c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


