Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.39829.1597042008699743451
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y24lqVe6;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l2so7047250wrc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 23:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K69GayIHwgAl96fwqxxaEnwt17pTGDTiRtEje0fMQR4=;
        b=Y24lqVe62LQTdJi+CkbXS+2Xxw+1ke+IVuIozFZEkUTd5gA2Nrz2AroPrcnDvprR8a
         R7FxJj36a1VA8LrxtErKLxE9EKfmDQgF/G/a9z+iMcZzsrLJTW8/+PjDmBpOEHukhiof
         /Kb9l6Qtf6qG5MBraI2jsCPlzxCREQpkwbQ8KUuyEjNuMxHVTwL9nOfR9kL6m702wa+h
         +BaUGYWGMd19G0Sooia6ARLM2BKhyEkttNs68mHYJHg4b0odZWeEphFVPmtBUS8UfA25
         OYNSUvAzfbWrbDn8KbLnp6OjYAP1xdwwaUDbzpI5s76ThRJt1sw3/HM+vqG/oWoCGHed
         EvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K69GayIHwgAl96fwqxxaEnwt17pTGDTiRtEje0fMQR4=;
        b=MTwnNm8XrKlRs2FR+VS7/L8BJhm8w6eQ5lhrwsOXqlXP53ibW0RN5sWGANQKgHFVcW
         x2jfbxoLhfCK6UrzC+/h7CFDdTemPlHBTgOPGyNIf5eykrokQBpyaT3F+tqnbb+CVC7H
         QEp5ewquWHX7FMY24mp4oTDkeD7zVVwqs0Z7mEjTMCoIszGNyBjZ53Vc9iGube4Ho8Bv
         ejmeO209xl6ct0mE13A3qTxrpEKB7TuW0YbBceT0mrvjsBM080Y2wys/VW9eQxW4jGFY
         A4wGid+U2sBbLbDpXEFfpOfVGrNv51NdDfhqvFkbzTK9rpyb4NKECmnNop9YvGgWtlCL
         9oZw==
X-Gm-Message-State: AOAM531miegpDZPSmnExgpnQwzNjwhi45+XjQrlqBQc/VBPE1CD1DtDh
	h1UTETAilniIYlAsl883qsbc8Ubb
X-Google-Smtp-Source: ABdhPJyRr8JFyhwFMoZ3WnHRKhP0HVsL1C0NsRoI5JfxR8F8liUBb28HwWIKaAlcmIS9XxGLuOKJ3g==
X-Received: by 2002:a5d:6401:: with SMTP id z1mr22802221wru.272.1597042006983;
        Sun, 09 Aug 2020 23:46:46 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.82.145])
        by smtp.gmail.com with ESMTPSA id e16sm19410479wrx.30.2020.08.09.23.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 23:46:46 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 3/5] dlt-daemon: fix build failure when dlt-dbus is enabled, due to missing service file.
Date: Mon, 10 Aug 2020 08:46:31 +0200
Message-Id: <20200810064633.20079-3-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>
References: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 74270b579..2bb210791 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -47,7 +47,8 @@ EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)}"
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-system', 'dlt-system.service', '', d)} \
+                          ${@bb.utils.contains('PACKAGECONFIG', 'dlt-dbus', 'dlt-dbus.service', '', d)}"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 SYSTEMD_SERVICE_${PN}-systemd = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dlt-adaptor', 'dlt-adaptor-udp.service', '', d)} \
-- 
2.17.1

