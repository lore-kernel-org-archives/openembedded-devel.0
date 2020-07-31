Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.19977.1596206593721251143
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 07:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAPRp6Vl;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id jp10so5104291ejb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3TN6gfx69Bn5ZhDjRPJy71kvUeOtbF+8ptvyjC+sANs=;
        b=IAPRp6Vl1Thn0Xyyjxcu3SSVyMrzzOXJL731wh5NKSm7g8rzqi0qq1OamTp8r9bnd5
         D95zDdaXFHjeBuykebCNPx7al9sgxepz0sI3MSTK2bGBcUD/t/NcSDp8+O15LHcHaiWh
         AlshBWNq/uOTDrT1rQ2oPpLt5iU4zz+88kpOT5ksuT6wnyCsiFzVui9IFGro3bWkQMhe
         IYyoGO4NPraY7M7wjwh149jbij2tIgziyKrgulABI0GIHVaEJbdYQAu1zLTGX9QEcDXX
         TlBQ3mAIJ5LQn6XiBQDPr+KGlR67MPcMD7nuv/0BPj8BF12OiA9rdOhpTIZEBvObaf08
         K75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3TN6gfx69Bn5ZhDjRPJy71kvUeOtbF+8ptvyjC+sANs=;
        b=hQaOF3XIm0ToEUKOwWmj5TlUUizp1cTECSsakGqiRTRLpfNQ2dRnWLXkuBDeFSxszl
         sN4fGjJTF1IpHoQE2s26ZgSah3KdMHBs8IPtsbDyau9tXbhGC3neRwX1Ma/M1aLlSael
         z4PGwkkVFSlNnnS6fVECHaoknmEkTWuhI5+kr0eDiokJL+hl/NgPTYtuLL0HrdewawA/
         z/daRHn1uMkw08UXeXmgUGZq+XW86zetLE9nXnuN6yWPL29izLDibJjR6JBHRpiPCT7S
         ++5FCLPYoHSBNdQeuqNy25s/QPLbAUcsCVBCRs+hzxaF96SquoLBYZG0eFLGtA7tq7gz
         Z61g==
X-Gm-Message-State: AOAM531CZPG0oEDLbF6kHSZK6F3MOzcAeRXY9pfRIZqFgezOAXlPI0aQ
	vsyOREDy8JMWg6ko1CGe9QIEjTEJ
X-Google-Smtp-Source: ABdhPJzAT/4571I/fTQbKyYWsz6GYe6VZqQe5D5lTA1rBCABqcqKwlHeNtbTEnPOlVXZxoyG9X086Q==
X-Received: by 2002:a17:906:194b:: with SMTP id b11mr4354238eje.28.1596206591823;
        Fri, 31 Jul 2020 07:43:11 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:3f:a5ba:1524:a0bb])
        by smtp.gmail.com with ESMTPSA id h18sm9711747edw.56.2020.07.31.07.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 07:43:11 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 4/4] dlt-daemon: enable some configurations by default in PACKAGECONFIG
Date: Fri, 31 Jul 2020 16:43:02 +0200
Message-Id: <20200731144302.7074-4-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>
References: <20200731144302.7074-1-costamagnagianfranco@yahoo.it>

such as udp-connection dlt-system dlt-filetransfer and if systemd is enabled also:
- systemd
- systemd-watchdog
- systemd-journal
- dlt-examples
- dlt-adaptor
- dlt-console

rationale is:
all of the keys above are not that heavy in building and running,
and dlt-daemon doesn't take more than some seconds to build.
Not building them by default can result in a lot of missing functionalities
to the end user, such as the ability to talk with the dlt-daemon via
bash script or Python.

The end user can still change or disable something if needed.

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 2bb210791..e7a194ac8 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -23,7 +23,10 @@ SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES','systemd', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-console ', '', d)} \
+ udp-connection dlt-system dlt-filetransfer "
+# dlt-dbus
+
 # General options
 PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
 
-- 
2.17.1

