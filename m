Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF3FC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.20317.1646606122127508364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZnFifUbU;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id z4so12045089pgh.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tcAwTG6i2HUhBoo6LTMpNIXOla4QxQzI1flfiDLTgE4=;
        b=ZnFifUbUv/M+yRZvat31aiVNb/clhwyhWKd9vQEAuc3EZT/9VGBkLUe+gPCKEIjIeF
         GaEJ7GyVghjZYOcBCq597GtZbqMIJ42kVj++skvw++ncUDGkV18DObun5RNxsOX25jIl
         Cn/u3EdDuSSMgEbrWqeTKytWTq4Bg2wEzm+0dnIN+iMWzmBU+wPY6gJN03/u97l36FZE
         1kVqU2eFwT2vSkZ77uN6NURj/xuiXEPsjeWb0QWO4bkLI2UkcNAytvZDvAjEpKm0AylJ
         ucUEz3Jkdvm+ULJqIMQ3VukCxQdEH4CkxscUVNyEmpMljTvsg5GLi2B/nUl8r76tJ/3l
         JxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tcAwTG6i2HUhBoo6LTMpNIXOla4QxQzI1flfiDLTgE4=;
        b=c68CxzzICTxSMnSDAzVzrw3lKMPhG/E+yzRpXrYQSg6v49lTamWXN8IW9vjnuF6x6n
         mlyIzDeMVl2EIJ7tM5DaLF0kZR59VBPLVxyfBe0sg+6apFxb6ejQqKENIE2sLRe/BPwf
         c7/0KIK/V8JBWP5V2Z9gnsqvW1//UlMxsHPV189DywmdZFpQ2v0s9bjcGSvjet6IXHkM
         UAvuKiFESib9M+HYO4CqAorKhj3PscTAEFpWa1B70+rUSYmJKDBnIBt96Xy2xr1efKHN
         /nVyIHGyEpT9VQMY8l3SK01tISGpGR1s05AWT9BWBMsXJGzZYB9/p2IHcL5Zy5UPoWlb
         mRNQ==
X-Gm-Message-State: AOAM531hNUmS8pB8Vr5XFluUNXixDIqTIBukc3JvTAWdEOjjTsvVPD09
	LCVV5imiuYIZmUukigDiRIOnRtPTa2H+KQ==
X-Google-Smtp-Source: 
 ABdhPJzX5s6LrvfhWtCq67LVNYd6fim3D/SlayBak6bTfggPSwPseHITrOw2kuhl3gzhkrUd8AlaIg==
X-Received: by 2002:a63:4543:0:b0:374:87b6:c9f5 with SMTP id
 u3-20020a634543000000b0037487b6c9f5mr7588721pgk.302.1646606121478;
        Sun, 06 Mar 2022 14:35:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 4/6] gedit: Fix REQUIRED_DISTRO_FEATURES to not
 overwrite x11
Date: Sun,  6 Mar 2022 14:35:14 -0800
Message-Id: <20220306223516.504947-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306223516.504947-1-raj.khem@gmail.com>
References: <20220306223516.504947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95825

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_41.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
index b8d686fa50..adba8ab2f9 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
@@ -21,12 +21,11 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRC_URI[archive.sha256sum] = "7a9b18b158808d1892989165f3706c4f1a282979079ab7458a79d3c24ad4deb5"
 
 # gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+# x11 is needed for tepl and gtksourceview4
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 GIR_MESON_OPTION = ""
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.35.1


