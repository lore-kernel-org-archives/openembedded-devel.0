Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5978AD3610D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.27776.1730831948510750469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZXJ6w+z8;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea85f7f445so30731347b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831947; x=1731436747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbS1Hz6+IwIpv9Fmh3pPea1EyXzdRnTbq8spDlfZPYg=;
        b=ZXJ6w+z82MRArMqVCbYxCNaNlZm8YtYwDQlBcnxkw3TFrWudEqdeS72f90PbFoVGRe
         kSF2funNoBdchPj93B43xx0aiSFNU8pwM1CPdp+NAd4yUJ3CB5TrO9XzwObfmirs1KhG
         QSXYdo9NCF9RJY5NGO7Lww3aYssf0tdSYA1iTMiO+GNnljDtptBcra7+l5br1xfTJUT9
         C6YmAQKip4AqfT7amLI1I4tzeIfNXJf63OQ/ZWnOvIzbWM1NtYOZcCfyCXcYhvxih4YK
         UNDao8ac+dlJwpc+ZcA2lkNT+9qVm2N5qS6zHzwhqZE5pz5sZllig5vWF8/UtUJbrLdg
         /cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831947; x=1731436747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbS1Hz6+IwIpv9Fmh3pPea1EyXzdRnTbq8spDlfZPYg=;
        b=keOnY/JpSfmB33xUxeqgTW87Krd/rw4oMnd/DNJ24u0a7ZFs0Azga8xgxwstogl5hp
         VMrsM3zSTvru4aZg6437wmsew61V2Oi/PYz/GLahODPTiKBo2DpHSIlELWpAb1Bf2TH7
         YeGRtvtncLwER28CLqu73uLhigVayjAbM47/72LUnwfUNw3aJ+Zzdv55qBmX08NEedVd
         qrUcwhtUQjoWGYMjSiwpKoI9tLt4+t555keoVT0tfgcG9L+p8ET5TL1JDp7GMmwIAOq9
         lokgOlgYuwoTe+E69YXkR994Y3ELOYWSmFefbFftV1RkNcGts2jpjpS5vg8wtOHm7w7i
         X8vw==
X-Gm-Message-State: AOJu0YzXlEOA/iTLTNMLVA5gfEcvNVGjod0K8bJhAyRvqICTkf1avcEZ
	6g6Ke0stHvbEjGNk71Jf/RC1TAgcVCwlrU0aUlVk90YtWyahi3o43kADEx+R
X-Google-Smtp-Source: AGHT+IEHV17guRWhl3KCd87iWw+kugW8/AgbyCinSM8Z998UPl+tp28ToQ8i5Sr4jgbsArb/XHlWPw==
X-Received: by 2002:a81:b554:0:b0:6dd:d0fa:15a8 with SMTP id 00721157ae682-6ea52520ba4mr152052457b3.35.1730831947071;
        Tue, 05 Nov 2024 10:39:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:06 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 084/161] ttf-liberation-sans-narrow: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:00 -0500
Message-ID: <20241105183658.34982-86-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113599

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb               | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index a0fb7b6a7..ab7308e73 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -13,7 +13,6 @@ SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${P
            file://30-0-liberation-sans-narrow.conf \
 "
 
-SRC_URI[md5sum] = "134d8262145fc793c6af494dcace3e71"
 SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
-- 
2.43.0


