Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LmDqI-00025d-RV
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 22:07:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id EC96750277F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 18:11:46 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gK-lS-A0kc+W
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 18:11:42 -0300 (BRT)
Received: from [192.168.15.91] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 82C80502762C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 18:11:40 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>
References: <1236890935.6250.26.camel@northpole>
	<1237220171.4020.4.camel@faraday>
	<be7a9f3d0903161800i3f6735c8u7eafe009f2cb0b88@mail.gmail.com>
Organization: 2MI Tecnologia
Date: Tue, 24 Mar 2009 18:05:39 -0300
Message-Id: <1237928739.20348.3.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: calibrateproto git tag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Mar 2009 21:07:29 -0000
X-Groupsio-MsgNum: 8678
Content-Type: multipart/mixed; boundary="=-ogpF/9/w6L8Up4LfU3x+"

--=-ogpF/9/w6L8Up4LfU3x+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em Seg, 2009-03-16 =C3=A0s 22:00 -0300, Otavio Salvador escreveu:
> 2009/3/16 Marcos Amorim <marcos@2mi.com.br>:
> > libxcalibrate_git add tag
> >
> >
> > git diff packages/xorg-lib/libxcalibrate_git.bb
> > diff --git a/packages/xorg-lib/libxcalibrate_git.bb
> > b/packages/xorg-lib/libxcalibrate_git.bb
> > index f9e1587..7f889df 100644
> > --- a/packages/xorg-lib/libxcalibrate_git.bb
> > +++ b/packages/xorg-lib/libxcalibrate_git.bb
> > @@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 calibrateproto libxext"
> >  PV =3D "0.0+gitr${SRCREV}"
> >  PE =3D "1"
> >
> > -SRC_URI =3D
> > "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3D=
git"
> > +SRC_URI =3D
> > "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3D=
git;tag=3Dmaster"
>=20
> Please use AUTOREV in conf/distro/include/insane-srcrevs.inc and a good
> one at conf/distro/include/sane-srcrevs.inc. This makes images easier t=
o
> be reproducable.

Add calibrateproto sane revision to sane-srcrevs.inc, corrected this bug
in my compilation.
Patch is attached.

>=20
Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia


--=-ogpF/9/w6L8Up4LfU3x+
Content-Disposition: attachment; filename="sane-srcrevs.inc.patch"
Content-Type: text/x-patch; name="sane-srcrevs.inc.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 1c01fbc..0a7e8b0 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -19,6 +19,7 @@ SRCREV_pn-assassin ?= "268"
 SRCREV_pn-assassin-thumbnail ?= "4690"
 SRCREV_pn-bfin-uclibc ?= "1857"
 SRCREV_pn-bootchart-lite ?= "4"
+SRCREV_pn-calibrateproto ?= "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
 SRCREV_pn-clutter-box2d ?= "3197"
 SRCREV_pn-clutter-cairo ?= "3210"
 SRCREV_pn-clutter-gst ?= "3188"

--=-ogpF/9/w6L8Up4LfU3x+--
