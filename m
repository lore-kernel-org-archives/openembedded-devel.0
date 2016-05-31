Return-Path: <dachaac@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 39EB9771E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 12:51:44 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id z123so9402352itg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=QF6HaVbu7m2cPfyhOqX4O0sP/MyBVsfuCafZBWVeFhQ=;
	b=I27ztunypCo2ByLJARl/j9dPbJaHKvUM2hjs0magVh56r1kuo0H7Nv5jrpio7ldQ4U
	p2iVLVYWUeg5RBV/DJ8uwMr/fhZR0GceItNZZds0BYkfFh7LJOlWZ6sLxYK+LkcXqe8w
	SlI1mnXesEBuCBNIdhK1l8/VtbkB9R0yOSqjRUcWom7ueAQ0d0wFzB4YEVJfDDOw2VM+
	d1F2MiN++w/SBUD9waV1BNuBdeTZLaHXoRTLw/BuwfNk5DiLrnsgJTcpOXw8fWZAsj+V
	GH4Hswb+LxYluxTmXWQGrVtogN5xw9trAGNRFs+8T1DkrLC91SqPigGOlG9/JeaacEpX
	mlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=QF6HaVbu7m2cPfyhOqX4O0sP/MyBVsfuCafZBWVeFhQ=;
	b=Kpt0vHOLFBN++U3DQt/L3XvkDm5quTu8zgVBg39G+NOLf4ipp9+m1lZWHd0waX4hK6
	5NkxS64xS1iDZHXAIWEjmTiG0hw/Fdolueome9M4OeQWRUIpmFefbYxA4SZYiunG2vaQ
	YdQqjXnIVJbA9YHB77T/U6tQJKEJcvGKRCPqrdjWhF5FhBr1tCC37ujtM+W8FRQ2HUeC
	HeLPV6sFuHIIuPHkyFx4IfMHvrcZ+kBZ4+1ykInNmS9Ro4z3DAgqYxzVhSMSSFkiz4b3
	NeuiobgtMaTpVcMal0/TOfCdc/GNL97qdezvD/7FENaV8wB2haz4jtgmvOdssyMBbrZk
	TQcg==
X-Gm-Message-State: ALyK8tJb7BtTiD2d+iui9UPWzCPM9SvnxLomgVt3yQIxSeHAkGvHngp6eEfgGnOpnDkVCf9rVyLS+x3I6GASog==
MIME-Version: 1.0
X-Received: by 10.36.85.133 with SMTP id e127mr12339533itb.14.1464699104402;
	Tue, 31 May 2016 05:51:44 -0700 (PDT)
Received: by 10.79.7.88 with HTTP; Tue, 31 May 2016 05:51:44 -0700 (PDT)
In-Reply-To: <1464698314-127414-1-git-send-email-dachaac@gmail.com>
References: <1464698314-127414-1-git-send-email-dachaac@gmail.com>
Date: Tue, 31 May 2016 15:51:44 +0300
Message-ID: <CAKXA2Es60UDuBGk4KwbtLMQN7Pye2ri522X1Fa4dR7i=SdFOQw@mail.gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] Fix nano's license to GPLv3.
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
X-List-Received-Date: Tue, 31 May 2016 12:51:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'd recommend applying this fix for all yocto branches.

Thanks,
Vesa J=C3=A4=C3=A4skel=C3=A4inen

On Tue, May 31, 2016 at 3:38 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@=
gmail.com>
wrote:

> Nano recipe has incorrectly stated GPLv2 license where actually it is
> GPLv3.
>
> Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <dachaac@gmail.com>
> ---
>  meta-oe/recipes-support/nano/nano.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/nano/nano.inc
> b/meta-oe/recipes-support/nano/nano.inc
> index bdefe9b..3fad029 100644
> --- a/meta-oe/recipes-support/nano/nano.inc
> +++ b/meta-oe/recipes-support/nano/nano.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "GNU nano (Nano's ANOther editor, or \
>  Not ANOther editor) is an enhanced clone of the \
>  Pico text editor."
>  HOMEPAGE =3D "http://www.nano-editor.org/"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
>  SECTION =3D "console/utils"
>  DEPENDS =3D "ncurses"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

