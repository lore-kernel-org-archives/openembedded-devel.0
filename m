Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ppjfx-0007NG-6C
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 16:52:21 +0100
Received: by gwaa12 with SMTP id a12so643185gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 07:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=81wucMhmAF7zvg7xS6SU9fdXm8zrFXdJuHU1rH3NYy0=;
	b=croD0VRK00pBX9zspYMIrLpsAJbbbWI+vnGXB3Lh015nyWdl6+4n7ZuzEzkqpJqRdS
	5Zwmx8S4VZPJ2AFnnsA8h+nIitLv8muQLrZHFeEnnuQR2r5yMNKJnNb8RGERo/qxj8Sj
	IqH+sEKJlpqWZtxZvKU8uv5T1o+mwFL63+N08=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=az1BN2IAbNrfZANtVPmEJDkZDor9ztZ+WOnmVHFEoemueOqlZof35EVnbf80x3Kq6V
	7pXmcxDo/esjEnsHfW5XnU6d5x8D5UCNR1w2GkjL0yvXs6RnBhTaqVaZAWuYblvQVHoz
	xqgSaj3EmZ7k5tdq6mf5SQFhvlRQ1D5HyDvuc=
MIME-Version: 1.0
Received: by 10.150.238.2 with SMTP id l2mr879094ybh.364.1297871469128; Wed,
	16 Feb 2011 07:51:09 -0800 (PST)
Received: by 10.147.41.14 with HTTP; Wed, 16 Feb 2011 07:51:08 -0800 (PST)
In-Reply-To: <AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-8-git-send-email-otavio@ossystems.com.br>
	<AANLkTim7Ra8AMGXAvVH-v5biPJqE1tFCuVuWyMOmnZdr@mail.gmail.com>
Date: Wed, 16 Feb 2011 16:51:08 +0100
Message-ID: <AANLkTi=mnegYRtiQKnpw6sPjBJRSFrcaH_99LJ8q4-=F@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 08/13] cdparanoia (svn): use build variables to fix packaging when using empty prefix
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
X-List-Received-Date: Wed, 16 Feb 2011 15:52:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 16, 2011 at 3:48 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Did a quick check. We have 24 other recipes that refer to ${D}/usr/bin:
>
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep '${D}/usr/bin' */* -l

> mokoeightball/mokoeightball_svn.bb
> openmoko-3rdparty/openmoko-gps_0.0.1+svnr9.bb

those 2 fixed, will push as soon as I get home..

> Guess ideally these should all be fixed

agreed, but be aware that sometimes fixing it in recipe is not enough
and actuall code (like those 2 above) expects /usr/bin/
so fixing it only in recipe would create recipe respecting
bindir/datadir, but failing in runtime which is worse then not
respecting bindir/datadir but with working runtime.

Regards,


