Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5MNj-0004hk-2Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 19:41:54 +0200
Received: by ywl5 with SMTP id 5so1156398ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 10:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ppaOq1xrT1vgJn7YCU3jTAPzVt4zMA6uGoyPqwXh9/s=;
	b=x7aYyR9RFB6mJy7Cs1ngbU0T+F+iAgBPj62uLuWmXgvtch8mlJ0HMQ2vNz1XifHqhi
	l6SDc9BNZmT3gXMvjeH4hjx0Axv6laPn9bPtapYD0wMIZSkDxQw9jyakewhIjHiM/gvA
	S+2hPCClsxKrKmyM9wXLfyvu7nKROrZTX4D2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m4IW+1DNlxmueYx6GccZz8+8T+2DifQ7vAdP6mRQN9AD59zGZdYCKbehMBCBe/tGMs
	ULMREEbjNgnJNCpBwftvt5+P2vw/RnWTB7L/ZV/1gum+zFdfcxaTpyAXn3K+F1N9DhUQ
	XUC7pIJrGDgQDVNklT9H4tZWQ7IybEtmMo+18=
MIME-Version: 1.0
Received: by 10.42.163.137 with SMTP id c9mr1460765icy.378.1286818883013; Mon,
	11 Oct 2010 10:41:23 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 10:41:22 -0700 (PDT)
In-Reply-To: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
Date: Mon, 11 Oct 2010 19:41:22 +0200
Message-ID: <AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Mon, 11 Oct 2010 17:41:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Chase Maupin <chasemaupin03@gmail.com>:
> * While verifying the licensing for the packages I am building
> =A0into my file system I found that for some packages the
> =A0LICENSE value set in the recipe was either incorrect or
> =A0generic and not detailed enough. =A0This patch is my attempt
> =A0to update the LICENSE fields for these packages to match
> =A0the actual versions of the licenses in the sources.
>

[...]

> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPLv2+"

Doe we want this?
I think most GPLv2 code carries the clause:

"This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version."

Yet currently virtually all of these have GPL or GPLv2 as LICENSE

v2+ versions:

enblend/plotutils_2.6.bb:LICENSE =3D "GPLv2+"
ffmpeg/ffmpeg_svn.bb:LICENSE =3D "GPLv2+"
gnome/epiphany_2.30.2.bb:LICENSE =3D "GPLv2+"
gpe-package/gpe-package_0.4.bb:LICENSE =3D "GPLv2+"
libftdi/libftdi_0.18.bb:LICENSE =3D "LGPL GPLv2+linking exception"
libnfo/libnfo.inc:LICENSE =3D "LGPLv2+"
lzo/lzo2_2.03.bb:LICENSE =3D "GPLv2+"
raw-tools/exiv2_0.20.bb:LICENSE =3D "GPLv2+"
sysvinit/sysvinit_2.86.bb:LICENSE =3D "GPLv2+"
udev/udev.inc:LICENSE =3D "GPLv2+"
udev/udev_151.bb:LICENSE =3D "GPLv2+"
udev/udev_154.bb:LICENSE =3D "GPLv2+"


