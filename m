Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oqsuh-0002ST-UW
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 21:24:05 +0200
Received: by gxk2 with SMTP id 2so3353708gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 12:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PoD3zk6woL2RnkTRIchhoAES9vzcITPOJWmROzv5OLw=;
	b=IZyVMAcf1dxiliGTDYipBrluJDXQPvpG/D2qqWaUWOCVDdg4ZqI5kLG+vBXBdsu2Un
	cuoZQJHrjR8hY1jfg70sxoVP6h2knuXvlbQ5ewOqbHFN0LpvMVgdlgWmC6uhauarDTjI
	FqgZMgdR4RpQpIulszcIoYfBcjJHoiOuzkVKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gQWUt6rA5gWtrMfepOBIpMYJq9PO5OPZ96SvQyd3AGMBM3rBDQBRX+qbhkloxG0TjY
	OB+bDU6RWMl46GxkiTgFCIvnd74App46c76smF9ewcelfm9hX4bwlhWeWuwjR82iKl/d
	fC8I0+HpH8kXRTApl29ASdZdloRjUMuw6iQUk=
MIME-Version: 1.0
Received: by 10.101.183.33 with SMTP id k33mr8974784anp.16.1283368533403; Wed,
	01 Sep 2010 12:15:33 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 12:15:33 -0700 (PDT)
In-Reply-To: <1283250893-13141-1-git-send-email-noor_ahsan@mentor.com>
References: <1283250893-13141-1-git-send-email-noor_ahsan@mentor.com>
Date: Wed, 1 Sep 2010 21:15:33 +0200
Message-ID: <AANLkTi=8h5aGVY1OEUs79ooLK9S7hg5-Js581nFx7rsV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tk: Merge target and native packages using BBCLASSEXTEND
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
X-List-Received-Date: Wed, 01 Sep 2010 19:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/31 Noor Ahsan <noor_ahsan@mentor.com>:
> * Set BBCLASSEXTEND to native
> * Bump PR to "r2"
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/tcltk/tk_8.5.8.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/tcltk/tk_8.5.8.bb b/recipes/tcltk/tk_8.5.8.bb
> index 01d09e8..5dcd61a 100644
> --- a/recipes/tcltk/tk_8.5.8.bb
> +++ b/recipes/tcltk/tk_8.5.8.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://tcl.sourceforge.net"
> =A0SECTION =3D "devel/tcltk"
> =A0LICENSE =3D "tcl"
> =A0DEPENDS =3D "tcl virtual/libx11 libxt"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "\
> =A0 ${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz \
> @@ -42,4 +42,5 @@ FILES_${PN}-lib =3D "${libdir}/libtk8.5.so.*"
> =A0FILES_${PN} +=3D "${libdir}/tk*"
>
> =A0BINCONFIG_GLOB =3D "*Config.sh"
> +BBCLASSEXTEND =3D "native"
>
> --


Your patch should also include the removal of the native recipe as
otherwise that will get preference.
Also it is not clear if the stylize patch is applicable or not.

Frans


