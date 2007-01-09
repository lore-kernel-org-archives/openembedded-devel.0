Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H4H5Y-0008Fm-K6
	for openembedded-devel@openembedded.org; Tue, 09 Jan 2007 14:32:28 +0100
Received: (qmail 22342 invoked by uid 813007); 9 Jan 2007 13:30:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Jan 2007 13:30:42 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Tue, 9 Jan 2007 14:30:30 +0100
User-Agent: KMail/1.9.5
References: <200701081618.46665.openembedded@hrw.one.pl>
	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
	<200701082034.43447.openembedded@hrw.one.pl>
In-Reply-To: <200701082034.43447.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200701091430.38026.openembedded@hrw.one.pl>
Subject: Re: Status of ARM machines in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 13:32:29 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 8 stycznia 2007 20:34, Marcin Juszkiewicz napisa=B3:

> > Is there any easy way in angstrom to specify oabi?
>
> Yes - DISTRO=3D"angstrom-2007.1-oabi" makes it. I will do such build soon
> for armv4 and compulab-pxa270 machines.

I did "angstrom-2007.1-oabi" build for collie, h3600, h3800, simpad,
compulab-pxa270. Results:

collie, h3600, compulab-pxa270: built

h3800, simpad: broke in same way as h1910/htcbluengel/rx3000 in previous run

Someone who maintain linux-handhelds kernel need this patch applied:

[hrw@misc1 org.openembedded.dev]$ mtn dif packages/linux/linux-handhelds-2.=
6.inc
#
# old_revision [6a7ee07ba76c72b981330c44ab8b4d0ab285b2da]
#
# patch "packages/linux/linux-handhelds-2.6.inc"
#  from [7b2de315c55f5138116f295bfab2563cbd48e6e9]
#    to [1feef0116d4e092c87c44d63f6925be52126cf9c]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-- packages/linux/linux-handhelds-2.6.inc      7b2de315c55f5138116f295bf=
ab2563cbd48e6e9
+++ packages/linux/linux-handhelds-2.6.inc      1feef0116d4e092c87c44d63f69=
25be52126cf9c
@@ -1,9 +1,9 @@ COMPATIBLE_HOST =3D "arm.*-linux"
 SECTION =3D "kernel"
 DESCRIPTION =3D "handhelds.org Linux kernel 2.6 for PocketPCs and other co=
nsumer handheld devices."
 LICENSE =3D "GPL"

 COMPATIBLE_HOST =3D "arm.*-linux"
=2DCOMPATIBLE_MACHINE ?=3D '(asus730|h1910|h2200|h3600|h3900|h4000|h5000|ht=
cblueangel|htcuniversal|hx4700|jornada56x|magician|simpad)'
+COMPATIBLE_MACHINE ?=3D '(asus730|h1910|h2200|h3600|h3900|h4000|h5000|htcb=
lueangel|htcuniversal|hx4700|jornada56x|magician|simpad|rx3000|h3800)'

 # SRC_URI *must* be overriden in includer, but this is a good reference
 SRC_URI ?=3D "${HANDHELDS_CVS};module=3Dlinux/kernel26;tag=3D${@'K' + bb.d=
ata.getVar('PV',d,1).replace('.', '-')} \

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          As a computer, I find your faith in technology amusing.




