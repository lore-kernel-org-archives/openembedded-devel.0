Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NPEBa-0005nh-UG
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 12:54:58 +0100
Received: by pzk30 with SMTP id 30so7114160pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 03:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=F5qma5Ezx9cJTsBuhuK3M3uIK5KE9lHBGhLcNOK8Ubc=;
	b=Jbr11XbplG9AaCw1M8gKEqycZZJpZtg7MxPj8yyU43nClwPeQlCWJybw9TvIApPO1v
	UBvWR5aDfehvMlR5WvZ0HMi7/+KphCEOMzd82d9QbocK2yQddWL7vgE1lJ4EbU93rFbQ
	qlKLqc+CAORmECaF/Hh1wgwxi8vTrCKkLzumA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=LSJznbw0Ei2rdVeMhQ5giI6M33bOA6TvfElZ3Es/1Rtt5Y+NLhukcctJHmoenW7W9s
	qIas5gzpH/sZntQyG9t12zeJ8zWjc8jgm7GT41ZRWgVFzbYC/0VWt82CzX8osI53/Pzb
	kmuIjNHe5A6puV7yRtr5gEIdlBnhSLUzKZcts=
Received: by 10.141.23.17 with SMTP id a17mr11009649rvj.17.1262001177055;
	Mon, 28 Dec 2009 03:52:57 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.70.72])
	by mx.google.com with ESMTPS id 23sm11822239pzk.4.2009.12.28.03.52.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 28 Dec 2009 03:52:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5mqggdmmn1qzu@guohr-laptop-ubuntu>
	<20091228114144.GA19465@rhein.zuhause.netz>
Date: Mon, 28 Dec 2009 19:52:46 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5ncl8iwmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20091228114144.GA19465@rhein.zuhause.netz>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation of libxft failed due to lack of XFT* macroes
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
X-List-Received-Date: Mon, 28 Dec 2009 11:54:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Great! I will try the new version of libxft tonight

=E5=9C=A8 Mon, 28 Dec 2009 19:41:44 +0800=EF=BC=8CHenning Heinold  =

<heinold@inf.fu-berlin.de> =E5=86=99=E9=81=93:

> On Mon, Dec 28, 2009 at 11:54:06AM +0800, Guo Hongruan wrote:
>> Hi guys,
>>   I found a building error, when
>> 1. MACHINE=3Dqemux86 DISTRO=3Dmicro, see the following url for more  =

>> detailed.
>> http://tinderbox.openembedded.net/packages/391109/
>>
>> It seems that the compiler can not find the XFT* macroes.
>
> I already fixed with the latest libxft. It's an error inside autotools=
  =

> or using
> if you use #undef fobarr /* ddfdf*/ the #undef will be not replaced by=
  =

> configure.
> If you need this in libxft with smaller version numbers, backport my  =

> patch yourself.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


