Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1597C61D97
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.19999.1674401685723574769
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmP0hXOe;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1433ef3b61fso11494418fac.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QuA/D9Q3gXv7EIzg2b0nICPbXm6hohoJswmf+IEzlM=;
        b=YmP0hXOeJ657mf30RTMqb2FxqFf3LbENJrmpAocN9n0uyCBnrmEvk7Iskn9nrh2EoU
         GnDmPPGqwFe1Meie/coSQGuMSn/5Dl3iT71b2GyEXGzdHSsjJYhkbhP0hS9Ia+BCS1b7
         N6Qw8TE+ODmCZUezvmlxDql0/zaiwwNAfI4seUi66po5IC2uWevOWkIrWLGv2Kr7Nub6
         WRn8JxU74WA373cuY+5E+mEq88LCuvaGQUDfn2c7mKnj9LdMk9h8i8ZRMiLPapcWNEin
         cbAtgqhqW2B+U2uY1kL+IW9UYhOXsEXvbFBe9eYnQxsQeGbBcp2K97wmEHuiewq9OmEK
         CkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QuA/D9Q3gXv7EIzg2b0nICPbXm6hohoJswmf+IEzlM=;
        b=LSBnRoe4iZ5nhMWbHGvzLbMtNSr32HjROiFJGxsHrKCfiHhijlCEtArbkF6X0SW6s8
         +qlbDzBrD/KY+Srlk1nT0wUY9iLBQOM1eqEPXhxArDyIgXRaFODZEsHW/r+79ynkLQBA
         WYB3ZGsTuUSRcNDgcqdetGd2b92MH1ngMrLRsVqME9kZjPGJnQWVqyQtaWdeoELQrIUn
         D3B2s0f4OOwZBamUWFFpEX2ww4BjyESLW820WQnGSMrdXu9sAiG7/trG71Ac89lw46tB
         vfyvZUX9swhfhOXYSfIZD200e52oeD+hiPXCkpVburDRRt27MQxew4dnPg4HO73MQV1+
         sGIQ==
X-Gm-Message-State: AFqh2krAMJN/3s7XdBM4rvMsQPnbYrD9Mfr65sP0s3zaPnGG64gbD8N9
	g9hRvVI8M/G2eB9qclpqxldBTo3Uc6E=
X-Google-Smtp-Source: AMrXdXujK0DTZ7ifSe5bQZXDux0cHxY3urT1oK7qAhrIR1VKlGs5Yu2wBmW3BJRjLEV/htJN9BsmUQ==
X-Received: by 2002:a05:6870:a919:b0:15f:c8d1:987 with SMTP id eq25-20020a056870a91900b0015fc8d10987mr4341873oab.21.1674401684939;
        Sun, 22 Jan 2023 07:34:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/6] networkmanager: fix /etc/resolv.conf handling
Date: Sun, 22 Jan 2023 10:34:38 -0500
Message-Id: <20230122153442.213094-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122153442.213094-1-akuster808@gmail.com>
References: <20230122153442.213094-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100703

From: Chen Qi <Qi.Chen@windriver.com>

The current handling of /etc/resolv.conf by NM has some problems.
When networkd is not configuring network, and there's 'ip=dhcp'
in kernel command line, the /run/NetworkManager/resolv.conf file
is not created, resulting in /etc/resolv.conf being a dead symlink.
This is because NM is treating the network interface as externally
configured and will not try to reconfigure it again.

This means if we want NM to work properly with /etc/resolv.conf,
we've got to either ensure there's no 'ip=dhcp' in kernel command
line, or we've got to ensure networkd is configuring network. This
is weird because normally we should not enable two network managers
at the same time. Note that NM syncs part of its codes with networkd,
which is the reason I think it happens to work when these two network
configuration tools are configuring the same interface at the same
time.

In fact, NM now works well with resolved. It sends the DNS info it
gets to resolved unconditionally by default (the behavior could be
disabled in configuration file).

Looking at the original commit that sets up the update-alternatives
mechanism, it says:
"""
  This brings the networkmanager in sync with how systemd-resolved and connman
  work. Additionally this allows it to function with a read-only rootFS.
"""
I guess the author was using systemd but disabling resolved, and the author
wanted to use read-only rootFS. In order to keep such combination still works,
change to use PACKAGECONFIG to handle things, and when 'man-resolv-conf' is
enabled, the above combination could still work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a8ebf23dde9c82dd9d1dcd0fa6de0b4467a0112b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.40.0.bb            | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index b9273ac89e..801739170b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -107,6 +107,8 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
+# The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
+PACKAGECONFIG[man-resolv-conf] = ",,"
 
 
 PACKAGES =+ " \
@@ -258,9 +260,9 @@ SYSTEMD_SERVICE:${PN}-daemon = "\
 "
 RCONFLICTS:${PN}-daemon += "connman"
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
-ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
-ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
+ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv.conf','',d)}"
 
 
 # The networkmanager package is an empty meta package which weakly depends on all the compiled features.
@@ -285,7 +287,7 @@ do_install:append() {
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','true','false',d)}; then
         # For read-only filesystem, do not create links during bootup
         ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
 
-- 
2.25.1


