Return-Path: <konstantin.kletschke@inside-m2m.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5089C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 20:12:20 +0000 (UTC)
Received: from mail.inside-m2m.de (mail.inside-m2m.de [188.68.57.244])
 by mx.groups.io with SMTP id smtpd.web10.18877.1646597537779453885
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 12:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@inside-m2m.de
 header.s=default header.b=e1mRGCOl;
 spf=pass (domain: inside-m2m.de, ip: 188.68.57.244,
 mailfrom: konstantin.kletschke@inside-m2m.de)
Received: from localhost (localhost [127.0.0.1])
	by mail.inside-m2m.de (Postfix) with ESMTP id 94E3540145
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  6 Mar 2022 21:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=inside-m2m.de;
	s=default; t=1646597534;
	bh=4mt5Usb0KQyfcOhoMpbC9yV/agqpu4+Lx3irRK0Sz+4=;
	h=Date:From:To:Subject:From;
	b=e1mRGCOl3eoJuqC/+YzCKUBVcdfAZGeDCOQ4OyirL4AMXP3vbZDN6N2OiplzJCmJy
	 aNCOP6CoulqWH/tTS1Rw/7t+gyAzUUkqILTpDJFKmvKmBOd4p2qtOgais8E/xuT5nN
	 Iu1N6D1wzTvwcdByT8UekOqzMwgtExsKXNxpGK46mp/2OQje6wymtZCP3UeqNpPFKq
	 XOnRI3l81QMwG71uLRYo9uFcHRCYhmer8Sg2FywozCcfi7CISuVs2hbgz2+Sw70BU9
	 F8/9Kdxlzkp5aaYHPv1CEI3+u1BbIl0B0RZDw/HCBQ8GhloemLEkWWlV5kL/tYb1mn
	 MKtuJ+hy3TxXQ==
X-Virus-Scanned: Debian amavisd-new at mail.inside-m2m.de
Received: from mail.inside-m2m.de ([127.0.0.1])
	by localhost (mail.inside-m2m.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7bUJxtSmY6k
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Mar 2022 21:12:14 +0100 (CET)
Received: from Hephaistos (unknown [94.31.102.219])
	(Authenticated sender: konstantin.kletschke@inside-m2m.de)
	by mail.inside-m2m.de (Postfix) with ESMTPSA id E6BC6400E8
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  6 Mar 2022 21:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=inside-m2m.de;
	s=default; t=1646597533;
	bh=4mt5Usb0KQyfcOhoMpbC9yV/agqpu4+Lx3irRK0Sz+4=;
	h=Date:From:To:Subject:From;
	b=BcnWZZyyJKtOmNPzbbs8xr86tinQ7lAez6pNTJu4vVWp1tc9p2ycqlATubJ5vjtp7
	 NqIa6CecZPaR4RFqfCYz7FvW5BMZyDEZKp34l/CzBKl/0WkuM7yyjs/EXGUmhWgG8j
	 3B4DKlPQyqAdHRf9wm4z2w3DXZTAOBkESqeU5zdua+ennwRT+6ZSX9qocebgrc/yh3
	 8zPBK+v4Was8rBbNyLcvQ2cIxYD21z2NSeaczR6dwcpSi3i8+RpFvNXssJ8zx3/vNN
	 h6GBc7IZEuUayVuxPBIpzapnzltpsMj4oXfm6TzvB2+AIVUQQGmIvChB/FdXkcM6KY
	 A1uVoRrDg0Wtw==
Date: Sun, 6 Mar 2022 21:12:12 +0100
From: Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] openjre-14 from branch g0hl1n/jdk14 in honister,
 autoreconf fails
Message-ID: <YiUVnNpno1GbqzIO@Hephaistos>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 20:12:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95821

Dear Community,

last year I got great help and support to make the openjre-14 compile in
my yocto installation. There was a patch announced which was required
for openjre-8 which I found out also worked to make openjre14 finish. It
was prepared in the g0hl1n/jdk14 branch.

See here:

https://lists.openembedded.org/g/openembedded-devel/topic/81416935#90186

Now I updated to honister and was facing the work needed for the new
override syntax and I really wanted to prepare this and commit a nice
looking patch this time to get this integrated (last year I forgot to
keep track or to do so).

While the new override syntax was not overly problematic, the autoreconf
again is not happy, may be it was updated with honister.

The Problem is, I have not a good Idea and knowledge on how to deal with
this m4/auto* stuff. Does somebody have an educated gues, what's going
on here?

| AUTOV is 1.16
| NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/home/konsti/yocto/=
build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/re=
cipe-sysroot/usr/share/aclocal/ --automake-acdir=3D/home/konsti/yocto/bui=
ld/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/recip=
e-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --i=
nstall --force --exclude=3Dautopoint --exclude=3Dgtkdocize -I /home/konst=
i/yocto/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0=
.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/ -I /home/konsti/yocto/build/tmp=
/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/jdk14u-jdk-=
14.0.1-ga/make/autoconf/build-aux/ -I /home/konsti/yocto/build/tmp/work/c=
ortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/recipe-sysroot-nat=
ive/usr/share/aclocal/
| autoreconf: export WARNINGS=3Dcross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=3D/home/konsti/yocto/build/=
tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/recipe-s=
ysroot/usr/share/aclocal/ --automake-acdir=3D/home/konsti/yocto/build/tmp=
/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/recipe-sysr=
oot-native/usr/share/aclocal-1.16 -I /home/konsti/yocto/build/tmp/work/co=
rtexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/jdk14u-jdk-14.0.1-g=
a/make/autoconf/ -I /home/konsti/yocto/build/tmp/work/cortexa8hf-neon-pok=
y-linux-gnueabi/openjdk-14/14.0.1-r0/jdk14u-jdk-14.0.1-ga/make/autoconf/b=
uild-aux/ -I /home/konsti/yocto/build/tmp/work/cortexa8hf-neon-poky-linux=
-gnueabi/openjdk-14/14.0.1-r0/recipe-sysroot-native/usr/share/aclocal/ --=
force
| basics.m4:52: warning: underquoted definition of $1
| basics.m4:52:   run info Automake 'Extending aclocal'
| basics.m4:52:   or see https://www.gnu.org/software/automake/manual/aut=
omake.html#Extending-aclocal
| Use of uninitialized value $1 in quotemeta at (eval 14) line 497.
| autoreconf: error: aclocal failed with exit status: 2
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/konsti/yocto/meta-insidem2m/recipes-core/openjre/openj=
dk-14_14.0.1.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1616 tasks of which 1609 didn't need to be=
 rerun and 1 failed.

Summary: 1 task failed:
  /home/konsti/yocto/meta-insidem2m/recipes-core/openjre/openjdk-14_14.0.=
1.bb:do_configure
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.

There is a file=20
build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/openjdk-14/14.0.1-r0/jd=
k14u-jdk-14.0.1-ga/make/autoconf/basics.m4
looking like this:

[...]
  10
   9       # First remove it from the list of overridden variables, so we=
 can test
   8       # for unknown variables in the end.
   7       CONFIGURE_OVERRIDDEN_VARIABLES=3D"$try_remove_var"
   6
   5       tool_override=3D[$]$1
   4       AC_MSG_NOTICE([User supplied override $1=3D"$tool_override"])
   3
   2       # Check if we try to supply an empty value
   1       if test "x$tool_override" =3D x; then
497          AC_MSG_CHECKING([for $1])
   1         AC_MSG_RESULT([disabled])
   2       else
   3         # Split up override in command part and argument part
   4         tool_and_args=3D($tool_override)
   5         [ tool_command=3D${tool_and_args[0]} ]
   6         [ unset 'tool_and_args[0]' ]
   7         [ tool_args=3D${tool_and_args[@]} ]
   8
   9         # Check if the provided tool contains a complete path.
  10         tool_basename=3D"${tool_command##*/}"
[...]


Kind Regards
Konstantin




--=20
INSIDE M2M GmbH
Konstantin Kletschke
Berenbosteler Stra=DFe 76 B
30823 Garbsen

Telefon: +49 (0) 5137 90950136
Mobil: +49 (0) 151 15256238
Fax: +49 (0) 5137 9095010

konstantin.kletschke@inside-m2m.de
http://www.inside-m2m.de=20

Gesch=E4ftsf=FChrung: Michael Emmert, Ingo Haase, Dr. Fred K=F6nemann, De=
rek Uhlig
HRB: 111204, AG Hannover


