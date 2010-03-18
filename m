Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NsA5Y-0005yW-35
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 08:24:27 +0100
Received: by gwj23 with SMTP id 23so814551gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wPEmMOBGsC//4OzJNgnEYd055p6V3L1cYsvk3Z4f6as=;
	b=u+WDILpRTmqb+BvWRCdj8c/Zerb6LeZnUcmzr+QsQmFb5Lq0s5SJavJiqljDZ5JB4z
	gF+piVo7SQ4/MjYxpcz987XClEmNW0dTxs7X0vMo3TCLU37wWbGgFXTwfOaLUP6q/Gut
	08nERapMbfHIyxiH7iDJl+37ozbpLLsHzP7OE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=newxd45OmkFyk7yLnQfZ2IEV8DLAI0nGU/OwFVaM7mN0eGZ78rnI/H38dpsZKwU2+A
	2ubEcWU9BlwJ/l995Jc5XUaUj0zYK7t+yPsv8EWZr+NpE5bRiBgQgwMJuGNUt4MRBmRK
	xxdrsH7MhwNgfH/Izm191bH3ubRYd+maEJxec=
MIME-Version: 1.0
Received: by 10.100.27.29 with SMTP id a29mr3335965ana.191.1268896871412; Thu, 
	18 Mar 2010 00:21:11 -0700 (PDT)
In-Reply-To: <1268863405-29862-1-git-send-email-sgarman@zenlinux.com>
References: <1268863405-29862-1-git-send-email-sgarman@zenlinux.com>
Date: Thu, 18 Mar 2010 08:21:11 +0100
Message-ID: <ac9c93b11003180021vf3591cdh4859ada0a4c8842d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grip: Upgrade to 3.3.1
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
X-List-Received-Date: Thu, 18 Mar 2010 07:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/17 Scott Garman <sgarman@zenlinux.com>:
> * Latest development version (should be stable, same version is in
> =A0Debian Stable)
>
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>
> ---
> =A0recipes/grip/grip-3.3.1/no-host-includes.patch | =A0 10 ++++++++++
> =A0recipes/grip/grip_3.3.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 18 ++++++++++++++++++
> =A02 files changed, 28 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/grip/grip-3.3.1/no-host-includes.patch
> =A0create mode 100644 recipes/grip/grip_3.3.1.bb
>
> diff --git a/recipes/grip/grip-3.3.1/no-host-includes.patch b/recipes/gri=
p/grip-3.3.1/no-host-includes.patch
> new file mode 100644
> index 0000000..6a733b1
> --- /dev/null
> +++ b/recipes/grip/grip-3.3.1/no-host-includes.patch
> @@ -0,0 +1,10 @@
> +Index: grip-3.3.1/src/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- grip-3.3.1.orig/src/Makefile.am =A0 =A02010-03-16 14:46:01.651553829=
 +0800
> ++++ grip-3.3.1/src/Makefile.am 2010-03-16 14:46:05.240303128 +0800
> +@@ -1,4 +1,4 @@
> +-INCLUDES =3D -I$(top_srcdir) -I$(includedir) \
> ++INCLUDES =3D -I$(top_srcdir) \
> + =A0 =A0 =A0 -DGNOME_ICONDIR=3D\""$(datadir)/pixmaps"\" \
> + =A0 =A0 =A0 =A0 =A0-DG_LOG_DOMAIN=3D\"grip\" -DGNOMELOCALEDIR=3D\""$(da=
tadir)/locale"\" \
> + =A0 =A0 =A0 =A0 -I../intl -I$(top_srcdir)/intl \
> diff --git a/recipes/grip/grip_3.3.1.bb b/recipes/grip/grip_3.3.1.bb
> new file mode 100644
> index 0000000..7edae1e
> --- /dev/null
> +++ b/recipes/grip/grip_3.3.1.bb
> @@ -0,0 +1,18 @@
> +# grip OE build file
AFAIK the line above can go
> +# Copyright (C) 2005, Advanced Micro Devices, Inc. =A0All Rights Reserve=
d
> +# Released under the MIT license (see packages/COPYING)
> +
> +DESCRIPTION=3D"A cd-player and cd-ripper for the Gnome desktop"
> +HOMEPAGE=3D"http://www.nostatic.org/grip/"
> +LICENSE=3D"GPL"
> +
> +SRC_URI=3D"${SOURCEFORGE_MIRROR}/${PN}/${PV}/${P}.tar.gz;name=3Dgrip \
> + =A0 =A0 =A0 =A0 file://no-host-includes.patch;patch=3D1 "
> +SRC_URI[grip.md5sum] =3D "4b4233999b9f2bc85c711092553ea9aa"
> +SRC_URI[grip.sha256sum] =3D "d46394a1062ed066f9c633b010fd1059e63d9ed791b=
bb7a85bc6567cf0fd66fd"
> +
> +DEPENDS=3D"libgnomeui vte curl cdparanoia id3lib"
> +
> +PR =3D "r1"
and as this is a new recipe it should start wit r0
> +
> +inherit autotools
> --
> 1.6.3.3

FM


