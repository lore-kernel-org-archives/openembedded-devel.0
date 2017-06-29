Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id C4938780F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 15:21:19 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id z21so5211758ywz.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2bEd94Na/HOBwVGbG2Nq5GTMDEI0FOvFX/M7DXOUR7w=;
	b=S4e+cPo3/UOoFcP+J1s/Usi1EbjvYEsQ4/UOQWDRzT9twd9FnVHIKBSki+PNVhAStl
	ZGV/m6sLUw4E+73qap/D7L2yAqinegt4ZB6GijlP1lpwQFi3WBvBXRb+mQWHfpw8XTW3
	YZLU8g6U2lMgjgiCqUcOg9N8sJQRPllO/oWiPuCrLAcclSIpB5BUSgsQ1F21y71/P88m
	pgBjsuwVhlYNPzONUIBgRA0IABtRx53POWy9GdQ2xjnOJt4s6Ccq1+ziQQfbz2XXsvgx
	dZazs1AiTqWcp9tu4hOGMjvZd2j93WiGkRYJ6agXRwADCroMYazzC4sbPPhLBRSdv9xc
	xO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2bEd94Na/HOBwVGbG2Nq5GTMDEI0FOvFX/M7DXOUR7w=;
	b=W5NqzVhX+kJRUnqfoLsKkBjQG8IHI2vLJ/pBoi3gAyBJRN5LUhNV0CvJ8sLuvKVoBY
	UAjUucfHGamqSjY15zYTXAUjc1EomNjZh0CuTj/PwS6pfqsrBh+6y1yPDkZnD2ZPmjKZ
	RsseHdqDeSIxvtuNpyoj+Vs9WCinT20t5Usdb7F5vVghB9P/MjtXzTz1Qss/GYuP8CCd
	AsYPd+4H5Lwi0LEea0fQf/wyoo3A7//Gse1oirGNcDuDSTklGd18EoIq4WcIzc2CuL1+
	psxs0bjHsfipELNHrkUSZmJz+hi4l9a2l4y3he71VccTr4/rgL5bGXLatqLNuDdOSiNd
	EHBg==
X-Gm-Message-State: AKS2vOx6WSIP4wpBN80i3v1akII6HSOtkMixgI1k3nEddsoavAvfP97q
	mkCVCDc/UKGTOApTUMoFrmWhEbzS+A==
X-Received: by 10.129.156.3 with SMTP id t3mr3586575ywg.44.1498749680917; Thu,
	29 Jun 2017 08:21:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 29 Jun 2017 08:21:20 -0700 (PDT)
In-Reply-To: <1498745449-26690-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1498745449-26690-1-git-send-email-s.mueller-klieser@phytec.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Jun 2017 17:21:20 +0200
Message-ID: <CA+chaQfEO+s0K1sj7xqcgmZ91HTYqcw6inmQiRx01pFehN4f0Q@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][pyro][PATCH] qtquickcontrols: fix qa issue installed-vs-shipped
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
X-List-Received-Date: Thu, 29 Jun 2017 15:21:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Isn't it needed in master as well? I don't see it in my builds, but if the
issue exists in some configuration you're using then it should be
reproducible with master branch as well as they are currently identical
with pyro.

On Thu, Jun 29, 2017 at 4:10 PM, Stefan M=C3=BCller-Klieser <
s.mueller-klieser@phytec.de> wrote:

> QML dialogs ship an icons.ttf which does not get picked up by the
> default FILES mask.
>
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  recipes-qt/qt5/qtquickcontrols_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/
> qtquickcontrols_git.bb
> index 69f3d3b..c72ac4f 100644
> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
> @@ -22,3 +22,5 @@ SRC_URI +=3D " \
>  "
>
>  SRCREV =3D "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
> +
> +FILES_${PN}-qmlplugins +=3D "${OE_QMAKE_PATH_QML}/*/*/*/*.ttf"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

