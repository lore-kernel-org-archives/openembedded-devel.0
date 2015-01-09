Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id E1F4B72730
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 08:02:49 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hq11so2761919vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 00:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=tixFP9Gg5J2I22Hs0VYjZ0E9k3+3kk3vcuEfYp/Y/to=;
	b=k46P3kLEuOv+yJOpZlektursT6VP1ftjlSSOQ3E7dRc7I7DuCgVtqiqIOqtqHqVG7c
	OGKgFqe2VgiJDE21Fvf7owbcUFOMli8v6tSOC9eNKv0cYwNFO0AUSUAIb1vxWtPctN7S
	qt1+K8U0d5RA4L8BF2eABxWW2520PZM6r9Wp4pvhM40Gw9Yk7+Rh1Vlc5iluKkWIU3u6
	ZBpsRGeKG6NBmuWMRtEH2EvhwqsSLkLOpgqeSPP7hwaPV9cSjh5QIn3v5IsLbB15xPhC
	WPS8tYq99LK1dwuGOZKlxxIUg+UWt0Nkhric4APwALtUBTP98gaT9w0w/SbMUSl5iWQ5
	0wWg==
MIME-Version: 1.0
X-Received: by 10.221.68.135 with SMTP id xy7mr9406173vcb.41.1420790569760;
	Fri, 09 Jan 2015 00:02:49 -0800 (PST)
Received: by 10.52.144.47 with HTTP; Fri, 9 Jan 2015 00:02:49 -0800 (PST)
In-Reply-To: <1420715289-11792-1-git-send-email-Martin.Jansa@gmail.com>
References: <1420715289-11792-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 9 Jan 2015 09:02:49 +0100
Message-ID: <CALbNGRSa6wbtLduwsUgoo2Diw1v-s-+eyG6X3qK5C3fj=z=cAA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-vala: blacklist
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
X-List-Received-Date: Fri, 09 Jan 2015 08:02:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2015 at 12:08 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-=
xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> index 8e8e691..7bcffe5 100644
> --- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> +++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> @@ -5,6 +5,8 @@ DEPENDS =3D "libxfce4util garcon xfconf libxfce4ui xfce4-=
panel exo vala xfce4-dev-
>
>  inherit xfce
>
> +PNBLACKLIST[xfce4-vala] ?=3D "Fails to build since vala upgrade to 0.26.=
1"
> +
>  SRC_URI =3D "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir(=
"${PV}")}/${BPN}-${PV}.tar.bz2"
>  SRC_URI[md5sum] =3D "0bbb1d6e473e0fe9b335b7b1b49d8a71"
>  SRC_URI[sha256sum] =3D "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997=
a01b4af77260ae7b"
> --
> 2.2.1
>
Don't have time for this currently (and I guess nobody will miss it)-
so thanks and

Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

