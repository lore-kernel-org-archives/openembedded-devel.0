Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2kcB-0006i8-B3
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 12:53:30 +0100
Received: by ewy5 with SMTP id 5so61449ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JI75PKy9WpGPJXqOP7EL8U5kmVLvqq6UMKVE3QIzOqE=;
	b=W2Yj+DdEKITDqYkvSyG77PggifZAotEknw+zlASYReGkNP+4v3bVcSRVLa64AKk1pR
	pzd58Yr0QYs7euUEM5FO5KcxQ115b5WAqXEGNN4bkXDXvnubSQCfhWet80fgV3D8BqNz
	AuJkcOEwsj3lu8jKegwmjQq/A4rk0Fwk1K5Jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MMCK0lFJTmfG2gUPS2CrQVP9OxLJko1TeeM4JSC8Ta1aPSnKr9o4sGCmpKM6xPSwEv
	ADLDwYGX/skDFmbDDJwPcIo7oRdEgIU3VDZ1Qe7YFP+Xo8OBG5QO/YVSEgJ46DExShjk
	Ne7SfVPgGth6qW+DgDBLY5skWRxLb/f6J3uHI=
MIME-Version: 1.0
Received: by 10.216.86.129 with SMTP id w1mr341779wee.145.1256644340310; Tue, 
	27 Oct 2009 04:52:20 -0700 (PDT)
In-Reply-To: <hc6eva$qum$1@ger.gmane.org>
References: <70c9a9110910270155j3d9aed71m4f106612a94b8cfe@mail.gmail.com>
	<hc6eva$qum$1@ger.gmane.org>
Date: Tue, 27 Oct 2009 12:52:20 +0100
Message-ID: <70c9a9110910270452u18bc1a30k6115a3bac4a71554@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/5] igep0020.conf: Fix missing u-boot entrypoint
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
X-List-Received-Date: Tue, 27 Oct 2009 11:53:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ooops ! You're right. Thanks for checking.

Regards,

Enric

2009/10/27 Koen Kooi <k.kooi@student.utwente.nl>:
> On 27-10-09 09:55, Enric Balletb=C3=B2 i Serra wrote:
>>
>> Signed-off-by: Enric Balletbo i Serra<eballetbo@iseebcn.com>
>> ---
>> =C2=A0conf/machine/igep0020.conf | =C2=A0 =C2=A03 +++
>> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
>> index 512a977..7430646 100644
>> --- a/conf/machine/igep0020.conf
>> +++ b/conf/machine/igep0020.conf
>> @@ -24,6 +24,9 @@ IMAGE_FSTYPES +=3D "tar.bz2 ubi"
>> =C2=A0# Guesswork
>> =C2=A0SERIAL_CONSOLE =3D "115200 ttyS2"
>>
>> +UBOOT_ENTRYPOINT =3D "0x80008000"
>> +UBOOT_LOADADDRESS =3D "0x80008000"
>
> NACK, that is already set from within omap3.inc
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


