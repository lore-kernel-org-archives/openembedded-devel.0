Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.moussaud@gmail.com>) id 1OGtQl-0002tA-Tg
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 14:40:25 +0200
Received: by fxm9 with SMTP id 9so1039242fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=NE1a0CTaISDSl8O+/qwaxJL1VbDDxytZXVDORgAxEMM=;
	b=Kj9fdHDrIV0JCKbn1OzQeRLswtmtjxIMNrwZZHKSY4FH+lcEkumG8sQ67fbjp0ec5v
	qysk4FFOmx6/N1o9eoVdZRLbSsXfS8MfJFa7tbCgEy/+UpnmT1YLruvfwSinbdGS8Oo5
	KRxhZubcs/zyqdoNVJGnfaPtjftMTeg0Cm8Fg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bJt9HUpHx3upylgfY0jsPa/70Qxn6trLErmMV6Q4q3zu+4Rj7G1r+9OqFRHM9lzdCi
	fw3FlpiNucXHDSPF1QxRoadSsaFTNOuQa4H+FqrXToohT9nK6nDKsOhmye0Srk9vAMEG
	kf3vC+aFeeHfOFvhCGoKO4CCu2qUYCKCYVPeA=
Received: by 10.204.141.133 with SMTP id m5mr2719195bku.91.1274790977124; Tue, 
	25 May 2010 05:36:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.115.212 with HTTP; Tue, 25 May 2010 05:35:57 -0700 (PDT)
In-Reply-To: <AANLkTik6gpgWgU6ETC-aEYyyuRnAhu1fRlLU-zDA9dDU@mail.gmail.com>
References: <mailman.1729.1265722552.14961.openembedded-devel@lists.openembedded.org>
	<4B718115.1010104@tycoelectronics.com>
	<AANLkTik6gpgWgU6ETC-aEYyyuRnAhu1fRlLU-zDA9dDU@mail.gmail.com>
From: David MOUSSAUD <d.moussaud@gmail.com>
Date: Tue, 25 May 2010 14:35:57 +0200
Message-ID: <AANLkTindjfaFPaMSq05FM4ZDocJrxw2eLNMyWY0rYhPk@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: d.moussaud@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] error trying to build parted 1.8.8 : configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOURCE
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
X-List-Received-Date: Tue, 25 May 2010 12:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2010 at 6:24 PM, David MOUSSAUD <d.moussaud@gmail.com> wrot=
e:
> Hi,
>
> that patch works for me.
>
>
> diff --git a/recipes/parted/files/extensions-m4.patch
> b/recipes/parted/files/extensions-m4.patch
> new file mode 100644
> index 0000000..1ec53f7
> --- /dev/null
> +++ b/recipes/parted/files/extensions-m4.patch
> @@ -0,0 +1,26 @@
> +diff -Nru parted-1.8.8/m4/extensions.m4 parted-1.8.8.patched/m4/extensio=
ns.m4
> +--- parted-1.8.8/m4/extensions.m4 =A0 =A0 =A02006-10-12 10:01:18.0000000=
00 +0200
> ++++ parted-1.8.8.patched/m4/extensions.m4 =A0 =A0 =A02010-05-19 18:14:35=
.000000000 +0200
> +@@ -1,4 +1,4 @@
> +-# serial 4 =A0-*- Autoconf -*-
> ++# serial 5 =A0-*- Autoconf -*-
> + # Enable extensions on systems that normally disable them.
> +
> + # Copyright (C) 2003, 2006 Free Software Foundation, Inc.
> +@@ -16,6 +16,7 @@
> + # ------------------------
> + # Enable extensions on systems that normally disable them,
> + # typically due to standards-conformance issues.
> ++m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [], [
> + AC_DEFUN([AC_USE_SYSTEM_EXTENSIONS],
> + [
> + =A0 AC_BEFORE([$0], [AC_COMPILE_IFELSE])
> +@@ -48,7 +49,7 @@
> + =A0 =A0 AC_DEFINE([__EXTENSIONS__])
> + =A0 AC_DEFINE([_POSIX_PTHREAD_SEMANTICS])
> + =A0 AC_DEFINE([_TANDEM_SOURCE])
> +-])
> ++])])
> +
> + # gl_USE_SYSTEM_EXTENSIONS
> + # ------------------------
> diff --git a/recipes/parted/parted_1.8.8.bb b/recipes/parted/parted_1.8.8=
.bb
> index 2890e23..82369f1 100644
> --- a/recipes/parted/parted_1.8.8.bb
> +++ b/recipes/parted/parted_1.8.8.bb
> @@ -3,11 +3,12 @@ HOMEPAGE =3D "http://www.gnu.org/software/parted/parted=
.html"
> =A0LICENSE =3D "GPLv3"
> =A0SECTION =3D "console/tools"
> =A0DEPENDS =3D "readline util-linux-ng"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 file://use_llseek_syscall.patch;patch=3D1 \
> =A0 =A0 =A0 =A0 =A0 file://parted-1.8.x.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0file://extensions-m4.patch;patch=3D1 \
> =A0"
>
> =A0EXTRA_OECONF =3D "--disable-Werror ac_cv_func_calloc_0_nonnull=3Dyes"
>
>
> regards,
> David
>
> On Tue, Feb 9, 2010 at 5:36 PM, Jay Snyder
> <jay.snyder@tycoelectronics.com> wrote:
>> I'm trying to build parted 1.8.8 on OE:
>>
>>
>> NOTE: Running task 551 of 565 (ID: 3,
>> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, do_unpa=
ck)
>> NOTE: Running task 552 of 565 (ID: 13,
>> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
>> do_distribute_sources)
>> NOTE: Unpacking ../downloads/parted-1.8.8.tar.gz to
>> tmp/work/i686-angstrom-linux/parted-1.8.8-r2/
>> =A0NOTE: Running task 553 of 565 (ID: 4,
>> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb, do_patc=
h)
>> =A0 =A0 =A0 =A0 =A0 NOTE: Applying patch 'use_llseek_syscall.patch'
>> (../2009-12-04/openembedded/recipes/parted/files/use_llseek_syscall.patc=
h)
>>
>> NOTE: Applying patch 'parted-1.8.x.patch'
>> (../2009-12-04/openembedded/recipes/parted/files/parted-1.8.x.patch)
>>
>> NOTE: Running task 554 of 565 (ID: 5,
>> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
>> do_configure) =A0 =A0 =A0 =A0 ERROR: function do_configure failed
>>
>> ERROR: log data follows
>> (/home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do=
_configure.24731)
>>
>> | automake (GNU automake) 1.10.2
>>
>> | Copyright (C) 2008 Free Software Foundation, Inc.
>>
>> | License GPLv2+: GNU GPL version 2 or later
>> <http://gnu.org/licenses/gpl.html>
>>
>> | This is free software: you are free to change and redistribute it.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 | There is NO WARRANTY, to
>> the extent permitted by law.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
>>
>> | Written by Tom Tromey <tromey@redhat.com>
>>
>> | =A0 =A0 =A0 =A0and Alexandre Duret-Lutz <adl@gnu.org>.
>>
>> | AUTOV is 1.10
>>
>> | NOTE: Executing autoreconf --verbose --install --force --exclude=3Daut=
opoint
>> -I
>> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8=
/m4/
>> -I/home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10 =
-I
>> /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal
>> | autoreconf: Entering directory `.'
>> | autoreconf: running: aclocal -I
>> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8=
/m4/
>> -I /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal-1.10=
 -I
>> /home/oe/build/tmp/staging/i686-angstrom-linux/usr/share/aclocal --force=
 -I
>> m4
>> | configure.ac:173: error: AC_REQUIRE: circular dependency of AC_GNU_SOU=
RCE
>> |
>> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8=
/m4/extensions.m4:19:
>> AC_USE_SYSTEM_EXTENSIONS is expanded from...
>> | ../../lib/autoconf/specific.m4:332: AC_GNU_SOURCE is expanded from...
>> |
>> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/parted-1.8.8=
/m4/gnulib-comp.m4:23:
>> gl_EARLY is expanded from...
>> | configure.ac:173: the top level
>> | autom4te: /home/oe/build/tmp/staging/x86_64-linux/usr/bin/m4 failed wi=
th
>> exit status: 1
>> | aclocal: autom4te failed with exit status: 1
>> | autoreconf: aclocal failed with exit status: 1
>> | FATAL: autoreconf execution failed.
>> NOTE: Task failed:
>> /home/oe/build/tmp/work/i686-angstrom-linux/parted-1.8.8-r2/temp/log.do_=
configure.24731
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb do_confi=
gure
>> failed
>> ERROR: Task 5
>> (/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb,
>> do_configure) failed
>> NOTE: Tasks Summary: Attempted 553 tasks of which 548 didn't need to be
>> rerun and 1 failed.
>> ERROR: '/home/oe/2009-12-04/openembedded/recipes/parted/parted_1.8.8.bb'
>> failed
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


