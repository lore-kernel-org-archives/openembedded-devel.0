Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8MDV-0002Hm-D1
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 00:30:53 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1560673yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=JOyap24idIdFcwOuucJ2/6fMSANutWTmeAflNaAd61c=;
	b=sGSjAdFD3YRsFXiWAOOcCAjOSPiIGQw+Fp8u5FQhYo8scAvbWjfhMpa/dPMvPQS2VZ
	Y++kqhk+4MZYN3rERv4O0ucUYtip3AEM4ye1dgRQ01qODTiMZcUQb3Vgpih58PYwi/9d
	QetSMaUT4UMgDKG7ZjGtlFFdNWsXnWRxt4Rlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=szNIcq30MXYfTgfp9LThWTUHpJ1UvaQOTLytkUCQBRTOAliZidw8tJ42ilSBHRvN5j
	AiDmt7ldw4tx+L7g0O493AfBl4a1bnMebSEWZCOLJGozVyDsjA0N5Kt34RUw9AQQ669Y
	UryvwhWVtOmtsKXXH5NQ4Rr9/medrv7ngkxCU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.207.15 with SMTP id e15mr11344899ang.30.1243203777160; 
	Sun, 24 May 2009 15:22:57 -0700 (PDT)
In-Reply-To: <1243192526-31196-2-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243192526-31196-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243192526-31196-2-git-send-email-ihar.hrachyshka@gmail.com>
Date: Sun, 24 May 2009 19:22:57 -0300
X-Google-Sender-Auth: fa2373774d1ca222
Message-ID: <be7a9f3d0905241522i10fa5ff7re486c07fdef1db92@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] qt4-embedded: added directfb gfx driver support.
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
X-List-Received-Date: Sun, 24 May 2009 22:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

People has been using PR =3D "${INC_PR}.1" to avoid repeating the r twice.

Except from that it looks nice.

On Sun, May 24, 2009 at 4:15 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> This fix adds qdirectfbscreen gfx driver to qt4-embedded.
> Also moved recipes versioning to INC_PR.
>
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> ---
> =A0recipes/qt4/qt4-embedded.inc =A0 =A0 =A0| =A0 =A06 ++++--
> =A0recipes/qt4/qt4-embedded_4.4.3.bb | =A0 =A02 +-
> =A0recipes/qt4/qt4-embedded_4.5.1.bb | =A0 =A01 +
> =A03 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 0280dc4..c4112f7 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -1,11 +1,13 @@
> -DEPENDS +=3D "tslib"
> +DEPENDS +=3D "directfb tslib"
>
> =A0S =3D "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
>
> +INC_PR =3D "r11"
> +
> =A0QT_CONFIG_FLAGS +=3D " \
> =A0 =A0 -qtlibinfix E \
> =A0 =A0 -qt-decoration-styled -plugin-decoration-default -plugin-decorati=
on-windows \
> - =A0 =A0-plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc \
> + =A0 =A0-plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin=
-gfx-directfb \
> =A0 =A0 -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
> =A0 =A0 -qt-kbd-tty -qt-kbd-usb -qt-kbd-qvfb \
> =A0 =A0 -DQT_KEYPAD_NAVIGATION \
> diff --git a/recipes/qt4/qt4-embedded_4.4.3.bb b/recipes/qt4/qt4-embedded=
_4.4.3.bb
> index 994372c..e156575 100644
> --- a/recipes/qt4/qt4-embedded_4.4.3.bb
> +++ b/recipes/qt4/qt4-embedded_4.4.3.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "GPL QPL"
> =A0PRIORITY =3D "optional"
> =A0HOMEPAGE =3D "http://www.trolltech.com"
> -PR =3D "r11"
> +PR =3D "${INC_PR}.r1"
>
> =A0SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opens=
ource-src-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://0001-cross-compile.patch;patch=3D1 \
> diff --git a/recipes/qt4/qt4-embedded_4.5.1.bb b/recipes/qt4/qt4-embedded=
_4.5.1.bb
> index 5073ad1..9463a58 100644
> --- a/recipes/qt4/qt4-embedded_4.5.1.bb
> +++ b/recipes/qt4/qt4-embedded_4.5.1.bb
> @@ -3,6 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "GPL LGPL QPL"
> =A0PRIORITY =3D "optional"
> =A0HOMEPAGE =3D "http://www.trolltech.com"
> +PR =3D "${INC_PR}.r1"
>
> =A0SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opens=
ource-src-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://0001-cross-compile.patch;patch=3D1 \
> --
> 1.6.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


