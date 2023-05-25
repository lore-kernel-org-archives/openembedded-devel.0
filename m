Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8F9C7EE33
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10021.1685016850038032259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9261042;
	Thu, 25 May 2023 05:14:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D9B13F762;
	Thu, 25 May 2023 05:14:09 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 09/14] python3-blivetgui: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:52 +0100
Message-Id: <20230525121357.245812-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102852

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui=
_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_=
2.3.0.bb
index 29e7a267d2..aba127897d 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
@@ -15,7 +15,7 @@ SRC_URI =3D "git://github.com/storaged-project/blivet-g=
ui.git;branch=3Dmaster;protoc
            "
=20
 inherit features_check
-REQUIRED_DISTRO_FEATURES =3D "x11 systemd"
+REQUIRED_DISTRO_FEATURES =3D "x11 systemd gobject-introspection-data"
=20
 inherit setuptools3_legacy python3native
=20
--=20
2.34.1


