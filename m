Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NUeyR-0007mK-Dj
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 12:31:50 +0100
Received: by ywh8 with SMTP id 8so21980366ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VxiCP/chmZKUpa7YFoi0+4RvKyej2mB29w/g/5nujbg=;
	b=izCuQYXIwdmfzd00gqW5X69rDsn99uI3nEEarSxfS0ZT9aH5CeKltNwslgsWcs4DO3
	zUaBb1eJMCF1t6+bNg4UqO+Zw9UuR8QWv+f4r19y9Iop6C4Ds8fMkxWNlcmJg7ZctLqD
	+dETwP4XoH+W9H/PWJJvPogob57tvli9YcH1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ais8olhr9QpBil8nCfroI4E7CK8pHoHeU74mFw6OJVTHNq+iydqo3MTo7J+RmN7zUa
	C6m1W70MuoPg0MCOvBVJ8KNRJD3YbYFN5SUXhNNqILIRPLIrKi+7C1N7D8tiYLVqpVnM
	P3KVVolGZYFBj8CDODyS2msQ2JfTb0fIIVI5A=
MIME-Version: 1.0
Received: by 10.101.132.14 with SMTP id j14mr9814103ann.58.1263295777511; Tue, 
	12 Jan 2010 03:29:37 -0800 (PST)
In-Reply-To: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 12 Jan 2010 12:29:37 +0100
Message-ID: <ac9c93b11001120329wfe39627vda59932fb1c3784b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [gcc 4.4.2] [libcap, vdr] relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
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
X-List-Received-Date: Tue, 12 Jan 2010 11:31:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/1/12 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE hackers,
>
>
> sorry for bothering you with this. I am trying to reproduce the errors
> Henning has seen with g++ 4.4.2 [1] and therefore added the following
> lines to my `local.conf` for =C5ngstr=F6m with BeagleBoard [2].
>
> Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:
>
> [=85]
>
>> Putting
>>
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_binutils =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D "2.20"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_binutils-cross =A0 =A0 =A0 =A0 =3D "2.=
20"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_binutils-cross-sdk =A0 =A0 =3D "2.20"
>>
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_gcc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=3D "4.4.2"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_gcc-cross =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D "4.4.2"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_gcc-cross-sdk =A0 =A0 =A0 =A0 =A0=3D "=
4.4.2"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_gcc-cross-initial =A0 =A0 =A0=3D "4.4.=
2"
>> =A0 =A0 =A0 =A0 PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
>>
>> in my `local.conf` and running `bitbake vdr` gave me an error in
>> `do_compile` for `libcap_1.10.bb`.
>>
>> =A0 =A0 =A0 =A0 arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -sh=
ared -o libcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_t=
ext.o cap_sys.o
>> =A0 =A0 =A0 =A0 arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_=
ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shar=
ed object; recompile with -fPIC
>
> I do not get these errors if I use the standard versions defined for
> =C5ngstr=F6m which is 4.1.1. Adding `-fPIC` to the flags as suggested in =
[3]
> solves the problem for me.
>
> Does anyone know if GCC=92s behavior was changed somehow?

Did you start from scratch (with an empty tmp)? If not it might well
be that something has been changed and you are mixing objects from two
versions of gcc (which possibly their own set of options and
defaults).

Frans


