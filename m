Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.939.1602637597256049063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IWpIwHAM;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id l16so1400672eds.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8QXehzjC/Jk7uhRJH/bMinjudLLUn7qiBSf/GLeIiAM=;
        b=IWpIwHAMfq34sDVu4Cx+pSwwBHw3DmaTykiJ13POeCy/n91p6dMvLlsKXQoBVz+J7/
         0RmmSyM+Ye764mU/NoiGOjgJyOpzs3E9Ryz38Ck54N79B6jrIORBFY3gC9zdQdEEQdCq
         qCIXucay2yQJw/L83pSci2mY3cLn5bIHXfKH9cQfN/icuOI4q3J27DTtmU/PJLF4N7Pi
         ctIfId+zWpS8nbDuHlY/LYAbeq3hpeU8oo/p0dkf/1rPyIKbLn4sdNCkB+/9DvW5yNr5
         DVUwhpTU3zCIgnFTDFzF1OGTNueaLrfc5R+EFIWaW7tDbmxY0s7rdtATSj/Q2J74EGwH
         O+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8QXehzjC/Jk7uhRJH/bMinjudLLUn7qiBSf/GLeIiAM=;
        b=WpGh5TnrTo1nZl4bAaCaAsdaiwKos5vpTFT16P9UhohuYySQt2neMhZmhpevuXVOni
         YcJOltG9zvvvdTjGk9zUAlEbFL/iS3c/Sy5BOXvF5bJe9i4hGk2IrUdlo8/2B0+nT+ft
         42Hyo+I77JA1kH0wI1kdnSUPQE6nuLhjGeQACmvIX+ZYVzuWPeOxGY/Ed9yI+h/JDQ8p
         BgpHk/Mk6WxhrLORw+vo1aD4KqmDDKOkFCOC8dWRvT8BvxfKw2CiOTdPud/iGHz/Onz6
         K1E2j85eLCu1d9+TDY+dwoF3MnYD9pkqcIyHj9mgJcbZp4F9j10wjFrcPyUUsGdox8Wk
         m0kQ==
X-Gm-Message-State: AOAM531mqwRyYAyCwTRCeXhhuRq7qwN9EJPsjxDUXRFHzZgaGu/t/tO/
	m7gDQFLB94CRyBqaqMEX2s3uQQgEbWU=
X-Google-Smtp-Source: ABdhPJxeWnKAUREjK/xJkYKbwrHcowfbPr87wWiMekP30u+HnkCSwiIFt/X/izqXN/ZKuR8yJOxJwA==
X-Received: by 2002:a05:6402:21fd:: with SMTP id ce29mr2463635edb.383.1602637595511;
        Tue, 13 Oct 2020 18:06:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:34 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/8] babl: upgrade 0.1.78 -> 0.1.82
Date: Wed, 14 Oct 2020 03:06:15 +0200
Message-Id: <20201014010617.1086948-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/babl/{babl_0.1.78.bb => babl_0.1.82.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.78.bb => babl_0.1.82.bb} (80%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.78.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.82.bb
similarity index 80%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.78.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.82.bb
index 173d5aa74..244b867fa 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.78.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.82.bb
@@ -15,7 +15,6 @@ CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[md5sum] = "b1a85d1f3d710407164848708f1f49f1"
-SRC_URI[sha256sum] = "17d5493633bff5585d9f375bc4df5925157cd1c70ccd7c22a635be75c172523a"
+SRC_URI[sha256sum] = "c62d93d4ad6774cb8e3231bbbc7f2e61e551e7242d78640d757505ee1a9fadc5"
 
 BBCLASSEXTEND = "native"
-- 
2.26.2

