Return-Path: <charles.perry@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E8ACDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 22:10:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.268807.1697580641165859081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 15:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=uo4Dcw9Q;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: charles.perry@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6D8A59C3240
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 18:10:40 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id JP-BPmTM7tiv; Tue, 17 Oct 2023 18:10:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AE83D9C3241;
	Tue, 17 Oct 2023 18:10:39 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AE83D9C3241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1697580639; bh=ajBB0A9W7M2UFlAe6SRUKIVdXHP1eot5ah6bwGXmFeY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uo4Dcw9QiwiCbq35b7FVh6VXuc1JNp37bfhbzcNbaaR3qKmHHt9agE3oRItMmB1KR
	 pC555PpABtIwUigpImR+UcbR07FuT29hPTkPPjnW4FlNrHvI2bOK/HhTJiZ1+XQLT+
	 L//x4my3al8pqxclEVQRiLJrwsko8zgHqS43VL+VX2x+KuGIPz/4mSOMTsaB6BD/7v
	 n+yKoGkBH+c8K1ZL2jtXnGEDi0qTVvljMhlqiePEhwwF1oyJ/n8XprBUQvUffFHCbY
	 Cam6L+cfhl8GgtmG9a8Rp7JBkWagxdeJGqg7b9optRr5lbJz/C2LbcnbVJsGtSKxCU
	 mjiKsbo7rnHTg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3MiO1ERohaYC; Tue, 17 Oct 2023 18:10:39 -0400 (EDT)
Received: from pcperry.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A03069C3240;
	Tue, 17 Oct 2023 18:10:39 -0400 (EDT)
From: Charles Perry <charles.perry@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Charles Perry <charles.perry@savoirfairelinux.com>
Subject: [meta-networking][PATCH 2/2] libexosip2: add recipe
Date: Tue, 17 Oct 2023 18:10:31 -0400
Message-Id: <20231017221031.2376761-2-charles.perry@savoirfairelinux.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231017221031.2376761-1-charles.perry@savoirfairelinux.com>
References: <20231017221031.2376761-1-charles.perry@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 22:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105561

libexosip2 extends the capabilities of the osip2 library. It can be a
useful building block for an embedded device application.

Signed-off-by: Charles Perry <charles.perry@savoirfairelinux.com>
---
 .../libexosip2/libexosip2_5.3.0.bb                | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-support/libexosip2/libexosip2=
_5.3.0.bb

diff --git a/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.=
bb b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
new file mode 100644
index 000000000..99a32fd4d
--- /dev/null
+++ b/meta-networking/recipes-support/libexosip2/libexosip2_5.3.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Extend  the  capability  of the oSIP library"
+DESCRIPTION =3D "eXosip is a GPL library that  extend  the  capability  =
of \
+the oSIP library. It aims  to  implement  a  simple  high \
+layer API to control SIP (rfc3261) for sessions establishements \
+and common extensions."
+HOMEPAGE =3D "http://savannah.gnu.org/projects/exosip"
+SECTION =3D "libs"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://src/eXosip.c;beginline=3D1;endline=3D32;md5=
=3Ddb3c08b79afd8f4d5e5dc8f0a5dc687e"
+DEPENDS =3D "libosip2"
+
+SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/exosip/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "5b7823986431ea5cedc9f095d6964ace966f093b2ae7d0b0=
8404788bfcebc9c2"
+
+inherit autotools pkgconfig
--=20
2.40.1


