Return-Path: <charles.perry@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39005C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 22:10:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.268806.1697580640488455578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 15:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=RfT8OoDT;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: charles.perry@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5B2399C27A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 18:10:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id EOdnqSHcu3wt; Tue, 17 Oct 2023 18:10:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 776059C3240;
	Tue, 17 Oct 2023 18:10:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 776059C3240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1697580638; bh=P7tJx6W38qbcCmg5YERuc5/NS5VmO4D+Kp8/E7AXTbg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RfT8OoDTjb3CLPBmGkuvHktyfd/hayDbWKamXzmKu4wCtwWD+LUMpjbUIj6qHyUSJ
	 UUGeXSHMd4lbvQiBOq+PL9MVsfjPcOXuz54TRWsY9QdQgS2i1DOhLosJL25zrWjAwL
	 cCAoSiJnjzLyVNt1qGe/A+rETpx/6vtuKEVQq4ZgVbWCvkxekKogbaaWd1FmRwWyAp
	 4HSJDTJus2nF4hcYqyIiELgCwNPwhH40abAc8YRiIhp55c4cJDDqogjAEU8DX8TgH/
	 /0vxteMZ3Gp6WF2ZbNa3gDDjt3YI2eWA+Wmxb/SpL4JHAvuWKOWRQhPTSS+ietA+iX
	 B5RAieBJl67Qw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yjM0JPLweQpS; Tue, 17 Oct 2023 18:10:38 -0400 (EDT)
Received: from pcperry.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 60A429C27A3;
	Tue, 17 Oct 2023 18:10:38 -0400 (EDT)
From: Charles Perry <charles.perry@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Charles Perry <charles.perry@savoirfairelinux.com>
Subject: [meta-networking][PATCH 1/2] libosip2: add recipe
Date: Tue, 17 Oct 2023 18:10:30 -0400
Message-Id: <20231017221031.2376761-1-charles.perry@savoirfairelinux.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 22:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105562

The GNU oSIP library is an implementation of SIP - rfc3261. It can be a
useful building block for an embedded device application.

Signed-off-by: Charles Perry <charles.perry@savoirfairelinux.com>
---
Builds with poky and poky-tiny on qemux86-64.

 .../recipes-support/libosip2/libosip2_5.3.1.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-networking/recipes-support/libosip2/libosip2_5.3=
.1.bb

diff --git a/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb b=
/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
new file mode 100644
index 000000000..fa99d33e1
--- /dev/null
+++ b/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "The GNU oSIP library is an implementation of SIP - rfc3261"
+DESCRIPTION =3D "SIP stands for the Session Initiation Protocol and is d=
escribed \
+by the rfc3261 (wich deprecates rfc2543). This library aims to provide m=
ultimedia \
+and telecom software developers an easy and powerful interface to initia=
te and \
+control SIP based sessions in their applications. SIP is a open standard=
 \
+replacement from IETF for H323."
+HOMEPAGE =3D "http://www.gnu.org/software/osip/osip.html"
+SECTION =3D "libs"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://src/osip2/osip.c;beginline=3D1;endline=3D19=
;md5=3D22ca0da0e41276c50c81b733953c208d"
+
+SRC_URI =3D "${GNU_MIRROR}/osip/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "fe82fe841608266ac15a5c1118216da00c554d5006e2875a=
8ac3752b1e6adc79"
+
+inherit autotools
--=20
2.40.1


