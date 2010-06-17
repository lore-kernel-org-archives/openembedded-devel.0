Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OPEQZ-0003Cf-Eu
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:42:40 +0200
Received: by fxm18 with SMTP id 18so1458672fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BcGCZc5Ocq4NcbUznmoRleMFipXOQK3+NiLJfhODLFU=;
	b=w3/TwUXhzGdXHSwpnhLx6S66BUVhbng+ulJy71hs1VKLhKZvBv7JLG3CiF2egJBg3/
	KXSq8m8LQTRpjPs4Aw16RFJQ0u+YcWxhUkQIwv1TemqfpjsJstqVH9dsCR5a3vw0h9sB
	9V9AKU3LDNc7ahh391RfbsQ5lTo//5B4TTXFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qs18p9dNS9UYoDUjnmLl4+rilaegdCdDrSmJ0fWUcNo/BjHemOcWpw7K3Q7MAxBcxK
	3exsy8R6Iw23vpB+x3SAmKYFw/JDtgPwZOqvLhQfoTEfrxsmwwy7NlN/9Q8E9ixxaS3D
	ZGhUJSlsNAgRr5Z7MrakOWokxxCMoMNWXghSg=
MIME-Version: 1.0
Received: by 10.204.160.69 with SMTP id m5mr7751855bkx.70.1276778288639; Thu, 
	17 Jun 2010 05:38:08 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Thu, 17 Jun 2010 05:38:08 -0700 (PDT)
In-Reply-To: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
Date: Thu, 17 Jun 2010 14:38:08 +0200
Message-ID: <AANLkTikkiJFjXPiI3EAGgF2ryURSOAvc3e2lo0woC6Cs@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Thu, 17 Jun 2010 12:42:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/17 Andrea Adami <andrea.adami@gmail.com>:
> Hello,
>
> I plan to move soon the kernel recipes of linux-kexecboot in the
> standard recipes/linux location.

Actually I was wondering whether it made sense to move the
linux-libc-headers recipes to the linux dir too.
Not sure if there is enough overlap to make this beneficial in the end.

>
> Being that the kernel directory is already overpopulated I was

It is. Shouldn't we clean up this one? Or maybe introduce some subdirs or so?

> thinking to remove some obsolete versions before moving the recipes.
> I know that obsolete != unused, that's why I'm asking:
>
> Who is using linux-kexecboot kernels?
> Which machines apart some Zaurus are needing older 2.6.2x kernels?
>
> If it's only about Zaurus I'd *only* keep an older version (still to
> decide if 2.6.24 or 2.6.26) for a while and the latest 2.6.34.
>
> Please make your comments.
>
> Thanks
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


