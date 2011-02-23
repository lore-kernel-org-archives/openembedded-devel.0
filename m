Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PsBdD-0000rv-3g
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 11:07:39 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p1N9noUR006769
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 10:49:50 +0100
Received: from DEMCHP99ET1MSX.ww902.siemens.net
	(demchp99et1msx.ww902.siemens.net [139.25.131.180])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p1N9nnEo003419
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 10:49:50 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.227]) by
	DEMCHP99ET1MSX.ww902.siemens.net ([139.25.131.180]) with mapi;
	Wed, 23 Feb 2011 10:49:49 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Feb 2011 10:49:48 +0100
Thread-Topic: [oe] Weird behaviour with PPP
Thread-Index: AcvTPDAPUpBzHMEbQ1eWe6yu+yE0DQAAgbXQ
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E011A91BF89@DEMCHP99E35MSX.ww902.siemens.net>
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
	<4D63F7F9.7000804@eukrea.com> <4D63FF5C.30400@opendreambox.org>
	<20110222201107.GB3970@localhost.jama.net>
	<AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
In-Reply-To: <AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Wed, 23 Feb 2011 10:07:39 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Mickael Chazaux
> Gesendet: Mittwoch, 23. Februar 2011 10:19
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] Weird behaviour with PPP
>=20
> Hi,
>=20
> 2011/2/22 Martin Jansa <martin.jansa@gmail.com>:
> > On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
> >> Hi,
> >>
> >> On 02/22/2011 06:52 PM, Eric Benard wrote:
> >> > On 22/02/2011 18:22, Mickael Chazaux wrote:
> >> >> I have a hard time figuring out why bitbake seems to=20
> mix versions of
> >> >> ppp... Any ideas?
> >> >>
> >> > strange, which distro, git tag, bitbake version are you using ?
> >> >
> >> > Both bitbake ppp-2.4.5 & bitbake -b
> >> > openembedded/recipes/ppp/ppp_2.4.5.bb work fine here=20
> (angstrom 2008.1,
> >> > armv5 target, bitbake 1.12.0).
> >>
> >> I don't think this has anything to do with ppp. I faced=20
> the same issue
> >> with a local recipe, of which an older version had been=20
> built before.
> >> When packaging, the old version was used. A new workdir=20
> was created for
> >> the old version during this step and the resulting=20
> packages were empty.
> >> No recipe existed for this old version at that time, i.e.=20
> PR had already
> >> been increased to 1.0, but 0.0 was used by bitbake.
> >>
> >> In the end, I deleted bitbake's cache and all files matching the
> >> package's name to get rid of the annoying problem. I think=20
> there were
> >> pstage packages of the old version lying around.
> >
> > This wrong behavior is quite common ie after changing=20
> PACKAGE_ARCH, see:
> >=20
> http://www.mail-archive.com/openembedded-devel@lists.openembed
> ded.org/msg04280.html
> >
> As I often switch architectures (arm, x86) to work on different
> boards, should I use a different TMPDIR for each?

I am using one different TMPDIR for each MACHINE:
  build/mach1, build/mach2, ...

I still have to find a way to make two different machines with same arch (h=
ence same cross-toolchain) share the same pstage, so that the toolchain doe=
s not get built twice

with kind regards,
Fabrice=


