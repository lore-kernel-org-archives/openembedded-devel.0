Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PERzQ-0000yS-FC
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 20:30:39 +0100
Received: by gwaa11 with SMTP id a11so2514372gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5qrD28kp96WfJ1e8U3CS2kRtgoBCtfwbacUs+k4Bsl8=;
	b=xyIJPUI73tVQK7IJu6lrobWz4Dc4FUSlR8M1zcndVL1jjyfCEMAvrycSAzy1pxUpKm
	sJoDSFO0s5WkYWudgarkG6iGefXfyidekYYjSmrl/Uzk2aGn0zPvXiA+n5YckYM5tstj
	v9r13ZfUl0BeU+klJhuZpACXq+O8Q8Djwj1sA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hn1kasKqOXKu55bmYwemJEzwAonD6WpJbeA0EyXKKt8JdFdztH365BTojnw5beiJ9O
	yrt2xvQsZKNkntEUodxYYkWs0osA19lZ2ohkYbCZ0+lV7xlbSQa6iuILmu5JV24E+8SO
	PnJ4srYA+5bFVqHYghO1TK/kD0VfZS1C38kUM=
MIME-Version: 1.0
Received: by 10.42.76.145 with SMTP id e17mr1676460ick.62.1288985354675; Fri,
	05 Nov 2010 12:29:14 -0700 (PDT)
Received: by 10.220.118.5 with HTTP; Fri, 5 Nov 2010 12:29:14 -0700 (PDT)
In-Reply-To: <AANLkTincNJZVqfZKkHfHRTu9R9bN+_DL_5bfHvfQXRiR@mail.gmail.com>
References: <4CD43116.5020304@lambsys.com>
	<AANLkTincNJZVqfZKkHfHRTu9R9bN+_DL_5bfHvfQXRiR@mail.gmail.com>
Date: Fri, 5 Nov 2010 12:29:14 -0700
Message-ID: <AANLkTikq2i7xmVfdrbDRzO=SqHBXxmKN8zQw4+u_anDk@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
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
X-List-Received-Date: Fri, 05 Nov 2010 19:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 12:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Nov 5, 2010 at 9:30 AM, David Lambert <dave@lambsys.com> wrote:
>> I am getting apparent random failures when attempting to build OpenEmbed=
ded
>> with bitbake 1.10.0. =A0It seems that localedef is randomly failing as s=
hown
>> below. The first time it failed compiling UTF-8 es_NI, the second UTF-8
>> gv_GB, third UTF-8 es_NI again, and finally UTF-8 xh_ZA.
>> Initially I suspected a problem with my machine, but I ran diagnostics
>> overnight with no failures. Has anyone else experienced this type of
>> failure? Could you help guide me where else to look?
>>
>
> I think its because qemu-arm is dying on you. there is 0.13 release
> that happens few weeks back
> I am still working on getting that into OE. Once I have that in may be
> it will get fixed I am not sure yet
> remain tuned
>
> -Khem
>
>>
>> Thanks in advance for any help.
>>
>> Best regards,
>>
>> Dave.
>>
>>
>> NOTE: Task failed: localedef returned an error (command was
>> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:=
/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/=
build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/=
i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/=
dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/=
usr/games:/usr/local/armelf/bin"



I am running into the same similar issue on my 64bit machine. Where
its not building the correct places randomly. For me its libtool
aclocal aclocal-1.11




>> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
>> qemu-arm -s 1048576 -r 2.6.24 -L
>> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r37.3/locale-tree
>> -E
>> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linu=
x-gnueabi/glibc-2.9-r37.3/locale-tree/lib
>> =A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r37.3/locale-tree/bin/localedef
>> --force --old-style --no-archive
>> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree
>> --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
>> NOTE: package glibc-2.9-r37.3: task do_package: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> dlambert@development:~/oe/build$ bitbake base-image
>> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
>> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 targe=
ts,
>> 339 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 516 of 1345 (ID: 159,
>> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
>> NOTE: package glibc-2.9-r37.3: task do_package: Started
>> NOTE: preparing tree for binary locale generation
>> NOTE: generating locale es_NI (UTF-8)
>> NOTE: generating locale bo_IN (UTF-8)
>> NOTE: generating locale gv_GB (UTF-8)
>> qemu-arm: relocation error: qemu-arm: symbol unlink, version GLIBC_2.0 n=
ot
>> defined in file libc.so.6 with link time reference
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> NOTE: Task failed: localedef returned an error (command was
>> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:=
/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/=
build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/=
i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/=
dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/=
usr/games:/usr/local/armelf/bin"
>> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
>> qemu-arm -s 1048576 -r 2.6.24 -L
>> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r37.3/locale-tree
>> -E
>> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linu=
x-gnueabi/glibc-2.9-r37.3/locale-tree/lib
>> =A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r37.3/locale-tree/bin/localedef
>> --force --old-style --no-archive
>> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree
>> --inputfile=3D/usr/share/i18n/locales/gv_GB --charmap=3DUTF-8 gv_GB).
>> NOTE: package glibc-2.9-r37.3: task do_package: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> dlambert@development:~/oe/build$ bitbake base-image
>> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
>> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 targe=
ts,
>> 339 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 516 of 1345 (ID: 159,
>> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
>> NOTE: package glibc-2.9-r37.3: task do_package: Started
>> NOTE: preparing tree for binary locale generation
>> NOTE: generating locale es_NI (UTF-8)
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> NOTE: Task failed: localedef returned an error (command was
>> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:=
/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/=
build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/=
i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/=
dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/=
usr/games:/usr/local/armelf/bin"
>> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
>> qemu-arm -s 1048576 -r 2.6.24 -L
>> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r37.3/locale-tree
>> -E
>> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linu=
x-gnueabi/glibc-2.9-r37.3/locale-tree/lib
>> =A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r37.3/locale-tree/bin/localedef
>> --force --old-style --no-archive
>> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree
>> --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
>> NOTE: package glibc-2.9-r37.3: task do_package: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> dlambert@development:~/oe/build$ bitbake base-image
>> NOTE: Handling BitBake files: \ (7090/7090) [100 %]
>> Parsing of 7090 .bb files complete (6676 cached, 414 parsed). 7279 targe=
ts,
>> 339 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 516 of 1345 (ID: 159,
>> /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
>> NOTE: package glibc-2.9-r37.3: task do_package: Started
>> NOTE: preparing tree for binary locale generation
>> NOTE: generating locale es_NI (UTF-8)
>> NOTE: generating locale bo_IN (UTF-8)
>> NOTE: generating locale gv_GB (UTF-8)
>> NOTE: generating locale kw_GB (UTF-8)
>> NOTE: generating locale en_BW (UTF-8)
>> NOTE: generating locale xh_ZA (UTF-8)
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> NOTE: Task failed: localedef returned an error (command was
>> PATH=3D"/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/armv5te/bin:=
/home/dlambert/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/dlambert/oe/=
build/tmp/sysroots/i686-linux/usr/bin:/home/dlambert/oe/build/tmp/sysroots/=
i686-linux/sbin:/home/dlambert/oe/build/tmp/sysroots/i686-linux//bin:/home/=
dlambert/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/=
usr/games:/usr/local/armelf/bin"
>> I18NPATH=3D"/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnue=
abi/glibc-2.9-r37.3/locale-tree/usr/share/i18n"
>> qemu-arm -s 1048576 -r 2.6.24 -L
>> /home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.=
9-r37.3/locale-tree
>> -E
>> LD_LIBRARY_PATH=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linu=
x-gnueabi/glibc-2.9-r37.3/locale-tree/lib
>> =A0/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc=
-2.9-r37.3/locale-tree/bin/localedef
>> --force --old-style --no-archive
>> --prefix=3D/home/dlambert/oe/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/glibc-2.9-r37.3/locale-tree
>> --inputfile=3D/usr/share/i18n/locales/xh_ZA --charmap=3DUTF-8 xh_ZA).
>> NOTE: package glibc-2.9-r37.3: task do_package: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.b=
b
>> do_package failed
>> ERROR: Task 159 (/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.=
bb,
>> do_package) failed with 256
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>> ERROR: '/home/dlambert/oe/openembedded/recipes/glibc/glibc_2.9.bb' faile=
d
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


