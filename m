Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9FC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 10:35:31 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.44553.1670322921400515528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 02:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=SMRanRXi;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A937F9C0695;
	Tue,  6 Dec 2022 05:35:20 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zs95pJQ0TbzB; Tue,  6 Dec 2022 05:35:20 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 211E59C0721;
	Tue,  6 Dec 2022 05:35:20 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 211E59C0721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1670322920; bh=POQ7V5K1z3ArKymWYbbqt1SRzx6KSH2qcKgy9M9eiBA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=SMRanRXiT8qGXGxXu3MXsXmXDdC/nMhve93qRKyxRaEhE8YIFBiPBXVzLU3aVlnPM
	 qBm2p/NWCbRH61SzsrDGHJfWMCs0jXuDYWa2+0NttSm+ITjpV1SJtUCWKU86eK9NGJ
	 1S147yzouZ4Gn+tpGolH2T6EZSrgOPWiWk+hI5N1azb2Z5KvjJF11uBOcdsB+CTrim
	 JtqHxBu3a4KHrF57cSx4ln6NAe22aghiNje2QL6xcRqrrgq4bTAT0zoQg2nqWFvEav
	 5tLOaM/z9PVVqk85pVIs7Gvpj/mTPUt7PtevNNm1xulBtakvbQ3cAwi5GHn8HrRCEy
	 raWj2h178hO2A==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id i-xTw9uvW1h8; Tue,  6 Dec 2022 05:35:20 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8E44C9C0695;
	Tue,  6 Dec 2022 05:35:19 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: [meta-python][PATCH v2] tuna: add recipe
Date: Tue,  6 Dec 2022 11:34:46 +0100
Message-Id: <20221206103444.255618-2-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221206103444.255618-1-erwann.roussy@savoirfairelinux.com>
References: <20221206103444.255618-1-erwann.roussy@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 10:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99958

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
 meta-python/recipes-extended/tuna/tuna_git.bb | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-extended/tuna/tuna_git.bb

diff --git a/meta-python/recipes-extended/tuna/tuna_git.bb b/meta-python/=
recipes-extended/tuna/tuna_git.bb
new file mode 100644
index 000000000..a49341240
--- /dev/null
+++ b/meta-python/recipes-extended/tuna/tuna_git.bb
@@ -0,0 +1,24 @@
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


