Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D8FC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:40:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web10.1823.1750692739164223516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 08:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michaelestner@web.de header.s=s29768273 header.b=F8oFTWTp;
 spf=pass (domain: web.de, ip: 217.72.192.78, mailfrom: michaelestner@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750692737; x=1751297537; i=michaelestner@web.de;
	bh=CHlu6IDsk+K/4P0Igp9T2ZFsjZSj1nk2R+jVQq2g7O8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=F8oFTWTpPp9ryU6v0hJlD1HFGge9tTOPtFBBb6UwaV/pRXnG0WTFkM0SNPcCEUeO
	 3qjliMtyWroVRwQKjJ/IduK5l5niSZ9XPPOw58VjdxONEj0L+GH0y2/OtzceRrOc3
	 od+dCndGtvoxXIWISjdvayyDOK69/6QT2HIDWAcP7bfjs9/qmEpAiaTIulafzOvap
	 v4PUbthRj9eYU9OajVdt2aEPVQ2ONrxsRUqz+SUHRGnBPCU0Td8ZvG8+X3maiQgJR
	 FmPvNVdyiAq2CwJtcSJmW2zToUCNgBcPKi8/lM0lEv75KBqo6YA1HEGzyB6uztlZ7
	 unNXPIs39WQ5dc8AoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([217.85.92.231]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MzkOR-1ughZQ1Qxd-016RHG; Mon, 23 Jun 2025 17:32:17 +0200
From: "Michael Estner" <michaelestner@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Estner <michaelestner@web.de>
Subject: [PATCH 1/1] [meta-filesystems]: add nilfs-utils_v2.2.11
Date: Mon, 23 Jun 2025 17:32:10 +0200
Message-Id: <20250623153210.304150-2-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623153210.304150-1-michaelestner@web.de>
References: <20250623153210.304150-1-michaelestner@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:V/Gwenv6lFb1UbhPk0bJaHr/B5jkqC1xG6qTFofjG93wS1reTwE
 prLIyHaldqMUYx9xhC8wxaV83pU5krz4ghebF6Bq4MYcxoVAopvhgr4IaEnQxLMTMQXDx5B
 vQqfvy5gJTUZzLPNnunuwF1Ja510YUXSZVKPYPAyzGSRtjwLVUYbUbxkvCFCCiS2WUYClhr
 5NAR8HIGVQaSKakL/NIYg==
UI-OutboundReport: notjunk:1;M01:P0:BgHQaa3JKdg=;tzl74cji9GFzAGDP99H6KL+Bh43
 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
 Pjqc=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 15:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118082

* Add nilfs-utils to provide tools to work with the NILFS2 filesystem

* Tested with branch master

Signed-off-by: Michael Estner <michaelestner@web.de>
=2D--
 .../recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils=
_v2.2.11.bb

diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.1=
1.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
new file mode 100644
index 0000000000..507684a395
=2D-- /dev/null
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "nilfs-utils is a set of utilities for managing the NILFS fil=
esystem."
+HOMEPAGE =3D "https://nilfs.sourceforge.io/"
+
+LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D385034ac639a62b8415db9814582ee=
98"
+SRC_URI =3D "git://github.com/nilfs-dev/nilfs-utils.git;protocol=3Dhttps;=
branch=3Dv2.2.y;tag=3D${PV}"
+
+SRCREV =3D "507064bb3604d0fd88f5e3f6422d9ade73a26120"
+
+DEPENDS =3D "util-linux util-linux-libuuid"
+
+inherit autotools
=2D-=20
2.34.1


