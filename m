Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA696B6CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 12:55:51 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so5062265obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Gn2I8J/pa1M9sr4DDVlBsvvZULaVylYrn9fbswdNf0U=;
	b=mGxD8nLaJcNjb3kNijzfe4bYsYk5CddgVZZMjTKBLob61PtvUMDXTjbh2xhNe/HFYU
	JKtmWylEVze2zIzm2DJWpxHer503sR5OO3MOz2aCO5M6Fc2pNF/cfloy2lT8CY8ug9p1
	cU+KWAANNolGUpjeYc+Qt47lWE/ntSdn90cHEtmZnxkYw+LQ5FUoDu9v4HGQY73+ZL8J
	NTYg8QxXPzm1PJQ5k6gj9mf4rXwMaA7JuCgNzCAsmoQ9qzmjmaM9mxu2L3CCDVrcFxs7
	Kte+WL0EwIXF++EbU9INQRLp+CCu6/aSpIZ9Gq8+8d5ACu3l62F6fV5RJcEeYygiyX4O
	Ly9g==
X-Gm-Message-State: ALoCoQnw3GqJTjSeV2qfgmJEt8avJNXivgNs7tsPBclwMH5Nca5mnsySATKgdB7PHXmus9Ao6hGE
MIME-Version: 1.0
X-Received: by 10.182.71.82 with SMTP id s18mr30281340obu.9.1379422552353;
	Tue, 17 Sep 2013 05:55:52 -0700 (PDT)
Received: by 10.182.66.6 with HTTP; Tue, 17 Sep 2013 05:55:52 -0700 (PDT)
In-Reply-To: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
References: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
Date: Tue, 17 Sep 2013 14:55:52 +0200
Message-ID: <CA+AhUGwGsVOEUTUPyAOMZtCJN1rLLDsdUi2akyyhx3yCnDobMg@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Cc: Laszlo Papp <lpapp@kde.org>
Subject: Re: [meta-qt5][PATCH] Added module qtquickcontrols
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
X-List-Received-Date: Tue, 17 Sep 2013 12:55:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I just realized this patch does not package all files. The qt5.inc
only pick up on files three directories "deep", so I have to extend
this in qtquickcontrols.inc using:

FILES_${PN}-qmlplugins +=3D " \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qml \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.js \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*/qmldir \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.qmltypes \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.qml \
    ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.js \
    "

I would assume that this is better done in qt5.inc, can't really think
of any big drawback with having it central instead of per module and I
guess the decision to go "three deep" was just that it covered the
modules that recipes was written for at that time. Right?

Cheers,
Erik

On Wed, Sep 11, 2013 at 1:19 PM, Erik Bot=F6 <erik.boto@pelagicore.com> wro=
te:
> Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
> ---
>  recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
>  recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
>
> diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickc=
ontrols.inc
> new file mode 100644
> index 0000000..63e884e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols.inc
> @@ -0,0 +1,3 @@
> +require qt5.inc
> +
> +DEPENDS +=3D "qtdeclarative"
> diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/qtq=
uickcontrols_5.1.0.bb
> new file mode 100644
> index 0000000..fc880d7
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "b3825124a173a36f63c2f8380dc61e81"
> +SRC_URI[sha256sum] =3D "88d39421d78464c3900c37616e8369fc8d998c1b0f611980=
e6e082f46569646b"
> --
> 1.8.1.2
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Erik Bot=F6
Senior Software Engineer
Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)76 881 72 03
E-Mail: erik.boto@pelagicore.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

