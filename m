Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NLNsy-0004na-93
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 22:27:51 +0100
Received: by iwn32 with SMTP id 32so1261044iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2009 13:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EZ5sQv2Nn7Rywe9LdapDFjqNAUBCVAgON9kaaqal9sM=;
	b=GSAq6+5mqyHf6kxj7nwxZLCjCYZcI9HbaDtuY/MP1brxdWt7E5sqvuvEyywxHkY8JD
	wQOAw/XO1NJOAGoB++xHidAYEs9vPMW1Cl/4/PJjuqMxCXA5+6RnJVYKCycBDN/O2/R+
	jlVw+Rn++z9LEIPbXJcnvfehM7nywvUIe5gxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uWpvqVHzUUe13NQ9SZx4+IyOavhM1Zxv2x+jqNxMgRKGCH/ocbu58fDA3WCMkO76LS
	zHgadbRL6Bf2cyGD6zCoyTju2c5XsaXHhMNHjpZ0pG6PsiV8gjT3IChRJoDfiyIROiGq
	cNETYb7Mmt+9uVRBKwTxg3x6izdVGwUU9efzs=
MIME-Version: 1.0
Received: by 10.231.48.210 with SMTP id s18mr840151ibf.3.1261085159600; Thu, 
	17 Dec 2009 13:25:59 -0800 (PST)
In-Reply-To: <4B2A9E92.9060904@balister.org>
References: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<4B2A9E92.9060904@balister.org>
Date: Thu, 17 Dec 2009 13:25:59 -0800
Message-ID: <19c1b8a90912171325m532c1476g7df59e9ed96868b8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Thu, 17 Dec 2009 21:27:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2009 at 1:11 PM, Philip Balister <philip@balister.org> wrot=
e:
> On 12/17/2009 03:07 PM, Khem Raj wrote:
>>
>> * This is not supporting multilib
>> * Only 64-bit userspace can be built.
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0conf/machine/include/tune-x86_64.inc | =C2=A0 =C2=A04 ++++
>> =C2=A0conf/machine/x86_64-generic.conf =C2=A0 =C2=A0 | =C2=A0 31
>> +++++++++++++++++++++++++++++++
>> =C2=A0recipes/gcc/gcc-common.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A04 ++++
>> =C2=A03 files changed, 39 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 conf/machine/include/tune-x86_64.inc
>> =C2=A0create mode 100644 conf/machine/x86_64-generic.conf
>>
>> diff --git a/conf/machine/include/tune-x86_64.inc
>> b/conf/machine/include/tune-x86_64.inc
>> new file mode 100644
>> index 0000000..db2a560
>> --- /dev/null
>> +++ b/conf/machine/include/tune-x86_64.inc
>> @@ -0,0 +1,4 @@
>> +TARGET_CC_ARCH =3D "-mtune=3Dgeneric"
>> +BASE_PACKAGE_ARCH =3D "x86_64"
>> +FEED_ARCH =3D "x86_64"
>> +PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586 i686"
>> diff --git a/conf/machine/x86_64-generic.conf
>> b/conf/machine/x86_64-generic.conf
>> new file mode 100644
>> index 0000000..0dad0ff
>> --- /dev/null
>> +++ b/conf/machine/x86_64-generic.conf
>
>
> Any chance bitbake will find the underscore confusing in the machine name=
?

if there was an override for 64 which does not exist as of now

>
> Philip
>
>
>> @@ -0,0 +1,31 @@
>> +# Copyright (C) 2007,2009 Stelios Koroneos - Digital OPSiS, All Rights
>> Reserved
>> +# Released under the MIT license (see packages/COPYING)
>> +#@TYPE: Machine
>> +#@NAME: x86_64-generic
>> +#@DESCRIPTION: Machine configuration for a generic x86_64 machine
>> +
>> +
>> +TARGET_ARCH =3D "x86_64"
>> +
>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
>> +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-kdrive"
>> +XSERVER=3D"xserver-kdrive-vesa"
>> +
>> +KERNEL_IMAGETYPE =3D "bzImage"
>> +
>> +GLIBC_ADDONS =3D "nptl"
>> +GLIBC_EXTRA_OECONF =3D "--with-tls"
>> +
>> +IMAGE_FSTYPES ?=3D "ext2.gz"
>> +IMAGE_DEVICE_TABLES =3D " \
>> + =C2=A0files/device_table-minimal.txt \
>> + =C2=A0files/device_table_add-loop.txt \
>> + =C2=A0files/device_table_add-scsi.txt \
>> +"
>> +
>> +MACHINE_FEATURES =3D "kernel26 screen keyboard pci usbhost acpi ext2 x8=
6"
>> +MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
>> +
>> +#tune for x86_64
>> +require conf/machine/include/tune-x86_64.inc
>> +
>> diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
>> index 6e777e6..772e7a7 100644
>> --- a/recipes/gcc/gcc-common.inc
>> +++ b/recipes/gcc/gcc-common.inc
>> @@ -15,6 +15,10 @@ def get_gcc_fpu_setting(bb, d):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return "--with-float=3Dsoft"
>> =C2=A0 =C2=A0 =C2=A0return ""
>>
>> +EXTRA_OECONF_append_x86_64 =C2=A0 =C2=A0 =3D " --disable-multilib"
>> +EXTRA_OECONF_append_mips64 =C2=A0 =C2=A0 =3D " --disable-multilib"
>> +EXTRA_OECONF_append_powerpc64 =C2=A0=3D " --disable-multilib"
>> +
>> =C2=A0# We really need HOST_SYS here for some packages and TARGET_SYS fo=
r
>> others.
>> =C2=A0# For now, libgcc is most important so we fix for that - RP.
>> =C2=A0SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


