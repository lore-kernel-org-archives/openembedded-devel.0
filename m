Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0CLA-00035j-86 for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:30:08 +0100
Received: from f053044253.adsl.alicedsl.de ([78.53.44.253]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0CJW-000862-4P for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 12:28:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
Date: Thu, 17 Mar 2011 13:28:23 +0100
Message-ID: <1300364903.3950.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: xfce4-session: task configure fails with `checking for iceauth... no`
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
X-List-Received-Date: Thu, 17 Mar 2011 12:30:08 -0000
X-Groupsio-MsgNum: 30336
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FhzigIRS5y2xKayxyoFo"

--=-FhzigIRS5y2xKayxyoFo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 15.03.2011, 09:24 -0700 schrieb Khem Raj:
> On Tue, Mar 15, 2011 at 9:06 AM, Paul Menzel wrote:

> > Am Dienstag, den 08.03.2011, 14:34 +0100 schrieb Paul Menzel:
> >
> >> task configure of `xfce4-session_4.6.2.bb` fails with the following
> >> error message using any distribution (`minimal`, `angstrom-2008.1`).
> >>
> >>         checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=3D/o=
e/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is GN=
U ld... (cached) yes
> >>         checking whether to build with profiling support... no
> >>         checking whether to compile with coverage profiling instrument=
ation... no
> >>         checking whether to disable assertions... no
> >>         checking whether to build final version... yes
> >>         checking whether arm-oe-linux-gnueabi-ld --sysroot=3D/oe/build=
-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1..=
. yes
> >>         checking for iceauth... no
> >>         configure: error: iceauth missing, please check your X11 insta=
llation
> >>
> >> In my build directory I get the following hits for =C2=BB*iceauth*=C2=
=AB.
> >>
> >>         $ find . -iname *iceauth*
> >>         ./minimal-dev/deploy/sources/MIT-X/iceauth
> >>         ./minimal-dev/deploy/sources/MIT-X/iceauth/iceauth-1.0.4.tar.b=
z2
> >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-dbg_1.0.4-r5.0_armv5t=
e.ipk
> >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-dev_1.0.4-r5.0_armv5t=
e.ipk
> >>         ./minimal-dev/deploy/ipk/armv5te/iceauth-doc_1.0.4-r5.0_armv5t=
e.ipk
> >>         ./minimal-dev/deploy/ipk/armv5te/iceauth_1.0.4-r5.0_armv5te.ip=
k
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_patch
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_package_stage
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_configure
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_unpack
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_setscene
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_compile
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_rm_work
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_package_stage_all
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_fetch
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_package_write
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_qa_configure
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_build
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_install
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_qa_staging
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_package
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_distribute_sources
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_package_write_ipk
> >>         ./minimal-dev/stamps/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-=
r5.0.do_populate_sysroot
> >>         ./minimal-dev/pstage/minimaleglibc/staging-iceauth-armv5te-oe-=
linux-gnueabi_1.0.4-r5.0_armv5te-linux-gnueabi.ipk
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/iceauth
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
.packaged
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-doc
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-dbg.packaged
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-dev
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-dbg
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-doc.packaged
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-locale
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-dev.packaged
> >>         ./minimal-dev/pkgdata/armv5te-oe-linux-gnueabi/runtime/iceauth=
-static
> >>         ./minimal-dev/sysroots/armv5te-oe-linux-gnueabi/usr/share/man/=
man1/iceauth.1
> >>         ./minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5=
.0
> >>         ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-lin=
ux-gnueabi.control
> >>         ./minimal-dev/usr/lib/opkg/info/staging-iceauth-armv5te-oe-lin=
ux-gnueabi.list
> >>
> >> So nothing is in the `sysroot`. Building without `INHERIT +=3D "rm_wor=
k"`
> >> I find the following.
> >>
> >>         $ ls -l minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.=
0.4-r5.0/package/usr/bin/iceauth
> >>         -rwxr-xr-x 1 x x 16264 Mar  7 11:55 minimal-dev/work/armv5te-o=
e-linux-gnueabi/iceauth-1_1.0.4-r5.0/package/usr/bin/iceauth
> >>
> >> Does anyone have an idea how this can be solved. `git grep iceauth`
> >> indicates that only `xfce4-session_4.*` depends on `iceauth`.
> >
> > Any ideas?
>=20
> look at the config.log of this package

        $ more config.log
        [=E2=80=A6]
        configure:15938: checking for iceauth
        configure:15971: result: no
        configure:15983: error: iceauth missing, please check your X11 inst=
allation
        [=E2=80=A6]

> and see what is it looking for in iceauth and make sure that its staged

Well I am not sure.

        $ more configure.in
        [=E2=80=A6]
        dnl Check for iceauth
        AC_PATH_PROG([ICEAUTH], [iceauth])
        if test x"$ICEAUTH" !=3D x""; then
          AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth]=
)
        else
          AC_MSG_ERROR([iceauth missing, please check your X11 installation=
])
        fi
        [=E2=80=A6]

        $ less configure
          15936 # Extract the first word of "iceauth", so it can be a progr=
am name with args.
          15937 set dummy iceauth; ac_word=3D$2
          15938 { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_w=
ord" >&5
          15939 $as_echo_n "checking for $ac_word... " >&6; }
          15940 if test "${ac_cv_path_ICEAUTH+set}" =3D set; then :
          15941   $as_echo_n "(cached) " >&6
          15942 else
          15943   case $ICEAUTH in
          15944   [\\/]* | ?:[\\/]*)
          15945   ac_cv_path_ICEAUTH=3D"$ICEAUTH" # Let the user override t=
he test with a path.
          15946   ;;
          15947   *)
          15948   as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
          15949 for as_dir in $PATH
          15950 do
          15951   IFS=3D$as_save_IFS
          15952   test -z "$as_dir" && as_dir=3D.
          15953     for ac_exec_ext in '' $ac_executable_extensions; do
          15954   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x=
 "$as_dir/$ac_word$ac_exec_ext"; }; then
          15955     ac_cv_path_ICEAUTH=3D"$as_dir/$ac_word$ac_exec_ext"
          15956     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$a=
c_word$ac_exec_ext" >&5
          15957     break 2
          15958   fi
          15959 done
          15960   done
          15961 IFS=3D$as_save_IFS
          15962=20
          15963   ;;
          15964 esac
          15965 fi
          15966 ICEAUTH=3D$ac_cv_path_ICEAUTH
          15967 if test -n "$ICEAUTH"; then
          15968   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ICEAUTH=
" >&5
          15969 $as_echo "$ICEAUTH" >&6; }
          15970 else
          15971   { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
          15972 $as_echo "no" >&6; }
          15973 fi
          15974=20
          15975=20
          15976 if test x"$ICEAUTH" !=3D x""; then
          15977=20
          15978 cat >>confdefs.h <<_ACEOF
          15979 #define ICEAUTH_CMD "$ICEAUTH"
          15980 _ACEOF
          15981=20
          15982 else
          15983   as_fn_error "iceauth missing, please check your X11 insta=
llation" "$LINENO" 5
          15984 fi

I guess I need to somehow package the iceauth binary.


Thanks,

Paul

--=-FhzigIRS5y2xKayxyoFo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2B/mcACgkQPX1aK2wOHVilNwCggbl6R7vIRDu6xUnOFD968Ldj
yJsAn1QJVjKTgbRtaHR1aB1a8m9AsX1n
=4X5m
-----END PGP SIGNATURE-----

--=-FhzigIRS5y2xKayxyoFo--
