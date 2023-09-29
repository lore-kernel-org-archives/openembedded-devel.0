Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CC1E71D27
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 12:27:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.15908.1695990462036754582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 05:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCAMCvcn;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso10648050a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695990460; x=1696595260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGLPsBLrVmotbmcaXZ6s5BdZv58KW6f668Nc+wOzu2o=;
        b=HCAMCvcn0UJm/YahS593mPPxfcpztwexQ17wDIJu8p+vmnitzgNTNpFmT/MyleWpJD
         vn+NaXO1dA+GivJUuZOU8o8PeWPovyM550DhVmosFcqVkyay+s/U3D/tBQxICXoUz6s5
         lF4cH10YTTdXC8VmjdfxjvCL4+nrx8Vw+qSyp7GgpclJsEKENhHYVeQbJYiF7p6z+6G7
         tyHq282IqDo7otGSg+/KwZXTbTwgEj6jysP0atSTr+nZ0NHxNtFffEpGYV5ASH+BRzNA
         m8H4pgKyI5BJsrL3nrPDFK87sSuL3CPu40WbMs/neOaIB4OPOZTY6TKKCL8Qpdw9o74Z
         VVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990460; x=1696595260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGLPsBLrVmotbmcaXZ6s5BdZv58KW6f668Nc+wOzu2o=;
        b=KknMQvYEuk9CMJ4WXBc8rRBdofizvbjMxEUkMNc5h/RBgxt5J5yKHbeaRpzYPt6/zl
         bz4sgA8IhOSivMJGXiUNE0zR4DgVQBOYclo75CZSLyvD+ZXQ2Xgn90fNrorO6+BR5Os+
         g10ofr5ZRxlMRaNHWwGOT8U1W1Fff+Md1qIQ9kAVlC29PVPcbMpt26+scmjCqSA2rP/t
         kKVGiFhGaQZI7THobP6Ctn3f223nD95FQRkSSLffmyr1g3xxu96eI8oGxIuVTSMj62VP
         6di7lyrEG61m9IKG5gW95zeMhRjpOXQiAln0HIzXk0mzn8NOIcPirJmUCSNzPkMQik9q
         QFwA==
X-Gm-Message-State: AOJu0YyOB6oyvwKdkHCGTIdLKeyooGVwaig1+sw1qKSauWhcA8O+tqMp
	UZ9MnVGbSJ6PnBWDaY2Bjo1e5CE5Y5izWQ==
X-Google-Smtp-Source: AGHT+IGDBMKVsKVmmg+Y9zfHu1lcQyf57loh7zazCjPtT3R8oDuRzRph6soyIuJruRdptJaOjcaXbw==
X-Received: by 2002:a05:6402:652:b0:522:ae79:3ee8 with SMTP id u18-20020a056402065200b00522ae793ee8mr4214635edx.5.1695990459724;
        Fri, 29 Sep 2023 05:27:39 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d6d2000000b0052febc781bfsm11051272edr.36.2023.09.29.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 05:27:38 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Federico Briata <federicobriata@gmail.com>,
	Andrea Reali <andrea.reali@cnhind.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 1/2] dlt-daemon:
Date: Fri, 29 Sep 2023 14:27:32 +0200
Message-Id: <20230929122733.712422-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 12:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105239

Make sure also without systemd enabled as default, the tools can be built and installed,
such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples and dlt-console.
They have stub functionalities when systemd is not default, but they can still be used with
limited functionalities

Reported-By: Federico Briata <federicobriata@gmail.com>
Reported-By: Andrea Reali <andrea.reali@cnhind.com>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 33fae0619..3811772a7 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -22,12 +22,13 @@ SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
+ dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console \
  udp-connection dlt-system dlt-filetransfer "
 # dlt-dbus
 
 # General options
-PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-examples] = "-DWITH_DLT_EXAMPLES=ON,-DWITH_DLT_EXAMPLES=OFF"
 
 # Linux options
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF -DWITH_DLT_SYSTEM=OFF,systemd"
@@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=
 
 # Command line options
 PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
-PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
-PACKAGECONFIG[dlt-adaptor-stdin] = "-DWITH_DLT_ADAPTOR_STDIN=ON,-DWITH_DLT_ADAPTOR_STDIN=OFF,,dlt-daemon-systemd"
-PACKAGECONFIG[dlt-adaptor-udp] = "-DWITH_DLT_ADAPTOR_UDP=ON,-DWITH_DLT_ADAPTOR_UDP=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF"
+PACKAGECONFIG[dlt-adaptor-stdin] = "-DWITH_DLT_ADAPTOR_STDIN=ON,-DWITH_DLT_ADAPTOR_STDIN=OFF"
+PACKAGECONFIG[dlt-adaptor-udp] = "-DWITH_DLT_ADAPTOR_UDP=ON,-DWITH_DLT_ADAPTOR_UDP=OFF"
 PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
-PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF"
 
 inherit autotools gettext cmake pkgconfig systemd
 
-- 
2.34.1


