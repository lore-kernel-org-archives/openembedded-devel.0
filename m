Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F365C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69154.1782634361114672578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N5vpz1WX;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139a5f4ca15so2688091c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634360; x=1783239160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcVn4eisKj34A9NERXiAN3VQDtf0hu4gyLuRyHmKYAQ=;
        b=N5vpz1WX4fFg4QfKYLMhB04Nrudvm8AsZshu5aobhLqgtuS91764K0mVV9W6fXPHgs
         LSk+UAXOKViaKOaMIWB65Ul9bs+J/Y/xO7pwCrQCXFk1pvqdlAk3RZ/Xlv8+eBf+rta2
         33y3edZLCdbIHeqo2rqoYaXb+vlv9wNlActK/EgAlg2GPDokZDqxxPjPHmt8nLKz/0VF
         YBOPeqqBnxpzQV584Q7UscgRXbf6sChX0a4bym6y8/8oDblPFH/+Gekqme6hju0mn4UK
         M37vH3zjA7c7oobT5xmAaY7juxu7FOOE0S+252JiFrDdQYPH/vElY+kxevjop47b1FKa
         doSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634360; x=1783239160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pcVn4eisKj34A9NERXiAN3VQDtf0hu4gyLuRyHmKYAQ=;
        b=SsPw6EYjD+XLJ66XysenEx0q6OURXCrlGkyaTNFMrzhi36gkZ3nLiCqbdqc4BmtZFW
         Fo4xuHmcsWfH1zsotqv0IB9iEDciR/xvOBh0VvM4JC6VnAv5zzXKKTDnSntT99QkKIUv
         c2uDvARrf5ooHzZgajkqU606Yy8bildu4z1cksr2DbHEPeEc/GYM4bhcoVH5jjm0y8Et
         SGlHQnbXMTmUveZpU9Niu5glF+1vnRwLr6uqty20upDdAh5XkkK7y2xD2BeU/MKQSVqe
         V3r6Ox8Rs5BEBxOEHAoYY9W5NBKa+w+5a8o5XrGZu9tkbJ41f6AWlyldzYxew4gn7UJC
         CUYg==
X-Gm-Message-State: AOJu0YwmfK6i3ZUv6d0P9jz69Z+FzQt/UUNZX7pHyy31j0dRuL705LDU
	bHqDgFzXTtVGv4VPk1RaFa91ita35uVBN0Khtt+dIomfSE+AOolZZ9Pr3RSMaWyQlF/uHQ==
X-Gm-Gg: AfdE7cmgZKcu2FEwdCvs6TZzpElWpN3nqBviLux74AkLxrfP9BqkSndqQ1Tqmf56ItG
	6bdfGxmjHQ39gyaY0N4mI37E5kZeyTjKQ35XHDiXwJfD37GY6d7HwZ9IgnnEgyNkigKOubdGSWw
	OwH5nUg2bgkzjTR/UYmLwqxm+M8rwIgVX8gq3f9mqF1yFSJ1P54pLehJQca/3aZ14xp657c0ola
	QPzhec8KPeVgvifj2Y7RgoUZgvfSbULZ4SvSIoWZyrNzmkSlrA2TKHB31VWWt5gry7VOY/tzLSI
	IZWoJk3wnD6oaDE5O6lvdZGQnna666BSgFYmdsOgf933B7UDvgD9KE2aOCWyXhVDGnuIdcMFb0f
	WotlRaX1nB9ul/g1r5nmc8/dPBF38iBPXsLa5ZiGtwoHPADBbmF46c74unBNnMzsPeMn9wlJZpQ
	GyMda4sImQVaKCfIzaurLpvMujExokGegRoIykOnCKNup5zrzt/u/hOd25e06F/VqU3LVYrtjiw
	6XVqRJT66Uu2mj02CRCfpe9CZBYr+nM1BDA8lVZSkESeCDPP6DJXea7F+0jH9NE1bOY83LwwJtf
	jmpXCsFOMIyZmsCewVFhjo4BaBfrDw==
X-Received: by 2002:a05:7301:6a05:b0:30c:5254:788b with SMTP id 5a478bee46e88-30c84db2886mr12157924eec.10.1782634360452;
        Sun, 28 Jun 2026 01:12:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 082/128] telepathy-glib: upgrade 0.24.1 -> 0.24.2
Date: Sun, 28 Jun 2026 01:10:33 -0700
Message-ID: <20260628081122.178348-82-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127892

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{telepathy-glib_0.24.1.bb => telepathy-glib_0.24.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/telepathy/{telepathy-glib_0.24.1.bb => telepathy-glib_0.24.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
rename to meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
index 56af002d0b..0c88cbe65f 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.2.bb
@@ -5,7 +5,7 @@ DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt
 LICENSE = "LGPL-2.1-or-later"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7f7d5eb"
+SRC_URI[sha256sum] = "b0a374d771cdd081125f38c3abd079657642301c71a543d555e2bf21919273f0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 

