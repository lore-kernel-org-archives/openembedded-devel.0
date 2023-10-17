Return-Path: <referme@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1214CCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 21:22:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by mx.groups.io with SMTP id smtpd.web10.268104.1697577724095187978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 14:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=referme@gmx.de header.s=s31663417 header.b=dN1vm992;
 spf=pass (domain: gmx.de, ip: 212.227.15.18, mailfrom: referme@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1697577722; x=1698182522; i=referme@gmx.de;
	bh=MDlUc1ZkYGLMtavjD5vQ2eV7MHXOwVhC80+8WEOP9/U=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=dN1vm992kgnOCmNlyY+haSRkPF0ZzQmDAqjNumtLVv0BqWDTbX4zonaBOpz/yqDl
	 vuRqloHSkk4S8xxYg0BV8ls/v/abGvB1nPKQHqahopCvj5W8XlLPHEDDLZtSfmuDr
	 9HBJt3MfmjKtw0WIAq3auJssawU7PgVt7riQxsNO8Dc0g68IHdjsjtuT815vzucVP
	 iIx9rkrkVOEBQfUWrjaZgqyID38eWmppKL/ltUaamy3lFHW3vXQ7ua8QdWEkemioM
	 1+bAcnJVTwJqeS9rs1yCFHu/Lk+NYbsYqAZ+kwwfdGoQ1lCCC96UsxEAMhbRGVC4X
	 8JIjxLmzVg/LkOI9JQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.179.37] ([82.207.253.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1qwgzg19zm-004ykO for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 23:22:02 +0200
Message-ID: <a1bdbf97-2b2e-42b9-b507-97719f3e7c5e@gmx.de>
Date: Tue, 17 Oct 2023 23:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
From: Martin Maurer <referme@gmx.de>
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.32.4 -> 1.34.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hwrdsov38+cmzxML/0gUC+8nDNOw6AFRqArpyIl3LNmq/t5nrI2
 UzD2y2tNfprpIBFCrWmgm8l9t401QEPZ+oXKfSwJUaZn3tXlvzDvB1JHhkeNRqf7Y2npjp1
 kk8twiRt/0nA1GyWOgQzZQQofIPugq4hXmZ4mvxhpsEmhJ2Fnx3JZIuK1IBwhsJwmRFkMDq
 69J5oTW+wAdaTO0v7+4Iw==
UI-OutboundReport: notjunk:1;M01:P0:gFip9+Gxwok=;N68olW1G8ORyVgrHGnGUWvX6IbF
 dPKFWtr/bnxjw2qwVgStk0LFlD7rXxyWhWchZua8WyAS/yBDc8MVmOpLU1qj852j0nVh26F+z
 0kMvcvryVvb83R1IR92sVPxACbQ59b8g3ZWKkkQ7NMwOja0ccbsbxVjDgGU059Ks9K9LLkXfW
 yD34zCRXsruvUIQw/jr47J2+V72MqT8hypHXRAdYSgW2i9UR6uIGmgptx9fo/kDnQKy3UF+jB
 aFmiyMTCaoGW8kfmrDe6czeRfZToc8YbyyFXBE29Euj64rspzisk12Y2GHOeB4Nro9EZPuJhz
 tOpwNMmq6TwkJQwbb3ENce4wAO3gvbOPNb6ZxGudaDGXiogyqdILyhEhRNGgoKjO56DZ2GQrI
 oya06Wfyi4R+o9kUvyaZjsEMNl41uquPU8wK2VWnwiR3laWskOQLwGpZvx1YJpLD8MdCBMSCb
 e8LSZjxsDgbJew5T9kY/wLkzOMKdCPn4OIFhA2PJ6T8CuYT2YrOBjmKRALZ3ARASkt9MOPoUK
 qqQFh8Cn6x7GQ21dOz9EYiYL7xGQyo3q4av2iCQ/NpiiyHGT2bnbBfqhr7/QCPW1hVLLZNlOr
 DnKHX2WIdaXw8jeo9xYGkU1/rQsbKY7RJU2MPsCVRWgzndqZbl3UTv7uR6ho5Wx2PcmhG2Isu
 p4f8Mtl4hQ098eM1a9hQbcs7nIFNiXTf9MvKppkfErabwTimtYacwrjQZY/3aD37SzLCwMoYq
 hYcdin6CJ6rohj5mIhx/pbWK0PVkEb3ApSITsDj5RQqZM6u+HcsvRX48PXXsYws2q89pbFgv7
 8XcL/ocvXIGbt9oBcqVz31Y9lHZPniq3H0mDNFovvlEqL/Ss6hOJbN95KHdXxxQz7CQtK9E62
 QgMPSIs5iSrXDtAiWqdEmFTOtCMUZVEis4xX4X0hVGfUKgpjjCr+tm5zCb8iwtPIuI8I4s2S6
 IQJmKELkNMWN/9TV/WJxigOu7MI=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 21:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105560

 From 17c6f7e968a6962f93b6c6d822c96bc2073aeae0 Mon Sep 17 00:00:00 2001
From: Martin Maurer<referme@gmx.de>
Date: Mon, 16 Oct 2023 14:00:39 +0200
Subject: [PATCH] libqmi: Upgrade 1.32.4 -> 1.34.0

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/1.34.0/NEWS

Signed-off-by: Martin Maurer<referme@gmx.de>
=2D--
  .../libqmi/{libqmi_1.32.4.bb =3D> libqmi_1.34.0.bb}             | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.32.4.bb =3D> libqmi=
_1.34.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.32.4.bb b/meta-o=
e/recipes-connectivity/libqmi/libqmi_1.34.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.32.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
index 7b7a3b2350a..2cb843a4af5 100644
=2D-- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.32.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
@@ -12,8 +12,8 @@ DEPENDS =3D "glib-2.0 glib-2.0-native"

  inherit meson pkgconfig bash-completion gobject-introspection

-SRCREV =3D "6e248aceb66f53b467b343bca1c467a8211dd30d"
-SRC_URI =3D"git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;prot=
ocol=3Dhttps;branch=3Dqmi-1-32"
+SRCREV =3D "3f07d6e5b4677558543b3b4484ea88ad92257e92"
+SRC_URI =3D"git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;prot=
ocol=3Dhttps;branch=3Dqmi-1-34"

  S =3D "${WORKDIR}/git"



