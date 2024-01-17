Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFD6C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 12:13:48 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.7534.1705491576395611448
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 03:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=H7DDwIa2;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8BA709C4293
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vHPcxzi5UwEG; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 439BA9C4199;
	Wed, 17 Jan 2024 06:39:35 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 439BA9C4199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1705491575; bh=EZyL7++vY/HmL87S4lYHAvfmvr57e1IEQjqlGiHvSEk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=H7DDwIa2Y+cH26mZiU68YujtSjKgNtulNONNG0PFne20GaQrGbfNq0M7V1tZAIFAT
	 CZ19J9l9tNOqT/YZPIMMrUWMfhiPvE+OdUzIBCWCgf/khAhmlecwxm1KHZnVPqU8AX
	 lrEbWjbgFz1yNvXpwNHmbl/4JaJDGTDmjFrbrnqWTnZJD15rDZdsdpMSIaHNc4hIhp
	 zsswYJd5QgrEn3HrovM3QPIaYAgYA5WKA2mmSfNolyIA+RxvjbSiR71YEjIoglQ3B/
	 iGybhVWnic2JZRKlk59CgU/utZA18d0kNWz7Qfr3oyQCwKMS7OwNvFQhwoFAAGSpYs
	 ZESYFHjmOqkXA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id tL-6UaFjSxQc; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id CD6FE9C3290;
	Wed, 17 Jan 2024 06:39:34 -0500 (EST)
From: paul.leguendekerneizon@savoirfairelinux.com
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver][PATCH 1/2] cockpit-machines: add recipe
Date: Wed, 17 Jan 2024 12:39:10 +0100
Message-Id: <20240117113911.15322-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108327

`cockpit-machines` is a Cockpit plugin used to provide a web interface
to manage virtual machines. Since Cockpit version 242, cockpit-machines
has been moved to a dedicated repository.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 .../cockpit-machines/cockpit-machines_304.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/cock=
pit-machines_304.bb

diff --git a/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-mac=
hines_304.bb b/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-m=
achines_304.bb
new file mode 100644
index 000000000..b787a5cf6
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/cockpit-machines/cockpit-machines_3=
04.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Cockpit UI for virtual machines"
+DESCRIPTION =3D "Cockpit-machines provides a user interface to manage vi=
rtual machines"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b3645=
16c"
+DEPENDS +=3D "cockpit"
+
+SRC_URI =3D "https://github.com/cockpit-project/cockpit-machines/release=
s/download/${PV}/cockpit-machines-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "b9b41d728d68ae9d21c229765e00793ad018231903c84ed6=
53c21d25444714e3"
+
+S =3D "${WORKDIR}/${PN}"
+
+inherit autotools-brokensep gettext
+
+RDEPENDS:${PN} +=3D "cockpit libvirt-dbus pciutils virt-install"
+
+# Default installation path of cockpit-machines is /usr/local/
+FILES:${PN} =3D "\
+    ${prefix}/local/ \
+    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
+"
+
+BUGTRACKER =3D "github.com/cockpit-project/cockpit-machines/issues"
--=20
2.34.1


