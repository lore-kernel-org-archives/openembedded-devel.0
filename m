Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.9689.1604148738370110622
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2020 05:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sp/mbMuN;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id g25so8634377edm.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2020 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cvpz6o4MbIiuzbD/jC8Z3TkrF04XueJkWJU1vvkR5CE=;
        b=sp/mbMuNH9kQzIgeDB3GMsEweICCubUUwdW8yzStaktOR2ONqD2GpdNfbFJthyt6Yt
         udl0eR1ZsCkk1UA+oacdieAhxfJ4sPmwDbPaxpk6tGW7mAPWk0IcXIP29o0eFFaJXdwk
         2HNCEXQlffBg4V/Jd0sSwiFJUzQrf1BjOZhPJG5GhEXJATqyDiQMBFTYVIWBrjtTMbR0
         PCLfeR7nhmjLVG29JQEO+R9lyn6unCYpR6csPG6/gDUw3Vj8LHbe7V79X/HsP5cMHPXZ
         XF2mms9wrLKvGCp1KAor9PtVxGojLPCdWXZt5Xz29vvVWVrnFRFQyobDl+kJVs19DMqb
         /5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cvpz6o4MbIiuzbD/jC8Z3TkrF04XueJkWJU1vvkR5CE=;
        b=t8aWZ13tWDol0jB9pgsE1sH9pVDxuQ2M555eAIOsVLrtmeTv5KAA8th1OmtJGD1O6U
         +NZb5bBoU+ZLe1yovdzo15RVr8rS/sGeu4s/SuTgqoUnqlh37gsoAow1ojyf8j72YVtp
         7Jl10RsjuOGW2FdCPFBXp4DGRMI6UIgSCs9nRD6Usc1TVZPaXRyqSvSTJWoWijYkg+ZY
         aONC9V6nxzjPmWIPl7y+VthCraiT0Cy6DESQxPV5rD3YehzC9VndCxcMLxZXNbaMXZM3
         ZdEJoqwAP9NE+E8B1ULFyAcc3RHud4uSyJCo+Td0jcdsr98VrsXNzzWYSn3ThYdx8vac
         J/YQ==
X-Gm-Message-State: AOAM5331FAdyYRgJV8RXvrn2c3uWt8cdtJEICHodHShiuzmwztHG228o
	7hk5oLml6o4Rlyu9G/cH+6xrKxNoFaJ1Iw==
X-Google-Smtp-Source: ABdhPJzMKwj5e/e5Cm2nUoLq5qoezba5b4PGTYyFErmTUR/0Km1ALwodWpHpMKZUUKS3YKwRZJRJHw==
X-Received: by 2002:aa7:da4d:: with SMTP id w13mr7232093eds.266.1604148736611;
        Sat, 31 Oct 2020 05:52:16 -0700 (PDT)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2f4a00958d05857322ca74.dip0.t-ipconnect.de. [2003:cf:af2f:4a00:958d:585:7322:ca74])
        by smtp.gmail.com with ESMTPSA id ds7sm4844369ejc.83.2020.10.31.05.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 05:52:16 -0700 (PDT)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH] python3-pyinotify: Add missing ctypes dependency
Date: Sat, 31 Oct 2020 13:52:10 +0100
Message-Id: <20201031125210.12644-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pyinotify 0.9.6 has a runtime dependency on ctypes.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L82

pyinotify prefers ctypes to inotify_syscalls. The latter is only a
fallback.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L129

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
index ab3395317..049c3c3cf 100644
--- a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -3,11 +3,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
 RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-smtpd \
+    ${PYTHON_PN}-threading \
 "
 
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-- 
2.25.1

