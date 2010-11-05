Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PERq4-0001mP-Oj
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 20:20:41 +0100
Received: by gyf3 with SMTP id 3so2560288gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wLuHp9KucQ+0zffVjPSfF9LEpY8+zBLRpxZDJQUT8W4=;
	b=orXHs2RG0SOjuFeQhKT1tqAzD/O3IqH0yC6RsY7lY359q21zDeT8R6jzvEB7LV79Rk
	1wrwdwaJt31iA1u1drPEll5J7fORnKVSeocVsMUwU5Mhd2zR8v8SgJPP4D306vu7y7WH
	3GqwMlCViCxgLPB2tyGXQKEILYYDZzI6vk1rc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Syhq4DN6BHE62DBwzgwek63Fgpn8XrDbj/9DjvNH25GMmYF8S2wNsGDA8Ds+BrUWLS
	PC8YMuxVjmi1A1iXcIrcXk3iDxlV/NzSmFWSyktI0gMOIrG5h48dde19tLiITubUmYKE
	Jix51rEMNMzAqljiDY/FC72zUOxT0dpzhGpqw=
Received: by 10.90.57.2 with SMTP id f2mr1759325aga.118.1288984785215; Fri, 05
	Nov 2010 12:19:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 5 Nov 2010 12:19:25 -0700 (PDT)
In-Reply-To: <4CD43116.5020304@lambsys.com>
References: <4CD43116.5020304@lambsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 12:19:25 -0700
Message-ID: <AANLkTincNJZVqfZKkHfHRTu9R9bN+_DL_5bfHvfQXRiR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Random problems with building locales
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
X-List-Received-Date: Fri, 05 Nov 2010 19:20:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 9:30 AM, David Lambert <dave@lambsys.com> wrote:
> I am getting apparent random failures when attempting to build OpenEmbedd=
ed
> with bitbake 1.10.0. =C2=A0It seems that localedef is randomly failing as=
 shown
> below. The first time it failed compiling UTF-8 es_NI, the second UTF-8
> gv_GB, third UTF-8 es_NI again, and finally UTF-8 xh_ZA.
> Initially I suspected a problem with my machine, but I ran diagnostics
> overnight with no failures. Has anyone else experienced this type of
> failure? Could you help guide me where else to look?
>

I think its because qemu-arm is dying on you. there is 0.13 release
that happens few weeks back
I am still working on getting that into OE. Once I have that in may be
it will get fixed I am not sure yet
remain tuned

-Khem

>
> Thanks in advance for any help.
>
> Best regards,
>
> Dave.
>
>
> NOTE: Task failed: localedef returned an error (command was
> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/=
home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/b=
uild/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i=
686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/d=
lambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u=
sr/games:/usr/local/armelf/bin"
> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
> qemu-arm -s 1048576 -r 2.6.24 -L
> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r37.3/locale-tree
> -E
> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r37.3/locale-tree/lib
> =C2=A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r37.3/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueab=
i/glibc-2.9-r37.3/locale-tree
> --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> NOTE: package glibc-2.9-r37.3: task do_package: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> dlambert@development:~/oe/build$ bitbake base-image
> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 target=
s,
> 339 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 516 of 1345 (ID: 159,
> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
> NOTE: package glibc-2.9-r37.3: task do_package: Started
> NOTE: preparing tree for binary locale generation
> NOTE: generating locale es_NI (UTF-8)
> NOTE: generating locale bo_IN (UTF-8)
> NOTE: generating locale gv_GB (UTF-8)
> qemu-arm: relocation error: qemu-arm: symbol unlink, version GLIBC_2.0 no=
t
> defined in file libc.so.6 with link time reference
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> NOTE: Task failed: localedef returned an error (command was
> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/=
home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/b=
uild/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i=
686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/d=
lambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u=
sr/games:/usr/local/armelf/bin"
> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
> qemu-arm -s 1048576 -r 2.6.24 -L
> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r37.3/locale-tree
> -E
> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r37.3/locale-tree/lib
> =C2=A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r37.3/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueab=
i/glibc-2.9-r37.3/locale-tree
> --inputfile=3D/usr/share/i18n/locales/gv_GB --charmap=3DUTF-8 gv_GB).
> NOTE: package glibc-2.9-r37.3: task do_package: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> dlambert@development:~/oe/build$ bitbake base-image
> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 target=
s,
> 339 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 516 of 1345 (ID: 159,
> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
> NOTE: package glibc-2.9-r37.3: task do_package: Started
> NOTE: preparing tree for binary locale generation
> NOTE: generating locale es_NI (UTF-8)
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> NOTE: Task failed: localedef returned an error (command was
> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/=
home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/b=
uild/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i=
686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/d=
lambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u=
sr/games:/usr/local/armelf/bin"
> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
> qemu-arm -s 1048576 -r 2.6.24 -L
> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r37.3/locale-tree
> -E
> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r37.3/locale-tree/lib
> =C2=A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r37.3/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueab=
i/glibc-2.9-r37.3/locale-tree
> --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> NOTE: package glibc-2.9-r37.3: task do_package: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> dlambert@development:~/oe/build$ bitbake base-image
> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 target=
s,
> 339 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 516 of 1345 (ID: 159,
> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
> NOTE: package glibc-2.9-r37.3: task do_package: Started
> NOTE: preparing tree for binary locale generation
> NOTE: generating locale es_NI (UTF-8)
> NOTE: generating locale bo_IN (UTF-8)
> NOTE: generating locale gv_GB (UTF-8)
> NOTE: generating locale kw_GB (UTF-8)
> NOTE: generating locale en_BW (UTF-8)
> NOTE: generating locale xh_ZA (UTF-8)
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> NOTE: Task failed: localedef returned an error (command was
> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:/=
home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/b=
uild/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/i=
686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/d=
lambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u=
sr/games:/usr/local/armelf/bin"
> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
> qemu-arm -s 1048576 -r 2.6.24 -L
> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9=
-r37.3/locale-tree
> -E
> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r37.3/locale-tree/lib
> =C2=A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r37.3/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueab=
i/glibc-2.9-r37.3/locale-tree
> --inputfile=3D/usr/share/i18n/locales/xh_ZA --charmap=3DUTF-8 xh_ZA).
> NOTE: package glibc-2.9-r37.3: task do_package: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb
> do_package failed
> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b,
> do_package) failed with 256
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' failed
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


