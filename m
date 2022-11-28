Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9ABC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:21:00 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.120453.1669648857909191528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=Et/9aAqQ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 506769C06E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:57 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id qCnysnt7KZPc; Mon, 28 Nov 2022 10:20:56 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 887829C07B9;
	Mon, 28 Nov 2022 10:20:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 887829C07B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1669648856; bh=xxoUvzGOXmNtKGrqLIrWT6MZvEIEL6TFXEJ2SweDldk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Et/9aAqQOt1gHwwqWMfRoyTABLMZCAUYV06Um7vSIDAhd/Ax4CCQ0CDZwYK4uYcno
	 igBSUhRHR9moUbKTOUakYUtrKWQCEZcYZ0xI1wrfmo7fFJfa0HjYWK0kHryBhmAD4K
	 ldllYa8O20/KjTUkriF55uMneZD1+/zyGciMm4zVLZ0im5+eSB7RnEtBZyX/QsVNkq
	 e86OqNwsn6Suo9CkzcAMgdyTIg2X3P7gbM6/LcT5PktY6RekyabmrfQ8m0H5tfuImA
	 Ag1eRuKMSOjuoglCiR+/tOwLzEPOYHfnz2cNYKxu2OzmpBKApO5WF1eAlw7y1zkccE
	 RVgNUa1Y8eEBw==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YhPGvlIA0OR7; Mon, 28 Nov 2022 10:20:56 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1AD769C06E7;
	Mon, 28 Nov 2022 10:20:56 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: [meta-oe][PATCH 3/3] tuna: add recipe
Date: Mon, 28 Nov 2022 16:19:20 +0100
Message-Id: <20221128151916.3541948-4-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
References: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99829

Tuna is a cui/gui tool for tuning of running processes.
It is useful to see and changed irq affinity on an embedded board.

The chosen revision of tuna is the last commit to this day and not the
last release. This is due to the python3-ethtool module which was
required in the last release but isn't anymore. Tuna now has a built-in
module instead.

Despite tuna's homepage's dependencies section, python3-inet_diag isn't
required anymore.

Signed-off-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
---
 meta-oe/recipes-support/tuna/tuna_git.bb | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/tuna/tuna_git.bb

diff --git a/meta-oe/recipes-support/tuna/tuna_git.bb b/meta-oe/recipes-s=
upport/tuna/tuna_git.bb
new file mode 100644
index 000000000..f698b2ea2
--- /dev/null
+++ b/meta-oe/recipes-support/tuna/tuna_git.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "cui/gui tool for tuning of running processes"
+HOMEPAGE =3D "https://rt.wiki.kernel.org/index.php/Tuna"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D80=
1f80980d171dd6425610833a22dbe6"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=3Dm=
ain"
+
+SRCREV =3D "0681906e75e1c8166126bbfc2f3055e7507bfcb5"
+
+S =3D "${WORKDIR}/git"
+
+RDEPENDS:${PN} +=3D " \
+    python3-io \
+    python3-linux-procfs \
+    python3-logging \
+    python3-schedutils \
+    python3-six \
+    "
+
+inherit setuptools3
+
+do_install:append() {
+    install -m 0755 -d ${D}${bindir}
+    install -m 0755 ${S}/tuna-cmd.py ${D}${bindir}/tuna
+}
--=20
2.25.1


