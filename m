Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 556A271A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 16:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 989FE182D7;
	Fri,  4 May 2018 18:02:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Hv8K_lw-apdj; Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 526191857B;
	Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E2DF1E06C;
	Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31A6F1E066;
	Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 24B5825AA;
	Fri,  4 May 2018 18:02:26 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 4 May 2018 18:02:25 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 4 May 2018 18:02:25 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] networkmanager: fix
	"installed-vs-shipped" QA issue
Thread-Index: AQHT4wpgqSl6DmQGmkiEXP2W3KGrfKQfukQA
Date: Fri, 4 May 2018 16:02:25 +0000
Message-ID: <62171c6d294a43d886500350bfa26bd5@XBOX02.axis.com>
References: <1525371114-30249-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1525371114-30249-1-git-send-email-mark.asselstine@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-networking][PATCH] networkmanager: fix	"installed-vs-shipped" QA issue
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
X-List-Received-Date: Fri, 04 May 2018 16:02:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Mark Asselstine
> Sent: den 3 maj 2018 20:12
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] networkmanager: fix "installed-
> vs-shipped" QA issue
>=20
> When building we can see the following QA issue:
>   QA Issue: networkmanager: Files/directories were installed but
>     not shipped in any package:
>   [2018-05-02 23:01:40.442528079-07:00]   /usr/lib/NetworkManager
>   [2018-05-02 23:01:40.450990449-07:00]
> /usr/lib/NetworkManager/conf.d
>   [2018-05-02 23:01:40.456642738-07:00]   /usr/lib/NetworkManager/VPN
>=20
> The upstream project moved these to $prefix/lib as part of upstream
> commit 74818b155c32 [build: fix $nmlibdir to be
> "/usr/lib/NetworkManager"] and here we adapt the recipe to take this
> change into effect.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-
> networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> index d90b782..91636ec 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.10.6.bb
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.10.6.bb
> @@ -100,8 +100,8 @@ FILES_${PN} +=3D " \
>      ${libexecdir} \
>      ${libdir}/pppd/*/nm-pppd-plugin.so \
>      ${libdir}/NetworkManager/*.so \
> -    ${libdir}/NetworkManager/VPN \
> -    ${libdir}/NetworkManager/conf.d \
> +    ${prefix}/lib/NetworkManager/VPN \
> +    ${prefix}/lib/NetworkManager/conf.d \

There is a variable for ${prefix}/lib: nonarch_libdir, i.e.:

    ${nonarch_libdir}/NetworkManager/VPN \
    ${nonarch_libdir}/NetworkManager/conf.d \

>      ${datadir}/polkit-1 \
>      ${datadir}/dbus-1 \
>      ${base_libdir}/udev/* \
> --
> 2.7.4

//Peter


