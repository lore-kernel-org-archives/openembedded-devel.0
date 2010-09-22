Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyJt1-0000Fe-L5
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 09:37:04 +0200
Received: by gya6 with SMTP id 6so65968gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nBqQwodYIfWY4siUkpo3Y4HQBUZJTPB9Y3Z1ulwXUeQ=;
	b=i5XzTyYqeDfamw5r103rh1/mpynI/Tgf5bFt0BZcGdAnmptL1j9NdqcUR+/Jd2lwvC
	+5bWkQsu3LE7hU3HjZKr36N3MCxiK80mwGYZW1lvFcsej5gRgk8RUxx5iijEhXswZ+Id
	1IvSlPrdANNYCdpszODeb42dJFaPcWKdO9Gpc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m0Ex9hEW2SrK7CkFXlwzcp9h8OlqXWiy3xTJY5DDGwd11FLUAA06BFGLC6FuV1mwal
	ysV+oYtYPeCWeZsVHuzLopGTXdrrlOalZv8rFmyDemOYLA9/5v1UTo62aooH1MMgiRqM
	Kmfio6KHdgQbMngT7WaOJitaN/9Q8ti9Cwrnc=
MIME-Version: 1.0
Received: by 10.150.195.4 with SMTP id s4mr594049ybf.273.1285141018610; Wed,
	22 Sep 2010 00:36:58 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Wed, 22 Sep 2010 00:36:58 -0700 (PDT)
In-Reply-To: <201009220913.06632.marcin@juszkiewicz.com.pl>
References: <4C9950D0.7000907@gmail.com>
	<201009220913.06632.marcin@juszkiewicz.com.pl>
Date: Wed, 22 Sep 2010 17:06:58 +0930
Message-ID: <AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 07:37:04 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On 22 September 2010 16:43, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia =B6roda, 22 wrze=B6nia 2010 o 02:41:52 Graham Gower napisa=B3(a):
>
>> --- a/recipes/at91bootstrap/at91bootstrap.inc
>> +++ b/recipes/at91bootstrap/at91bootstrap.inc
>
>> +COMPATIBLE_MACHINE =3D
>> "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam9=
26
>> 0ek|at91sam9xeek|at91sam9261ek)"
>
> mk355 is also atmel at91sam9263 so at91bootstrap is used on it probably.
>

The compatible machines here are those that have a defconfig in the
the files/ directory.

-Graham


