Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11791.1795762948961766916
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uGd6dHtn;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b546061d58so18010283c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762948; x=1796367748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6BahZRwhxPF27xB1xTvkqPslHFZVhHmg+eEqLH4CNT4=;
        b=uGd6dHtnkaMGaq2XESqqHTYMrtS4Y5Y3t5GphMIx4Ypw+A2yIFzFPzGJH6IETpAOL0
         +naLmRnrCEBRX5XbAY8XGjPVWtVgfz/2TiRBBRT4lKZadftByF0jh4lQ6NHgCLmw2dZJ
         7JRFMUjT/0Mv5d+E4uFdrtJtIW4EfdJZ9fRL35XMDgbkSl3PWHvUDNqyIS0Arlhl4Awt
         tHn6Rmiupa6GwySu5ceB9qV1GXbAbzbEISPCu1JbiKCYonn9DRlF8Q7TbW0XZN+yUMuk
         DuTKbVAXyU9p8KJN3M9K6LQvsrzUbjXXgUBR5KZ2KD3m88iS2YvQmHXK/MjT5BL3oimB
         kcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762948; x=1796367748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6BahZRwhxPF27xB1xTvkqPslHFZVhHmg+eEqLH4CNT4=;
        b=PKgwehlB2IdxudtxzALKNdYqoorDzxhjVqgAIIevuo4sBey8Yng3ZGklI3BItIZ/Dp
         qrcY8hseaS+/sWHfOil1+KfkgSq4aG3NJF2y+QDT3airGhAB4u0EMQmsXkn7PO3d7K91
         P5ROBRVkSTZo+SZIhAfEh8yn0hu8rXESUlUFF5zdyVLgnL9t0zfIaHHig1y9a+qNTmjy
         wF8lAe2zQ43zNAPwj7bQoJxmzCvZ5YbHLFoH6//D8XPjq+bS0P/0nWVnUuMB1/PJ0otF
         0mowFChA6Ahpe9XydCbY82rq9zZ7pgm82mcfsD61Kein/xlKxE5egyqw1OXys+qwgyaF
         GZMA==
X-Gm-Message-State: APuU4Z8YWRYH9WwY4K1HZVY6XicGQSEO0gqDnhwJxzaXj9ndtoPzTR2S
	khcVgjBIKRqrrB9jLB9ecHvA5OmQzFtNTA+ziWKW2Jlrz6uOvZhFRaThlX+fM4PD
X-Gm-Gg: AZFdTZdfCltL02li1BbMR1xTnmUF1TM2jLnu5MGLAl5p9tsxFGi3aCsyeky2ojq8w/Z
	XMVDoYPqLtyzQ4zKHrL2l6AsUZHiD8jVJprmt4+BfwLFzTdr9qshUSHrv8Cm0fU8ApdL3MNO1Oo
	MQCMQ4HRuNFqT9IpaocuTU0vp2Snbhdr+1Y5DNe95xKuwP7Dh3oGkjarGto5GHZr6T6M8ZO8oWe
	WqHEcFO3FQtYTBq9o7U8cFW39srMmvGBI+T1gK41Cph/WXUhfWQLLhOQyuNBfYBd/YtojpPo0Uy
	WnoZ23adnETDwx+NnnHbhz/Elka2JPLU14kAUJd41yneKcBAC+ZiuLcH078+2UO012x7T8ankVq
	vZZwI7OPbuFyqqQCx+xF2KyX+vweHhqBSgqDGAhiLj0UAj1jLAXmQAUhXArA/4jHD4S/yG/flT/
	2xbdLMOFUr5LEsp2gQOas9zLIDNU9FPkktBdbEaBy8XY29jjRdukCjlgi2309Twsci7DNc98EME
	nTo9xYCWrcH4yoklLLFu2lFLu3Y3Wj1H+rMoh4o/HLrlbHXlBtBHYya0dQUvekO30o3cO9j3czs
	Pv6RR6RjnC5CWCF81yQWwHV4d0wagQWoOmqcx/klaDEP0OLfwP1Hwy9XnGeQ7gov44/MxFalZ+H
	qb0zIKTqBYkW2lNVwPeeJA4sRa7ZIo9DpsyA0771ymjxLtACzpOcyn1a2EOyWma4w+uo268Gr5K
	zq1gszYLdYGefng0bXduRdWXjrJJsfUZpXr3m4cAoUsOM2f3AMEGrz5qjYTODh25PI0JNHkpRhH
	09Vk5rjX/GPai9MvqlKqGQEubJL3vMXCb46zg+C0SzwqqG6POBhjHb6eDUbQHGDE5GhPrfKUHYs
	Yha1
X-Received: by 2002:a05:7022:4181:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b5568ba440mr36222611c88.17.1795762948169;
        Thu, 26 Nov 2026 23:02:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 12/21] gdm: upgrade 51.1.1 -> 51.2
Date: Thu, 26 Nov 2026 23:02:00 -0800
Message-ID: <20261127070211.2329979-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133339
Content-Type: text/plain; charset="utf-8"

- Fixed authentication bypass (CVE-2026-132858)
- Fixed reauthentication privilege escalation (CVE-2026-133445)
- Fixed remote display creation during direct login
- Fixed D-Bus startup races and reconnect handling
- Fixed PAM rules not skipping both keyring modules when pam_gdm fails
- Search XDG_DATA_DIRS for GNOME session files

Recipe: checksum update only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_51.1.1.bb => gdm_51.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_51.1.1.bb => gdm_51.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_51.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_51.2.bb
index 4f83fb90f4..51997ce359 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_51.1.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_51.2.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "390ae9e7540f71db28a3dc64319a8f687f4d88bd4d5f1ff816b7a9f2249ab4aa"
+SRC_URI[archive.sha256sum] = "b9e5f940ba8a4a2a488f84f756c1be5b79c520931e054e82db4fe91d37feb03d"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"
