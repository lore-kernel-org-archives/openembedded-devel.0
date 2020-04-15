Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.8524.1586923325295108510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 21:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VAbRkAPV;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id p8so912649pgi.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 21:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x389di466Q4vs9T3V75qqo286wpTsj+JSl87dqHsSyM=;
        b=VAbRkAPVA3zDCoZ2Fyt4BsXL/EM37aTTKX+j/KagRK3SWkawfW6b0ZCY7lIsM9il5B
         z+VyA3EQ47AdW6rMKbPbwCXcQB2QKQWziOkArbQup6cTfB51D44uDj2rIGg4i8QoqDz5
         RgrkilH6Qw44VGdZZbsLvZL8A2rBCFMFpi3A2IiU28ZhH/2iQnE18TD0Hk+EzBf9Avm4
         STeNw+9np1cuJzZyugmzL5vDzXG9FEbpgmqT/GarEdFxfyaQ4zkPSEo8RobQj94rTgF/
         7btjQcFZrgvBsg3SVrPFXb4FhF9lkDHDbp9RAXu1PCegOfDFJO8kfU7GYOSruE27tSpQ
         yQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x389di466Q4vs9T3V75qqo286wpTsj+JSl87dqHsSyM=;
        b=dPX4GZN2OtqOIHW/KjmnCcCXJCGJx8IgeaHn15+ctwgeXQh7mnJQfN7OysfEA7BGdU
         MAM72QfMxliC7lFiKUvtIuJMNLEHQtcVPCZ78fBC5b6D3lOahKf1EYk+1zv1jTRHiqVo
         eGKhu2xZ3R6jmizgZMx21DOYdSFVn5AiWiGAWyYewCZRfmoDic2GQKyo2E8RFGNDblyy
         SjmiUr/VamvY529v5qDfvpTGIO1jmPdMuarevo0INaLZ2XFwmsJkt7P8Payl/bNqR3z7
         w/eLnmjbaWIy+SRkiRwQJReWd2Aj6imH0DrakT6Ab176RrxiFdj/WgzxIL3zycfAx67l
         G0mw==
X-Gm-Message-State: AGi0PuYTGycpPSrovA+ZEXZoEMphF2s/6Q4o6HyDBTSjnobZvNSTo0Xh
	FHOSQqqc9qxTSI8wPhPigAKI2Hst474=
X-Google-Smtp-Source: APiQypKOzBp+WwHn6J6J+22GY3RMmH45D/iwwOgcH3jHNE0EQzjtidXqOb5V+vNuTFccfLelIxA/oA==
X-Received: by 2002:a62:7b56:: with SMTP id w83mr12048731pfc.97.1586923324333;
        Tue, 14 Apr 2020 21:02:04 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:a097:5ffb:4a26:b07b])
        by smtp.gmail.com with ESMTPSA id t12sm7127699pgm.37.2020.04.14.21.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 21:02:03 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH v2] packagegroup-meta-python2: add new recipes
Date: Tue, 14 Apr 2020 20:59:52 -0700
Message-Id: <20200415035952.33995-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add python-docker-pycreds
Add python-websocket-client
Add python-docker

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 9a8826ab..0eb9b8db 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -58,7 +58,8 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
     python-netifaces python-configargparse python-sqlparse python-soupsieve python-wrapt \
-    python-deprecated python-booleanpy \
+    python-deprecated python-booleanpy python-docker-pycreds python-websocket-client \
+    python-docker \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.25.0

