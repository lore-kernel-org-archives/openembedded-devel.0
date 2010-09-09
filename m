Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtkSd-0004W1-PU
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 18:58:56 +0200
Received: by ywa8 with SMTP id 8so747885ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=1EHywGYiAGkG49iJkgMHC9wyOSWBh7Ys0YIWrqjO+FU=;
	b=SpuuQOnSnxzUQzYqv6fTyQRlkimmVDVCHgT7W85uxYs/Lxbl+OEBvdLJyISs4qdYI4
	zbAXVlBi6zNRzQQEHX2RmDyOfnmUrVbs+U2lRAP8/64SHZehDjC6zIf3DbfljRqEDy/j
	jhJH7vSJmyaVOzk/LcFmFYifsuTmpUBKtepcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=B/ezgpyq1YcEXp+AugXKcorRy6If/Llipjipj1BJcDI0QayaX5ihfRLVtKyR7171Hn
	VscHZpZxTacl1jElM7lVK3eULz+QSagufE8R22zU31fseHehGbRUy/bI703mbX1GE4N8
	QBHDsjFgAelo/AQEwCs6aUc7+lx2niy16CO+s=
Received: by 10.150.52.11 with SMTP id z11mr302687ybz.149.1284051484990; Thu,
	09 Sep 2010 09:58:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Thu, 9 Sep 2010 09:57:44 -0700 (PDT)
In-Reply-To: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
References: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Sep 2010 09:57:44 -0700
Message-ID: <AANLkTi=om4W4SaSvFPE23qGWdTbwSA4YaM-SU=KAJgS5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omniorb_4.1.4: merged native and non-native recipes
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
X-List-Received-Date: Thu, 09 Sep 2010 16:58:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2010 at 9:30 AM, Fahad Usman <fahad_usman@mentor.com> wrote:
> * removed the omniorb-native_4.1.4.bb file
> * added DEPENDS_pn-omniorb =3D "omniorb-native" and DEPENDS_pn-omniorb-na=
tive +=3D "python-native" to handle different dependencies for native and t=
arget recipes, thanks to Vitus Jensen for guidance
> * added NATIVE_INSTALL_WORKS =3D "1"
> * added BBCLASSEXTEND =3D "native"
> * added do_install_virtclass-native and converted do_stage from native re=
cipe to do_install_virtclass-native_append in the combined recipe
> * bumped PR
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> =C2=A0recipes/omniorb/omniorb-native_4.1.4.bb | =C2=A0 23 ---------------=
------
> =C2=A0recipes/omniorb/omniorb_4.1.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 33 +++++++++++++++++++++++++-----
> =C2=A02 files changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/recipes/omniorb/omniorb-native_4.1.4.bb b/recipes/omniorb/om=
niorb-native_4.1.4.bb
> deleted file mode 100644
> index c5c550d..0000000
> --- a/recipes/omniorb/omniorb-native_4.1.4.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SECTION =3D "devel"
> -DEPENDS +=3D "python-native"
> -PR =3D "r0"
> -
> -SRC_URI =3D "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4.tar.=
gz;name=3DomniORB414targz \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://omniorb_4.1.4.patch \
> -"
> -
> -SRC_URI[omniORB414targz.md5sum] =3D "1f6070ff9b6339876976d61981eeaa6a"
> -SRC_URI[omniORB414targz.sha256sum] =3D "84fb9790c25d6e46248c9773747e393b=
429573190da2150850d4a49debda4e8e"
> -
> -S =3D "${WORKDIR}/omniORB-${PV}"
> -
> -inherit native autotools
> -
> -do_compile () {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake
> -}
> -# Ugly hack so libtool does not find native libs when building cross pac=
kages
> -# We really only build this package for omniidl anyway
> -do_stage_append() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f =C2=A0${STAGING_LIBDIR_NATIVE}/libomni=
*
> -}
> diff --git a/recipes/omniorb/omniorb_4.1.4.bb b/recipes/omniorb/omniorb_4=
.1.4.bb
> index a4c032c..03a1554 100644
> --- a/recipes/omniorb/omniorb_4.1.4.bb
> +++ b/recipes/omniorb/omniorb_4.1.4.bb
> @@ -2,8 +2,9 @@ DESCRIPTION =3D "OmniORB High Performance ORB"
> =C2=A0SECTION =3D "devel"
> =C2=A0PRIORITY =3D "optional"
> =C2=A0LICENSE =3D "LGPL"
> -DEPENDS =3D "omniorb-native"
> -PR =3D "r0"
> +DEPENDS_pn-omniorb =3D "omniorb-native"
> +DEPENDS_pn-omniorb-native +=3D "python-native"
> +PR =3D "r1"
>
> =C2=A0SRC_URI =3D "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4=
.tar.gz;name=3DomniORB414targz \
> =C2=A0file://omniorb_4.1.4.patch \
> @@ -12,6 +13,10 @@ file://omniORB-cross.patch \
> =C2=A0file://omniORB_embedded_appl.patch \
> =C2=A0file://rm_LongDouble.patch \
> =C2=A0"
> +SRC_URI_virtclass-native =3D "http://downloads.sourceforge.net/omniorb/o=
mniORB-4.1.4.tar.gz;name=3DomniORB414targz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://omniorb_4.1.4.patch \
> +"
> +
>
> =C2=A0SRC_URI[omniORB414targz.md5sum] =3D "1f6070ff9b6339876976d61981eeaa=
6a"
> =C2=A0SRC_URI[omniORB414targz.sha256sum] =3D "84fb9790c25d6e46248c9773747=
e393b429573190da2150850d4a49debda4e8e"
> @@ -29,9 +34,14 @@ do_compile () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake
>
> =C2=A0}
> +
> +do_compile_virtclass-native() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake
> +}
> +
> =C2=A0do_install () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 export EmbeddedSystem=3D1
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0make DESTDIR=3D${D} install
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/omniORB.cfg ${D}${=
sysconfdir}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${localstatedir}/omninames

can this be made do_install_append instead ?

> @@ -39,7 +49,18 @@ do_install () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#only executable libraries are stripped by the=
 stripper
> =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ${WORKDIR}/image/usr/lib/lib*
> =C2=A0}
> -do_stage () {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0export EmbeddedSystem=3D1
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_stage_all
> +
> +do_install_virtclass-native() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install
> +}
> +
> +# The following comment is from the omniorb-native recipe which is now m=
erged into this one...
> +# Ugly hack so libtool does not find native libs when building cross pac=
kages
> +# We really only build this package for omniidl anyway
> +do_install_virtclass-native_append() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f =C2=A0${D}${libdir}/libomni*
> =C2=A0}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


