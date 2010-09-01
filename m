Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OqtBp-0004tu-Nr
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 21:41:46 +0200
Received: by iwn2 with SMTP id 2so6902998iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BiE/Xv81r9YBEw9Ew5S9m0Tnw56vr3j5vaHVB6JGegA=;
	b=lzcnRsDWma9wiyA+kDWKDGqtskEFH5Flpop3D0DBRPKWBP6wImYsfbOsJqWEArWZhk
	mlKMqRNtjKxVSPRs1msWRHoZglFoJekKVceEYZyxveU39ZHUkX/6bl7kq+y9lTmzc9B+
	kRnnggS1QCS3/c3mGGastAq65JXmAZ+FTkOAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xrnh0dBHDFEyilFbfyVmk6CRc3girqUGm8Yp2tvllHDX7GMg0E+nPf+eDiU2M1T0Mc
	xdVDqtmm8Uy3u7pz/Kkf8xa0x1W9mDph1a7LYWuxQnn1BtNkxakSkh96yvpSGio+kgis
	c6ehQaxytaU/TuOiRNgUPLhdyNpXrLW/AQscs=
MIME-Version: 1.0
Received: by 10.231.183.67 with SMTP id cf3mr9307327ibb.187.1283370072632;
	Wed, 01 Sep 2010 12:41:12 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 12:41:12 -0700 (PDT)
In-Reply-To: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
References: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
Date: Wed, 1 Sep 2010 21:41:12 +0200
Message-ID: <AANLkTikGdRbLuVujasDCgu2eiyn0VCVCbjXjRo8Zv1xr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sip-native: Run oe-stylize script on the recipe and modify the recipe accordingly.
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
X-List-Received-Date: Wed, 01 Sep 2010 19:41:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/1 Noor Ahsan <noor_ahsan@mentor.com>:
> * Run oe-stylize script on the recipe and updated the recipe according to=
 the output of the script.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/sip/sip-native_4.7.9.bb | =A0 34 +++++++++++++++++------------=
-----
> =A01 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/recipes/sip/sip-native_4.7.9.bb b/recipes/sip/sip-native_4.7=
.9.bb
> index 0b025df..2d78ac1 100644
> --- a/recipes/sip/sip-native_4.7.9.bb
> +++ b/recipes/sip/sip-native_4.7.9.bb
> @@ -1,35 +1,35 @@
> =A0DESCRIPTION =3D "SIP is a C++/Python Wrapper Generator"
> -SECTION =3D "devel"
> -HOMEPAGE =3D "http://www.riverbankcomputing.co.uk/sip"
> =A0AUTHOR =3D "Phil Thompson"
> +HOMEPAGE =3D "http://www.riverbankcomputing.co.uk/sip"
> +SECTION =3D "devel"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0PR =3D "ml0"
>
> -DEFAULT_PREFERENCE =3D "-1"
> -
> =A0SRC_URI =3D "http://www.riverbankcomputing.co.uk/static/Downloads/sip4=
/sip-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "597d7ff7edb42a18421c806ffd18a136"
> +SRC_URI[sha256sum] =3D "7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e304=
68f1bd7cf45898e1"
> +
> =A0S =3D "${WORKDIR}/sip-${PV}/sipgen"
>
> =A0inherit qt4x11 native
>
> -export BUILD_SYS
> -export HOST_SYS
> -export STAGING_LIBDIR
> -export STAGING_INCDIR
> -
> =A0EXTRA_QMAKEVARS_POST +=3D "DESTDIR=3D${S} CONFIG=3Dconsole"
>
> =A0do_configure_prepend() {
> - =A0 =A0 =A0 cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURC=
ES, | sed s,headers,HEADERS, > sipgen.pro
> + =A0 =A0 =A0 =A0cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SO=
URCES, | sed s,headers,HEADERS, > sipgen.pro
> =A0}
> -
> =A0do_stage() {
> - =A0 =A0 =A0 install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
> - =A0 =A0 =A0 cd ${WORKDIR}/sip-${PV} && python configure.py
> - =A0 =A0 =A0 install -d ${STAGING_PYDIR}/site-packages
> - =A0 =A0 =A0 install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
> + =A0 =A0 =A0 =A0install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
> + =A0 =A0 =A0 =A0cd ${WORKDIR}/sip-${PV} && python configure.py
> + =A0 =A0 =A0 =A0install -d ${STAGING_PYDIR}/site-packages
> + =A0 =A0 =A0 =A0install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
> =A0}
>
> -SRC_URI[md5sum] =3D "597d7ff7edb42a18421c806ffd18a136"
> -SRC_URI[sha256sum] =3D "7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e304=
68f1bd7cf45898e1"
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> --
>
Mickey can you say something about this recipe.
It is from 2008 and has DEFAULT_PREFERENCE =3D -1

pyqt seems to depend on this recipe
and there are also two sip3-native recipes. Could not find a user for this.

Frans

PS: despite what the name suggests, this package does not seem to have
anything to do with voip.


