Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA3C75773
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:24:47 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZbrA8-00015K-0c from Joe_MacDonald@mentor.com ;
	Tue, 15 Sep 2015 07:24:48 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 07:24:46 -0700
Received: by burninator (Postfix, from userid 1000)	id 866C0582837; Tue, 15
	Sep 2015 10:23:38 -0400 (EDT)
Date: Tue, 15 Sep 2015 10:23:38 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: akuster <akuster@mvista.com>
Message-ID: <20150915142335.GI8885@mentor.com>
References: <1441747968-13989-1-git-send-email-akuster808@gmail.com>
	<20150914195137.GB8885@mentor.com> <55F73ADC.4060603@mvista.com>
	<20150915014947.GC8885@mentor.com> <55F8281B.6090709@mvista.com>
MIME-Version: 1.0
In-Reply-To: <55F8281B.6090709@mvista.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH][V3] netmap: fix multiple build issues.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 14:24:47 -0000
X-Groupsio-MsgNum: 57367
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Content-Disposition: inline

--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH][V3] netmap: fix multiple build issues.] On 15=
=2E09.15 (Tue 07:15) akuster wrote:

>=20
>=20
> On 09/14/2015 06:49 PM, Joe MacDonald wrote:
> > Hi Armin,
> >=20
> > [Re: [meta-networking][PATCH][V3] netmap: fix multiple build issues.] O=
n 15.09.14 (Mon 14:23) akuster wrote:
> >=20
> >> Joe,
> >>
> >> On 09/14/2015 12:51 PM, Joe MacDonald wrote:
> >>> Hey Armin,
> >>>
> >>> I'm not quite sure what happened here, but when I went to cherry-pick
> >>> this from master-next it appears to be patching the recipe introduced=
 in
> >>> v2 of the original netmap submission, but I don't see that merged to
> >>> master yet and I didn't see a follow-up to the email I sent about the=
 v2
> >>> patch here:
> >>>
> >>>    http://patchwork.openembedded.org/patch/99753/
> >>>
> >>> Curiously, I also don't see my comments in the mailing list archive, =
so
> >>> it might be that somehow my mail got discarded from the list even tho=
ugh
> >>> patchwork saw it (and I know you saw it because you sent me a follow-=
up
> >>> to my follow-up, even).
> >>>
> >>> I can bring the both of them in, but frankly if the two commits toget=
her
> >>> (ae7fed356adf3bab37822230290f3aff7390d75c and
> >>> 0a86d95779b64b4b1a0f91898616217006ace16c in master-next) introduce a =
new
> >>> recipe that builds successfully, I'd rather take it as a single commit
> >>> in master (which would also give you another shot at removing the 'V2=
: '
> >>> text from the commit log that Martin mentioned ...)
> >>
> >> So would a clean  patch adding the package make sense at this point? My
> >> last V3 was on top of what is in master-next. ( guesses that is not
> >> appropriate process). ie one against master not master-next?
> >>
> >>
> >>>
> >>> Thoughts?  I've not yet changed the status of this patch in patchwork
> >>> and probably won't until I hear back from you.  Let's call it 'pendin=
g'.
> >>> :-)
> >>
> >> I will do what ever is easiest for you.
> >=20
> > Since nothing's been merged from master-next into master yet, I'd rather
> > just have a single patch that combines the two you have out right now.
> > I was going to squash them together myself, but then thought I should
> > check with you first just in case there was something else I was
> > missing.
>=20
> Nope those are it. The one in Master-next and the [V3] one.

Okay, I'll take care of that, then, since it seems to have sorted things
out.  Thanks Armin.

-J.

>=20
> regards,
> Armin
> >=20
> > -J.
> >=20
> >>
> >> - armin
> >>>
> >>> -J.
> >>>
> >>> [[meta-networking][PATCH][V3] netmap: fix multiple build issues.] On =
15.09.08 (Tue 14:32) Armin Kuster wrote:
> >>>
> >>>> From: Armin Kuster <akuster@mvista.com>
> >>>>
> >>>> updated to latest version to get kernel 4.1 support
> >>>>
> >>>> update makefile patch
> >>>> fixed printf type issue
> >>>> Fixed manual config options
> >>>> Readme checksum changed, don't know why. must got it wrong to begin =
with.
> >>>>
> >>>> V2: Fix "Upstream-Status" typos
> >>>>
> >>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >>>> ---
> >>>>  ...1-testmmap-fix-compile-issue-with-gcc-5.x.patch | 33 +++++++++++=
++++++++++
> >>>>  .../netmap/files/makefile_fixup.patch              | 34 +++++++++++=
++++++-----
> >>>>  .../recipes-kernel/netmap/netmap-modules_git.bb    |  8 ++++-
> >>>>  meta-networking/recipes-kernel/netmap/netmap.inc   |  4 +--
> >>>>  .../recipes-kernel/netmap/netmap_git.bb            |  1 +
> >>>>  5 files changed, 69 insertions(+), 11 deletions(-)
> >>>>  create mode 100644 meta-networking/recipes-kernel/netmap/files/0001=
-testmmap-fix-compile-issue-with-gcc-5.x.patch
> >>>>
> >>>> diff --git a/meta-networking/recipes-kernel/netmap/files/0001-testmm=
ap-fix-compile-issue-with-gcc-5.x.patch b/meta-networking/recipes-kernel/ne=
tmap/files/0001-testmmap-fix-compile-issue-with-gcc-5.x.patch
> >>>> new file mode 100644
> >>>> index 0000000..ea36b1c
> >>>> --- /dev/null
> >>>> +++ b/meta-networking/recipes-kernel/netmap/files/0001-testmmap-fix-=
compile-issue-with-gcc-5.x.patch
> >>>> @@ -0,0 +1,33 @@
> >>>> +Upstream-Status: Pending
> >>>> +
> >>>> +From c81bf54d6eb870286662a11d3b4a994717c47696 Mon Sep 17 00:00:00 2=
001
> >>>> +From: Armin Kuster <akuster808@gmail.com>
> >>>> +Date: Tue, 8 Sep 2015 05:36:27 -0700
> >>>> +Subject: [PATCH] testmmap: fix compile issue with gcc 5.x
> >>>> +
> >>>> +this fixes:
> >>>> +examples/testmmap.c:540:10: error: format '%ld' expects argument of=
 type 'long int', but argument 3 has type 'ssize_t {aka const int}' [-Werro=
r=3Dformat=3D]
> >>>> +|    printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
> >>>> +|           ^
> >>>> +
> >>>> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>>> +---
> >>>> + examples/testmmap.c | 2 +-
> >>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>> +
> >>>> +diff --git a/examples/testmmap.c b/examples/testmmap.c
> >>>> +index d7f6acc..934489a 100644
> >>>> +--- a/examples/testmmap.c
> >>>> ++++ b/examples/testmmap.c
> >>>> +@@ -537,7 +537,7 @@ do_if()
> >>>> + 	for (i =3D 0; i < 5; i++)
> >>>> + 		printf("spare1[%d]  %u\n", i, nifp->ni_spare1[i]);
> >>>> + 	for (i =3D 0; i < (nifp->ni_tx_rings + nifp->ni_rx_rings + 2); i+=
+)
> >>>> +-		printf("ring_ofs[%d] %ld\n", i, nifp->ring_ofs[i]);
> >>>> ++		printf("ring_ofs[%d] %zd\n", i, nifp->ring_ofs[i]);
> >>>> + }
> >>>> +=20
> >>>> + struct netmap_ring *
> >>>> +--=20
> >>>> +2.3.5
> >>>> +
> >>>> diff --git a/meta-networking/recipes-kernel/netmap/files/makefile_fi=
xup.patch b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.patch
> >>>> index e838653..b050bf0 100644
> >>>> --- a/meta-networking/recipes-kernel/netmap/files/makefile_fixup.pat=
ch
> >>>> +++ b/meta-networking/recipes-kernel/netmap/files/makefile_fixup.pat=
ch
> >>>> @@ -10,24 +10,24 @@ Index: LINUX/netmap.mak.in
> >>>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>  --- a/LINUX/netmap.mak.in
> >>>>  +++ b/LINUX/netmap.mak.in
> >>>> -@@ -12,10 +12,8 @@ SRCDIR:=3D@SRCDIR@
> >>>> +@@ -12,10 +12,9 @@ SRCDIR:=3D@SRCDIR@
> >>>>   # The following commands are needed to build the modules as out-of=
-tree,
> >>>>   # in fact the kernel sources path must be specified.
> >>>>  =20
> >>>>  -PWD ?=3D $(CURDIR)
> >>>> --
> >>>> +=20
> >>>>   # Additional compile flags (e.g. header location)
> >>>>  -EXTRA_CFLAGS :=3D -I$(PWD) -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCD=
IR)/../sys/dev -DCONFIG_NETMAP
> >>>>  +EXTRA_CFLAGS :=3D -I$(SRCDIR) -I$(SRCDIR)/../sys -I$(SRCDIR)/../sy=
s/dev -DCONFIG_NETMAP
> >>>>   EXTRA_CFLAGS +=3D -Wno-unused-but-set-variable
> >>>> - EXTRA_CFLAGS +=3D $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell ec=
ho $s|tr a-z A-Z))
> >>>> + EXTRA_CFLAGS +=3D $(foreach s,$(SUBSYS),-DCONFIG_NETMAP_$(shell ec=
ho $s|tr a-z- A-Z_))
> >>>>  =20
> >>>>  Index: LINUX/configure
> >>>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>  --- a/LINUX/configure
> >>>>  +++ b/LINUX/configure
> >>>> -@@ -311,34 +311,6 @@ reset_tests() {
> >>>> - 	NEXTTEST=3D1
> >>>> +@@ -349,52 +349,6 @@ reset_tests() {
> >>>> + 	EOF
> >>>>   }
> >>>>  =20
> >>>>  -# run_tests: run all accumulated tests and exec the pertinent
> >>>> @@ -48,28 +48,46 @@ Index: LINUX/configure
> >>>>  -		cat >> $TMPDIR/Makefile <<-EOF
> >>>>  -			get-$d:
> >>>>  -			$t	[ -z "\$($d-src)" ] || cp -Rp \$($d-src) \$(if \$($d-dst),\$=
($d-dst),.)
> >>>> +-			$t	touch get-$d
> >>>>  -		EOF
> >>>>  -	done
> >>>>  -	echo endif >> $TMPDIR/Makefile
> >>>> +-	{
> >>>> +-		cat <<-EOF
> >>>> +-##################################################################=
############
> >>>> +-## BEGIN RUNNING TESTS: $(date)
> >>>> +-##################################################################=
############
> >>>> +-## Makefile:
> >>>> +-		EOF
> >>>> +-		cat $TMPDIR/Makefile
> >>>> +-		cat <<-EOF
> >>>> +-##################################################################=
############
> >>>> +-		EOF
> >>>> +-	} >> config.log
> >>>>  -	(
> >>>>  -		cd $TMPDIR
> >>>>  -		make -k -j $(grep -c processor /proc/cpuinfo)
> >>>>  -	) >> config.log
> >>>>  -	eval "$TESTPOSTPROC"
> >>>> +-	cat >> config.log <<-EOF
> >>>> +-##################################################################=
############
> >>>> +-## END RUNNING TESTS: $(date)
> >>>> +-##################################################################=
############
> >>>> +-	EOF
> >>>>  -}
> >>>>  -
> >>>>   configh=3Dnetmap_linux_config.h
> >>>>   # succes/failure actions are expected to write some macros
> >>>>   # in netma_linux_config.h. The following functions can be
> >>>> -@@ -555,7 +527,6 @@ configuration. Please check 'config.log'
> >>>> -=20
> >>>> +@@ -619,7 +573,6 @@ configuration. Please check 'config.log'
> >>>>   reset_tests
> >>>> + rm -f drivers.mak
> >>>>   add_test true broken_buildsystem < /dev/null
> >>>>  -run_tests
> >>>>  =20
> >>>>   drvname2config() {
> >>>>   	local name=3D$1
> >>>> -@@ -1087,7 +1058,6 @@ cat > $configh <<-EOF
> >>>> +@@ -1280,7 +1233,6 @@ cat > $configh <<-EOF
> >>>>   EOF
> >>>>  =20
> >>>>   # the TESTPOSTPROC script will add macros to $configh
> >>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_gi=
t.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> >>>> index 00d334f..bb0db9d 100644
> >>>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> >>>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> >>>> @@ -36,7 +36,13 @@ do_configure_append () {
> >>>>  #define NETMAP_LINUX_HAVE_TX_SKB_SHARING
> >>>>  #define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
> >>>>  #define NETMAP_LINUX_HAVE_PERNET_OPS_ID
> >>>> -#define NETMAP_LINUX_TIMER_RTYPE static enum hrtimer_restart
> >>>> +#define NETMAP_LINUX_VIRTIO_FUNCTIONS
> >>>> +#define NETMAP_LINUX_VIRTIO_FREE_PAGES
> >>>> +#define NETMAP_LINUX_VIRTIO_GET_VRSIZE
> >>>> +#define NETMAP_LINUX_TIMER_RTYPE enum hrtimer_restart
> >>>> +#define NETMAP_LINUX_VIRTIO_MULTI_QUEUE
> >>>> +#define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
> >>>> +#define NETMAP_LINUX_HAVE_E1000E_DOWN2
> >>>>  EOF
> >>>>  }
> >>>> =20
> >>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta=
-networking/recipes-kernel/netmap/netmap.inc
> >>>> index 9083c69..ab33e76 100644
> >>>> --- a/meta-networking/recipes-kernel/netmap/netmap.inc
> >>>> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
> >>>> @@ -4,9 +4,9 @@ SECTION =3D "networking"
> >>>>  HOMEPAGE =3D "http://code.google.com/p/netmap/"
> >>>>  LICENSE =3D "GPLv2+"
> >>>> =20
> >>>> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=
=3Df64f2b172fe6903ff7b6272c6edde588"
> >>>> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=
=3D56ae0b9c7ba0476ab9098de94c2714d6"
> >>>> =20
> >>>> -SRCREV =3D "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
> >>>> +SRCREV =3D "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
> >>>>  PV =3D "master+git${SRCPV}"
> >>>> =20
> >>>>  SRC_URI =3D "git://github.com/luigirizzo/netmap.git"
> >>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/m=
eta-networking/recipes-kernel/netmap/netmap_git.bb
> >>>> index 0ee19d4..f15a626 100644
> >>>> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
> >>>> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> >>>> @@ -11,6 +11,7 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_=
BUILDDIR} \
> >>>>                  --cc=3D'${CC}' \
> >>>>                  --ld=3D'${LD}' \
> >>>>                  "
> >>>> +SRC_URI +=3D "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.p=
atch"
> >>>> =20
> >>>>  do_fetch[depends] +=3D "netmap-modules:do_fetch"
> >>>> =20
> >=20

--=20
-Joe MacDonald.
:wq

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV+CnnAAoJEEn8ffcsOfaWy7MIAMBPNX3QYjq9T0J85hFV4VDa
E+darCA47Zixr+Z0GI4Z5ZpYkafdMweWSIT611pIvVl/UD+caa1Xb1LedLbTVGoE
92VSCSR0eD9yVx7+76RFx4aKq/6Bl6d7BjCxLz9WGf7R3zxXHLdc/Gv3hOYRw8Nr
k809+efQaifdXbAfgzpzHlMQif3UOjKBfNy04a0jZlv0WjGYXDgW3xxDubJ178fu
xuTJgejmzBxBuDoAwBOhq0kvbcTrWt2ZA7YD4dmp/8bIEmZvJP5SPHMgDFOjXaJp
m79LdoosLtopr2xZtoUhCWdn91AiP6HsY1due7jfIcZkVpYNvCaOSTQvlm4RLBw=
=uIJR
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
