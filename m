Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3510BC25B78
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:26:05 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v2] android-tools-configfs: Fix build-time warning about S being non-existent
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
X-Originating-Location: Cork, Munster, IE (80.111.64.44)
X-Originating-Platform: Linux Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 May 2024 02:26:04 -0700
References: <20240528161133.3767471-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240528161133.3767471-1-dmitry.baryshkov@linaro.org>
Message-ID: <26400.1717061164690626647@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110625

Hi,

I believe similar recipe updates in e.g. oe-core also update do_install() a=
nd friends to reference S again instead of UNPACKDIR, i.e. something like t=
he following should also be done to be consistent (sorry for the formatting=
):

 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
+    install -m 0755 ${S}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${S}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${S}/android-gadget-cleanup ${D}${bindir}
=20
-    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
+    if [ -r ${S}/android-gadget-setup.machine ] ; then
 	install -d ${D}${sysconfdir}
-	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdi=
r}
+	install -m 0644 ${S}/android-gadget-setup.machine ${D}${sysconfdir}
     fi
=20
     install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitd=
ir}/system/android-tools-adbd.service.d
+    install -m 0644 ${S}/10-adbd-configfs.conf ${D}${systemd_unitdir}/syst=
em/android-tools-adbd.service.d
 }


Cheers,
Andre'

