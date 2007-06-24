Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I2a1G-0007bP-Na
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2007 23:53:19 +0200
Received: by an-out-0708.google.com with SMTP id b33so249980ana
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2007 14:49:09 -0700 (PDT)
Received: by 10.100.122.8 with SMTP id u8mr2808408anc.1182721749047;
	Sun, 24 Jun 2007 14:49:09 -0700 (PDT)
Received: by 10.100.38.3 with HTTP; Sun, 24 Jun 2007 14:49:08 -0700 (PDT)
Message-ID: <ae36f8040706241449v5d8daa37v22f3f039ba27e97b@mail.gmail.com>
Date: Sun, 24 Jun 2007 18:49:08 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706220709p455a92e3q7eed288a5a69efee@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
	<20070614025356.GA6177@twibble.org>
	<ae36f8040706200948o54d0ec92qb94eb5c379bad1fd@mail.gmail.com>
	<20070622045718.GA8358@twibble.org>
	<ae36f8040706212233kcaf86b0k9498869fce6cddff@mail.gmail.com>
	<ae36f8040706220709p455a92e3q7eed288a5a69efee@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Sun, 24 Jun 2007 21:53:19 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dears:
is this patch generated with mtn diff, good enough for OE ?

(BD06DC30:instramed/openembedded/org.openembedded.dev) lvcargnini% mtn diff
#
# old_revision [ef8c722889bd5cf7ded674cfc20d139a00318a1c]
#
# patch "packages/cups/cups_1.2.10.bb"
#  from [f35e4bd25f49222a16880ac6e7b5e18ab4b4f41a]
#    to [ee3749cc0ab3e7fb974dd65b81b7b8c068922b34]
#
# patch "packages/perl/perl-native_5.8.8.bb"
#  from [2f2d7163b1fd47aa9554cf3e954cd81ea1e73556]
#    to [d7850b53264d7e24c413054b4e0c73614909fafb]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/cups/cups_1.2.10.bb
f35e4bd25f49222a16880ac6e7b5e18ab4b4f41a
+++ packages/cups/cups_1.2.10.bb
ee3749cc0ab3e7fb974dd65b81b7b8c068922b34
@@ -46,6 +46,9 @@ fakeroot do_install () {

 fakeroot do_install () {
        oe_runmake "DSTROOT=3D${D}" install
+
+       # This directory gets installed with perms 511, which makes
packaging fail
+       chmod 0711 "${D}/${localstatedir}/run/cups/certs"
 }

 do_stage () {
@@ -56,6 +59,12 @@ do_stage () {
        oe_libinstall -C filter -so libcupsimage ${STAGING_LIBDIR}
 }

+python do_package_append() {
+       # Change permissions back the way they were, they probably had a
reason...
+       workdir =3D bb.data.getVar('WORKDIR', d, 1)
+       os.system('chmod 0511 %s/install/cups/var/run/cups/certs' % workdir=
)
+}
+
 FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
                     ${libdir}/cups/cgi-bin/.debug \
                    ${libdir}/cups/filter/.debug \
@@ -71,6 +80,6 @@ FILES_${PN} +=3D "${datadir}/doc/cups/imag
                 ${datadir}/icons/ \
               "

+LEAD_SONAME =3D "libcups.so.*"


-
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/perl/perl-native_5.8.8.bb
2f2d7163b1fd47aa9554cf3e954cd81ea1e73556
+++ packages/perl/perl-native_5.8.8.bb
d7850b53264d7e24c413054b4e0c73614909fafb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://ftp.funet.fi/pub/CPAN/
            file://native-nopacklist.patch;patch=3D1 \
            file://native-no-gdbminc.patch;patch=3D1 \
            file://native-perlinc.patch;patch=3D1 \
+          file://perl-5.8.8-asm-page-h-compile-failure.patch;patch=3D1 \
            file://native-makedepend-dash.patch;patch=3D1"

 # This sloppy patch breaks normal gcc
(BD06DC30:instramed/openembedded/org.openembedded.dev) lvcargnini%

Please this modifications was generated, applying my patch for perl-native,
to make possbile coimpile it in gentoo distro and it remain correct for all
the others distro, and applying the patch to cups bug id 2345.
Thanks anyway.


On 6/22/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> howto fix this issue:
> NOTE: package cups-1.2.10-r0: task do_package: started
> !!! Failed to move ./var/run/cups/certs to
> /home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-angstrom-lin=
ux-gnueabi/cups-
> 1.2.10-r0 /install/cups/./var/run/cups/certs
> !!! [Errno 13] Permission denied
> NOTE: Task failed: File population failed
> NOTE: package cups-1.2.10-r0: task do_package: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package cups-1.2.10: failed
> ERROR: Build of
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages=
/cups/cups_1.2.10.bb
> do_package failed
> ERROR: Task 769
> (/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/package=
s/cups/cups_1.2.10.bb,
> do_package) failed
> NOTE: Tasks Summary: Attempted 905 tasks of which 897 didn't need to be
> rerun and 1 failed.
> ERROR:
> '/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/package=
s/cups/cups_1.2.10.bb'
> failed
>
>
> On 6/22/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> >
> > Yes I have teh latest version of linux-header of my gentoo, i applied
> > the gentoo patch for page.h on my perl-native and it compiled.
> > my gentoo linux -header installed is the following:
> > sys-kernel/linux-headers
> >       Latest version available: 2.6.21
> >       Latest version installed: 2.6.21
> >       Size of files: 4,286 kB
> >       Homepage:      http://www.kernel.org/ http://www.gentoo.org/
> >       Description:   Linux system headers
> >       License:       GPL-2
> >
> > how my system is the latest not the stable I suppose that page.h still
> > been cuted off.
> > now what do you think ?
> >
> > On 6/22/07, Jamie Lenehan <lenehan@twibble.org> wrote:
> > >
> > > On Wed, Jun 20, 2007 at 01:48:00PM -0300, Lu=EDs Cargnini wrote:
> > > > Please can add the Gentoo patch as suggested ?
> > >
> > > Not yet.
> > >
> > > The patch will break builds using older glibc's... the question is
> > > how old? I think it'll be that old that it doesn't matter, but until
> > > I've verified that I don't want to push this change.
> > >
> > > Did you try upgrading to the latest linux-headers? I thought this had
> > > been re-added in the lastest version of the linux-headers (of
> > > whatever gentoo calls it) and that gentoo had update the later
> > > version?
> > >
> > > > I emailed the list some days ago, this will make perl compile in an=
y
> > > system
> > > > without errors I suppose
> > >
> > > Any recent system.
> > >
> > > --
> > > Jamie Lenehan < lenehan@twibble.org>
> > >
> >
> >
> >
> > --
> >
> > -----------------------------------------------------------------------=
-------
> > Thanks && Regards
> > Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> > IEEE Member
> > Electrical Engineer Faculty @ PUCRS
> > Ipiranga Avenue, 6681 =96 Building 30
> > P.O. Box: 90619-900 =96 Porto Alegre/RS
> > Phone: +55 51 3320 3500  extension: 7696
> > -----------------------------------------------------------------------=
----------
> >
> >
>
>
>
> --
>
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
>
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

