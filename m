Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7425.1586164844237711912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PVUa740m;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id j19so14992809wmi.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IoEyxEcUfPG7MPw4Nfq/G9+3MGnvjk9a/Z9OpJ77F2U=;
        b=PVUa740mdRePSxxJghVSau7Qg7S6bBskweyc2c+Bd8F96XWaTklQshW9cOKSzjn57a
         gInMtb3Mu2+UEv4Key7rWEObTho/bUmAStYmS7svNeKgKcKpnrEcIVKxPSDwZzJToxmW
         4fVC8qlXu2ssV4JFHXb1n/KaX0qzPVxuiRJ1E/0LKvClMqh9ey0THWSoNeMArW5j8wYE
         c8/F0VAD0KcleQIdffzTNsKSNf+bx/gBd1pS2Vj64bh77E2abzXnQSFpjCob6nfls77c
         sJHWGY9PmJGPkRvG2+CM74gKSA2GSg1S2AEcP5iXN4m/FZrQneHxiHkZfFuItMWBceO/
         VSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IoEyxEcUfPG7MPw4Nfq/G9+3MGnvjk9a/Z9OpJ77F2U=;
        b=pv/jonKE++Dj3EVpVluMhXzsrF2Q1jNtgRGLOTZiaOdTndxcySg+EcWyWC6QMw/bjh
         NzN/YIEefqPXtNDAlYwDKsbQkb60AkGlg+SQu96zoBKyNUfZyg59gsz4Gsk7KbFRCoE3
         lGrCndn3klIPLfPFBL8e12M04uhuj91v/frI79owsE8WOK5sm+qrxCUzdlrCuoNCZona
         ry+9DzTuNzW2ok8j0pxQFPc5hA6kscaz1G1K0aw+fY8MM7BTZLBOobEg9HqVvuziAlov
         +ZeoeOGLwAFEHnbBQEzAHqngVLRzTt6JGHS7Ph9vYrODBs/6oSfTzSlNJDkSp8Ol1eGh
         BxYg==
X-Gm-Message-State: AGi0PuY2DJqsj63zL+v6LGTxhjZjSzY6aauh1x2IQr50VK9eLCKs8NMk
	ncVMRpnmPfUBS8sOJnISoumRfsOx4S0=
X-Google-Smtp-Source: APiQypK9MekrkzylrigqzrcRoIIlN30A+8Png4NfQOR3ec7EbXl3qK4ES7kysfHjOP9daqDTWT14nw==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr21496897wmz.21.1586164842595;
        Mon, 06 Apr 2020 02:20:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:42 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/14] gnome-desktop3: upgrade 3.34.4 -> 3.34.5
Date: Mon,  6 Apr 2020 11:20:19 +0200
Message-Id: <20200406092032.3574-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.34.5
==============

- Translation updates: Dutch, Hebrew

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-desktop3_3.34.4.bb => gnome-desktop3_3.34.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.34.4.bb => gnome-desktop3_3.34.5.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb
index f9b053837..63a96c8ee 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.5.bb
@@ -14,8 +14,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "d682a05eb98bb2dd434042b6ac4f99d5"
-SRC_URI[archive.sha256sum] = "c53e72737cc21535f2fd4b72bc2fb5594741cfc3d3ce90949bc5cc07bade0cbc"
+SRC_URI[archive.md5sum] = "1cbcb9d9a5159447b9a45079c6157ca5"
+SRC_URI[archive.sha256sum] = "ef13203bed721d271227d9928d91937733c312ef79b6f5c00b6c02e8e0b2fa21"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.1

