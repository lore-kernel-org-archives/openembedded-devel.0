Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0M94-0007l6-St
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 23:58:18 +0100
Received: by fxm19 with SMTP id 19so3156232fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=W052DvsFgb+ysAge/+xdIium92d/FC5ylSioAYauT+8=;
	b=waEwBXC8K4m/yzH3vdvWKE02FicqnwEpWnTOrGdxra3RNcJAVVG5GsJ38XSW/jQU7+
	+SWb04W8i256ty2EKjoBU9iFcDOsKQ1pYEOaClTK9eLDJEP70WCZCeuxHdMl2lrYNX5U
	1WqSClIIk1QqTTLFEschiOrkOoreG1pm9DeJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=r9v3BiKvsaHRDq3sQaDVgRzXGa7demv9tJPC3AJRDWu8xUwG8QFtiAO7UdKd3lToji
	nFOaC5WuDeuu58eiV4Uqm3FygjFwP6nR5TaFZaltv5in9WyI8TqDrz12QIHn4UnkSPsS
	Ts1kju0ZJe+SeuMS33aGEAiUZo87FcIGspC4U=
Received: by 10.223.20.144 with SMTP id f16mr408052fab.68.1300402594108; Thu,
	17 Mar 2011 15:56:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Thu, 17 Mar 2011 15:56:04 -0700 (PDT)
In-Reply-To: <1300402006.17833.14.camel@mattotaupa>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
	<1300364903.3950.21.camel@mattotaupa>
	<1300402006.17833.14.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2011 15:56:04 -0700
Message-ID: <AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
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
X-List-Received-Date: Thu, 17 Mar 2011 22:58:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2011 at 3:46 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 17.03.2011, 13:28 +0100 schrieb Paul Menzel:
>> Am Dienstag, den 15.03.2011, 09:24 -0700 schrieb Khem Raj:
>> > On Tue, Mar 15, 2011 at 9:06 AM, Paul Menzel wrote:
>>
>> > > Am Dienstag, den 08.03.2011, 14:34 +0100 schrieb Paul Menzel:
>> > >
>> > >> task configure of `xfce4-session_4.6.2.bb` fails with the following
>> > >> error message using any distribution (`minimal`, `angstrom-2008.1`)=
.
>> > >>
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking if the linker (arm-oe-linux-gn=
ueabi-ld --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-=
oe-linux-gnueabi) is GNU ld... (cached) yes
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to build with profilin=
g support... no
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to compile with covera=
ge profiling instrumentation... no
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to disable assertions.=
.. no
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to build final version=
... yes
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether arm-oe-linux-gnueabi-l=
d --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linu=
x-gnueabi accepts -O1... yes
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking for iceauth... no
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure: error: iceauth missing, plea=
se check your X11 installation
>> > >>
>> > >> In my build directory I get the following hits for =C2=BB*iceauth*=
=C2=AB.
>> > >>
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ find . -iname *iceauth*
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/sources/MIT-X/icea=
uth
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/sources/MIT-X/icea=
uth/iceauth-1.0.4.tar.bz2
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceaut=
h-dbg_1.0.4-r5.0_armv5te.ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceaut=
h-dev_1.0.4-r5.0_armv5te.ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceaut=
h-doc_1.0.4-r5.0_armv5te.ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceaut=
h_1.0.4-r5.0_armv5te.ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_patch
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_package_stage
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_configure
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_unpack
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_setscene
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_compile
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_rm_work
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_package_stage_all
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_fetch
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_package_write
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_qa_configure
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_build
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_install
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_qa_staging
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_package
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_distribute_sources
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_package_write_ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-g=
nueabi/iceauth-1_1.0.4-r5.0.do_populate_sysroot
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pstage/minimaleglibc/stag=
ing-iceauth-armv5te-oe-linux-gnueabi_1.0.4-r5.0_armv5te-linux-gnueabi.ipk
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/iceauth
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth.packaged
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-doc
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-dbg.packaged
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-dev
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-dbg
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-doc.packaged
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-locale
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-dev.packaged
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-=
gnueabi/runtime/iceauth-static
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/sysroots/armv5te-oe-linux=
-gnueabi/usr/share/man/man1/iceauth.1
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/work/armv5te-oe-linux-gnu=
eabi/iceauth-1_1.0.4-r5.0
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/usr/lib/opkg/info/staging=
-iceauth-armv5te-oe-linux-gnueabi.control
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/usr/lib/opkg/info/staging=
-iceauth-armv5te-oe-linux-gnueabi.list
>> > >>
>> > >> So nothing is in the `sysroot`. Building without `INHERIT +=3D "rm_=
work"`
>> > >> I find the following.
>> > >>
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ ls -l minimal-dev/work/armv5te-oe-lin=
ux-gnueabi/iceauth-1_1.0.4-r5.0/package/usr/bin/iceauth
>> > >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 -rwxr-xr-x 1 x x 16264 Mar =C2=A07 11:5=
5 minimal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0/package/us=
r/bin/iceauth
>> > >>
>> > >> Does anyone have an idea how this can be solved. `git grep iceauth`
>> > >> indicates that only `xfce4-session_4.*` depends on `iceauth`.
>> > >
>> > > Any ideas?
>> >
>> > look at the config.log of this package
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ more config.log
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 [=E2=80=A6]
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure:15938: checking for iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure:15971: result: no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure:15983: error: iceauth missing, ple=
ase check your X11 installation
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 [=E2=80=A6]
>>
>> > and see what is it looking for in iceauth and make sure that its stage=
d
>>
>> Well I am not sure.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ more configure.in
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 [=E2=80=A6]
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnl Check for iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([ICEAUTH], [iceauth])
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test x"$ICEAUTH" !=3D x""; then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$=
ICEAUTH"], [path to iceauth])
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([iceauth missing, please=
 check your X11 installation])
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 [=E2=80=A6]
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ less configure
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15936 # Extract the first word of "ic=
eauth", so it can be a program name with args.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15937 set dummy iceauth; ac_word=3D$2
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15938 { $as_echo "$as_me:${as_lineno-=
$LINENO}: checking for $ac_word" >&5
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15939 $as_echo_n "checking for $ac_wo=
rd... " >&6; }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15940 if test "${ac_cv_path_ICEAUTH+s=
et}" =3D set; then :
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15941 =C2=A0 $as_echo_n "(cached) " >=
&6
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15942 else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15943 =C2=A0 case $ICEAUTH in
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15944 =C2=A0 [\\/]* | ?:[\\/]*)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15945 =C2=A0 ac_cv_path_ICEAUTH=3D"$I=
CEAUTH" # Let the user override the test with a path.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15946 =C2=A0 ;;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15947 =C2=A0 *)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15948 =C2=A0 as_save_IFS=3D$IFS; IFS=
=3D$PATH_SEPARATOR
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15949 for as_dir in $PATH
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15950 do
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15951 =C2=A0 IFS=3D$as_save_IFS
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15952 =C2=A0 test -z "$as_dir" && as_=
dir=3D.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15953 =C2=A0 =C2=A0 for ac_exec_ext i=
n '' $ac_executable_extensions; do
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15954 =C2=A0 if { test -f "$as_dir/$a=
c_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15955 =C2=A0 =C2=A0 ac_cv_path_ICEAUT=
H=3D"$as_dir/$ac_word$ac_exec_ext"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15956 =C2=A0 =C2=A0 $as_echo "$as_me:=
${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15957 =C2=A0 =C2=A0 break 2
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15958 =C2=A0 fi
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15959 done
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15960 =C2=A0 done
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15961 IFS=3D$as_save_IFS
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15962
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15963 =C2=A0 ;;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15964 esac
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15965 fi
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15966 ICEAUTH=3D$ac_cv_path_ICEAUTH
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15967 if test -n "$ICEAUTH"; then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15968 =C2=A0 { $as_echo "$as_me:${as_=
lineno-$LINENO}: result: $ICEAUTH" >&5
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15969 $as_echo "$ICEAUTH" >&6; }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15970 else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15971 =C2=A0 { $as_echo "$as_me:${as_=
lineno-$LINENO}: result: no" >&5
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15972 $as_echo "no" >&6; }
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15973 fi
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15974
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15975
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15976 if test x"$ICEAUTH" !=3D x""; t=
hen
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15977
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15978 cat >>confdefs.h <<_ACEOF
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15979 #define ICEAUTH_CMD "$ICEAUTH"
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15980 _ACEOF
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15981
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15982 else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15983 =C2=A0 as_fn_error "iceauth mis=
sing, please check your X11 installation" "$LINENO" 5
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 15984 fi
>>
>> I guess I need to somehow package the iceauth binary.
>
> I am still confused. As written in the beginning the package `iceauth`
> contains the binary.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ dpkg -c /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/deploy/ipk/armv7a/iceauth_1.0.4-r5.0_armv7a.ipk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0drwxr-xr-x root/root =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0 2011-03-17 22:38 ./
> =C2=A0 =C2=A0 =C2=A0 =C2=A0drwxr-xr-x root/root =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0 2011-03-17 22:38 ./usr/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0drwxr-xr-x root/root =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0 2011-03-17 22:38 ./usr/bin/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-rwxr-xr-x root/root =C2=A0 =C2=A0 18944 2011-=
03-17 22:38 ./usr/bin/iceauth
>
> `xfce4-session_4.6.2.bb` depends on `iceauth` (`DEPENDS =3D "=E2=80=A6 ic=
eauth"`),
> so I am confused why it is not staged. Could someone enlighten me
> please?
>

It must be trying to execute this iceauth and its for arm architecture
so it wont execute on build host
most probably thats the problem.

You can to convert that test by caching the result in site files so
this test is not executed and cached value
is used instead

>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


