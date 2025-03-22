Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370CEC35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 10:48:53 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.7477.1742640528382293774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Mar 2025 03:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 53B964AE
	for <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 11:48:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.42.220]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tvwPE-1uBSEb0; Sat, 22 Mar 2025 11:48:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: dont create alsa links for native
Date: Sat, 22 Mar 2025 11:48:57 +0100
Message-ID: <20250322104857.932095-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742640524-E3FECC07-41206457/0/0 CLEAN NORMAL
X-TOI-MSGID: 21d0b308-bf01-461c-b5ec-0e3798aaa730
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 10:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116198

This fixes:
ERROR: pipewire-native-1.4.0-r0 do_populate_sysroot: sstate found an abso=
lute path symlink /home/flk/poky/build/tmp/work/x86_64-linux/pipewire-nat=
ive/1.4.0/sysroot-destdir/home/flk/poky/build/tmp/work/x86_64-linux/pipew=
ire-native/1.4.0/recipe-sysroot-native/etc/alsa/conf.d/50-pipewire.conf p=
ointing at /home/flk/poky/build/tmp/work/x86_64-linux/pipewire-native/1.4=
.0/recipe-sysroot-native/usr/share/alsa/alsa.conf.d/50-pipewire.conf. Ple=
ase replace this with a relative link.
ERROR: pipewire-native-1.4.0-r0 do_populate_sysroot: sstate found an abso=
lute path symlink /home/flk/poky/build/tmp/work/x86_64-linux/pipewire-nat=
ive/1.4.0/sysroot-destdir/home/flk/poky/build/tmp/work/x86_64-linux/pipew=
ire-native/1.4.0/recipe-sysroot-native/etc/alsa/conf.d/99-pipewire-defaul=
t.conf pointing at /home/flk/poky/build/tmp/work/x86_64-linux/pipewire-na=
tive/1.4.0/recipe-sysroot-native/usr/share/alsa/alsa.conf.d/99-pipewire-d=
efault.conf. Please replace this with a relative link.
ERROR: pipewire-native-1.4.0-r0 do_populate_sysroot: Failing task due to =
absolute path symlinks
ERROR: Logfile of failure stored in: /home/flk/poky/build/tmp/work/x86_64=
-linux/pipewire-native/1.4.0/temp/log.do_populate_sysroot.913232
ERROR: Task (virtual:native:/home/flk/poky/meta-openembedded/meta-multime=
dia/recipes-multimedia/pipewire/pipewire_1.4.0.bb:do_populate_sysroot) fa=
iled with exit code '1'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
index b3040861f3..a57fbca229 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.0.bb
@@ -160,7 +160,7 @@ remove_unused_installed_files() {
     rm -f "${D}${datadir}/pipewire/minimal.conf"
 }
=20
-do_install:append() {
+do_install:append:class-target() {
     # The pipewire-alsa plugin needs the following files in /etc/alsa/co=
nf.d/ to
     # be picked up by alsa.
     install -d ${D}${sysconfdir}/alsa/conf.d
--=20
2.48.1


