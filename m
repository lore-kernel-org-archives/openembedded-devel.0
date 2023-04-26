Return-Path: <dev@loewen-email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C110C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 10:19:08 +0000 (UTC)
Subject: [meta-oe] sharutils: Build error
To: openembedded-devel@lists.openembedded.org
From: dev@loewen-email.de
X-Originating-Location: Trondheim, Trøndelag, NO (195.1.58.114)
X-Originating-Platform: Mac Safari 16.1
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Apr 2023 03:19:05 -0700
Message-ID: <wgQe.1682504345848324808.V9RJ@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TiVHrHgXdq6JMnzjNmY2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 10:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102195

--TiVHrHgXdq6JMnzjNmY2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, I found a bug when building sharutils-native:

>=20
> | ../../sharutils-4.15.2/lib/fseeko.c: In function =E2=80=98rpl_fseeko=E2=
=80=99:
> | ../../sharutils-4.15.2/lib/fseeko.c:110:4: error: #error "Please port
> gnulib fseeko.c to your platform! Look at the code in fseeko.c, then
> report this to bug-gnulib."
> | =C2=A0 110 | =C2=A0 #error "Please port gnulib fseeko.c to your platfor=
m! Look at
> the code in fseeko.c, then report this to bug-gnulib."
> | =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0^~~~~
> | make[4]: *** [Makefile:1598: fseeko.o] Error 1
>=20

The bug is known and there are patches available in Debian and other distri=
butions.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D915173

Looking at the patch that is used in debian, it states it was introduced in=
 debian with glibc 2.28.

I saw this bug in mickledore, but also in honister, which makes sense since=
 honister uses glibc 2.34.
The strange thing is more that it seemed to work in my honister setup befor=
e. I lately updated the build machine from Ubuntu 18.04 to Ubuntu 22.04. Th=
en, the build still worked, but after deleting the sstate cache, it did not=
 build again and failed with the error above. So, seemingly, somehow it see=
med to build before with the same meta data. So one question is why it actu=
ally worked before. My best guess is somehow that the host glibc might have=
 been taken into the build, since Ubuntu 18.04 uses glibc 2.27, but as said=
, that is only a guess.

Looking forward, I testet two different strategies that both seemed to work=
:

1) Adding a pre-configure step
Inspired by https://www.linuxfromscratch.org/blfs/view/svn/general/sharutil=
s.html, I added the following lines to the bb file:

>=20
> do_configure:prepend() {
> sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' ${WORKDIR}/${BPN}-${PV}/lib/*.c =
=C2=A0=20
> &&
> echo "#define _IO_IN_BACKUP 0x100" >>
> ${WORKDIR}/${BPN}-${PV}/lib/stdio-impl.h &&
> }
>=20

2) Adding the debian patch
As a better option, I added the patch from debian to the recipe in my setup=
 and it built as well with that.
The patch can be found here: https://sources.debian.org/patches/sharutils/1=
:4.15.2-5/02-fix-ftbfs-with-glibc-2.28.patch/

The second option seems like a good solution, but I think it should be repr=
oduced and verified by someone else as well. Also, I don't have knowledge r=
egarding licenses etc when it comes to posting patches from other distros t=
o OE, so it would be nice if someone else could port the patch to OE.

--TiVHrHgXdq6JMnzjNmY2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, I found a bug when building sharutils-native:</div>
<div>&nbsp;</div>
<blockquote>
<div>
<div>| ../../sharutils-4.15.2/lib/fseeko.c: In function &lsquo;rpl_fseeko&r=
squo;:</div>
<div>| ../../sharutils-4.15.2/lib/fseeko.c:110:4: error: #error "Please por=
t gnulib fseeko.c to your platform! Look at the code in fseeko.c, then repo=
rt this to bug-gnulib."</div>
<div>| &nbsp; 110 | &nbsp; #error "Please port gnulib fseeko.c to your plat=
form! Look at the code in fseeko.c, then report this to bug-gnulib."</div>
<div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;^~~~~</div>
<div>| make[4]: *** [Makefile:1598: fseeko.o] Error 1</div>
</div>
</blockquote>
<div>&nbsp;</div>
<div>The bug is known and there are patches available in Debian and other d=
istributions.</div>
<div>&nbsp;</div>
<div>https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D915173</div>
<div>&nbsp;</div>
<div>Looking at the patch that is used in debian, it states it was introduc=
ed in debian with glibc 2.28.</div>
<div>&nbsp;</div>
<div>I saw this bug in mickledore, but also in honister, which makes sense =
since honister uses glibc 2.34.</div>
<div>The strange thing is more that it seemed to work in my honister setup =
before. I lately updated the build machine from Ubuntu 18.04 to Ubuntu 22.0=
4. Then, the build still worked, but after deleting the sstate cache, it di=
d not build again and failed with the error above. So, seemingly, somehow i=
t seemed to build before with the same meta data. So one question is why it=
 actually worked before. My best guess is somehow that the host glibc might=
 have been taken into the build, since Ubuntu 18.04 uses glibc 2.27, but as=
 said, that is only a guess.</div>
<div>&nbsp;</div>
<div>Looking forward, I testet two different strategies that both seemed to=
 work:</div>
<div>&nbsp;</div>
<div>1) Adding a pre-configure step</div>
<div>Inspired by https://www.linuxfromscratch.org/blfs/view/svn/general/sha=
rutils.html, I added the following lines to the bb file:</div>
<div>&nbsp;</div>
<blockquote>
<div>do_configure:prepend() {</div>
<div>&nbsp; &nbsp; sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' ${WORKDIR}/${BPN=
}-${PV}/lib/*.c &nbsp; &nbsp; &nbsp; &nbsp;&amp;&amp;</div>
<div>&nbsp; &nbsp; echo "#define _IO_IN_BACKUP 0x100" &gt;&gt; ${WORKDIR}/$=
{BPN}-${PV}/lib/stdio-impl.h &amp;&amp;</div>
<div>}</div>
</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>2) Adding the debian patch</div>
<div>As a better option, I added the patch from debian to the recipe in my =
setup and it built as well with that.</div>
<div>The patch can be found here: https://sources.debian.org/patches/sharut=
ils/1:4.15.2-5/02-fix-ftbfs-with-glibc-2.28.patch/</div>
<div>&nbsp;</div>
<div>The second option seems like a good solution, but I think it should be=
 reproduced and verified by someone else as well. Also, I don't have knowle=
dge regarding licenses etc when it comes to posting patches from other dist=
ros to OE, so it would be nice if someone else could port the patch to OE.<=
br /><br /></div>

--TiVHrHgXdq6JMnzjNmY2--

