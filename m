Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FCFC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:29 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.11803.1639668208394706504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHz1qmt8;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id o4so23844910pfp.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bddkYsilMezkjwAlerNRkNbYx6Z4PzRikKwF/auUPHs=;
        b=FHz1qmt8+1V3/Dg6xXWAOoHVlDG+hsMnD0TD3m3QTL5pxWBQwGbI7Ko0YdGRj6w338
         XfHnfLxW1XVlyi0IwRe5ZJd8CW2K2ODVMm6BqtNof7y8zjJ+lWSxMuGk3tdJDXQAZnL3
         A0BQO9B8Ar7DkQSavV4htoWrTV44TNgOhSMcnDPlkhidW+XE0JbbDiDbpMMbxj4wFr0u
         KxHAKfIo6ruMOq21rwiFP/XafrGVrMcdp4EbQZ9YLgjfKebhhL2kkkv9LPLwoHolVHcH
         acNkuByU+IJeqqQzkPRY6ioEGahgd9NW923oc3oKm7VvQ3Cvv1L4qkJfZqD+i3h4XkaV
         SPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bddkYsilMezkjwAlerNRkNbYx6Z4PzRikKwF/auUPHs=;
        b=iKwFmMJHgMWRktQ96x8qqur9VElFM41cWFJOhdMgOFzVrsc+AUlZQcuk+IF6BtYTdn
         gS5ntTZLOWdtXva0BHCy/8m6Q/aYah2Xg3TBhea9ml4Y3KUnLML5gSHNb+Y8ZFFAwDX2
         /gGEZbaJ4eSpJdrtWS7cXtVYZQhBC+qgAXowkAxWJb8HHAqw/g0YEVAdG7WOKZE0JwPW
         eTkBfh+wCtuNDftKnZo9ugLTC/kH/OLigUoI3BsLya40OedoRm8mCZLvTwIaOTViuQA8
         6GcPuGW+HPEeynPC23c/+aMmAg7cKiMO6SZUs4iIBmarDPSIn9Ya3acBPBp8cemtikKZ
         6xPQ==
X-Gm-Message-State: AOAM530YsfjlZ63L3h576t5VskZppUOR1Qi8XBZwbdTZKKqUNw6b9H9e
	d+oscuW6ZIyetCY8trnIR0PbPqyUjG4=
X-Google-Smtp-Source: 
 ABdhPJxeIyOo0FG3CeoO3O9yCCR5BHz0uhgczTgvKTJ2u7pKQ18b20VzRO3D+dDU8ktTsYsuBXMBhA==
X-Received: by 2002:a62:6dc2:0:b0:4af:98e:1d3b with SMTP id
 i185-20020a626dc2000000b004af098e1d3bmr14577949pfc.52.1639668207757;
        Thu, 16 Dec 2021 07:23:27 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 01/18] lvm2: do not install systemd units/initscripts when
 building native SDK tools
Date: Thu, 16 Dec 2021 07:23:06 -0800
Message-Id: 
 <8739e7ae8ff5df6d0559aeacbfbf2e101066a3b1.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94386

From: Luca Boccassi <luca.boccassi@microsoft.com>

Nothing picks them up, so the build fails. Required to be able to build
native tools like systemd-analyze.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit defbcad66fc1e91117ba08bf1051035188e40b37)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
index 3988d54910..a729324c9b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
@@ -17,13 +17,16 @@ do_install:append() {
     install -d ${D}${sysconfdir}/lvm
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        oe_runmake 'DESTDIR=${D}' install install_systemd_units
-        sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
-    else
-        oe_runmake 'DESTDIR=${D}' install install_initscripts
-        mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
-        rm -rf ${D}${sysconfdir}/rc.d
+    # We don't want init scripts/systemd units for native SDK utilities
+    if [ "${PN}" != "nativesdk-lvm2" ]; then
+        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+            oe_runmake 'DESTDIR=${D}' install install_systemd_units
+            sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_system_unitdir}/blk-availability.service
+        else
+            oe_runmake 'DESTDIR=${D}' install install_initscripts
+            mv ${D}${sysconfdir}/rc.d/init.d ${D}${sysconfdir}/init.d
+            rm -rf ${D}${sysconfdir}/rc.d
+        fi
     fi
 }
 
-- 
2.25.1


