Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3E57D53D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 22:34:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id y26so14711230qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qA3OLmw5Rhw5jR2gmOjAOUM4yJuf/LNLZjP631eg4CI=;
	b=l7XD0CCnoIzUz0B5nx8pNNA1QZuOcjBDkR/LSvBZQWB5GwXpEUYWGNuzhPCPiLzW5F
	ZvNy4dDkMSdyUhOrDOT9O2wE75uaENBng+7E1eUOaOaY/2NDNFGmd3BRtNtmwNddaFey
	s2O3BfUWAlpT+FeS2YRnZwFx14DjaPOBUd6Sh9xdaSgAO5AhbU7UWJGy6InKrefm+LRE
	YeZjVkkYwaMpUOVzLjxunCzcSMXQjWbtVAhyTtLpC+692wRyLbyS+EYz4LLnblycWUeJ
	MEnXjhjMbl/8otFcmwcxcqgxpfLKJJwLCSp7sgWAjDbPxNMwIhZwPzJKW2VMKueM52ne
	a1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qA3OLmw5Rhw5jR2gmOjAOUM4yJuf/LNLZjP631eg4CI=;
	b=sxY/6lybgSrb3JaYk7WqLKeHjPDrASQFEUZZv39ATD+L/4Hs1UveZagi5XhF7ECK2T
	5wTDNcY/V0P41+2ET1osIxuxNv6pz3dAYNnwhKEGPj6D25z71zgMx1ENbLpGTjv4hO2i
	PaHleZzvACFWRyFInFLgAaVMKmTYaxcOztrwJhfDE6tpxp7wD854fV5vTUD5LVnwMdPc
	y8R6XC5Fo7XLBDiMPXhrXsphbhD0ZpUQLbDbFGRDIDdytQC1ohQM8Ybp+7O0NQcXrcgF
	sKukt6hofBr7osRSyHH1z7lw7HaGO1IPK9xsRJ21UM953UYri044qCyIyoXtmY78a+AD
	72rg==
X-Gm-Message-State: APjAAAVkSTlnvsjX/r17z2J1QCqUwEXbjT84bg+l1ynerl7lN3RoD0S2
	FNr/dKsR1GpoSK1WNbT4LAgofYX34TeDe8AxsVk=
X-Google-Smtp-Source: APXvYqzO9EK9fNFWzMD4/eha9u+HUaSWp6yPANK8O2Q7//dbKGuKHr3+KkdbJSmmD6uF8Pli0sVHTn14AAEwtoUf1v8=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr11156790qtx.80.1566686100102; 
	Sat, 24 Aug 2019 15:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190821123824.17831-1-bunk@stusta.de>
	<53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
	<CAMKF1srz7wYH8AmV_38Nqb12jLDJN_mbd8PpfkGK-LY-5nE-oQ@mail.gmail.com>
	<71e003a3-e1ee-294d-da16-12a45d649350@gmail.com>
In-Reply-To: <71e003a3-e1ee-294d-da16-12a45d649350@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 15:34:49 -0700
Message-ID: <CAMKF1soZNRmLXcCQt0t-GbF4y7CHs_cdYVQdB_JUexi2ub94CA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Sat, 24 Aug 2019 22:34:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2019 at 2:52 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 8/24/19 10:37 AM, Khem Raj wrote:
> > On Fri, Aug 23, 2019 at 1:14 AM Kang Kai <Kai.Kang@windriver.com> wrote=
:
> >> On 2019/8/21 =E4=B8=8B=E5=8D=888:38, Adrian Bunk wrote:
> >>> Remove a generated file with always changing hash from
> LIC_FILES_CHKSUM.
> >> Why not just upgrade to version 1.20.0 which is the latest major
> release?
> >>
> > this still is useful, if its a bugfix only release, as it could be
> > considered for backport to release branaches.
> Warrior is @ 1.16 so I think not.
> >


Yes in that case sure however if someone is working on 1.20 that=E2=80=99s =
fine I
can wait but will try with this patch meanwhile

>
> >> Regards,
> >> Kai
> >>
> >>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> >>> ---
> >>>   .../{networkmanager_1.18.0.bb =3D> networkmanager_1.18.2.bb}   | 5
> ++---
> >>>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>>   rename meta-networking/recipes-connectivity/networkmanager/{
> networkmanager_1.18.0.bb =3D> networkmanager_1.18.2.bb} (95%)
> >>>
> >>> diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.0.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.2.bb
> >>> similarity index 95%
> >>> rename from meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.0.bb
> >>> rename to meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.2.bb
> >>> index 9ce2d961d..b760a40c3 100644
> >>> --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.0.bb
> >>> +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.18.2.bb
> >>> @@ -5,7 +5,6 @@ SECTION =3D "net/misc"
> >>>   LICENSE =3D "GPLv2+"
> >>>   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dcbbffd568227ada506640fe950a4823b \
> >>>
>  file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fbd84344a1b816cd \
> >>> -
> file://docs/api/html/license.html;md5=3D233931303ef80eded167add1f60a50c1 =
\
> >>>   "
> >>>
> >>>   DEPENDS =3D " \
> >>> @@ -31,8 +30,8 @@ SRC_URI_append_libc-musl =3D " \
> >>>       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> >>>       file://musl/0002-Fix-build-with-musl.patch \
> >>>   "
> >>> -SRC_URI[md5sum] =3D "c8c27116a8083bab5d5fcca0d03e988a"
> >>> -SRC_URI[sha256sum] =3D
> "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
> >>> +SRC_URI[md5sum] =3D "ca1e6175c6ba97ca1adf65a67861ccd9"
> >>> +SRC_URI[sha256sum] =3D
> "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
> >>>
> >>>   UPSTREAM_CHECK_URI =3D "${GNOME_MIRROR}/NetworkManager/1.16/"
> >>>   UPSTREAM_CHECK_REGEX =3D
> "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
> >>
> >> --
> >> Kai Kang
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

