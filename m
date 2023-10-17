Return-Path: <referme@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E692ECDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 21:19:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web10.268038.1697577573292060532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 14:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=referme@gmx.de header.s=s31663417 header.b=i2/y+Dsy;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: referme@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697577571; x=1698182371; i=referme@gmx.de;
 bh=a5++txDNK/hXJhdktgGKwkEEm7br9Fg9aXA4AhhdpBM=;
 h=X-UI-Sender-Class:Date:Subject:References:To:From:In-Reply-To;
 b=i2/y+DsySjWnVpRRQAuG4X4zxHah1tHfTKmKZvyYEx2tZakfbMJ+GyxoHioaOpl8hUqTIVqdJZx
 QGf7yHvTu2IIYm4H+Taqp2sAKUaJ22Suw1cWhcT30z8h71JWU2SGnrczAQFdcBssAOgpHCA743Vim
 b/UmisjmRnDxYazvs/ELmVqgxXh7wIrsO7leeOISlprzRB6pxV++eyfm4ZQ1MMUwA6BjT7cwLjF3L
 Y3FAbKzUOsxhEl2VNRiqYxz0fOit4frZfW7kfK8qKxuLvBtnn+OaZ767U4HKI209nwwahA/RQWLwl
 4Fb3ad5NWuvIeqdW/k4nUrDqd+LPTgNX8Vow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.179.37] ([82.207.253.147]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1rJMeY1RoX-00iRxE for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 23:19:31 +0200
Content-Type: multipart/alternative;
 boundary="------------HeFRrOmtnzCWadCO5eVK9ChL"
Message-ID: <02551277-c2d7-4a92-8a7d-bf89276068f3@gmx.de>
Date: Tue, 17 Oct 2023 23:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.32.4 -> 1.34.0
References: <1781aa98-f8f0-475e-b6bb-2ec00aa2c23a@gmx.de>
To: openembedded-devel@lists.openembedded.org
From: Martin Maurer <referme@gmx.de>
In-Reply-To: <1781aa98-f8f0-475e-b6bb-2ec00aa2c23a@gmx.de>
X-Forwarded-Message-Id: <1781aa98-f8f0-475e-b6bb-2ec00aa2c23a@gmx.de>
X-Provags-ID: V03:K1:Q5hY+4+l/zMQyd88NMHAOHe8Eu9LSJ6KLiHuTuROzBGqXhFrEpB
 hmhzO1n3Ifz6ZxmXH+BxrZNxJCt5aW9j34Wm/PMHisfG0POlovyVARxY5sR3U/118K6u9Sx
 jhtnyH6jUi7wu/em3oNohx89PZ4C/52Zui2ARjc0KuEJa5I2tHNXeOtuxugG0wr/YiJEy3+
 s5BOdDOJFvqCkJ1mYGk6g==
UI-OutboundReport: notjunk:1;M01:P0:6ODuCKKG5Mk=;VQENKgbR2sy5b+n1vt16jmbZ1TN
 Bj4RTv0J5ohM9eUFJqFE3bYjgTOLcl461qe+LqPz4e+FaV124VpjQ/T+iUYioOKQL9hrJn8Iw
 lTEHRFutPAQV+YK70zyRKYfggMJyke3iZk6RxDr4bHBsJCWJbxhZo0GzsqbklcD5FQ59iPU5W
 65jNFRDL5qTCOxBKRIf91IqjZ1CKcnzm3nmE07w0GAmr9jifNY/ixJwCF7jiNMPlb+ICq6Zg4
 8m9D3XmoR73XhGhvADKTAJW9bP4WvVJvzpXnuJ17lb4u4NtEhGZQ+B91j2tQLdkWgAW5xaBtu
 DA7wGsb7yyH1aUJWkUTsdoVZDJgaLnRJF5e31JqDoi11+KjBvYBUtJ5IqS0R+90Yk7AGCaX75
 I6eZpkaSCbsJHmS9d7uHjgkPQZardTLqqkWMID70+7G6XFKF6+AUsr+Bso13TxKWLtkZCH5F2
 xgvmlv69b6MhuZm9Nw8vQaXZMCCqnhxgqqCjcUUXkbk3ZPVEFIZvZEp3I/V+zESPzbLF25S8f
 7TCTwgKHFiWd0oH+0jDdxuLs/DQvCWcVequ9/Nl2juKI6l5fF4PpZz1zcUv2m5N4GgsdXLh+j
 bH1xCDqatdv1EDeor+7HLIlF5ZhaG8x1aaNPeU9cc1V3Iz97Dgjg2LxLXqKfQTcRMgPy6hvgg
 0wBDLGI5emb0Ll6LLbT8zd5NJ1yDznOsFYCQdaPB0bR4tIiQ05QzcubBrGe6IgHO7BwakvfaH
 aEe/ATKumhrHtDRz2JIQvwFYmWDBVQkPOXTJB9oYdjHekrhB2lo149GmQZGHxyDzC9yQtCaLd
 Mki7OddUaN5mho48XkTJVotUc8QJmXTk2RT5ZWm5kZDY+hsBPFlxxcSUx3LRSbPRYVUWdMwdK
 vfLrfKcAdmOhQ1IwSmyHj1VY1+bGpE4PDiioKDKWVR0u+2MalnzXnKOpyjVZQBEAtsI9dBm3l
 BFNHEoB6fVzENp7tHa6WHINCFjw=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 21:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105559

This is a multi-part message in MIME format.
--------------HeFRrOmtnzCWadCO5eVK9ChL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

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


--------------HeFRrOmtnzCWadCO5eVK9ChL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    From 17c6f7e968a6962f93b6c6d822c96bc2073aeae0 Mon Sep 17 00:00:00
    2001
    <div class=3D"moz-forward-container">
      <pre>From: Martin Maurer <a class=3D"moz-txt-link-rfc2396E"
      href=3D"mailto:referme@gmx.de" moz-do-not-send=3D"true">&lt;referme@=
gmx.de&gt;</a>
Date: Mon, 16 Oct 2023 14:00:39 +0200
Subject: [PATCH] libqmi: Upgrade 1.32.4 -&gt; 1.34.0

Changelog:
<a class=3D"moz-txt-link-freetext"
href=3D"https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/blob/1.34=
.0/NEWS"
      moz-do-not-send=3D"true">https://gitlab.freedesktop.org/mobile-broad=
band/libqmi/-/blob/1.34.0/NEWS</a>

Signed-off-by: Martin Maurer <a class=3D"moz-txt-link-rfc2396E"
      href=3D"mailto:referme@gmx.de" moz-do-not-send=3D"true">&lt;referme@=
gmx.de&gt;</a>
=2D--
 .../libqmi/{libqmi_1.32.4.bb =3D&gt; libqmi_1.34.0.bb}             | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.32.4.bb =3D&gt; libq=
mi_1.34.0.bb} (91%)

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
-SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E"
href=3D"git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=
=3Dhttps;branch=3Dqmi-1-32"
      moz-do-not-send=3D"true">"git://gitlab.freedesktop.org/mobile-broadb=
and/libqmi.git;protocol=3Dhttps;branch=3Dqmi-1-32"</a>
+SRCREV =3D "3f07d6e5b4677558543b3b4484ea88ad92257e92"
+SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E"
href=3D"git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=
=3Dhttps;branch=3Dqmi-1-34"
      moz-do-not-send=3D"true">"git://gitlab.freedesktop.org/mobile-broadb=
and/libqmi.git;protocol=3Dhttps;branch=3Dqmi-1-34"</a>

 S =3D "${WORKDIR}/git"

</pre>
    </div>
  </body>
</html>

--------------HeFRrOmtnzCWadCO5eVK9ChL--

