Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1M0oWC-0000Qa-7m
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 05:07:00 +0200
Received: by yw-out-1718.google.com with SMTP id 9so2226710ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 May 2009 20:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IyMlHOPBVvoX4rOVrHCdBqu2mjLyo1J1Lv67Cp2W4es=;
	b=g2ozdEfGQcA52g1SQVmDZOk5sBHTR168uJorhfJTrje/qs4VKlKe/m3E0OEv0+WKaj
	q4PtkYC5+h230tbBu479i1X5jnkjkK1LxdBjCvIZErYRWmeLxlojfSuV4wypetMfWNKg
	khadODEl1BcfVqidpkyARojxXPKX5PgxLSRIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=O4G/z2cH7SbLL9LOoGOGmDd4ML9PdUDDtO7vh1exqgI2+9ZBCg9RRXwzc3deL2a8uv
	GBVmONgZadL9eVCX3YG876OfBT72hVtHKCaOpwoiSenPMQg0vI+3PbGhHMGfUP9v3UwF
	7T67RgiaaJL7lBKLLEnu9DgDzD139Wt6USzN4=
MIME-Version: 1.0
Received: by 10.100.164.12 with SMTP id m12mr12001920ane.88.1241406075548; 
	Sun, 03 May 2009 20:01:15 -0700 (PDT)
In-Reply-To: <20090503233017.GE7973@smtp.west.cox.net>
References: <20090503233009.B15601880DC@amethyst.openembedded.net>
	<20090503233017.GE7973@smtp.west.cox.net>
Date: Sun, 3 May 2009 20:01:15 -0700
Message-ID: <19c1b8a90905032001x496ed10cp7d132d2ae176572a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Tom Rini : base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first.
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
X-List-Received-Date: Mon, 04 May 2009 03:07:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2009 at 4:30 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Mon, May 04, 2009 at 01:30:09AM +0200, GIT User account wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 714bed6ab1174ec126ea7d8c8655d1cfd6900325
>> URL: =C2=A0 =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3D714bed6ab1174ec126ea7d8c8655d1cfd6900325
>>
>> Author: Tom Rini <trini@embeddedalley.com>
>> Date: =C2=A0 Sun May =C2=A03 19:23:57 2009 -0400
>>
>> base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first.
>> Comment on what this function is used for primarily. =C2=A0The default
>> gcc3-native that we build is called 'gcc-3.4.6' so look for that one
>> first.
>
> I thought we had fixed this before, but apparently we had not. =C2=A0I'd =
like
> to propose two related changes, and then pull this all out for
> stable/2009. =C2=A0First, no distro has a preferred version for gcc3-nati=
ve,
> so I would like to drop gcc-native_3.4.4 and just use 3.4.6. =C2=A0Second=
,
> I'd like to change the order to:
> 'gcc-3.4.6 gcc-3.4.7 gcc-3.4 gcc34' as I'm unconvinced that anything

there was no 3.4.7. Does qemu work with any gcc 3.4.x ?

It would be good if its fixed.


