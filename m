Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1905.1795113400400755573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mAYSX0Zt;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso841714b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113400; x=1795718200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvxhZ2kFyCWQcqcWfjc+tRGWgXHVRPHNao39E3JKd4s=;
        b=mAYSX0ZtC23nTwFExKer9zjO8VdgO7bi5bXCJTixtwFE2I7S9q1PLfY9SzLOaDJuHG
         d235YwF0e2LsQcFsifbP0I5mXpWglyL/ZUVQuzxigUhP8vHbwu4Sxm7glm3cpg1G62HC
         u/9HFUalfPZiUD4i/Y3RWs0sfs/Es04Xv8I98WtQyoZG1O+vrAL/jswCIVcbq6fZIiD8
         l9PX6cOu5HiPzcmiHn57SEn7iv8npE0Jse9AxzMu5ReCBpFjlL0A8COcTdAxiRT7YGej
         3Egh78cNbZOZ8XH9bLf3pWla/t2zg0HCoc+7LIvHbjYkPmRgrLmUmTWYg2lJVbh/vWqP
         0csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113400; x=1795718200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvxhZ2kFyCWQcqcWfjc+tRGWgXHVRPHNao39E3JKd4s=;
        b=mTk7IDTN8OxgINylTAd5+azMbphG6e6Zna1cWuCioPB7R1nOkfoD54dKxbazUAUqgs
         fvmhX7dL68hi9dt6LHu8Y362eUWtViQ/fRgTFBzJ1dCH2MsAvds77lQu472itMCWjBsy
         whS3KKiUhJXyOHIhKJZOdtpK+Cs+p1mJUMue4aSOyLT9bi9cb+ZBThXcqYI565QJTqzD
         6HhnjXky01PRDpg2D/oKkEqmZPnHGvBFi3Kvt8GX8bfmYlafzT+Ug5qbtombavWz1uXL
         COEGc5XQR3D2UvZCixoPvn5nXhqsCkp+HQpD1F7s+y6+QHV3uQ3PdbWZAj8YiPwp0Cm6
         nX9Q==
X-Gm-Message-State: APuU4Z9XZdf3IdzeMRUyOD5+auOqQQ6ruqtixF+drdZjc9yQy4tbORxd
	vDyqFc/iBRMMUWMxLrWShCTrcGRVEY+josYXUNDycxMnp43A5NTR3ps32Vp+Qg==
X-Gm-Gg: AYBFou2UlvMYva3LiwAdvVhWmxz/2bn7CUluE4Q28B/D2vBujQQ0An33SHkJH5v42Jm
	zGd5nJZwE8Bsb3/iHsdwV9SgU7ZqNK7eNGsf9Zl9USnlyXXcjYY3zzIBz8/yRHdrkHntCezit3h
	iaRNcU13EGzEW8PmeRpJ68tksZz/PtVtloFvRdrZN1/VY5udorkRzhD2bX/w7rh24XnfavB7TXn
	AF12kalQkESczHodJiCfWU5huo1SN5+mwMDdCQL57Fsj95k50QLqY+EVU+e0y+56oL7eXpl4Cnu
	pWrRkMxnrcmZX4sXZEcBqY4r2w0BO+2JN4gqPXutPJOjqpI29wUQeTayVdRko2RiJPTZ8cnYU+K
	IfUVg9o+4u9A5bOenRgWRGJev2UBVdOTB0S55H/z4Qy8Hue6mqCdgeTzcWX9F+qLo9HgBsr0Rk8
	HGwfdO8pbp+5qHZ8h1s2hpZD/P0W+MvpWFnKSR9Kn2o6/fvgu7xAxWPZ28iYokdhJAM7FY0eLXD
	7MICXbYP9Ryftx/eO5TbjBhNzIhHkjWj3dEwxQMfjn29ptJXsFtoqb0J13rNJEtI2dyr0gEK/W6
	6lPmx2JeEm7+a+/lRSmXVrgnB2yMEJk6jQACphzvJD801ViHsg95kHhcHzwn7cYA5N7N8F1PlcK
	7JjOr8Ck=
X-Received: by 2002:a05:6a21:6f89:b0:3f1:fdd4:5742 with SMTP id adf61e73a8af0-4014ca44afbmr308723637.9.1795113399637;
        Thu, 19 Nov 2026 10:36:39 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 17/64] cockpit: upgrade 366 -> 366.1
Date: Fri, 20 Nov 2026 07:32:45 +1300
Message-ID: <f9b2626778fe06d039f8791b8badf5e56b9ba939.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132707
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Fixes for CVE-2026-91147, CVE-2026-91149, CVE-2026-76235, CVE-2026-91148

Changelog: https://github.com/cockpit-project/cockpit/releases/tag/366.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 33f74f5dc5cf6a1411e6d26f8535f0e31851bd09)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cockpit/{cockpit_366.bb => cockpit_366.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_366.bb => cockpit_366.1.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
index b8d12d5ea1..e12cabcd98 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "bf0a8c37eca303282a85777e049fce67fe2002743fabfb3e85f9de24855b099a"
+SRC_URI[sha256sum] = "514723bdac652ec1fb55d0288ae775799e784708f34a5db66b9d8984c4ac4735"
 
 UPSTREAM_CHECK_URI = "https://github.com/cockpit-project/cockpit/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)*)"
