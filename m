Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7428.1794562112934110150
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=rH6snUz1;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id B18DE4C01
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2V0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 16/16] libwacom: upgrade 2.19.1 -> 2.20.0
Date: Fri, 13 Nov 2026 10:27:31 +0100
Message-ID: <20261113092732.3895896-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562061-517F982B-0E5B4807/0/0 CLEAN NORMAL
X-TOI-MSGID: 2de3c442-86f2-466a-9188-d0bad808fec1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=iVJaxU++awxtImrZot7898KXs9i8569TBaeUi+f2978=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rH6snUz1W+bnNjYCM78mkOXW7tASPzey0YpSX66tu5C+1UeR6YVhMZkVZb2jsjPi/
	 jv2aufn9LJdphsYHamx3SUkfkU3TVukJUMJ+OeoGOmebvkLXOBRlMW/67bwOBn5/oZ
	 ReqKBKxmO5m7YlIb6CFKHn8vX/k2YT9k4bvOyzlxFQ9A38n14K1eXKh7kO7CUQkg8m
	 pJTeHfb/OiHUKeqQqXcJMA7bqqO3FqlOcfeZAQWEWnP75Oe2BUbkpa1r7fITATHAo0
	 xuLu+PIyxs83FxNLICui3Hof/+baZhlTEaLoajBGmQ085yqEnk8s5cYwtuIshnJOLr
	 KjISz4VGPyGYA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132238
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libwacom/{libwacom_2.19.1.bb =3D> libwacom_2.20.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.19.1.bb =3D> libw=
acom_2.20.0.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb b/met=
a-gnome/recipes-support/libwacom/libwacom_2.20.0.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.20.0.bb
index 4342f98a35..6068379da8 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.20.0.bb
@@ -8,7 +8,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D40a21fffb367c82f39fd91a3b137c=
36e"
=20
 SRC_URI =3D "git://github.com/linuxwacom/libwacom.git;branch=3Dmaster;pr=
otocol=3Dhttps;tag=3D${BP}"
-SRCREV =3D "8d904ebbbf879adacb8d59f7dde06eee2ed6ee80"
+SRCREV =3D "d4efe9342a6da4c9b8e288d29bc19b1140d93a36"
=20
 DEPENDS =3D " \
     libxml2-native \
--=20
2.56.0

