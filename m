Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B04C61DA3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.44852.1674653493595751910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gvw/QxQA;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id d16-20020a4a5210000000b004f23d1aea58so3139578oob.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QuA/D9Q3gXv7EIzg2b0nICPbXm6hohoJswmf+IEzlM=;
        b=gvw/QxQAwxpEDnLGaqpNhv8LVSIt+J6Rz8MnOJG8xbf/l8ycNBCEDC95tzWWH9K1pu
         29VUu6htibhbqPJQ2yE0WoO+GLoH7BwvzQYmndaffC2Zt0VNYSN28eJW04VPWeJtDRmJ
         zUSXaFZ87TO8DT16TFb7IpwZmxXmRNqEom1xQywILmfKWtr8lnMQ5bVsfEdsLBdtXxDO
         bmqYYm763qD81hIx0eJoQoBubN4KBDTS3uEClhsUs1DFNOVM66u2MO1XCpQ6N0LDY8s2
         jW0wHeGEx1j7uh7doo8yginR12H3eOjTUauUIu6+1SbIMfeX+NqbPlrcBx0XG9LKW6c8
         6p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QuA/D9Q3gXv7EIzg2b0nICPbXm6hohoJswmf+IEzlM=;
        b=DDNVljvMkhfi3Z23B3YZ0aA/ydK/nqjptH2s6wNYXZsWwD+mwJ0Z5d0xsbWuhI8oRe
         /sTZ4UeLAIc4Nv5HTfiwNwbIFxJhuhF0n+mfego1k0xJq+S+TW/FvcnUdq98oymxw8jf
         /ZvYGWV22mesaURF5G0fiKdu/ZHF5X2u6faIiCr/Wb7XJMmjVtoz2JCASBeO/slOUjSo
         W3O50PX/SHMdavCiVzJeM59/UUltFnaAPwXD5u9m7Fua6nyxi5XbvZ1/z8fdP6WzXYLS
         k24V+mXFXTD7U6aKhKVbFlIiu3ghZG+e+weIJnQelR5o+5+6PIDvAt2y9eF/uJu+daHM
         dhaA==
X-Gm-Message-State: AFqh2kq60xbNsgiqm3TZJxPH06FkOsT9UDPVt+fW6xD3yzLYIuCH+gh4
	zF3iGpwaY5lNmj/9dOxst1UJ0OrFezM=
X-Google-Smtp-Source: AMrXdXttvXvcnpsXq+hsxND9bCJV6wO+Ga7C5D7WGS1arYEoojyepSCmsc8LtJZmW5czDnJ4DUUziw==
X-Received: by 2002:a4a:8c68:0:b0:4a3:aa96:23c7 with SMTP id v37-20020a4a8c68000000b004a3aa9623c7mr14073777ooj.6.1674653521193;
        Wed, 25 Jan 2023 05:32:01 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 35/41] networkmanager: fix /etc/resolv.conf handling
Date: Wed, 25 Jan 2023 08:31:17 -0500
Message-Id: <a0d774ffaeb1a0c07eb2bee344743d55e74add09.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100770

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


