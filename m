Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzPxo-0001np-Aw
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 10:18:33 +0200
Received: by iwn2 with SMTP id 2so1246406iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 01:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Yq+B8sUC7cNmBaf5EqQZO+O5ck12yt1yc89EebPFA94=;
	b=xFdlWIVKtfuQQXXJVuBJlmeTESoGOt4qjEFXcnMyIIW5QMVo2qk3D9PHAdUuEGdKGG
	iCzvdodinfWST1kEUkRa3jJkJ+ouINS4L1vGxz4CO5odRGSmmZ2Y/zxplJt8MNfgqaLK
	pRENT4XtSFeqBLWJz9st8DXwuUVR4tnQmhnWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pCfx1yYKN5P7MlkGqzA4PM7UlCxwTyZ3WgRcGS8FZ6MkPs1yNNOW1RFACOsi9zeNhn
	30KoVhTnth0V5+fxaaKdoW6VpmBFamZ/NI9JzJVStErA6bkhYFlWq5NsU83cTkz6jBw6
	z7va+1VqzNG8M/ZFWfwinvgEH8PTewdnc7aTc=
MIME-Version: 1.0
Received: by 10.231.169.10 with SMTP id w10mr5333237iby.106.1285402700871;
	Sat, 25 Sep 2010 01:18:20 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 01:18:20 -0700 (PDT)
In-Reply-To: <AANLkTikLp83F_dsDzD7fqL4LLm+Kgh75KFri++OBmHxf@mail.gmail.com>
References: <4C9D1136.2070507@freyther.de> <i7j7n6$u68$1@dough.gmane.org>
	<AANLkTikLp83F_dsDzD7fqL4LLm+Kgh75KFri++OBmHxf@mail.gmail.com>
Date: Sat, 25 Sep 2010 10:18:20 +0200
Message-ID: <AANLkTimWTmhU6Kh65wLGpLzbOmAQKb3BKfRnH+tBKa0k@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt and detecting iWMMXT
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
X-List-Received-Date: Sat, 25 Sep 2010 08:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/25 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/9/25 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 24-09-10 22:59, Holger Freyther wrote:
>>> Hi all,
>>>
>>> when building for XScale one could pass -iwmmxt to the configure script. Now
>>> how can a recipe find out if XScale systems are targeted? The closest thing I
>>> can think of is to look at PACKAGE_ARCH and see if xscale is in it.
>>
>> Adapted from the mplayer magic Graeme and I came up with some years ago:
>>
>> #build with support for the iwmmxt instruction (pxa270 and up)
>> MY_ARCH := "${PACKAGE_ARCH}"
>> PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt',
>> '${MY_ARCH}',d)}"
>>
>> QT_CONFIG_FLAGS_append = " ${@base_contains('MACHINE_FEATURES',
>> 'iwmmxt', ' -iwmmxt', '',d)} "
>>
>> regards,
>>
>> Koen
>
> Nice solution.
> Guess it would be useful to have a list of all possible
> MACHINE_FEATURES and DISTRO_FEATURES somewhere (e.g. wiki)
>
> Frans
>
Rethinking the issue: assuming we *do* want SOC_FAMILY would it not be
more appropriate to use that here?

Frans


