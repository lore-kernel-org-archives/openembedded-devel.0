Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7F660043
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 00:41:17 +0000 (UTC)
Received: by igui7 with SMTP id i7so33851608igu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Xg0lDAbjNrN53O0XafaQYYCaoJBrnZQty46pU72YkXs=;
	b=PQZqpcdhEyqZD1de9Luj8+EXZB+j0JGgUHQzKjYcpUW9pG/Ud46vOMcdusNVY3Dvw1
	af7HEQ7UKJK3KT1lYLzCXFO91629CcJHbv4GNYZUWrqevyOZvgSoLUzusbhamN52HHzg
	PMRMULjRAZ9Dy7QG2NHDMaaapNRCkQiFH0Tg+F3rtictU3q7qr8riBGagk4FrUarf1di
	juaOIAY+IQN14lBnj1L0uOI4NM1q7pfpdiAeoKSaNY0UmYQPMQhWij+qv+2y548NJGkt
	hHamlZwGjvJ5b+7c+I0lWYUs1uZE9JF/ZsWkyuTH8wsQXzOqN35kt7nPedfh6yHGpUhr
	Uasg==
X-Received: by 10.50.30.226 with SMTP id v2mr10538528igh.11.1439685677499;
	Sat, 15 Aug 2015 17:41:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Sat, 15 Aug 2015 17:40:48 -0700 (PDT)
In-Reply-To: <55CFD8B5.4000501@gmx.de>
References: <55CFD8B5.4000501@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Aug 2015 17:40:48 -0700
Message-ID: <CAMKF1sr0Bp6HCAA869S6tJrKa2jv2OPo5qhU9ews8SYy4aBxYQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Python 2 and Python 3 module recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2015 00:41:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2015 at 5:26 PM, Dominic Sacr=C3=A9 <dominic.sacre@gmx.de> =
wrote:
> Hi,
>
> I'm trying to build a Python 3 application which depends on some modules
> that are already packaged in OE for Python 2, but not for Python 3.
> Since OE currently has virtually no Python 3 module recipes, this makes
> me wonder what the best approach to create these recipes would be.
>
> In most cases, I could just copy a Python 2 recipe, change the name from
> "python-foo" to "python3-foo", and replace "inherit distutils" with
> "inherit distutils3". However that would create a lot of duplication,
> and might turn into a maintenance nightmare.
>
> Do you have a suggestion what the right course of action would be? Move
> most of the recipes' content to .inc files that can then be included by
> both Python 2 and Python 3 recipes? Or maybe create a .bbclass that
> would build both versions from the same recipe?
> Is there any functionality already in place that would simplify this task=
?
>

bbclassextend comes to mind, but then its not a core thing, secondly
python2 is not going away soon so we will have to have them coexist.
Best is to encapsulate in .inc files and then have 1 liner recipe
files, that wont be as bad to maintain.

>
> Dominic
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

