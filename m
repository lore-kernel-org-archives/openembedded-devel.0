Return-Path: <erwann.roussy@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A7EC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:20:40 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.120664.1669648833285295290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=dfc430d2-d198-11ec-948e-34200cb392d2 header.b=weB3DC6x;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: erwann.roussy@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6850F9C06E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 10:20:32 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7AtKmtHJ1CBz; Mon, 28 Nov 2022 10:20:31 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B4AE29C07B9;
	Mon, 28 Nov 2022 10:20:31 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B4AE29C07B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1669648831; bh=mELAGU+TJq0jevngAmNiGMAcQvmx7pMT898MkWnFMYI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=weB3DC6xQA5EAQ68rVE+uVQUamjpE7KB7dW+i+kwl4/sgk20P7fyCsrMDpA9s2Z4+
	 PUNsh9Q7wFNjYEw+rP9Lk40xf8OW85YgcZIdTmycnyr8vb4pmpxVWqEdaB2sblHRGf
	 8k1cRnNH+fxCcjRx/6ylBv5Fp6iuNL0tMFgQC9Om0TCxzHRR4jRnQbGjjmvWpbkm/4
	 LYFX5Qd8EQ+Gi2qCA4+CtKwCvxYEIwpHxrmCbHE+eZ2123DG310ulkphyr1M3QnymJ
	 XMiW+zenO5itLhLNIyl2lH15VdPonL6LVOAVa7CcH+CSHHHwcKaNSrM7HGy7He+a8f
	 7uSSOdAjOv+YA==
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D5fHcaPFDVRZ; Mon, 28 Nov 2022 10:20:31 -0500 (EST)
Received: from jean.bzh.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 4688B9C06E7;
	Mon, 28 Nov 2022 10:20:31 -0500 (EST)
From: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Subject: [meta-python][PATCH 1/3] python3-schedutils: add recipe
Date: Mon, 28 Nov 2022 16:19:16 +0100
Message-Id: <20221128151916.3541948-2-erwann.roussy@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
References: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99827

Signed-off-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
---
 .../python/python3-schedutils_0.6.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-schedutil=
s_0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-schedutils_0.6.b=
b b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
new file mode 100644
index 000000000..50868b9c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-schedutils_0.6.bb
@@ -0,0 +1,12 @@
+DESCRIPTION =3D "Python interface for the Linux scheduler functions etc.=
"
+HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/python/python-scheduti=
ls/python-schedutils.git/"
+SECTION =3D "devel/python"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/libs/python/python-schedutils/=
python-schedutils.git;branch=3Dmain"
+SRCREV =3D "46469f425f9844f355f6496785ee1ce993b58747"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
--=20
2.25.1


