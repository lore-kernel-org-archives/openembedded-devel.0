Received: from mail-iw0-f198.google.com ([209.85.223.198])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NSDdm-0005DY-GC
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 18:56:25 +0100
Received: by iwn36 with SMTP id 36so11099885iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jcyL5z9HVJzyc+7W3pYaufzzmXXU5M4SKallCTCf0W8=;
	b=SCugl87Rp9f22YEUFXV6DvOL3Zf3GkOS3u/u8Epi3MEyGD4P8ZLMXIhNblVvmNhQKl
	FVA21xxTfAZbXj96cINtlvJEgXJ8EprmANcEE1pLBb83oyTRuuZqs9p8fjxplsXJjH/c
	AWG+4RcSMFlGQqZFtjlMPPWLX12EcKH8Wd9jg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H1RvkPyBSNhJVKH6zWisTk2RHri27LwVzWNASEudDEzRnRFOp69CdOhrjGBCfv0F6t
	SJyL2BTVy4MUw/s1EiPBlJeVsEGjlzKHgfh/hNfuVR0sUhVcnpsK+40j4I6y3ATF6jYk
	wxIhNcjqfGeDrBJzpzcnv0bI5gOsmKsgWyWXg=
MIME-Version: 1.0
Received: by 10.231.122.103 with SMTP id k39mr2852570ibr.10.1262714058255; 
	Tue, 05 Jan 2010 09:54:18 -0800 (PST)
In-Reply-To: <ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
	<19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
	<ec1f3d400912090347w217d39d2jd64c9801f95e96e4@mail.gmail.com>
	<19c1b8a90912092118o54903eb4v4044e2c1191617c8@mail.gmail.com>
	<ec1f3d400912100300l42da9902wee299ca7bd27e6bb@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
Date: Tue, 5 Jan 2010 09:54:18 -0800
Message-ID: <19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Tue, 05 Jan 2010 17:56:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 5, 2010 at 1:43 AM, RK Raggit <rk.raggit@gmail.com> wrote:
> Sorry for the delay in replying. I was on vacation.
>
> =C2=A0if you use minimal or micro distro then eglibc is default libc for
>> others you can add
>>
>> LIBC=3D"eglibc"
>>
>> IIRC angstrom needs ANGSTROMLIBC =3D "eglibc"
>>
>> for choosing 2.11 you can add
>>
>> PREFERRED_VERSION_eglibc =3D "2.11"
>> PREFERRED_VERSION_eglibc-initial =3D "2.11"
>>
>> to your local.conf
>>
>
> This is my lineup now -
> PREFERRED_VERSION_binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D "2.20"
> PREFERRED_VERSION_binutils-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.20"
> PREFERRED_VERSION_binutils-cross-sdk =C2=A0 =C2=A0 =3D "2.20"
> PREFERRED_VERSION_gcc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross-initial =C2=A0 =C2=A0 =C2=A0=3D "4.4.1"
> PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.1"
> PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D "2.9"
> PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.9"
> PREFERRED_VERSION_eglibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D "2.10"
> PREFERRED_VERSION_eglibc-initial =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "2.10"
> ANGSTROMLIBC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "eglibc"
> =C2=A0I had started with eglibc2.11 but some failure occured in the build=
 (i dont
> quite remember the error). Based on the above lineup my build fails while
> packaging eglibc. This is the log -
>
> ----------------------------------------------------------------------
> NOTE: Running task 897 of 3319 (ID: 195,
> /home/raghu/opendistro/openembedded/recipes/eglibc/eglibc_2.10.bb,
> do_package)
> + export localstatedir=3D/var
> ...
> ...
> ...
> + cd
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglib=
c-2.10-r7.1/build-arm-angstrom-linux-gnueabi
> + do_prep_locale_tree
> +
> treedir=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnu=
eabi/eglibc-2.10-r7.1/locale-tree
> ...
> ...
> ...
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglib=
c-2.10-r7.1/temp/run.do_prep_locale_tree.23041:
> line 819: [:
> /home/raghu/opendistro/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/=
lib/libgcc_s.so:
> binary operator expected
> ...
> ...
>
> NOTE: Task failed: localedef returned an error (command was
> PATH=3D"/home/raghu/opendistro/build/tmp/staging/i686-linux/usr/bin/armv7=
a-angstrom-linux-gnueabi:/home/raghu/opendistro/build/tmp/staging/i686-linu=
x/usr/bin/armv7a-angstrom-linux-gnueabi:/home/raghu/opendistro/build/tmp/st=
aging/i686-linux/usr/sbin:/home/raghu/opendistro/build/tmp/staging/i686-lin=
ux/usr/bin:/home/raghu/opendistro/build/tmp/cross/armv7a/bin:/home/raghu/op=
endistro/build/tmp/staging/i686-linux/sbin:/home/raghu/opendistro/build/tmp=
/staging/i686-linux/bin:/home/raghu/opendistro/bitbake-1.8.12/bin:/home/rag=
hu/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/ARM/FastM=
odelTools_5.0/bin:/home/raghu/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/b=
in:/home/raghu/sg/ARM/FastModelTools_5.0/bin:/distro/cortex/STLinux-2.3/dev=
kit/arm/bin/:/usr/kerberos/bin:/usr/lib/ccache:/home/raghu/sg/ARM/FastModel=
Tools_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/ARM/FastModelTools_5.0/bin:/=
home/raghu/sg/ARM/FastModelTools_5.0/ModelDebugger_5.0/bin:/home/raghu/sg/A=
RM/FastModelTools_5.0/bin:/distro/cortex/STLinux-2.3/devkit/arm/bin/:/usr/l=
ocal/bin:/bin:/usr/bin:/home/raghu/bin"
> I18NPATH=3D"/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/eglibc-2.10-r7.1/locale-tree//usr/share/i18n"
> qemu-arm =C2=A0-s 1048576 -r 2.6.16 -L
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglib=
c-2.10-r7.1/locale-tree
> -E
> LD_LIBRARY_PATH=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-l=
inux-gnueabi/eglibc-2.10-r7.1/locale-tree/lib
> /home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglib=
c-2.10-r7.1/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=3D/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gn=
ueabi/eglibc-2.10-r7.1/locale-tree
> --inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> ERROR: TaskFailed event exception, aborting

It seems that qemu is aborting while running localedef. Unless you
really need locales I would recommend to disable
the locale generation. Add
ENABLE_BINARY_LOCALE_GENERATION =3D "0"
to your local.conf and rebuild eglibc.

-Khem


