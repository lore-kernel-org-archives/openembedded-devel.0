Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NS5z5-00025k-QX
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 10:45:55 +0100
Received: by pwi18 with SMTP id 18so9974921pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=R4ZgDmc0e/7Lif0Jt6bDGgCuVT1eq4KvcCr5Bhkupy8=;
	b=OLzkCLA3gCbLtKwOLewLMHaH5E79ZdSXdgDeRZbqM+pPm/9XqeCAXaswbIlWk7fEQq
	yj+8FcpKaLZ6EUfkEQi9q0MCDGDSNPb67pDQciUTL1/tpM5IIEo1Bbl7SMxy3rwcTi/z
	T76/VAICXITlFHHKnZZiWFSfA1i1SlYRgdUrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qlHHBAwylIJcnvM8GymO5czTUeKpJk9N2HEbT1jUuxEtd9Xx0J2paaacJrY7GyReMw
	RH7u9mIXJyIEqEW0rCTKFHmXJuZvP3kQvQFIhAZDt4NA9BnMzONlUdj6Ii28gS3iADtx
	8Nr3nJJdpZPAq5lcA21/2R5nYANGyczjubzHA=
MIME-Version: 1.0
Received: by 10.140.58.4 with SMTP id g4mr1147632rva.166.1262684627848; Tue, 
	05 Jan 2010 01:43:47 -0800 (PST)
In-Reply-To: <19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
Date: Tue, 5 Jan 2010 15:13:47 +0530
Message-ID: <ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Tue, 05 Jan 2010 09:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sorry for the delay in replying. I was on vacation.

  if you use minimal or micro distro then eglibc is default libc for
> others you can add
>
> LIBC=3D"eglibc"
>
> IIRC angstrom needs ANGSTROMLIBC =3D "eglibc"
>
> for choosing 2.11 you can add
>
> PREFERRED_VERSION_eglibc =3D "2.11"
> PREFERRED_VERSION_eglibc-initial =3D "2.11"
>
> to your local.conf
>

This is my lineup now -
PREFERRED_VERSION_binutils               =3D "2.20"
PREFERRED_VERSION_binutils-cross         =3D "2.20"
PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
PREFERRED_VERSION_gcc                    =3D "4.4.1"
PREFERRED_VERSION_gcc-cross              =3D "4.4.1"
PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.1"
PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.1"
PREFERRED_VERSION_glibc                 =3D "2.9"
PREFERRED_VERSION_glibc-initial         =3D "2.9"
PREFERRED_VERSION_eglibc                =3D "2.10"
PREFERRED_VERSION_eglibc-initial        =3D "2.10"
ANGSTROMLIBC                            =3D "eglibc"
 I had started with eglibc2.11 but some failure occured in the build (i don=
t
quite remember the error). Based on the above lineup my build fails while
packaging eglibc. This is the log -

----------------------------------------------------------------------
NOTE: Running task 897 of 3319 (ID: 195,
/home/raghu/opendistro/openembedded/recipes/eglibc/eglibc_2.10.bb,
do_package)
+ export localstatedir=3D/var
...
...
...
+ cd
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-=
2.10-r7.1/build-arm-angstrom-linux-gnueabi
+ do_prep_locale_tree
+
treedir=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnuea=
bi/eglibc-2.10-r7.1/locale-tree
...
...
...
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-=
2.10-r7.1/temp/run.do_prep_locale_tree.23041:
line 819: [:
/home/raghu/opendistro/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/li=
b/libgcc_s.so:
binary operator expected
...
...

NOTE: Task failed: localedef returned an error (command was
PATH=3D"/home/raghu/opendistro/build/tmp/staging/i686-linux/usr/bin/armv7a-=
angstrom-linux-gnueabi:/home/raghu/opendistro/build/tmp/staging/i686-linux/=
usr/bin/armv7a-angstrom-linux-gnueabi:/home/raghu/opendistro/build/tmp/stag=
ing/i686-linux/usr/sbin:/home/raghu/opendistro/build/tmp/staging/i686-linux=
/usr/bin:/home/raghu/opendistro/build/tmp/cross/armv7a/bin:/home/raghu/open=
distro/build/tmp/staging/i686-linux/sbin:/home/raghu/opendistro/build/tmp/s=
taging/i686-linux/bin:/home/raghu/opendistro/bitbake-1.8.12/bin:/home/raghu=
/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/ARM/FastMod=
elTools_5.0/bin:/home/raghu/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/bin=
:/home/raghu/sg/ARM/FastModelTools_5.0/bin:/distro/cortex/STLinux-2.3/devki=
t/arm/bin/:/usr/kerberos/bin:/usr/lib/ccache:/home/raghu/sg/ARM/FastModelTo=
ols_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/ARM/FastModelTools_5.0/bin:/ho=
me/raghu/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/ARM=
/FastModelTools_5.0/bin:/distro/cortex/STLinux-2.3/devkit/arm/bin/:/usr/loc=
al/bin:/bin:/usr/bin:/home/raghu/bin"
I18NPATH=3D"/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnu=
eabi/eglibc-2.10-r7.1/locale-tree//usr/share/i18n"
qemu-arm  -s 1048576 -r 2.6.16 -L
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-=
2.10-r7.1/locale-tree
-E
LD_LIBRARY_PATH=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-lin=
ux-gnueabi/eglibc-2.10-r7.1/locale-tree/lib
/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-=
2.10-r7.1/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnue=
abi/eglibc-2.10-r7.1/locale-tree
--inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/raghu/opendistro/openembedded/recipes/eglibc/
eglibc_2.10.bb do_package failed
ERROR: Task 195 (/home/raghu/opendistro/openembedded/recipes/eglibc/
eglibc_2.10.bb, do_package) failed
NOTE: Tasks Summary: Attempted 896 tasks of which 371 didn't need to be
rerun and 1 failed.
---------------------------------------------------------------------------=
------

--RK

