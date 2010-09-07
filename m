Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OsrAI-0000Z2-ND
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 07:56:20 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Osr9d-0006rB-5w from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:55:37 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Tue,  7 Sep 2010 05:55:35 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	07 Sep 2010 10:55:34 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283777330-31590-1-git-send-email-fahad_usman@mentor.com>
References: <1283777330-31590-1-git-send-email-fahad_usman@mentor.com>
Organization: Mentor Graphics
Date: Tue, 07 Sep 2010 10:55:34 +0500
Message-ID: <1283838934.16315.26.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uicmoc-native_2.3.10.bb: converted to new style staging
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
X-List-Received-Date: Tue, 07 Sep 2010 05:56:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-09-06 at 17:48 +0500, Fahad Usman wrote:
> * Converted do_stage to do_install.
> * Bumped PR
> * Added NATIVE_INSTALL_WORKS =3D "1"
>=20
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  recipes/uicmoc/uicmoc-native_2.3.10.bb |   13 ++++++++-----
>  1 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uicm=
oc-native_2.3.10.bb
> index c161571..8c69bef 100644
> --- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
> +++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.trolltech.com"
>  SECTION =3D "devel"
>  PRIORITY =3D "optional"
>  LICENSE =3D "GPL QPL"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-fre=
e.tar.gz \
>             file://fix-makefile.patch \
> @@ -43,11 +43,14 @@ do_compile() {
>      oe_runmake -C tools/makeqpf       || die "Building makeqpf failed"
>  }
> =20
> -do_stage() {
> -    install -m 0755 bin/moc ${STAGING_BINDIR}
> -    install -m 0755 bin/uic ${STAGING_BINDIR}
> -    install -m 0755 tools/makeqpf/makeqpf ${STAGING_BINDIR}
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 bin/moc ${D}${bindir}
> +    install -m 0755 bin/uic ${D}${bindir}
> +    install -m 0755 tools/makeqpf/makeqpf ${D}${bindir}
>  }
> =20
>  SRC_URI[md5sum] =3D "1f7ad30113afc500cab7f5b2f4dec0d7"
>  SRC_URI[sha256sum] =3D "883363eb0c94de3d1e36f3ab9e09a8f127418d497213cc1a=
0ed1a1588ecd66b8"
> +
> +NATIVE_INSTALL_WORKS =3D "1"=20

This patch was already sent by Noor Ahsan on September 2,
http://patchwork.openembedded.org/patch/2852/
I have changed the status of my patch to "Not Applicable" in patchwork

Regards,
Fahad


