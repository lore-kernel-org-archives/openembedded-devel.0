Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44036C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:20:51 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.120673.1669648843787558950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=sfBVAkLf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 314319C06E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:43 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2pQtDIwnCbz8; Mon, 28 Nov 2022 10:20:42 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8A46C9C07B9;
	Mon, 28 Nov 2022 10:20:42 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8A46C9C07B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1669648842; bh=gMtL4mYd2cjKCrxmdqdJpWb9H1Frvitqc8QNSkq16p0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=sfBVAkLfSU5Kp2i+fuC58aziozIO6cbDdHAqXRI/TJqnqqiUf2yzqqClP0Jlj7sI7
	 OvvYqpF7Wws6KoXkuqZahUV+Ae8e3f2VnrZkaZwxNlHCBm9wgBWhtGkSoTXXHuQqJX
	 bvCgZmRwSGfG+qeF40MX/Iho2Q0xm7KcPgIlmzB0XXTn6Dd9cd9B7/4aDrysjzUSZ6
	 BCsybQ/N/+hPOM4C+cTIirSmMhuHBjcmo9xBcVvjicQimCOdp7T/q9ozVdWZER8iTl
	 SYzoaYUBP6FqZk7JDtPmcvi6MgctuE4sNd+j0l5aN5T/yxUdQwRkCy/RA7WjFtPKsn
	 1LgFsD52hgnPQ==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RLqgKjrFZD2B; Mon, 28 Nov 2022 10:20:42 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1FF259C06E7;
	Mon, 28 Nov 2022 10:20:42 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: [meta-python][PATCH 2/3] python3-linux-procfs: add recipe
Date: Mon, 28 Nov 2022 16:19:18 +0100
Message-Id: <20221128151916.3541948-3-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
References: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99828

Signed-off-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
---
 .../python/python3-linux-procfs_0.7.1.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-linux-pro=
cfs_0.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7=
.1.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
new file mode 100644
index 000000000..9395a792f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Python classes to extract information from the Linux ke=
rnel /proc files."
+HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/python/python-linux-pr=
ocfs/python-linux-procfs.git/"
+SECTION =3D "devel/python"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-linux-procf=
s/python-linux-procfs.git;branch=3Dmain"
+SRCREV =3D "7f43598387e44e2da93ead2e075b7232429e4cc4"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
--=20
2.25.1


