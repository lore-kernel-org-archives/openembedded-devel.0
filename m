Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7t5L-0003Tu-6t
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 19:01:22 +0200
Received: by gxk19 with SMTP id 19so595275gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ruvMhREOp3NCpBSIGr0J4Hnc0Y6KpK4Q9zrzaOjNbXE=;
	b=xObzo2Dr21DVBXfFV1+tl6nhou38zatj2wZIMSZn826/8yOJiOXphpKbOluzahdIt9
	CMS1QGMnBWOwrXi5EFO23Lun12bkhnAbjoAwWc+xccXtx7uxgdewrfmjR23pziaoGJ+/
	7wva6atav51mdN9OB3vXHlS+goDy7Hw8yK4gY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Inmv5x6ImwyithQggWSYOjyD1AwOw0kcpJ9zVlj19JGff0Li3CFiaeKYOb/PztaRkI
	gRhB28kBTbqfEdN8Qtgoe2Rd9CqPcwlocP7orL/aFEC0KQGk+fsen+LImJpESR7h9AUf
	TEOei/p9x8Nwe98OKFX0MZLMgnnKL7pIttbfE=
MIME-Version: 1.0
Received: by 10.42.213.3 with SMTP id gu3mr1110344icb.88.1287421240531; Mon,
	18 Oct 2010 10:00:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 10:00:36 -0700 (PDT)
In-Reply-To: <i9hpii$gf2$1@dough.gmane.org>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
Date: Mon, 18 Oct 2010 19:00:36 +0200
Message-ID: <AANLkTim6ROYhLyn1e8=PT+Joby0hiJ7rCVgUD7ifJRYe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 18 Oct 2010 17:01:22 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/10/18 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-10-10 15:38, Ulf Samuelsson wrote:
>> Marcin Juszkiewicz skrev:
>>> Dnia sobota, 16 pa=BCdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.com
>>> napisa=B3(a):
>>>
>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>
>>> Do you plan to duplicate that file with each kernel you will produce?
>>> Create include/at91-sam9.inc and put it there.
>>>
>>> Regards,
>>
>> This is to allow different kernel versions for different AT91 chips.
>> This allows both a "stable" version, and a development kernel
>> to be easily handled.
>>
>> The file defines (amongst other things) the
>> * kernel version,
>> * u-boot version
>> * at91bootstrap version
>> so you need one file per version.
>
> NAK! Machines don't get to decide versions! Please revert that commit
> and come up with a better way, e.g. default_preference in the recipes or
> distro include files.

Well machines are probably better capable to decide what u-boot and
kernel version is best for them.
One alternative (which is probably by more yukky) is to create an
kernel-at91 recipe and define PREFERRED_PROVIDER_virtual/kernel
I don't feel that is a better scenario

Frans


> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMvGmSMkyGM64RGpERAoEpAJwP7tGmHa9mq3bUhbc0WKfwRWJETgCgrd3l
> 3rfyCWSdNXlK4lIbgpZLMBA=3D
> =3D2WQm
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


