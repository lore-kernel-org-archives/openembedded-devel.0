Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.9524.1605377930943270906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 10:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SA1P4YVT;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id p1so13901789wrf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 10:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JKQocQu5qhHRgmqTp9LB4MMlGsSxPiB+tIMNiZ5YrI=;
        b=SA1P4YVTL42ipqaG7OcUIqfxZUDZR4RS4bBMOL0Zu91WEJN1WyCDJOBffjPuXsOjBU
         UieiJjMLKGOS3e6kXTBBJYi/L2CHhY6Jc5NOCXgc86KKxxeNq9PjFLinBBY2YJSYTn0O
         wRkvqDF2/Lb1wxGW2cnl0/svO2abvD6SY3xfIZ8G4B8DSP9Pz3qS4bpExc+E6rF7c8ni
         X2ElSlIDWyB0vShGt9FW+w4eRiP7T3Bmgh541k8GeEa+oyWtesYxEl3UdXi+sGSA4Sy3
         Q6EV8nNSizFZbpkehauI06asWsfOGIzjG7d+tBtS/U2a5pTlniMNpsKYK1A+AobF8+6R
         b61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/JKQocQu5qhHRgmqTp9LB4MMlGsSxPiB+tIMNiZ5YrI=;
        b=XjpcrxNE4Fz6FfHBvz9T81iWDfFvl0WPtiD+CSrtewqke54rncIeLomoMdDaPLzZyw
         kOlDbSmfyM8EX3sF+4X/sc4N2sbs4zDu3i9IKYei6M6IRsakXgfqEh/tvnoNQwXyCe3a
         jAywMPh3C1BRB/PfPC23f8XfdDMsbJV5kwrOq9m4IIAlsKplB2Z5EZHuvorvMVjiAGhj
         90kntf0JOoPHQ2DXKErVJgcK0OD+DavzrtKxBAIsDkY7800ZzhocsKQ4E5gNpDk0YUNa
         YfG7CPll6t19Ay5ikwSM6MvgoAJD4GnGYsvlbDKLoFkcFj4AEsVJm7z95OGAO0Lr4nYu
         K6PA==
X-Gm-Message-State: AOAM533OAYqU8+2p8OwuhpkYj2IrWR09qjApLIhsjkvJ3aHZ/PoRiWo7
	5swc9smkxm3i1X8Zp9B5ImdlQNns2D0h6A==
X-Google-Smtp-Source: ABdhPJxhHOvFTMK0s3OUsWcoWp69RZ0rlObdOKR4BGQuoJQJyOY6VRX049o1iG08R+SkCZOfeA73Rw==
X-Received: by 2002:a05:6000:10c9:: with SMTP id b9mr11224561wrx.251.1605377929101;
        Sat, 14 Nov 2020 10:18:49 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2d6b00882a76ab3ee25207.dip0.t-ipconnect.de. [2003:cf:af2d:6b00:882a:76ab:3ee2:5207])
        by smtp.gmail.com with ESMTPSA id t15sm13642424wmn.19.2020.11.14.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 10:18:48 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][meta-python][PATCH] python3-pyinotify: Add missing ctypes dependency
Date: Sat, 14 Nov 2020 19:18:12 +0100
Message-Id: <20201114181812.1537197-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pyinotify 0.9.6 has a runtime dependency on ctypes.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L82

pyinotify prefers ctypes to inotify_syscalls. The latter is only a
fallback.
See https://github.com/seb-m/pyinotify/blob/0.9.6/python3/pyinotify.py#L129

Signed-off-by: Mark Jonas <toertel@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

