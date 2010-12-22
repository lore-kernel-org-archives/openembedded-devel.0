Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVG6A-00032A-AV
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 05:14:46 +0100
Received: by yie16 with SMTP id 16so557556yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 20:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7VhLzKG8563RbNmHdUkLGmcgfqU4US8QRhKLEtDkbZM=;
	b=o4qyAFzo6ML50THPa7QXwQ3ij/XoF6JJcoJlqhwGQNG9h/5+7WqpKmNyHLknyajqae
	SgQ/N7GtwxF1AoBEiI0ldrAoK+3se7SmKTc5EtUS41z+l6uapqjoD2wvrH3tWicJjFeU
	MnMtCNuA1lkxgcuGgsxUCVTxnnaEiIANakQSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=k4eRQjb1k20TnOy4oJUUGcfVr/cEm98A17w2pWB640ijUglMyQq43qB5h4G7zZEv/J
	VNKL5xLGMVBWCiwJ8j+KyoPzGwIeRYX/8/bWI2eiir1T2MHgND5QBHJszDU2RoRk2aq0
	KzJDx2eFAgBaGLRAdMjU9INpTUaB0a5A7Ygik=
Received: by 10.90.120.17 with SMTP id s17mr7896660agc.193.1292991278328; Tue,
	21 Dec 2010 20:14:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 20:14:17 -0800 (PST)
In-Reply-To: <1292986254-24531-2-git-send-email-marc@cpdesign.com.au>
References: <1292986254-24531-1-git-send-email-marc@cpdesign.com.au>
	<1292986254-24531-2-git-send-email-marc@cpdesign.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 20:14:17 -0800
Message-ID: <AANLkTikNGoO9ev0qhzQnt+HRuABhYwz6U9StC3XhyLYt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Add qextserialport recipe.
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
X-List-Received-Date: Wed, 22 Dec 2010 04:14:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 6:50 PM, Marc Reilly <marc@cpdesign.com.au> wrote:
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>

thank you for your conrtribution

> ---
> =C2=A0recipes/qextserialport/qextserialport-e_hg.bb | =C2=A0 =C2=A04 ++++
> =C2=A0recipes/qextserialport/qextserialport.inc =C2=A0 =C2=A0 | =C2=A0 25=
 +++++++++++++++++++++++++
> =C2=A0recipes/qextserialport/qextserialport_hg.bb =C2=A0 | =C2=A0 =C2=A04=
 ++++
> =C2=A03 files changed, 33 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/qextserialport/qextserialport-e_hg.bb
> =C2=A0create mode 100644 recipes/qextserialport/qextserialport.inc
> =C2=A0create mode 100644 recipes/qextserialport/qextserialport_hg.bb
>
> diff --git a/recipes/qextserialport/qextserialport-e_hg.bb b/recipes/qext=
serialport/qextserialport-e_hg.bb
> new file mode 100644
> index 0000000..f106ebd
> --- /dev/null
> +++ b/recipes/qextserialport/qextserialport-e_hg.bb
> @@ -0,0 +1,4 @@
> +inherit qt4e
> +
> +require qextserialport.inc
> +
> diff --git a/recipes/qextserialport/qextserialport.inc b/recipes/qextseri=
alport/qextserialport.inc
> new file mode 100644
> index 0000000..1f3cd6b
> --- /dev/null
> +++ b/recipes/qextserialport/qextserialport.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Serial Port Library for Qt"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +
> +PV =3D "0.0+${PR}+hg${SRCREV}"
> +PR =3D "r0"
> +
> +SRCREV =3D "default"
> +SRC_URI =3D "hg://qextserialport.googlecode.com/hg;rev=3D${SRCREV};modul=
e=3Dqextserialport;proto=3Dhttps"
> +
> +S =3D "${WORKDIR}/qextserialport"
> +
> +do_stage() {
> + =C2=A0 =C2=A0 =C2=A0 oe_libinstall -so -C src/build libqextserialport $=
{STAGING_LIBDIR}
> + =C2=A0 =C2=A0 =C2=A0 cp -pPR src/*.h ${STAGING_INCDIR}
> +}
> +

get rid of do_stage its no more required. staging is done from install now.

> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${inc=
ludedir}
> + =C2=A0 =C2=A0 =C2=A0 oe_libinstall -so -C src/build libqextserialport $=
{D}${libdir}
> + =C2=A0 =C2=A0 =C2=A0 cp -pPR src/*.h ${D}${includedir}
> +}
> +
> +FILES_${PN} =3D "${libdir}"
> diff --git a/recipes/qextserialport/qextserialport_hg.bb b/recipes/qextse=
rialport/qextserialport_hg.bb
> new file mode 100644
> index 0000000..3464131
> --- /dev/null
> +++ b/recipes/qextserialport/qextserialport_hg.bb
> @@ -0,0 +1,4 @@
> +inherit qt4x11
> +
> +require qextserialport.inc
> +
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


