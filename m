Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E3DC2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:25:55 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by mx.groups.io with SMTP id smtpd.web11.13748.1700331950020821550
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=Ns9OLRXw;
 spf=pass (domain: web.de, ip: 212.227.15.3, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700331948; x=1700936748; i=jan.claussen10@web.de;
	bh=/9gPPbu0gsqS8HAHGcx2uMMe7arPwHiFTnGnDQTISWI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=Ns9OLRXw+J8/ZHmnZmXuDfPEaRixVH7BxZ4uF+3Te9tra6MUe1owfVEMkY2SPHfr
	 Hx/QoKXzn0lRnyq90avXd/IxYbAkSTWR5/4+THot5HstM6H21h4Skku7RbmegocDy
	 T+IL5fCJEa6Zbh7HKvzDzHLjGdbsI44khoI5JtbSUF2QwwHobFiqNdg5ivKjHhoGl
	 85dvXNu/ZduLrbVlCgKy5gq/ES6aLvnOOwwKaMg5EbYBdsSWgS8gm7oJF1ZJ+67Tz
	 pDwp70AxYFZLGQL9uX/BVgDG7xdZAOoI9iW7nEQ5oPyCgGnl8lEiIcZlarT0HxK3H
	 3JJ27RGrpKIV2oKRKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost ([195.123.103.85]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1qg2TN0C0f-00OkCo; Sat, 18
 Nov 2023 19:25:48 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [PATCH] meta-oe: recipes-support: Add btop
Date: Sat, 18 Nov 2023 19:25:42 +0100
Message-ID: <20231118182542.3237409-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fb7dqv60fU5GqN9tZ7RZ1Pf4aH60Tosgx6+zMUScdpH77750ikR
 VRnf6VTDxZKLyf/QastcyKkTv8gObeXcYenroIC7gM2oGH2QmrUdWPYrkYzdb4vPkRDM9Kl
 LtTRhtP/TzvbVDhg9bkyj9dvddWeLhKuh0Ml6Xkq0CuHy9TIzikicMAlep0Wan0yGjB7hix
 0Plx7IAfdVBoURGqtPm5g==
UI-OutboundReport: notjunk:1;M01:P0:t8t5J208AOo=;4aX/QU+dDPZIxmIBzCmhvJIVGni
 dV0XZXsWAPtqZnPRUZKjwKl6J1OUrv/CuQkyRLVhPvtcQ2finumsanGCf+Oqn5HuBRtWopr6S
 X1eRT349k8RxdK666OolVZLHgvsZNIgy6ksgwIA5c55ZfmBzDIQdaUuQZtl3NCX0z7dhP5qtf
 ZMiB8Z2j2WCplwmDqby8tyEe8W2A5J9UQOJYDtosKOJYE8F/sqxZdBk6q1xJihGRTfwUqhbuI
 5ROMo/71jm6xf5DhV0Wx3l6acAt3YiETlIXlA5cj12dfv3ovSDo4YOocCVqPzyXbxEJHoH6ZS
 pCGWN9REQCU/hUn2U9G5TeWZ5oxFJNCSx94L4aPV+t4W4yuzpoXTFXFXE99WLPqz19esIw3Im
 ombMN60jC2xG2iIF2iODN5GeUSoi9V38I68WO7yV/GL0cJDvrri7R4lrmrD4rYi9vGO7hAsTI
 6WysKStgZ1+RiKEPCCqzDwRlZZbI9ZeDSzeDgWIIgVcoQ+DvidfDNLD3Kqp2vat5igW7tn6ca
 6tM5nFiGMpwzVrG1K0sDgNiN/znWAZ+SHkkF9kNWDoeQASC3pugUEWs9F6qxTKrYdk/Rzm0Pu
 JGqC72XRdG6pKT28O8JL61xCry46w3djfGjxm5OU81nNOILnlnCNtThphkzcBaClS6MhyrnKj
 fufOe0Mro1eZjzh6syQDkPIismLxl93PeEVD5OoCygjXkVlVHF55YKIw9g8U/mH+sB1xDxw1F
 IzHJeGMqo/xNami/e4HrRmjahSeNm0bnNeh0BoEgrXr6n136PbDReo7411+ZGJAdTMZGTnkjH
 wmVaen2IhK7yr5AXeEVmlCqsuPFZyG80HwREiXvDAljqP/zl9IQ0gl9N0bQ5YdY2zaeXWU8xb
 lpxaEE9KndepXE/svhVZOaOmaRXj14RhIHX1kt5PG2blQmdGJ949BLKU0rSoM0QDjf9Bhtnnz
 N1qS1OPvL0AhuD+7P7NXpp/76gQ=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106889

Adds btop, the shell-based resource monitor that shows usage and stats for=
 processor, memory, disks, network and processes.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb

diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes=
-support/btop/btop_1.2.13.bb
new file mode 100644
index 000000000..a944fe7b5
=2D-- /dev/null
+++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Resource monitor that shows usage and stats for processor, m=
emory, disks, network and processes."
+HOMEPAGE =3D "https://github.com/aristocratos/btop"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57"
+SECTION =3D "console/utils"
+
+SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bran=
ch=3Dmain"
+SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN} +=3D " \
+    ${datadir}/icons \
+    ${datadir}/icons/hicolor \
+    ${datadir}/icons/hicolor/48x48 \
+    ${datadir}/icons/hicolor/scalable \
+    ${datadir}/icons/hicolor/48x48/apps \
+    ${datadir}/icons/hicolor/48x48/apps/btop.png \
+    ${datadir}/icons/hicolor/scalable/apps \
+    ${datadir}/icons/hicolor/scalable/apps/btop.svg \
+"
=2D-
2.42.1


