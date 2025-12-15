Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27C3D5B85B
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:02:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54115.1765818139140961931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHztL5Ac;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso30036395e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 09:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765818137; x=1766422937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt7bm/jQqSGI5gRD/bRee23p1v9NS8uAgJ98CQt+nlo=;
        b=YHztL5Ac+S7oV8GVHIGDYljoBigxUqFW8TD9RnmOsGFDTSQThaiMejENDAHsM12t06
         ONQ5w6nhnnw/tCGTljj05IbMPZjQVeNf+wVWjxoxXG8kL9FrCfZNeJYEvoalgAD/C9kU
         oJz0/On89zupxZBlIpl4RwimwrSH/erw3KofPgizCNQDdjcjsaiseKdpCLIZLkR0IkWl
         cOD+B87DaIOfjmxou0dDCJOiI+IOHm8CpDRqWkUWfSqkBbmqsgM1eKxewa0hxgMsDHTZ
         olf1EJBaP5KYIK6sQx42h7UVhydweUy4uP5NLkJpYM+DgcF4GFIiPBIGT0T8WsezuUxM
         J6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818137; x=1766422937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dt7bm/jQqSGI5gRD/bRee23p1v9NS8uAgJ98CQt+nlo=;
        b=i1aJM6XXfXwW46GC3woZ04WTmcGwMb4wa3UpPAaht4JpKAhq1ax/vpu/Y6DjapMLiP
         FLgqId3wQJMMUJZhIrr0MFM+m7v/jlXBa2awIiSjE83hibh46k7bbjXczcoRP9LZ46D2
         2ebzil7XFeyeOMENO+cqsSr7pa+34V9sgKpWgq0EAHhodiw+tTTxRx5Ip2SZxBiBgKkA
         dOkeP7nneA6XX4xFlR03hxK1KIAxMcxQRQ+u6vnj5vC0EgnU9EPWXI5YIk2IQGMasp2V
         5X9rxYbn8fA8p9IItB0W+hQxBqqgajqY/mY1mTYqAPK7e63kDo/wS1FEyjSjdcjy0WLq
         1yWg==
X-Gm-Message-State: AOJu0YxSbUXpwytzRobDypRxfofhmhV6lmu2vpKSnlIWOSKOd+kYTXri
	xfSCrsRUvibtSBOrzv17EI0ESdjkFiq6g/Cy0T5/RojSpF4JVLiew47QYArPaQ==
X-Gm-Gg: AY/fxX5xp8TDijZgQr5Dc9iZMjeh341RwbxGqR73G1UnKw7Tq+sTWJAsaXb2r7cMn/O
	XmrxK9ngOMFvhr8ILXSBmvcsfsc7E+QgowVw8CCIj5wZKt8wSHJHIUA/Kl1dYi5urDewHeZaTe5
	SYVFKAufvYHJ/0GeX5Q6mJNCqJSTXQwVDgXzWAzvzM9JmAwXjx/xyTAyVVy3vNXbTVhMwn6lAJz
	pWJJ1XwJ+BlKSyZzIkt4xiUsGYCteAbB+CRATJedWp60h1+0VZpNs1ALhpaYhbHo9hkhJBI9MLt
	hvN4Tz71Ixs37BfSrueO/UcRaciycBKABQZzZBwxCi3Nu0+KSPg/uJhYxKNuahVYZ5Hv2MVRHC+
	lGpsop68G5L5sLamx1IN8oIpHLL6m/RXXchLknufy62Z6KhedybDnd5tO/0vIR274DYJHoSI3+2
	hcAwPptN9nA8nuK/G4xrU=
X-Google-Smtp-Source: AGHT+IEtdLqEnBe//wv0tePT8ZJAZB52pZkzymRnqlilZFKoPlkeQmOTjoDz6zUwzB6ZXzSSKlWRWQ==
X-Received: by 2002:a05:600c:190e:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47a8f90d61amr130258315e9.26.1765818137349;
        Mon, 15 Dec 2025 09:02:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b6e43sm74418205e9.2.2025.12.15.09.02.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:02:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] imagemagick: upgrade 7.1.2-8 -> 7.1.2-11
Date: Mon, 15 Dec 2025 18:02:11 +0100
Message-ID: <20251215170211.573880-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215170211.573880-1-skandigraun@gmail.com>
References: <20251215170211.573880-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122663

Contains fix for CVE-2025-65955

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-8.bb => imagemagick_7.1.2-11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-8.bb => imagemagick_7.1.2-11.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb
index b445ae8f62..ce474c96de 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-11.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "a3b13d143fd7dea44cd71d31aa02f411b597688f"
+SRCREV = "578d60d1bf77be54b16ef2673d507932885570dd"
 
 
 inherit autotools pkgconfig update-alternatives ptest

