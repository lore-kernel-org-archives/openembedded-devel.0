Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIemm-0001vW-Sl
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 10:58:42 +0100
Received: by iwn38 with SMTP id 38so657436iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PYa+HICk4Lzac/kUi7hF3Qwc7HaXoX4ogGo8PjUvsfE=;
	b=E3/GywIdoeJeurvMQDCpCy59hpSm7b+3GHc1++NOMYE+Oo6vN6JLwALE4aSjKaMRv3
	9XWYu+vxh7S0GmK7+uIk3d9r3LBuk3DuCNpzD79yVGjObWYJb5hp8VxLc96hPNyRkeNd
	PjZ08TWERRvrwOt5LmvEkmv0u3Ukxq3h2h7xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DAKrPm+EmuRArhwHFzwh5HhsXmIw91rLYEmh/Hg/6sbVArWYosFPKrWBW3FYHUASia
	7kIyv69PNMzNP83++rNqvYDvS48KboB2cu6nwLTqEFBj8XQyIrIoOFXru0FLwh00qCyw
	WzVYKtpm4TAw8Uk646nMnigxFQVohZrk4XTqg=
MIME-Version: 1.0
Received: by 10.231.39.137 with SMTP id g9mr6799747ibe.101.1289987855543; Wed,
	17 Nov 2010 01:57:35 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 17 Nov 2010 01:57:35 -0800 (PST)
In-Reply-To: <AANLkTimgbSkwmvo4jH_-=gpswQopuSjvYDZF7kaR=HbN@mail.gmail.com>
References: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
	<AANLkTimgbSkwmvo4jH_-=gpswQopuSjvYDZF7kaR=HbN@mail.gmail.com>
Date: Wed, 17 Nov 2010 10:57:35 +0100
Message-ID: <AANLkTi=AtzjhcrfUyZrpgZnFLneYmY-E3dEb4zriQZit@mail.gmail.com>
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
Subject: Re: PREFERRED_PROVIDER issue/question
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
X-List-Received-Date: Wed, 17 Nov 2010 09:58:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/17 Andrea Adami <andrea.adami@gmail.com>:
> On Tue, Nov 16, 2010 at 10:44 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> When I am building mythtv-plugins for distro minimal I get:
> ...
>> NOTE: multiple providers are available for runtime
>> module-init-tools-depmod (module-init-tools, module-init-tools-cross)
> ..
>
> I see the same note building Angstrom since some months.

Actually it depends which message your get.
I suspect that if you build mythtv for angstrom you'll also get the
libmysqlclient message.
You won't get it if you have no dep on libmysqlclient.
Similarly you won't get the module-init-tools-depmod warning if you
build a package that does not need it. (guess building helloworld
won't give it).

It would be nice to get this fixed before the release, but I have no
idea how to do so.

>
> Did not track yet the commit which originated that but seems a
> conflict wrt module-init-tools-cross_3.2.2.bb
> PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"

Good find. I feel we should try to decide which of the two recipes
should provide this (module-init-tools or module-init-tools-cross)

Searched into it: that PROVIDES is there for > 1 yr.
See http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=59ae038eec20833a9d07c43ddd9f0109f8bc3a74
where it already was present

Can't find the other virtual though (virtual/${TARGET_PREFIX}depmod),
guess it is generated automagically.

BTW noticed what we have module-init-ttols and modutils. Is this desired?

frans@frans-desktop:~/workspace/openembedded/recipes$ grep depmod */*
| grep virtual
module-init-tools/module-init-tools-cross_3.2.2.bb:PROVIDES +=
"virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
modutils/modutils-cross_2.4.27.bb:PROVIDES +=
"virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.4"

>
>
> Besides that, I'm not sure I understand following RDEPENDS in
> module-init-tools.inc: runtime depending on a package created by
> itself?
>
> PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
> RDEPENDS_${PN} += "module-init-tools-depmod"

I guess this says that if you install module-init-tools you also need
module-init-tools-depmod
(but that is just a guess)

Frans
>
>
> Regards
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


