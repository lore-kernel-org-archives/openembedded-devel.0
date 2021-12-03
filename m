Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A5FC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 03:28:56 +0000 (UTC)
Subject: Unable to build image with qt examples
To: openembedded-devel@lists.openembedded.org
From: "Ankur Tyagi" <ankur.tyagi85@gmail.com>
X-Originating-Location: Auckland, NZ (203.211.77.44)
X-Originating-Platform: Windows Firefox 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 02 Dec 2021 19:28:38 -0800
Message-ID: <Iv8X.1638502118949323637.J1Lz@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="N8hG8gLB3ffsJfKTgUr0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 03:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94189

--N8hG8gLB3ffsJfKTgUr0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using dunfell branch and trying to include qtbase-examples, qtdeclarat=
ive-examples, qtquickcontrols2-examples in the image by adding following to=
 the packagegroup:

QT5_EXAMPLES =3D " \
qtbase-examples \
qtdeclarative-examples \
qtquickcontrols2-examples \
"
but during image creation I am getting following error:

Error:
Problem 1: conflicting requests
- nothing provides qtdeclarative-examples needed by packagegroup-qt5-1.0-r0=
.noarch
Problem 2: conflicting requests
- nothing provides qtquickcontrols2-examples needed by packagegroup-qt5-exa=
mples-1.0-r0.noarch
(try to add '--skip-broken' to skip uninstallable packages or '--nobest' to=
 use not only best candidate packages)

But checking qtdeclarative and qtquickcontrols2 recipes, they do provide th=
is package:

ankur@pc:~/build $ bitbake -e qtquickcontrols2 | grep ^PACKAGES=3D
PACKAGES=3D"qtquickcontrols2-qmldesigner qtquickcontrols2-qmlplugins qtquic=
kcontrols2-tools qtquickcontrols2-plugins qtquickcontrols2-mkspecs qtquickc=
ontrols2-examples qtquickcontrols2-src qtquickcontrols2-dbg qtquickcontrols=
2-staticdev qtquickcontrols2-dev qtquickcontrols2-doc qtquickcontrols2-loca=
le=C2=A0 qtquickcontrols2"

ankur@pc:~/build $ bitbake -e qtdeclarative | grep ^PACKAGES=3D
PACKAGES=3D"qtdeclarative-ptest qtdeclarative-qmldesigner qtdeclarative-qml=
plugins qtdeclarative-tools qtdeclarative-plugins qtdeclarative-mkspecs qtd=
eclarative-examples qtdeclarative-src qtdeclarative-dbg qtdeclarative-stati=
cdev qtdeclarative-dev qtdeclarative-doc qtdeclarative-locale=C2=A0 qtdecla=
rative"

What am I missing here?

thanks
Ankur

--N8hG8gLB3ffsJfKTgUr0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I am using dunfell branch and trying to include qtbase-examp=
les, qtdeclarative-examples, qtquickcontrols2-examples in the image by addi=
ng following to the packagegroup:<br /><br />QT5_EXAMPLES =3D " \<br />&nbs=
p;&nbsp; &nbsp;qtbase-examples \<br />&nbsp;&nbsp; &nbsp;qtdeclarative-exam=
ples \<br />&nbsp;&nbsp; &nbsp;qtquickcontrols2-examples \<br />"<br />but =
during image creation I am getting following error:<br /><br />Error: <br /=
>&nbsp;Problem 1: conflicting requests<br />&nbsp; - nothing provides qtdec=
larative-examples needed by packagegroup-qt5-1.0-r0.noarch<br />&nbsp;Probl=
em 2: conflicting requests<br />&nbsp; - nothing provides qtquickcontrols2-=
examples needed by packagegroup-qt5-examples-1.0-r0.noarch<br />(try to add=
 '--skip-broken' to skip uninstallable packages or '--nobest' to use not on=
ly best candidate packages)<br /><br /><br />But checking qtdeclarative and=
 qtquickcontrols2 recipes, they do provide this package:<br /><br />ankur@p=
c:~/build $ bitbake -e qtquickcontrols2 | grep ^PACKAGES=3D<br />PACKAGES=
=3D"qtquickcontrols2-qmldesigner qtquickcontrols2-qmlplugins qtquickcontrol=
s2-tools qtquickcontrols2-plugins qtquickcontrols2-mkspecs qtquickcontrols2=
-examples qtquickcontrols2-src qtquickcontrols2-dbg qtquickcontrols2-static=
dev qtquickcontrols2-dev qtquickcontrols2-doc qtquickcontrols2-locale&nbsp;=
 qtquickcontrols2"<br /><br />ankur@pc:~/build $ bitbake -e qtdeclarative |=
 grep ^PACKAGES=3D<br />PACKAGES=3D"qtdeclarative-ptest qtdeclarative-qmlde=
signer qtdeclarative-qmlplugins qtdeclarative-tools qtdeclarative-plugins q=
tdeclarative-mkspecs qtdeclarative-examples qtdeclarative-src qtdeclarative=
-dbg qtdeclarative-staticdev qtdeclarative-dev qtdeclarative-doc qtdeclarat=
ive-locale&nbsp; qtdeclarative"<br /><br />What am I missing here?<br /><br=
 />thanks<br />Ankur

--N8hG8gLB3ffsJfKTgUr0--

