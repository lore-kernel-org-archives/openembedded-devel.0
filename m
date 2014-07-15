Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id BAFE16AC95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:44:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,664,1400018400"; d="scan'208";a="54889390"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 15 Jul 2014 10:44:11 +0200
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 15 Jul 2014 10:44:11 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.156]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.03.0174.001; Tue, 15 Jul 2014 10:44:11 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH][meta-oe] memstat: add memstat recipe
Thread-Index: AQHPmyHn0KndiN9tdkCP6I8TENPv7Jug2ylg
Date: Tue, 15 Jul 2014 08:44:10 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA8B274A6@COSNADEXC13.usr.ingenico.loc>
References: <1404809042-10815-1-git-send-email-rongqing.li@windriver.com>
	<53BCAFF5.6080901@windriver.com>
In-Reply-To: <53BCAFF5.6080901@windriver.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH][meta-oe] memstat: add memstat recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 08:44:22 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

A manpage is included in the sources but not installed. This would be nice =
to package it.

Regards,
Matthieu


-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Rongqing Li
Envoy=E9=A0: mercredi 9 juillet 2014 04:59
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: Re: [oe] [PATCH][meta-oe] memstat: add memstat recipe

Drop this patch, HuangJ has sent out a similar patch

-Roy

On 07/08/2014 04:44 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-oe/recipes-devtools/memstat/memstat_1.0.bb |   24 ++++++++++++++++=
+++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb
>
> diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb=20
> b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> new file mode 100644
> index 0000000..8c8882e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "Display virtual memory allocation"
> +DESCRIPTION =3D "Lists all the processes, executables, and shared=20
> +libraries \ that are using up virtual memory. It's helpful to see how=20
> +the shared memory \ is used and which 'old' libs are loaded. "
> +HOMEPAGE =3D "http://memstattool.sourceforge.net/"
> +SECTION =3D "devtool"
> +
> +LICENSE =3D "GPLv2"
> +
> +S =3D "${WORKDIR}/memstattool"
> +
> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D87be186443b1ac2cfa46=
6f475e1ee0cb"
> +
> +SRC_URI =3D "http://sourceforge.net/projects/memstattool/files/${BPN}_${=
PV}.tar.gz \
> +          "
> +SRC_URI[md5sum] =3D "2c3acc0c62b2a18f6601b84e54aa7462"
> +SRC_URI[sha256sum] =3D "245d5fc7fb87bcfd14486cd34917cae2856e799559ac5684=
34af12c4852bce94"
> +
> +do_install_append(){
> +    install -d ${D}${bindir}
> +    install -m 0755 memstat ${D}${bindir}
> +    install -d ${D}/etc
> +    install -m 0755 memstat.conf ${D}/etc }
>

--
Best Reagrds,
Roy | RongQing Li
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

