Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NK9l6-0006LN-U2
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 13:10:40 +0100
Received: by pxi13 with SMTP id 13so2144576pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=FzZD8wFVrWa/r8b827gl1r5ffIQqn2SqswBUjfuONdU=;
	b=uw39eUjdFiehoARgsSxy2vJI+GaOT0UGETj7Qfpdf0CPcn5pLEKDIMmOUMtEWK8fFZ
	+RXvPtiSm2zZR+tegxQMC7+iWTPdLa6vkXQh674zJyjukXfM2dn/5DOHs0Jw+l/AXx9c
	p5N5HmF1HoIQPI3LBkH4jHFc5Lqxzj01uH3Rk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=QGmSHv4HcB8rqR/YsSrkBLoLzWm1XUTdOMj7xQSmOxUPHyUioQwNH50jLCh7UUDGRO
	tVlWQK8ofbsOzDH/h7hgSWf5FtzVFnPk7yIYS51Yt6jueXUeJ3G9BxlNR7+bpgMtyy2d
	0dZieKvUrwSUCrlxXTnfVvCC+etJZQZxxYBno=
Received: by 10.114.164.38 with SMTP id m38mr793414wae.179.1260792530852;
	Mon, 14 Dec 2009 04:08:50 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.125.108])
	by mx.google.com with ESMTPS id 20sm4958999pzk.1.2009.12.14.04.08.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 04:08:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
	<200912140947.10207.holger+oe@freyther.de>
	<op.u4w8hfz5mn1qzu@guohr-laptop-ubuntu>
	<200912141032.19529.holger+oe@freyther.de>
Date: Mon, 14 Dec 2009 20:08:40 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4xf0qmqmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912141032.19529.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How generate dependence file without native packages
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
X-List-Received-Date: Mon, 14 Dec 2009 12:10:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Hi Holger,
    I think we should change the following lines:

360         if item in dataCache.ignored_dependencies:
361             return

    When I call the bitbake -g helloworld-image -I "*native", the  =

ignored_dependencies is ["*native",], so when the item is "quilt-native"=
  =

or "qemu-native" or any names ends with -native , the expression should =
 =

return ture.

    But I don't know how to change it.


=E5=9C=A8 Mon, 14 Dec 2009 17:32:19 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Monday 14 December 2009 10:25:53 Guo Hongruan wrote:
>> Hi,
>>      Yes, it works. The following is the command line I used to gener=
ate
>> dot file
>>
>> bitbake -g helloworld-image -I quilt-native -I opkg-native -I
>> shasum-native -I ipkg-utils-native
>>
>>      Unfortunately,  It does not support wild characters, so I must  =

>> append
>> lots of -I options for every native packages.
>
>
> patches for wildcards are welcome. I don't remember the source file bu=
t  =

> I would
> start in bin/bitbake and search for the -I option and follow its users=
  =

> until
> you hit the string comparison.
>
> z.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


