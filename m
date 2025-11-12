Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16103CD37AD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6292.1762976146252457118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hZqY0tOT;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b312a089fso20861f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976144; x=1763580944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eR5lHTDNjQD0UrkhA3PnoHLSOQ8mAtBaLVV9dHYclgk=;
        b=hZqY0tOTic7j7DEF9WUn9fisukey8m/BYRuX0fAb5ICcgHxUy32/fOK6ZEiYHEBop3
         BDuWgAwzNYl3r5+sLKCjgFgpGSt9iParAWCELMi5vKB5Vl0NmSTrolq+ifcQ4NBCeZvo
         J1MANGCOGhIXHoRLJCFFg2GCwrXS+sc8TU7zOL5its0nIUYTeAu8+nV3kxrOyxYBw5SB
         W5g2GLO2FCDBZcAWJ1eGyK8j/D6s86+/4ZeU70y/aQXh3Ji42C77+esj7juRN/Itq0uh
         fOx+1Iy/X7oY6VyeUUOIU+q4nNliN5aqrRYchEsNOiLpexaTlDWrjXuXKM8X6GD/xC7d
         CzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976144; x=1763580944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eR5lHTDNjQD0UrkhA3PnoHLSOQ8mAtBaLVV9dHYclgk=;
        b=qiwmGvmmy6cQF9vnSH8l768m9sydGUCYN4jrdDZeFRLWiePmScUqaYFhWxmYoFvlJS
         jp+S9vH1/NNtwWYG4XwMQoJKW98GiwnykNaR6KGxukQB2uuxCVgYzy0SY72ITTx8FOuU
         +HEC6UaOWg8ENWElIw6SOo0PFvzVkEvPL1v+1R1gGR81+sUT2AqxOKD5ZI2otQ1cXcCo
         67N+zVvVXMKwcFgk/5OAc+3tUDXxUIAKvecK+wKSTWohQ92nBYO1IkvPyRn36wAdy4hb
         RIvNYx2+A6F9UWBJLDbWNdvaFmWIfnHQ42NNv2jyKJmaH0eqvVFNUWiWgnG/a6aUrjUS
         2z0w==
X-Gm-Message-State: AOJu0Yz3l6K3zQTeccxE0oUN5SB2q7SkbHzKhoZoiDu3JHwMKKVswY4p
	/EuO0LGz4SDyyvrhgFd4NYD6VOavH/dNqMsgytnbL3THeCSSGDVTcr5chGOEYzzE
X-Gm-Gg: ASbGncuXS+5Ag1XOQEmshuTnqf9zv3kUZvlTR0oPSkjWVvc3pV1exVqKHRQFnAlRWpj
	oj0CyZ/09y7EKJexg2Yaxuvtt/AQqQF5wLUAe3OE0dQnXUD60vXK99fmDRVV1iLyg/nurZYfbMY
	+xWwL1Hw5kya/7Dm0gz3bPhB5T+eqn4Q0weW/0PquvV/8OToqprRw26pxQhyXGf5MbrBwFepNUm
	9CFgO4BBBgKg9sr8ElbN8exHXAuHN6PE1e2BRiAc7IXYW0Ffj/0+5sRQuFpUBX3ZGBYVzVtz8fX
	JaTQ/XdKoXR5y801MdDqve72LT7uXqzHlnq0yS/R5jQZqqRrGUpOhmc5rBXq4zOCbj5bolgoHjJ
	wFV/8A6YWtjq3Vlt8PIe3d/H/HSok34/3a061GKu31bSoMwGtecd9MRB1mTtj/dqoyN8yvMrb8Q
	==
X-Google-Smtp-Source: AGHT+IHsfyLUop+3mILW5J4UQbzFwlX4SUtjnm68W3sI4flhUTMVmhyP06mFVrz3f6lAzozcnL+HCw==
X-Received: by 2002:a05:6000:651:b0:429:d40e:fa40 with SMTP id ffacd0b85a97d-42b4bdb4849mr3680556f8f.45.1762976144509;
        Wed, 12 Nov 2025 11:35:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/21] cmpi-bindings: update SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:23 +0100
Message-ID: <20251112193542.1589821-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121563

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 3b7453536b..c41928d347 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
 DEPENDS = "swig-native python3 sblim-cmpi-devel"
 
-SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=main \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://cmpi-bindings-0.9.5-python-lib-dir.patch \

