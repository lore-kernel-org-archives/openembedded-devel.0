Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B469C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:13:07 +0000 (UTC)
Subject: Re: [[meta-oe][PATCH]aer-inject:add new recipe] [[meta-oe][PATCH]aer-inject:add new recipe]
To: openembedded-devel@lists.openembedded.org
From: "chenheyun" <chen_heyun@163.com>
X-Originating-Location: Chongqing, CN (119.86.40.242)
X-Originating-Platform: Windows Chrome 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Mar 2024 06:13:02 -0700
References: <CAMKF1srJ-hbp2fKy=XZOWiLYJQ_QPEc1f=hjAywaB6V94A4vXg@mail.gmail.com>
In-Reply-To: <CAMKF1srJ-hbp2fKy=XZOWiLYJQ_QPEc1f=hjAywaB6V94A4vXg@mail.gmail.com>
Message-ID: <8795.1711545182569472821@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lgTFC63gESJfDHKVD37k"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 13:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109643

--lgTFC63gESJfDHKVD37k
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi
i fix it in=C2=A0109642.like this:
"
LICENSE =3D "GPL-2.0-only"
+SECTION =3D "pcie/misc"
*+LICENSE =3D "GPL-2.0-only"*
+
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D25;endline=3D38;md5=3D643c=
2332ec702691a87ba6ea9499b2d6"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-i=
nject.git;protocol=3Dhttps;branch=3Dmaster \
+"
+SRCREV =3D "9bd5e2c7886fca72f139cd8402488a2235957d41"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "bison-native"
+
*+do_compile() {*
*+=C2=A0 =C2=A0 oe_runmake CFLAGS=3D"-Wall -D_GNU_SOURCE"*
*+}*

"
Thanks for the guidance=EF=BC=81

--lgTFC63gESJfDHKVD37k
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi<br />&nbsp; i fix it in&nbsp;109642.like this:<br />"<br />LICENSE =3D "=
GPL-2.0-only"<br />
<div>+SECTION =3D "pcie/misc"</div>
<div><strong>+LICENSE =3D "GPL-2.0-only"</strong></div>
<div>+</div>
<div>+LIC_FILES_CHKSUM =3D "file://README;beginline=3D25;endline=3D38;md5=
=3D643c2332ec702691a87ba6ea9499b2d6"</div>
<div>+</div>
<div>+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/=
aer-inject.git;protocol=3Dhttps;branch=3Dmaster \</div>
<div>+"</div>
<div>+SRCREV =3D "9bd5e2c7886fca72f139cd8402488a2235957d41"</div>
<div>+</div>
<div>+S =3D "${WORKDIR}/git"</div>
<div>+</div>
<div>+DEPENDS =3D "bison-native"</div>
<div>+</div>
<div><strong>+do_compile() {</strong></div>
<div><strong>+&nbsp; &nbsp; oe_runmake CFLAGS=3D"-Wall -D_GNU_SOURCE"</stro=
ng></div>
<div><strong>+}</strong></div>
<br />"<br /><span style=3D"white-space-collapse: preserve;">Thanks for the=
 guidance=EF=BC=81</span><br />

--lgTFC63gESJfDHKVD37k--

