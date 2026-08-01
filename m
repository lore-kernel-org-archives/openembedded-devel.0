Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29775C55179
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:10 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5280.1785589926378802143
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BQTXyLHF;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a2dcede83so2795872b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589926; x=1786194726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFZxYwsSGheIir/rlz27vTtOCQ/1JtKSrvvjkonesVI=;
        b=BQTXyLHF8ELZq8vI5dJP53ufXytOKDZLqswqHM3FcjgsbcHJ1CPmVXhte3QS5QIsiR
         P3S8SsTNS5qOiBW1C01n7u6+6d3ASYlhJGMUodQnJWiZ286zU2jHYY5lt8qsYVO+GOHh
         7VZ63ljNydhJ/qTiR+RlMRifDXSxOZkFSN+V+PJ7JNcMCZw8ckWaa+HdV/sr6bVe06Bd
         6yx1BSfUx3bPkg/fhdwhcUcv7NlAyA/vY2da6mP4EbXxFsB1pa/MJ/E8EQdlI0KM2k9O
         4Np9LPdAVgjLKDvDh2uqWKz99l+TuMp9CR+FIx/Fd9snHTrU4udRX6luVyrPUvc7+Jo5
         DmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589926; x=1786194726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFZxYwsSGheIir/rlz27vTtOCQ/1JtKSrvvjkonesVI=;
        b=ELY9DdoP1hTJ2WVpaksDnc7aNiIq87WssLNjJ7wD+NCMgnQhZ7rj5KO9zrHl4khmqA
         90xEuseSLz5bTOa+sa3emK+gEaZF+yqTEn8k4riKosB3DWQqa2l2j8NlvHYp8rH45JiX
         pLKs395SV+8yW3mX8B8Ae5SkH38t03U7M8HBLTAUzbgdCm/6Qxa/SIPif8YaenoC9vCd
         ocNOs9GWFK7wGyh3GKi9ls+UMpQxWR76Wera6M1/abBe8hdIDisbVNos9LmeS+eKy1UV
         4fV0+Ca0nzhJusbONMTmYwhpBz8zEydb7LAGQJvzSC6FXtGcluy36/S+ymtXvl2byan4
         ACtg==
X-Gm-Message-State: AOJu0Yw1NCX9b4/g+X88/6zQqcTYnvZ84rGyC5s9IYGNtmgIicgBGIVH
	ptfGZfMdQSdCuvPysJnGgM1oADsAY8TVvJQ6wkU1d5t85OOeLcKbbYKHamEqYs/z
X-Gm-Gg: AR+sD12so6g0MkR4FMoviKQWek2Dc37nw7h12bM6H5FoDuz+xGG1P2DvAPqoD2SJOzX
	D1xEFnpd+qTu8DctnJTIPNivNy4qiK00POpxjyTDCdhz4UW+ZrnbDu8x4OQmGkOLu8OkJvVCd/t
	bWJNCgW9YjnhIkZVAmeEpDCLTRb63rZ6XqKRCUU5f6ImLUjteN2grIU+cptsmKaZhzrRYX/4MF+
	uKp2twNbdQFGL69+1x00MHJyiDsUuxKG3OAVaRv+ZCjcdCZmQ23+KUxyZdbb4lQZ5tIeuc7lfpI
	Ssh/K4COmOcjBDyL4SZ6AWhP1/aP8w+TMECCm6uZyk06GrsY4MIFiU2CEiwYoZBFfFCWdYOIBzM
	qW70f2gb16HqhJ3gouK2EQxhsCBbxnX639QrJJtcDhcQ8PoKCM5RFzITpvlUs9bcm2+rmqlJFrZ
	nKYSRI73VQxDx57gALI1bu+O2dz9c5rf8sEBquzH3h/FArVir7+IXUoXLG7TPfYZKDeHbpdmoQu
	A==
X-Received: by 2002:a05:6a00:418d:b0:848:2f77:e2dc with SMTP id d2e1a72fcca58-84ee49aa19bmr3002819b3a.69.1785589925616;
        Sat, 01 Aug 2026 06:12:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 7/20] zenity: upgrade 4.1.99 -> 4.2.2
Date: Sun,  2 Aug 2026 01:11:25 +1200
Message-ID: <20260801131138.3299410-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128601

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/zenity/-/blob/4.2.2/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/zenity/{zenity_4.1.99.bb => zenity_4.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_4.1.99.bb => zenity_4.2.2.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.2.2.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.2.2.bb
index 350c66b626..573c36ae05 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.1.99.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.2.2.bb
@@ -18,7 +18,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "6fe2aa313c71e91ffa55b11dbec7904f31a40303e0a3f6016820ff6dee329ee2"
+SRC_URI[archive.sha256sum] = "019186a996096ef4fc356e21577b5673f5baa3a29ac8e3d608b753371c18018d"
 
 PACKAGECONFIG ?= "webkitgtk"
 PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"

