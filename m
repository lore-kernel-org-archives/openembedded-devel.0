Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1TCu3g-0002qx-FY
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 17:13:25 +0200
Received: from mail177-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Sat, 15 Sep 2012 15:00:47 +0000
Received: from mail177-ch1 (localhost [127.0.0.1])	by
	mail177-ch1-R.bigfish.com (Postfix) with ESMTP id 18B2A2601AF;
	Sat, 15 Sep 2012 15:00:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zz9371I542M1432Id6f1izz1202h1d1ah1d2ahzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ah1220h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail177-ch1 (localhost.localdomain [127.0.0.1]) by mail177-ch1
	(MessageSwitch) id 1347721244863500_28067;
	Sat, 15 Sep 2012 15:00:44 +0000 (UTC)
Received: from CH1EHSMHS038.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.237])	by mail177-ch1.bigfish.com (Postfix) with ESMTP id
	C5F8F1E00C0;	Sat, 15 Sep 2012 15:00:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS038.bigfish.com
	(10.43.69.247) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 15 Sep 2012 15:00:42 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.100]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Sat, 15 Sep 2012 10:00:41 -0500
From: Liu Ting-B28495 <B28495@freescale.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-oe v2][for-denzil][PATCH] systemd: use system variables
	instead of hardcoded paths
Thread-Index: AQHNkmLAuCMcrd2EI02NZSF8pOtmC5eKGNKAgAFjJDA=
Date: Sat, 15 Sep 2012 15:00:41 +0000
Message-ID: <AF604684617F454390621992F367F169011FE311@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1347617889-16484-1-git-send-email-b28495@freescale.com>
	<6ABF37BF-CD17-4C0E-AA90-2641D869742F@dominion.thruhere.net>
In-Reply-To: <6ABF37BF-CD17-4C0E-AA90-2641D869742F@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [117.79.233.232]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "yocto@linux.freescale.net" <yocto@linux.freescale.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe v2][for-denzil][PATCH] systemd: use system variables instead of hardcoded paths
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
X-List-Received-Date: Sat, 15 Sep 2012 15:13:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Friday, September 14, 2012 8:32 PM
> To: Liu Ting-B28495
> Cc: yocto@linux.freescale.net; Khem Raj; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [meta-oe v2][for-denzil][PATCH] systemd: use system
> variables instead of hardcoded paths
>=20
> Please do a git cherry-pick to keep author info
>=20

[Liu Ting-B28495] My fault. Because recipes are moved to meta-systemd and t=
he systemd source code has changed, the original commit can't be used direc=
tly on denzil. Moreover, the fix is part of the original commit "systemd: U=
pgrade to 187 tag". So I generate a new patch in the same way with original=
 commit, include related messages, and use a more clear title. Sorry for no=
t keeping author info.

> Op 14 sep. 2012, om 12:18 heeft <b28495@freescale.com> het volgende
> geschreven:
>=20
> > From: Ting Liu <b28495@freescale.com>
> >
> > Back port commit 980b338fb5100ff4c779335a86f3d9450ea8c54a
> > Below is the original commit message:
> >
> > Fix build for ppc64
> >
> > Consider /lib64 and /usr/lib64
> >
> > Some 64bit architectures chose lib64 instead of lib for default
> > library dirnames. So we dig this from metadata vars base_libdir and
> > libdir instead of hardcoding 'lib'
> >
> > ppc64 in OE uses lib64 for default libdir and this leaves lot of
> > udev/systemd files unpackaged since 'lib' was hardcoded
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> > meta-oe/classes/systemd.bbclass                    |    5 +-
> > .../systemd/systemd/use-rootlibdir.patch           |   94
> ++++++++++++++++++++
> > meta-oe/recipes-core/systemd/systemd_git.bb        |    3 +-
> > 3 files changed, 100 insertions(+), 2 deletions(-) create mode 100644
> > meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> >
> > diff --git a/meta-oe/classes/systemd.bbclass
> > b/meta-oe/classes/systemd.bbclass index a2c8ddf..0d88c64 100644
> > --- a/meta-oe/classes/systemd.bbclass
> > +++ b/meta-oe/classes/systemd.bbclass
> > @@ -154,7 +154,10 @@ python populate_packages_prepend () {
> >
> > 	# check service-files and call systemd_add_files_and_parse for each
> entry
> > 	def systemd_check_services():
> > -		searchpaths =3D '/etc/systemd/system/ /lib/systemd/system/
> /usr/lib/systemd/system/'
> > +		base_libdir =3D d.getVar('base_libdir', 1)
> > +		searchpaths =3D '/etc/systemd/system/' + ' '
> > +		searchpaths +=3D d.getVar('base_libdir', 1) +
> '/systemd/system/' + ' '
> > +		searchpaths +=3D d.getVar('libdir', 1) + '/systemd/system/' + '
> '
> > 		systemd_packages =3D d.getVar('SYSTEMD_PACKAGES', 1)
> > 		has_exactly_one_service =3D len(systemd_packages.split()) =3D=3D 1
> > 		if has_exactly_one_service:
> > diff --git a/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> > b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> > new file mode 100644
> > index 0000000..26973c4
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/systemd/systemd/use-rootlibdir.patch
> > @@ -0,0 +1,94 @@
> > +From 5210f67d0c637f4fbd8bb0a94e9b11da25a9c76c Mon Sep 17 00:00:00
> > +2001
> > +From: Ting Liu <b28495@freescale.com>
> > +Date: Fri, 14 Sep 2012 16:56:30 +0800
> > +Subject: [PATCH] use rootlibdir
> > +
> > +Back port from meta-oe 980b338fb5100ff4c779335a86f3d9450ea8c54a.
> > +Below is the original message in the patch:
> > +
> > +Upstream-Status: Undecided
> > +
> > +This patch removes some of hardcoded references to /lib and /usr/lib
> > +since on some architectures it should be
> > +/lib64 and /usr/lib64 atleast in OE
> > +
> > +I am not sure about the intention of hardcoded values thats why
> > +status is undecided
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Ting Liu <b28495@freescale.com>
> > +---
> > + Makefile.am |   20 ++++++++++----------
> > + 1 files changed, 10 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am index 219d8de..b96ac74 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -50,19 +50,19 @@ bashcompletiondir=3D$(sysconfdir)/bash_completion.=
d
> > +
> > + # Our own, non-special dirs
> > + pkgsysconfdir=3D$(sysconfdir)/systemd
> > +-userunitdir=3D$(prefix)/lib/systemd/user
> > +-tmpfilesdir=3D$(prefix)/lib/tmpfiles.d
> > +-sysctldir=3D$(prefix)/lib/sysctl.d
> > ++userunitdir=3D$(prefix)/$(rootlibdir)/gcsystemd/user
> > ++tmpfilesdir=3D$(prefix)/$(rootlibdir)/gctmpfiles.d
> > ++sysctldir=3D$(prefix)/$(rootlibdir)/gcsysctl.d
> > + usergeneratordir=3D$(pkglibexecdir)/user-generators
> > + pkgincludedir=3D$(includedir)/systemd
> > +
> > + # And these are the special ones for /  rootprefix=3D@rootprefix@
> > +rootbindir=3D$(rootprefix)/bin
> > +-rootlibexecdir=3D$(rootprefix)/lib/systemd
> > ++rootlibexecdir=3D$(rootprefix)/$(rootlibdir)/gcsystemd
> > + systemgeneratordir=3D$(rootlibexecdir)/system-generators
> > + systemshutdowndir=3D$(rootlibexecdir)/system-shutdown
> > +-systemunitdir=3D$(rootprefix)/lib/systemd/system
> > ++systemunitdir=3D$(rootprefix)/$(rootlibdir)/gcsystemd/system
> > +
> > + CLEANFILES =3D
> > + EXTRA_DIST =3D
> > +@@ -93,7 +93,7 @@ AM_CPPFLAGS =3D \
> > + 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=3D\"$(bindir)/systemd-stdio-
> bridge\" \
> > + 	-DROOTPREFIX=3D\"$(rootprefix)\" \
> > + 	-DRUNTIME_DIR=3D\"/run\" \
> > +-	-DRANDOM_SEED=3D\"$(localstatedir)/lib/random-seed\" \
> > ++	-DRANDOM_SEED=3D\"$(localstatedir)/$(rootlibdir)/gcrandom-seed\" \
> > + 	-DSYSTEMD_CRYPTSETUP_PATH=3D\"$(rootlibexecdir)/systemd-cryptsetup\"
> \
> > + 	-DSYSTEM_GENERATOR_PATH=3D\"$(systemgeneratordir)\" \
> > + 	-DUSER_GENERATOR_PATH=3D\"$(usergeneratordir)\" \ @@ -1408,7 +1408,7
> > +@@ nodist_systemunit_DATA +=3D \
> > +
> > + binfmt-install-data-hook:
> > + 	$(MKDIR_P) -m 0755 \
> > +-		$(DESTDIR)$(prefix)/lib/binfmt.d \
> > ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcbinfmt.d \
> > + 		$(DESTDIR)$(sysconfdir)/binfmt.d \
> > + 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
> > + 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \ @@
> > +-1940,7 +1940,7 @@ polkitpolicy_in_files +=3D \
> > + logind-install-data-hook:
> > + 	$(MKDIR_P) -m 0755 \
> > + 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
> > +-                $(DESTDIR)$(localstatedir)/lib/systemd
> > ++                $(DESTDIR)$(localstatedir)/$(rootlibdir)/gcsystemd
> > + 	( cd $(DESTDIR)$(systemunitdir) && \
> > + 		rm -f dbus-org.freedesktop.login1.service && \
> > + 		$(LN_S) systemd-logind.service
> > +dbus-org.freedesktop.login1.service)
> > +@@ -2196,9 +2196,9 @@ systemd-install-data-hook:
> > + 	$(MKDIR_P) -m 0755 \
> > + 		$(DESTDIR)$(tmpfilesdir) \
> > + 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
> > +-		$(DESTDIR)$(prefix)/lib/modules-load.d \
> > ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcmodules-load.d \
> > + 		$(DESTDIR)$(sysconfdir)/modules-load.d \
> > +-		$(DESTDIR)$(prefix)/lib/sysctl.d \
> > ++		$(DESTDIR)$(prefix)/$(rootlibdir)/gcsysctl.d \
> > + 		$(DESTDIR)$(sysconfdir)/sysctl.d \
> > + 		$(DESTDIR)$(systemshutdowndir) \
> > + 		$(DESTDIR)$(systemgeneratordir) \
> > +--
> > +1.7.5
> > +
> > diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb
> > b/meta-oe/recipes-core/systemd/systemd_git.bb
> > index b9c8a19..21a6326 100644
> > --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> > +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> > @@ -14,13 +14,14 @@ inherit gitpkgv
> > PKGV =3D "v${GITPKGVTAG}"
> >
> > PV =3D "git"
> > -PR =3D "r28"
> > +PR =3D "r29"
> >
> > inherit useradd pkgconfig autotools vala perlnative
> >
> > SRCREV =3D "3eff4208ffecedd778fec260f0d4b18e94dab443"
> >
> > SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd;protocol=3Dg=
it
> > \
> > +           file://use-rootlibdir.patch \
> >            ${UCLIBCPATCHES} \
> >            file://var-run.conf \
> >           "
> > --
> > 1.7.5
> >
> >
>=20




