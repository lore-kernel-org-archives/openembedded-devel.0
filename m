Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5B8D6025E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 23:19:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x129so22524740qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 15:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R+7QeqN1DvDvtD8ik57KFpxVvVkuaxh4tu7S8hVWL34=;
	b=V+ELfhh+uovrMxRD+w5U8cIykcqDYFQJhnpd5kfyVweCv0EbeF5ufEar+3BGtH48LW
	laIa6++n3kpiky+S8dkMp2MGAlfHwAVqd+45TzlMmuUw0YNj8f2Pryh5XCSaaKg439XF
	m2INTwXbFYgmtUtQGRldj1EYhhqXE/+6kMBi0taRCpCJcH5ELsjExfG6a1RA71bVQnxQ
	cPYmUwDOpEdRBfGzZWIrW6tGO2Ce4QMeumfHMRSS3yNPgpkORXioBSsbUQkwgDhLB4Q4
	Y+cjeGqTX0loPVx1OCgw35qJwfv/jrsvG6lTx+7ZBt5kYHPElPyrIdPv48yycg0nrasy
	ICiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R+7QeqN1DvDvtD8ik57KFpxVvVkuaxh4tu7S8hVWL34=;
	b=bl54rIP9hhj8BWRTMX6ArvH8Dj8k5w76Biy7NymAOBnVo+JbYyd71HxXQIbIlq0LCU
	2GvBWTkA2gJL9VU37owsWRmmXbPL+MGUu6AFxz1NtZFySPdBrdJ2p7ukUjkhwnQ07Jxo
	5/1/MWhuoX5fqd3nCEWiGmi6Y3aFEuTjqZmcEcbRji/D4ig9UB5GMqHs50n29FgZN0iK
	O/7NS5UCJuzEDYBv5qil4mNFOdnyeRgDlhFgv1dTBGwb8H/pPfEtyWq7Fmc1xFfppD10
	LkY7ufTRBsXgDuI2TWaBIoQ0dyo2FaWDVZ1sn/tQTZq8eKyXDqjF4H/lkpSSg3O+6DBJ
	1WmQ==
X-Gm-Message-State: APjAAAXDrOBLhpEGnJPIaJOpXrIF78xv8F0C3xgv14K/tuILVvLDB0xP
	oTAIjXLm81XouBSFVzIDpasuAplGiPULXEdXfw4=
X-Google-Smtp-Source: APXvYqysKrqcokmMJ1hoyxYTfVd1CHH6Ej7cFSQEkhDjoknTDFM3AQb0eSfZeWKUwHUl/I0rmXQb4cDm7b3wfsm9nfc=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr46008816qkf.337.1577488785773; 
	Fri, 27 Dec 2019 15:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
	<20191227213120.3930-9-schnitzeltony@gmail.com>
In-Reply-To: <20191227213120.3930-9-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Dec 2019 15:19:34 -0800
Message-ID: <CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 23:19:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 1:33 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> From [1]:
>
> Evolution-Data-Server 3.34.2 2019-11-22
> ---------------------------------------
>
> Bug Fixes:
>         I#156 - EBook/CalMetaBackend: Automatic refresh not always setup
> ][ (Milan Crha)
>         I#159 - LDAP: Fails to read userCertificate from the server (Mila=
n
> Crha)
>         I#162 - e-cal-recur: Ignores recurrence exceptions (Milan Crha)
>         I#164 - HSTS (RFC 6797) support for "On The Web" calendars (Milan
> Crha)
>         I#169 - Detached instances shown as with floating time (Milan Crh=
a)
>         I#173 - ESoupSession: Accept also compressed responses (Milan Crh=
a)
>
> Miscellaneous:
>         EWeatherSource: Use g_signal_connect_object() in
> e_weather_source_parse() (Milan Crha)
>         Correct runtime warning from camel_network_service_can_reach()
> (Milan Crha)
>         ESoupSession: Do not presend credentials on insecure connections
> (Milan Crha)
>         EBackend: Slightly enhance g_warning() messages with an ESource
> identification (Milan Crha)
>         ESource: Required signals not connected after EDBusObject is
> replaced (Milan Crha)
>         LDAP: Change how LDAP query is constructed (Milan Crha)
>
> [1]
> http://ftp.gnome.org/pub/gnome/sources/evolution-data-server/3.34/evoluti=
on-data-server-3.34.2.news
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../evolution-data-server/evolution-data-server.inc         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.in=
c
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.in=
c
> index 0893f8e92..0e58b0cc2 100644
> ---
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.in=
c
> +++
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.in=
c
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6a6e689d19255cf0557f3fe7d7068212 \
>
>  inherit gnomebase upstream-version-is-even
>
> -SRC_URI[archive.md5sum] =3D "d1701875bbac80d6d62e9acfc6c43bea"
> -SRC_URI[archive.sha256sum] =3D
> "6ff56ba04cb639e627fe9d6e0ada106a10cadd68a0d53b8ec72b4e285df53abe"
> -PV =3D "3.34.1"
> +SRC_URI[archive.md5sum] =3D "7a0571ac358664c6e96accd3ac4cd245"
> +SRC_URI[archive.sha256sum] =3D
> "3eb89f82eee042884a8d65737564fe48829c3ae187f067cbcdec2b088d2fe89b"
> +PV =3D "3.34.2"
>

I think version specific information should be in bb file not inc

>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

