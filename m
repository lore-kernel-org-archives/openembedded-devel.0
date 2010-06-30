Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OTrOg-0008Vj-NL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:07:55 +0200
Received: by bwz11 with SMTP id 11so216839bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=q82zMzPLjNT6pHQjSGGlM88EnElomA9Fwu7MFR+u5/E=;
	b=ls+X+sfzgBXKmqVONFR5krXUfaayT6ChcNwi9xCxwHSXsc2TEyw05RdGFwRn3Xkm7z
	y+qHWJKwrIF4e/oU7gLhJnSDkGISp65PwRFVLLC3EQZXoF1cDQYwG3ZaNhel4fOGNSPu
	NVcZ8Q48JZMIViiVdy6iLVPNYGwOZCZ2gon9o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WKA+cKSME2BhyMEOGAN3Ze3RO/hmQPO0uC7XeZiHtr+71nhvrVytdRBVZ9FPB5HxaD
	tCibCQgalnVydpwskgc97r+QuJUuwZASz768AhL2ja2EqfBwbB3M+sOF1t1sEZGut6xi
	DrItBJxdS0uDBJ7q6ZM6ikIvMmr1vf3wzc+90=
MIME-Version: 1.0
Received: by 10.204.47.21 with SMTP id l21mr5758191bkf.134.1277881389332; Wed, 
	30 Jun 2010 00:03:09 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Wed, 30 Jun 2010 00:03:09 -0700 (PDT)
In-Reply-To: <i0epn0$ke6$1@dough.gmane.org>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
	<1277858599-27400-3-git-send-email-joaohf@gmail.com>
	<i0epn0$ke6$1@dough.gmane.org>
Date: Wed, 30 Jun 2010 09:03:09 +0200
Message-ID: <AANLkTim86--1-sAePXz04w2xygyDpIPfCzOAw8U0mBKe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] replace sdk -> nativesdk
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
X-List-Received-Date: Wed, 30 Jun 2010 07:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/30 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Martin and I chatted about nativesdk a bit last week and after rereading
> the email thread it seems that 'nativesdk' and 'sdk' should coexist for
> awhile, so have both in BBCLASSEXTENDS?

Care to share the rationale for this?

Wrt the BBCLASSEXTEND:
if we have
BBCLASSEXTEND =3D "native sdk"
should that imply we also get native_sdk (or sdk_native or something
like that) (so do they extend each other), or should things like
nativesdk be mentioned explicitly?

Frans.
>
> regards,
>
> Koen
>
> On 30-06-10 02:43, Joao H. Freitas wrote:
>> ---
>> =A0recipes/cmake/cmake.inc =A0 =A0 =A0| =A0 =A02 +-
>> =A0recipes/cmake/cmake_2.8.1.bb | =A0 =A02 --
>> =A02 files changed, 1 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
>> index 5601ddb..e53cd35 100644
>> --- a/recipes/cmake/cmake.inc
>> +++ b/recipes/cmake/cmake.inc
>> @@ -10,7 +10,7 @@ PR =3D "r3"
>> =A0CMAKE_MAJOR_VERSION =3D "${@bb.data.getVar('PV',d,1).split('.')[0]}.$=
{@bb.data.getVar('PV',d,1).split('.')[1]}"
>> =A0SRC_URI =3D "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake=
-${PV}.tar.gz"
>>
>> -BBCLASSEXTEND =3D "native sdk"
>> +BBCLASSEXTEND =3D "native nativesdk"
>>
>> =A0inherit autotools
>>
>> diff --git a/recipes/cmake/cmake_2.8.1.bb b/recipes/cmake/cmake_2.8.1.bb
>> index 845ea7c..279495c 100644
>> --- a/recipes/cmake/cmake_2.8.1.bb
>> +++ b/recipes/cmake/cmake_2.8.1.bb
>> @@ -1,7 +1,5 @@
>> =A0require cmake.inc
>>
>> -#inherit cmake
>> -
>> =A0do_configure_append() {
>> =A0 =A0 =A0 sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:I=
NTERNAL=3D1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=3D0,' CM=
akeCache.txt
>> =A0}
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMKuogMkyGM64RGpERAvN7AKCEvgfnOi0yyFdM4TlIUMRURRCz/QCfe8TF
> ZqNPtfxlSkMEMv8DajxRUCk=3D
> =3D4FWY
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


