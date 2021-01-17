Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.21178.1610905031329966575
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVVuOy45;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id i5so9496025pgo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yKABuh2oZ9obq+Q38v0sDFT+retKkYypfkVw12bOVIs=;
        b=VVVuOy45mvvLCeTWCGKbib2TGOvM40KaxwwgC6aZ3fHR61mSykMKEFsrlQlXzCmSTi
         qDJ8Bym+Us2x3+bfgWHdIfibbr9xStjGfdVEtqq4VznGSIjSYYGd+oPRDypZeqnEWxSx
         izc9mP0bVll7/C1cTf0Lu5eCkLdWzWLZ9OebbEjeB/oLc+x28uopf3GtWXS3tNIopIO0
         b1F0KBKkWHLq3D46CKDChUPTL6xghi47Q8wmOdPX6Y2FLJMtrQjZmjMlSXvhStVny4zD
         n2V9pq0zatUEqvEJHOhPk/L8ub+0a+lcJoYB3FhmVaIKMzEMXWTYyjRFfd0VAZXKbLiU
         hMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yKABuh2oZ9obq+Q38v0sDFT+retKkYypfkVw12bOVIs=;
        b=DPVggQBiRE2MnK/m1FPBYbUjz0wslzxACq8+uGKhM5tOFZImgx8XAE2Ss05U76eWHj
         t1eHW5Qouh6hFts8jz2dpfiG1S6ELsg1MDO+fp1POlyZTmhR293itkWpZPmkZgUOUxpc
         5v2+t78EzMVXxKvnPxTYwtjxMqsordMaIHR1ZdtztBlsFxwuVeujybGTyheTJa2UMfMz
         NuDrxVbMeaZBcBrJo+dD81yLlJBggPecm/x1FRRq0uyJoKl8XsmFvvU9UP1xbBCt5NSH
         /eHGQB3PUzw6X/5VDYKQ+zT8oMXIERTcVehY7KpC7VaSyF/7b3VB6StrhbOQt9V8FKDf
         HSRA==
X-Gm-Message-State: AOAM531zDmaH+67HFGz0u53QdGQbg5VxQY1ItkY4KpOhOU1udGF6y2s+
	o8EzUXnqE6U7uRFZZST1LljqDUuhQR5wWg==
X-Google-Smtp-Source: ABdhPJyTGIpcCrLRIa/wnJdnaex3h2W2/vg1axF599TJdIUXn2TfZ65Die7oiSHJmoZdmkkCxb0gyQ==
X-Received: by 2002:a63:4d41:: with SMTP id n1mr22401063pgl.147.1610905030756;
        Sun, 17 Jan 2021 09:37:10 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:10 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 29/31] gssdp: Upgrade to 1.2.2 -> 1.2.3
Date: Sun, 17 Jan 2021 09:36:34 -0800
Message-Id: <e788d4673888f15c302842fb1ce0284aafa6e3d7.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Diego Santa Cruz <diego.santacruz@spinetix.com>

Dependency of gupnp 1.2.3

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
index ddaddd2094..7d82c3e2e6 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "glib-2.0 libsoup-2.4"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f00a470ebcba96f34def8f83ac5891ed"
-SRC_URI[sha256sum] = "cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4"
+SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
+SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.17.1

