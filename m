Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A06D6ACFE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:34:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40855.1766061290427786922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtR+gsWh;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477aa218f20so3843195e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 04:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061289; x=1766666089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwyVbQnKug55TyHdc6er2BQq6lkC+kvsSGNY1Mh4Hhc=;
        b=XtR+gsWh6McXbVXNjEhyIQgFeRA7vMi7hAge0RyP49snVytnU0UwtNHRdHWNl8TRS3
         uVVGBkeefRVfy6IZzDGhbYTkR+w7jjXSKO/Hw8MK1iF+xvwZK9Qo9MgFbiP0D3c6kTmO
         JbdfureZjh76pYy0qGLbLTk/knyO70jkaJO29V7hZ0g5Cy6gvqANdZ/GBg5vYxmX7cx8
         rwEqMsudPtslefU0JOSOF8Wbd5/NRHko8lAGA93n/i7z5RaKietF8Wzte8LvELVl73Zr
         dhuJYO0FCvGWVfmPHtNaQkeTF9BOzXrkBrOCuo2N+hzRU6q6ovBaNfemjT75+CS09S/N
         ObhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061289; x=1766666089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EwyVbQnKug55TyHdc6er2BQq6lkC+kvsSGNY1Mh4Hhc=;
        b=j1nkvP5dLWECRH/WjvJeySNU9tgbbujuWa65+PrQVBYPZB4am5nU4zRLLC8gArHB9c
         596pZsS/eqpTKi42uCPxNG2XJIvOBnmCS4hP+GuRHI6JOgqfNM9OOh/lMhxYIj/Fjd7R
         G3dc6b6s80xKVqp13VSYPYV+j37OifPUoTT+LNFj9kSV7faJmWBZbD4e33+UvO17oypb
         7zRERoDApcDTcUFRNNEWde28wXMV8qgVYSD459vfE8ERl6xc/1jx3iDvbvpZQf+6gQfV
         AhpNkMAj2v4hRZlxMVjbHqygfHq8dZ+EkXJvpN/1HAQXOjWGBE5WqY0XCUEXIW6XiX/Z
         gz3A==
X-Gm-Message-State: AOJu0YwwBKuJ8TO1u3Wo0ORO5wep6UKr6zzuwPvJ4oGSUNTk0Mtpybs2
	9T480/xVPXGhJfeAL/uaM1C6Ew0Y+30LssxtvgJRLEV/I4N3c3YnkeMk3xgaew==
X-Gm-Gg: AY/fxX4Pj6+cPaevZ/UAVjmSjU40sVSDJdO59VPIEY1lj2v2WRLNWFf3KxU9wMuDM92
	/ZAm+1/rcwDv5R7DXtm8dishCqACYo9mSW/X6rfFWzCYmM/507gqqMwn+rnyAklH+IP64c9N2kJ
	wuQIO3iusyNnF8N+oMWvcLV15NAymM/yfQIVMDaMDWxrZ+cTlZKbQ5PkLypxF9703pWtMH6C9S+
	ATVvHsdwEWnmNQ6EOE4oH2QtnD7GMhOFTABqc5mraFB03HCZEbQ/ZGXFknlWU5Gg4XPsx/GgyYI
	FriFBDmDMSL9pBpm/4KpooJoUe+AqXnAK3MtfEwj8lSRMkpUtW+fzZLgxOIOLTzTRPQXaQPp1t2
	F8n26282hIaE6IMYEfMn6lSwpK3xTxYP/VkKpZF6wZWk+PHvdBUktja2WLxmCGp7g09n266n5Pi
	v6KbYdKjeR
X-Google-Smtp-Source: AGHT+IFnc+dWFdCcPqY9QUrx7TTuiL+qQo3zrwfW9++GGXVu6LKHnb3oy8R/whxqoRutAvHbd1e6iw==
X-Received: by 2002:a05:600d:8447:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-47a900bd698mr178855345e9.28.1766061288753;
        Thu, 18 Dec 2025 04:34:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a3ec73sm12679035e9.5.2025.12.18.04.34.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:34:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH 3/4] tumbler: upgrade 4.16.0 -> 4.16.1
Date: Thu, 18 Dec 2025 13:34:45 +0100
Message-ID: <20251218123446.3489941-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218123446.3489941-1-skandigraun@gmail.com>
References: <20251218123446.3489941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 12:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122762

Changelog:
- gst-thumbnailer: Add mime type check
- desktop-thumbnailer: Guard against null path
- Fix typo in gthread version

https://gitlab.xfce.org/xfce/tumbler/-/blob/tumbler-4.16.1/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tumbler/{tumbler_4.16.0.bb => tumbler_4.16.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.16.1.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.1.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.16.1.bb
index 6a583ade73..37f048de9b 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc
 
-SRC_URI[sha256sum] = "9b0b7fed0c64041733d490b1b307297984629d0dd85369749617a8766850af66"
+SRC_URI[sha256sum] = "852bbffa13f35b48ce92e243a03a118e32037c03e68297335c2bc4578e39273e"
 
 INSANE_SKIP:${PN} = "dev-so"
 

