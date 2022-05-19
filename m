Return-Path: <rustyhowell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9322C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 18:33:00 +0000 (UTC)
Subject: Minimal samba recipe
To: openembedded-devel@lists.openembedded.org
From: "Rusty Howell" <rustyhowell@gmail.com>
X-Originating-Location: Provo, Utah, US (136.36.195.213)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 May 2022 11:32:52 -0700
Message-ID: <VJUE.1652985172739004910.dX2F@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cGuBxXkkX8lWUBgXvLQt"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 18:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97204

--cGuBxXkkX8lWUBgXvLQt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Is there a way to use the existing samba recipe in meta-openembedded/meta-n=
etworking/recipes-connectivity/samba to create a minimal samba package?=C2=
=A0 Currently it seems to build (or cause to be built) nearly a hundred sam=
ba-related packages.=C2=A0=C2=A0 On our older build system, (not Yocto) we =
would just configure and build samba in our own way.=C2=A0 This included di=
sabling nearly all of the configure options, and then we would package just=
 the bare minimum (/etc/smb.conf, /etc/smbpasswd, =C2=A0 /usr/sbin/smbd, /u=
sr/sbin/nmbd) and that would work for us.

But we are moving to Yocto for our build system, and samba has been a strug=
gle. The current recipe builds a lot and creates dozens of packages. I have=
 tried using a .bbappend to set PACKAGECONFIG and also use EXTRA_OECMAKE, b=
ut are still a lot of packages that I don't think I need. The recipe itself=
 is rather complex and maybe what I'm asking for is not possible with the c=
urrent recipe.

I don't want to write my own the samba recipe, I want to use the one provid=
ed. But I'm don't know how to get the existing recipe to do what I want.

--cGuBxXkkX8lWUBgXvLQt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />Is there a way to use the existing samba recipe in meta-o=
penembedded/meta-networking/recipes-connectivity/samba to create a minimal =
samba package?&nbsp; Currently it seems to build (or cause to be built) nea=
rly a hundred samba-related packages.&nbsp;&nbsp; On our older build system=
, (not Yocto) we would just configure and build samba in our own way.&nbsp;=
 This included disabling nearly all of the configure options, and then we w=
ould package just the bare minimum (/etc/smb.conf, /etc/smbpasswd, &nbsp; /=
usr/sbin/smbd, /usr/sbin/nmbd) and that would work for us.<br /><br />But w=
e are moving to Yocto for our build system, and samba has been a struggle. =
The current recipe builds a lot and creates dozens of packages. I have trie=
d using a .bbappend to set PACKAGECONFIG and also use EXTRA_OECMAKE, but ar=
e still a lot of packages that I don't think I need. The recipe itself is r=
ather complex and maybe what I'm asking for is not possible with the curren=
t recipe.<br /><br />I don't want to write my own the samba recipe, I want =
to use the one provided. But I'm don't know how to get the existing recipe =
to do what I want.

--cGuBxXkkX8lWUBgXvLQt--

