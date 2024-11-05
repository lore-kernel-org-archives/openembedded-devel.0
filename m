Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C54D2B959
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.19501.1730817403926718156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlRtx6y2;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5594102276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817403; x=1731422203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXlIDqjoBwKs8RnctxP9VD8oiKSH8SfEjwCDpzt1GtI=;
        b=KlRtx6y2yPSB8aKQnPncpuEzAt36XsWzHcUzqnOTS8PCBoJ05O7YuSV7YKWX2is5VW
         xPQdv/1dNskflteOZ/2UycL2TGkW9a9Jd9wrWZEji9hxSl3ZrLSjgNM3SkoArvs2tbEu
         H/aiKNweZ59p08nN0nu5GiRpaABf5PKCK0tnFrP5Nk624RvrbmwZtjFwnGo97LX4Aw9a
         bpbnaYKoQ8IkE3trLd/FyEDf0ofwPu/YNG4IcvYKmIO+xcYszlFskMhDevsrakX58o7+
         MYPqouVF2TNLJkZ0J03AFJyqPfw8YmVU+4LxdqoxMbKKYl9Y0eI4WYyp5+gpQgOeElBz
         tK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817403; x=1731422203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXlIDqjoBwKs8RnctxP9VD8oiKSH8SfEjwCDpzt1GtI=;
        b=bB5JeNWekb1decaFf3ef5ugxaycKn1rZUop1prvUCnK80yOB0ZcyECO0oFP49ygX4G
         BP0gesQ0+dWP3AIhto2fFrSl+T5IPTG8199Jibk6rRj/9a9zFDObCno/fXtkU05Ioegk
         XwMiZQQeEB+2ZkmO9+CAPOq0/JBecSNx13KELBdqXMxbTBC69ncF6rCEQrjYVF159h2u
         WLIsG3ZIoAW9s/61pJbpvMXs8cgFDZtrnhyAz0Vxz22LHzcLsu6LSj7io5npZYrL2Y3x
         VfcugJQpTGHa4f7wsxW//adAfBl/hIEbXZXGHFIb+1aXU5XASgomvgAzoV9EwIAllp3b
         893Q==
X-Gm-Message-State: AOJu0Ywo77pc5Y5HoJsniNQ2TfyvQMlH5ZmscTRESALIagRtqxcIWnNk
	l2/1ffXAzOSyWlIMpHM/WTixLVNI0EbNtATsKLpPfbPd1jEr3jt9Px+0Jw==
X-Google-Smtp-Source: AGHT+IGNntR9U688XSEzeVfuUmT3AbqwXD9AviGAPVRjfO4/hCDWzKhxXZN0Y13RHR73brsVnA1iwQ==
X-Received: by 2002:a05:690c:c83:b0:6ea:3313:fa1b with SMTP id 00721157ae682-6ea64c1cd41mr146414807b3.46.1730817402932;
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 08/90] python3-elementpath: upgrade 4.4.0 -> 4.5.0
Date: Tue,  5 Nov 2024 09:34:33 -0500
Message-ID: <20241105143638.2301245-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113426

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix and clean node trees iteration methods
- Fix missing raw string for '[^rn]'
- Full and more specific type annotations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ython3-elementpath_4.4.0.bb => python3-elementpath_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.4.0.bb => python3-elementpath_4.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
index e095cb8a32..937d968607 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "dfc4b8ca3d87966dcb0df40b5b6d04a98f053683271930fad9e7fa000924dfb2"
+SRC_URI[sha256sum] = "affdc8de95af1a4c10d1d2ed79c6fa56b59c26c7fce64b73497569e9dea46998"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.43.0


