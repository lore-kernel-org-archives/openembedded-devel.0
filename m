Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD4C7317D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:32:13 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id m11so18287238igk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=v/ZcXcUEA8Qcn4tp68qD7DiaoiXC2ITQBcal48zvQtQ=;
	b=juYXtJF0OC4GmYR9iF24vauaOqZF27XeE5Zax6ss+79loY5OPpI+A02xvN0ckDblKh
	+YpBDhPR1Tcw5Ep4MAiov4bxD+0idJdBBKcEoHAOEzVc8uzKG5ZaHqid6sqzQefUCSkr
	7aUZO1S51MTyrEP8Hx9RQ8gKLyafDakuxr/vO0PdVp08e6Cgp547RYxAel6drNpCvAsk
	rN9ZwPATOyBdiCWeDPe4XDFrhaPuDckSwAAdzFlYYFyBNB1KxxsMEXdteL9WlcVZ+j+l
	fkKR+C0tQ72y7RgPMXz69RK+pTh8+7vpQoXMvx65/0wHDbIaujB1fVDMqlcMyRAT/8gm
	2DNw==
MIME-Version: 1.0
X-Received: by 10.50.22.33 with SMTP id a1mr3298686igf.52.1450179133817; Tue,
	15 Dec 2015 03:32:13 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 15 Dec 2015 03:32:13 -0800 (PST)
In-Reply-To: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
References: <1448525199-27504-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 15 Dec 2015 12:32:13 +0100
Message-ID: <CALbNGRRfko=LsF+J6zbkPyd+wYr_a2=-z-v_Erq1d2Bg7VSd4Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][master 1/2] qt5-creator: building qmldesigner with gcc5 works so enable it
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
X-List-Received-Date: Tue, 15 Dec 2015 11:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 9:06 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qt5-creator_3.5.1.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-cre=
ator_3.5.1.bb
> index 4bb0998..2d8cee9 100644
> --- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
> +++ b/recipes-qt/qt5/qt5-creator_3.5.1.bb
> @@ -30,12 +30,6 @@ S =3D "${WORKDIR}/qt-creator-opensource-src-${PV}"
>
>  EXTRA_QMAKEVARS_PRE +=3D "IDE_LIBRARY_BASENAME=3D${baselib}${QT_DIR_NAME=
}"
>
> -do_configure_prepend() {
> -    # causes gcc infinite loop with 4.9.x for arm targets similar to
> -    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61033
> -    export DO_NOT_BUILD_QMLDESIGNER=3D1
> -}
> -
>  do_configure_append() {
>      # Find native tools
>      sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}${QT_=
DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
> @@ -67,6 +61,7 @@ FILES_${PN} +=3D " \
>  FILES_${PN}-dbg +=3D " \
>      ${libdir}${QT_DIR_NAME}/qtcreator/.debug \
>      ${libdir}${QT_DIR_NAME}/qtcreator/plugins/.debug \
> +    ${libdir}${QT_DIR_NAME}/qtcreator/plugins/qmldesigner/.debug \
>      ${libdir}${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
>  "
>
> --
> 2.1.0
>
Ping

