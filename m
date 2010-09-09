Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Otko7-0001P3-Cw
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 19:21:08 +0200
Received: by iwn2 with SMTP id 2so1310801iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d34r7uVKeOIiKKvWt6cYV0YMs+AH0kOEfecSMQJEO5E=;
	b=kyBCNizoUf/UruWoQWtGKCOrEIfFbCcH7vkPEKWkxoRaD0LsmN1xSDZnEshFySGP3/
	PM7QpylCoNeE5HS32TaMvPcbfd8cou9S48Apjx84WSM1MnqMSi5eCagJ0RPyXc50CThw
	1HByZdaq1YxpQw2W8SszKZpXqI/3ZWBB74UuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jIYIgur/uGe3BWT+R0WqWj5XCNBu6W6FnstqO7segL95MnW+lS1Ei1CvPD5xCxHd6f
	lXKUZZB+CoghIVGgWTbskAi/qTrwgxaXZmUcuV68jCqybhx2ug+So0bE7QplEMs6quWJ
	88ujwkwcH4plK+jCP3V3uAaqyklZ7c+v3DhkI=
MIME-Version: 1.0
Received: by 10.231.59.212 with SMTP id m20mr11799343ibh.130.1284052825666;
	Thu, 09 Sep 2010 10:20:25 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 10:20:25 -0700 (PDT)
In-Reply-To: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
References: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>
Date: Thu, 9 Sep 2010 19:20:25 +0200
Message-ID: <AANLkTinLc9Yns87CFTwX4Wk_Wj0k=g02F06e5Aj5HXup@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Thu, 09 Sep 2010 17:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Fahad Usman <fahad_usman@mentor.com>:
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
> =A0recipes/omniorb/omniorb-native_4.1.4.bb | =A0 23 ---------------------
> =A0recipes/omniorb/omniorb_4.1.4.bb =A0 =A0 =A0 =A0| =A0 33 +++++++++++++=
++++++++++++-----
> =A02 files changed, 27 insertions(+), 29 deletions(-)
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
> - =A0 =A0 =A0 =A0 file://omniorb_4.1.4.patch \
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
> - =A0 =A0 =A0 =A0oe_runmake
> -}
> -# Ugly hack so libtool does not find native libs when building cross pac=
kages
> -# We really only build this package for omniidl anyway
> -do_stage_append() {
> - =A0 =A0 =A0 =A0rm -f =A0${STAGING_LIBDIR_NATIVE}/libomni*
> -}
> diff --git a/recipes/omniorb/omniorb_4.1.4.bb b/recipes/omniorb/omniorb_4=
.1.4.bb
> index a4c032c..03a1554 100644
> --- a/recipes/omniorb/omniorb_4.1.4.bb
> +++ b/recipes/omniorb/omniorb_4.1.4.bb
> @@ -2,8 +2,9 @@ DESCRIPTION =3D "OmniORB High Performance ORB"
> =A0SECTION =3D "devel"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "LGPL"
> -DEPENDS =3D "omniorb-native"
> -PR =3D "r0"
> +DEPENDS_pn-omniorb =3D "omniorb-native"
> +DEPENDS_pn-omniorb-native +=3D "python-native"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://downloads.sourceforge.net/omniorb/omniORB-4.1.4.ta=
r.gz;name=3DomniORB414targz \
> =A0file://omniorb_4.1.4.patch \
> @@ -12,6 +13,10 @@ file://omniORB-cross.patch \
> =A0file://omniORB_embedded_appl.patch \
> =A0file://rm_LongDouble.patch \
> =A0"
> +SRC_URI_virtclass-native =3D "http://downloads.sourceforge.net/omniorb/o=
mniORB-4.1.4.tar.gz;name=3DomniORB414targz \
> + =A0 =A0 =A0 =A0 file://omniorb_4.1.4.patch \
> +"
> +
>
> =A0SRC_URI[omniORB414targz.md5sum] =3D "1f6070ff9b6339876976d61981eeaa6a"
> =A0SRC_URI[omniORB414targz.sha256sum] =3D "84fb9790c25d6e46248c9773747e39=
3b429573190da2150850d4a49debda4e8e"
> @@ -29,9 +34,14 @@ do_compile () {
> =A0 =A0 =A0 =A0oe_runmake
>
> =A0}
> +
> +do_compile_virtclass-native() {
> + =A0 =A0 =A0 =A0oe_runmake
> +}
> +
> =A0do_install () {
> =A0 =A0 =A0 =A0 export EmbeddedSystem=3D1
> - =A0 =A0 =A0 =A0make DESTDIR=3D${D} install
> + =A0 =A0 =A0 =A0autotools_do_install
> =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}
> =A0 =A0 =A0 =A0 install -m 0644 ${WORKDIR}/omniORB.cfg ${D}${sysconfdir}
> =A0 =A0 =A0 =A0 install -d ${D}${localstatedir}/omninames
> @@ -39,7 +49,18 @@ do_install () {
> =A0 =A0 =A0 =A0#only executable libraries are stripped by the stripper
> =A0 =A0 =A0 =A0chmod +x ${WORKDIR}/image/usr/lib/lib*
> =A0}
> -do_stage () {
> - =A0 =A0 =A0 =A0export EmbeddedSystem=3D1
> - =A0 =A0 =A0 =A0autotools_stage_all
> +
> +do_install_virtclass-native() {
> + =A0 =A0 =A0 =A0autotools_do_install
> +}
> +
> +# The following comment is from the omniorb-native recipe which is now m=
erged into this one...
> +# Ugly hack so libtool does not find native libs when building cross pac=
kages
> +# We really only build this package for omniidl anyway
> +do_install_virtclass-native_append() {
> + =A0 =A0 =A0 =A0rm -f =A0${D}${libdir}/libomni*

Can you verify if this is still needed ?
I suggest to do that by cleaning both recipes, then remove this hack,
then build omniidl-native followed by omniidl
If the last one builds fine, I'd say it is afe to leave tout this rm

Frans
> =A0}
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


