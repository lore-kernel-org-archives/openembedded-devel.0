Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB51AC77B7F
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:40:42 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.5067.1750502437255427943
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUzDk6lY;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e78e04e48so20919977b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750502436; x=1751107236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAlSC6kIfSZ/1oGYtlsnyXiFswQZbjHohp69mUKDzwA=;
        b=QUzDk6lYLgpKxr08UUZ3jfq5T5ysf3Sf9kCwosjtkev4PurmjVQLSMtKYMQW3sZWX2
         bhuvP+wlZJN9DY6H7ebe2P55lHqtNPrbJsC8pRkSO2zDQdQcwR3GIg18+xJ0A6/mc2MJ
         Tvj0AhxYtU8fqeU112oN9yReAlWQaQWMORqirIBXccfmHwGqE8RBmC5lrgrbpLT+UksX
         VQLbse7LP3dz5DcBbqTHOrSKBXdwkedUTmz4Q17yq5Yotv1F+WPSy6JvZWWYqsVPmWl8
         JHrT6Zp4vtCKR/dI4khBmWCa2vRIttats33/0lPfJxRPNlqwvk4GKwxn33gP7MAD1PpP
         wnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750502436; x=1751107236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAlSC6kIfSZ/1oGYtlsnyXiFswQZbjHohp69mUKDzwA=;
        b=Ts3dIBey/GPcylX7YPgAyEbQvcBVPFfkT3c4/4QIodmjGfNkyMEzcv6IbvSL0asFXk
         8bt/XXAe55jqcqRs81LAqpZEDmWjFCbc9bpqF6r7c4Hqj4/COmZ74zBriktH+NqpXDPa
         4O+uxqIr2X4LtlJvaOCskeTjtobuYklh1x4wF1Zhh34r96qNuPpWb+6Rtv6C2u25mgCW
         B/XgaOhVuNT6HrRl+WM5J3Q4352vlMJnTznCZ8vWt2OBQuIW+IBt5Zn9mYgPzCZvHcDx
         hmWPS1nOgKBQw6jza1WW24r6seyFHSt+u+2EexfFsQMF3MVxoqtAyLoyGKdXasdJHUm8
         sFSw==
X-Gm-Message-State: AOJu0Yy9LwhoAQH3vzhSwDpJzR6nGc4ugyCzNynF3RTiNk5JgJuRRO8z
	jMQc4GC9GNk40Olpy7pLM1WJSUgtyDTdCYGDLmdNDrYcNX33PoG/cyUq8SjzEPFL
X-Gm-Gg: ASbGncu24sDo1g/PBwkSragn+HIFE67CcSdwZQ8TWqbOFxGeDADbV3C4vT+8lPIm7ke
	sbbAeR0W3UssbFUsYyMNAM7rZ++I1emXSShfLv2lxwR2mvSBJ7WRJYliGw9+Fbv8NYsNPx2wOZs
	FJI2agF7exNYi7CCHaGtMZeKMo779FVd6liRX2i5CL48rgoATWlzgNeBQjt+ZoWz2H0CQLapKDS
	zDm0oUy7sa/U+2BC227/FFd3bglsES0MSC+pX8rNLy6XAYlFVPn7zMyC+JHl9DbSx66kQgvQ29d
	07hQkESC6NRtVz3f8PwSgK6jXO9pDXBfkidzlYNlmSjqtVMOSBe8YrpukP8DYcbY1FGlbHCb9rR
	GrCkwaf0KhUTM2Zj8cpOfzY8Pm4BVD5Y=
X-Google-Smtp-Source: AGHT+IFLPrTVkL/3QywaJBPLIBt48z1+OfFrrnuaGLWXWOsQMfDPxeVBZCBH4+M7273r+BGcpUWYug==
X-Received: by 2002:a05:690c:3707:b0:6fd:318b:9acf with SMTP id 00721157ae682-712c6777319mr83931117b3.38.1750502435901;
        Sat, 21 Jun 2025 03:40:35 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4be2c76sm7792147b3.102.2025.06.21.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:40:35 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/5] thunar: upgrade 4.20.0 -> 4.20.3
Date: Sat, 21 Jun 2025 06:40:08 -0400
Message-ID: <20250621104010.766706-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621104010.766706-1-schonm@gmail.com>
References: <20250621104010.766706-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118000

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.3

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.2

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.20.0.bb => thunar_4.20.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.0.bb => thunar_4.20.3.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb
index 43125c1e2b..c5a800bb02 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "File manager for the Xfce Desktop Environment"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/start"
 SECTION = "x11"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
@@ -10,7 +11,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "27731a76f3aecf3752b1ca35afad89e264c52244f70083d933507dd4a17548b0"
+SRC_URI[sha256sum] = "fe1908b396298e6515a90fa9ddaec0db8b684e4b3d7773118e21561baf8f9639"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-- 
2.43.0


