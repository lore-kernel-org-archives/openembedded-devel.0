Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjclL-0000mT-2E
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 19:39:51 +0200
Received: by qw-out-1920.google.com with SMTP id 4so260296qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 10:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IztnxPkfhVl+ww0mw0tqQamrdvpvvWpIpfUazBTLCjE=;
	b=V6ARlOoQ9opzXlnFj6X1Ve52fIsQHjlegoUEjPYUswydFlch5kcyNh85p4aQDyCPms
	DUZhTEvrRpW9UeCw/h6l+GPv8mPBlYP3XL+7+Dgpwy/awmatVxjxcslr8NKsJHxAA492
	oHYqQhm5BAlpUwNLutVh188qymlI2CZjTAoc0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OFX2kxGjTVcu1BwXmvolQAgTKq4hf+Gbd8WGyPoIOdY8EiiQnmRKKUWU2jG+r5bew7
	3IVSxHieZ5KyDyCJR2zz1d1Rpxh1VZpTSangj6bRq6OiIyw0niqlKvWYDsXybJZiZryx
	+MZed98A62uC5OqZ61IcWhNM2UJrYi1Chbwek=
MIME-Version: 1.0
Received: by 10.229.19.149 with SMTP id a21mr3501667qcb.29.1252084852409; Fri, 
	04 Sep 2009 10:20:52 -0700 (PDT)
In-Reply-To: <h7rch9$u4f$1@ger.gmane.org>
References: <1252075968-14536-1-git-send-email-raj.khem@gmail.com>
	<h7rch9$u4f$1@ger.gmane.org>
Date: Fri, 4 Sep 2009 10:20:52 -0700
Message-ID: <19c1b8a90909041020i3cb20298x2981581ee8597ada@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] angstrom: Use linux-uclibceabi instead of linux-uclibcgnueabi
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
X-List-Received-Date: Fri, 04 Sep 2009 17:39:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2009 at 8:42 AM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 04-09-09 16:52, Khem Raj wrote:
>>
>> * For uclibc based ARM EABI systems switch to using linux-uclibceabi
>> =C2=A0 as TARGET_OS
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
> I wasn't happy with the other linux-gnu stuff, but since that's in now:
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Thanks. Yes its gross but it I think/hope it will be helpful.
>
>
>> ---
>> =C2=A0conf/distro/include/angstrom-2007-for-openmoko.inc | =C2=A0 =C2=A0=
4 ++--
>> =C2=A0conf/distro/include/angstrom-uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0conf/distro/include/angstrom-uclinux-uclibc.inc =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
>> =C2=A0.../include/sane-toolchain-uclinux-uclibc.inc =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 =C2=A02 --
>> =C2=A04 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/conf/distro/include/angstrom-2007-for-openmoko.inc
>> b/conf/distro/include/angstrom-2007-for-openmoko.inc
>> index 1deb85d..6741bae 100644
>> --- a/conf/distro/include/angstrom-2007-for-openmoko.inc
>> +++ b/conf/distro/include/angstrom-2007-for-openmoko.inc
>> @@ -143,8 +143,8 @@
>> PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D
>> "glibc"
>> =C2=A0PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D
>> "glibc"
>> =C2=A0PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
>> "glibc"
>>
>> -PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gc=
c
>> =C2=A0 =C2=A0=3D "uclibc-initial"
>>
>> -PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-=
gcc
>> =C2=A0=3D "uclibc-initial"
>> +PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibceabi-libc-for-gcc
>> =C2=A0=3D "uclibc-initial"
>> +PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibceabi-libc-for-gcc
>> =C2=A0=3D "uclibc-initial"
>>
>> =C2=A0# hostap stuff, we prefer the in-kernel modules, but those don't w=
ork for
>> all machines
>> =C2=A0PREFERRED_PROVIDER_hostap-conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "hostap-conf"
>> diff --git a/conf/distro/include/angstrom-uclibc.inc
>> b/conf/distro/include/angstrom-uclibc.inc
>> index a60952f..004d904 100644
>> --- a/conf/distro/include/angstrom-uclibc.inc
>> +++ b/conf/distro/include/angstrom-uclibc.inc
>> @@ -9,7 +9,7 @@ USE_NLS_glib-2.0 =3D "yes"
>> =C2=A0USE_NLS_glib-2.0-native =3D "yes"
>> =C2=A0USE_NLS_gcc-cross =3D "no"
>>
>> -TARGET_OS_UC =3D
>> "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) =
in
>> ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600=
',
>> 'h3800', 'simpad', 'htcwallaby']]}"
>> +TARGET_OS_UC =3D
>> "linux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in
>> ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600=
',
>> 'h3800', 'simpad', 'htcwallaby']]}"
>> =C2=A0TARGET_OS =3D "${@['${TARGET_OS_UC}',
>> 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d) =C2=A0in ['bfin']]}"
>>
>> =C2=A0#mess with compiler flags to use -Os instead of -O2
>> diff --git a/conf/distro/include/angstrom-uclinux-uclibc.inc
>> b/conf/distro/include/angstrom-uclinux-uclibc.inc
>> index 019f814..ad499f7 100644
>> --- a/conf/distro/include/angstrom-uclinux-uclibc.inc
>> +++ b/conf/distro/include/angstrom-uclinux-uclibc.inc
>> @@ -6,7 +6,7 @@ USE_NLS_glib-2.0 =3D "yes"
>> =C2=A0USE_NLS_glib-2.0-native =3D "yes"
>> =C2=A0USE_NLS_gcc-cross =3D "no"
>>
>> -TARGET_OS_UC =3D
>> "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1=
) in
>> ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600=
',
>> 'h3800', 'simpad', 'htcwallaby']]}"
>> +TARGET_OS_UC =3D
>> "uclinux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) i=
n
>> ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600=
',
>> 'h3800', 'simpad', 'htcwallaby']]}"
>>
>> =C2=A0#mess with compiler flags to use -Os instead of -O2
>> =C2=A0#Please see
>> http://free-electrons.com/doc/embedded_linux_optimizations/img47.html fo=
r
>> some more info
>> diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
>> b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
>> index b757efb..fbb239a 100644
>> --- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
>> +++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
>> @@ -7,8 +7,6 @@ USE_NLS_glib-2.0 =3D "yes"
>> =C2=A0USE_NLS_glib-2.0-native =3D "yes"
>> =C2=A0USE_NLS_gcc-cross =3D "no"
>>
>> -TARGET_OS_UC =3D
>> "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1=
) in
>> ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600=
',
>> 'h3800', 'simpad', 'htcwallaby']]}"
>> -
>> =C2=A0#mess with compiler flags to use -Os instead of -O2
>> =C2=A0#Please see
>> http://free-electrons.com/doc/embedded_linux_optimizations/img47.html fo=
r
>> some more info
>> =C2=A0FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-poin=
ter
>> -frename-registers -Os"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


