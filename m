Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLzWi-0007FL-Tw
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 16:11:39 +0200
Received: by gwb20 with SMTP id 20so2183538gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=f3Ojz1gm/nWMwwbkuIH+GuVrwg19whoN5/hirHwTLGU=;
	b=OrOi8tPpw888XR85QbfBzOiJZHaMZ4hSCBukTVQbxAp55tYJV7H9LXvUo+5rRKSkSb
	Ecq6elEVKrOh/NeMuSJ+3Om68rFU6+wfU/qU0V4m58rzCFmfGqPTnjeB0WG5S5/caHww
	ZJAtfo0W0rSlxtCLIjtyAw1nAZnRQGSBQYhMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QB60Zu0dh1ygSRS7lkicbF+CP/yIMZLZ8kS06Esq02MMYMJZrtK6Kxa1WNnsPMZX5S
	pd2Y3aZuOeRGLu6CWvcqd2O5dn+CEe3Gm61nBxiiMWLsPaEpBXJOPRc9fCQFWwkd/8Fr
	aojpfLVYDY+aeDb9wcpRbqAFVhVqW77o/Fhi8=
Received: by 10.224.43.100 with SMTP id v36mr1340632qae.201.1276006034305; 
	Tue, 08 Jun 2010 07:07:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 07:06:41 -0700 (PDT)
In-Reply-To: <1275981951-532-1-git-send-email-Martin.Jansa@gmail.com>
References: <1275981951-532-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 07:06:41 -0700
Message-ID: <AANLkTin4UHCGog_yym4YJqce-0vgFI71BH07eKLIIDEF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt-4.6.2+4.7.0-beta1: fix SRC_URI and S after c070de32d40dd561b63de5b4f41baa3cf822ef5b
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
X-List-Received-Date: Tue, 08 Jun 2010 14:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 12:25 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/qt4/qt-4.6.2+4.7.0-beta1.inc =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0recipes/qt4/qt4-tools-native_4.7.0-beta1.bb | =A0 =A09 ++++++++-
> =A0recipes/qt4/qt4-x11-free_4.7.0-beta1.bb =A0 =A0 | =A0 =A03 ++-
> =A03 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc b/recipes/qt4/qt-4.6.2+=
4.7.0-beta1.inc
> index eb19285..9de3a5d 100644
> --- a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
> +++ b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "LGPLv2.1 GPLv3"
> =A0FILESPATHPKG .=3D ":qt-${PV}"
>
> =A0SRC_URI =3D "\
> - =A0 =A0 =A0 ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-=
src-${PV}.tar.gz \
> + =A0 =A0 =A0 ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-=
src-${SRCVER}.tar.gz \
> =A0 =A0 =A0 =A0file://0004-no-qmake.patch \
> =A0 =A0 =A0 =A0file://hack-out-pg_config.patch \
> =A0 =A0 =A0 =A0file://0006-freetype-host-includes.patch \
> @@ -19,7 +19,7 @@ SRC_URI =3D "\
> =A0 =A0 =A0 =A0file://linux.conf \
> =A0 =A0 =A0 =A0 =A0 =A0"
>
> -S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
> +S =3D "${WORKDIR}/qt-everywhere-opensource-src-${SRCVER}"
>
> =A0QT_LIB_NAMES +=3D "QtDeclarative"
> =A0FILES_${QT_BASE_NAME}-tools =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D "${bin=
dir}/qml"
> diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt=
4-tools-native_4.7.0-beta1.bb
> index 0539c04..fb08ded 100644
> --- a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
> +++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
> @@ -3,9 +3,16 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0require qt4-tools-native.inc
> =A0LICENSE =3D "LGPLv2.1 GPLv3"
>
> -PV =3D "4.6.2+4.7.0-beta1"
> +SRCVER =3D "4.7.0-beta1"
> +PV =3D "4.6.2+${SRCVER}"
> =A0PR =3D "${INC_PR}.0"
>
> +SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-=
src-${SRCVER}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0 file://qt-config.patch \
> + =A0 =A0 =A0 =A0 =A0 file://g++.conf \
> + =A0 =A0 =A0 =A0 =A0 file://linux.conf"
> +S =3D "${WORKDIR}/qt-everywhere-opensource-src-${SRCVER}"
> +
> =A0EXTRA_OECONF +=3D " -no-fast -silent -no-rpath"
>
> =A0TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> diff --git a/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb b/recipes/qt4/qt4-x1=
1-free_4.7.0-beta1.bb
> index beef158..c489a48 100644
> --- a/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
> +++ b/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
> @@ -2,7 +2,8 @@ DEFAULT_PREFERENCE =3D "-1"
>
> =A0require qt4-x11-free.inc
>
> -PV =3D "4.6.2+4.7.0-beta1"
> +SRCVER =3D "4.7.0-beta1"
> +PV =3D "4.6.2+${SRCVER}"
> =A0PR =3D "${INC_PR}.1"
>
> =A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


