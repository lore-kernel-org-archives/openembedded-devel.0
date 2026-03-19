Return-Path: <youenn.lejeune@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F421090247
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:51:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14573.1773935495545426379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 08:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=PH60HQmJ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: youenn.lejeune@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BDF4F3D817AB
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 11:51:34 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u-kJi-vbOW4s; Thu, 19 Mar 2026 11:51:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 00B963D817B0;
	Thu, 19 Mar 2026 11:51:33 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 00B963D817B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1773935494; bh=bHJfPv9KniwZ+tj54Qg5YLlK1J/KXQB49oGQIvuqaSM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=PH60HQmJ2bWt1HfPwkyCL5EMNE6sn+rTpdgJpXSTDb8kX5F7s3nwWSdK+VMJedcrU
	 g0Nq3R99R/Lwn5atkS/AmEilehL53VHcOrLQaSFwv6HqesvJXYYbwTj93wrB9Anf9A
	 nqBbG7wzQpRq+3oJge+EKhipE56MQMqpVXb5Fo9pgZvGP3NaZD8s2pj06RxPiZjbS3
	 fDSnn2PnSBgnhDgehrlbzvgqY6BdpfgZ5dSJ5rOFxPS86/LnHwMp7oGWHHrRzyy8Eo
	 ctGTas6gxOC3s6dimuL40rHpQeVv11vyVY9AGatFihyaeVT8wiJd93M8puYsCKsHza
	 TdIRsuF9obnJw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id mFQZwosdUBAM; Thu, 19 Mar 2026 11:51:33 -0400 (EDT)
Received: from krampouz.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 7C33C3D817AB;
	Thu, 19 Mar 2026 11:51:33 -0400 (EDT)
From: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
Subject: [meta-networking][scarthgap][PATCH] spice: backported ignores for CVE-2016-0749 and CVE-2016-2150
Date: Thu, 19 Mar 2026 16:51:20 +0100
Message-ID: <20260319155120.426126-1-youenn.lejeune@savoirfairelinux.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 15:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125405

NVD tracks those CVEs as version-less.
The CVE_STATUS have already been added in master with commits [1, 2]

[1] https://git.openembedded.org/meta-openembedded/commit/meta-networking=
/recipes-support/spice/spice_git.bb?id=3De44f3251b552773fe9346fdf7aab2443=
77cf6007
[2] https://git.openembedded.org/meta-openembedded/commit/meta-networking=
/recipes-support/spice/spice_git.bb?id=3D073e8452748132a93103e5db32dc9980=
c84d201c

Signed-off-by: Youenn Le Jeune <youenn.lejeune@savoirfairelinux.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-ne=
tworking/recipes-support/spice/spice_git.bb
index 419316a26e..7900a7dea5 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -21,6 +21,8 @@ SRC_URI =3D "gitsm://gitlab.freedesktop.org/spice/spice=
;branch=3Dmaster;protocol=3Dhtt
=20
 S =3D "${WORKDIR}/git"
=20
+CVE_STATUS[CVE-2016-0749] =3D "fixed-version: patched since 0.13.2"
+CVE_STATUS[CVE-2016-2150] =3D "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] =3D "fixed-version: patched already, caused b=
y inaccurate CPE in the NVD database."
=20
 inherit meson gettext python3native python3-dir pkgconfig
--=20
2.53.0


