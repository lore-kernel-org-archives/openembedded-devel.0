Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYvho-0002aM-Vp
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 08:44:46 +0200
Received: by iwn34 with SMTP id 34so6807495iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BelzFzDg2Q6yeQFEUNDQhV3iN0b6XMQRR2c/1wIxnww=;
	b=Pvqyjp4zGIcEMO9ewN1InC0jzgFRz1c42ZRRBRDIV2uPLvogHLobgFLpLCTzEHevFZ
	2aD1YKA4m7075ffAZDO7hLgeA+Gsz598CHL02XFshiPqajdIq997rvvVlgiteReuWw5E
	SL2wzjKta7gW8+5IMaMbQKA0XarBez+qB7gq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=JQq7elYZfu4fw0tE86LIEA90WWN7SJm+xpVrn5npqnR4fAYQvcfzzi0eF2K0HGBiyB
	0RiVdOMT/Q3nw2u/OrVyoDx5F4tTeXa7RvOzPaLLy3ZflVvhhpskTK1wSUzJZPrMrznK
	m4byCwOVqkbPoYBzOKlhZKpbrrrbym2wruQhU=
Received: by 10.42.36.3 with SMTP id s3mr5467748icd.95.1279089870296; Tue, 13 
	Jul 2010 23:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.11.12 with HTTP; Tue, 13 Jul 2010 23:44:10 -0700 (PDT)
In-Reply-To: <113134CF306E8E4CACC27BE5937261B20931BF1B28@AUSX7MCPS303.AMER.DELL.COM>
References: <113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTilYsPNfPjreXVd31_k4mzUDHLiyY4XlPNmJh6x-@mail.gmail.com> 
	<113134CF306E8E4CACC27BE5937261B20931BF1B28@AUSX7MCPS303.AMER.DELL.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jul 2010 23:44:10 -0700
Message-ID: <AANLkTildsmw9qsK89yM-ta6Lj0BBJj3clWCyD8z6p1V3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Correcting APACHE mirror location for APR recipes.
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
X-List-Received-Date: Wed, 14 Jul 2010 06:44:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2010 at 8:08 AM,  <Sean_Hudson@dell.com> wrote:
> It appears as though the only versions visible at the current URL are the=
 latest version. =A0To get access to the latest version, the archive URL ap=
pears to be necessary. =A0It is worth noting that the archive seems to cont=
ain the latest version too.

OK. Does this require any updates to checksums ?


>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Tuesday, July 13, 2010 1:06 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] Correcting APACHE mirror location for APR recip=
es.
>
> On Mon, Jul 12, 2010 at 3:31 PM, =A0<Sean_Hudson@dell.com> wrote:
>> Hi all,
>>
>> =A0We recently noticed that apr and apr-util recipes were not fetching c=
orrectly.
>> =A0It appears as though the APACHE_MIRROR variable in the bitbake.conf f=
ile.
>>
>> =A0Below is a trivial patch to update the variable.
>
> I am able to see the files in existing URL. What problem did you have
>
>>
>> Regards,
>> Sean
>>
>>
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 12a5522..71c7273 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -533,7 +533,7 @@ export palmqtdir =3D "${palmtopdir}"
>> =A0OE_STRICT_CHECKSUMS ?=3D "1"
>>
>> =A0ADOBE_MIRROR =3D "http://fpdownload.macromedia.com/get/flashplayer/cu=
rrent/"
>> -APACHE_MIRROR =3D "http://www.apache.org/dist"
>> +APACHE_MIRROR =3D "http://archive.apache.org/dist"
>> =A0DEBIAN_MIRROR =3D "ftp://ftp.debian.org/debian/pool"
>> =A0E_CVS =3D "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"
>> =A0E_URI =3D "http://enlightenment.freedesktop.org/files"
>>
>>
>>
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


