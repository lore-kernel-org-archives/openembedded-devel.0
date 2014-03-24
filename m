Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id D0B9D6FA53
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 07:38:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,719,1389740400"; d="scan'208";a="43161585"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 24 Mar 2014 08:38:45 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC22.usr.ingenico.loc ([10.31.4.222]) with mapi id
	14.02.0318.001; Mon, 24 Mar 2014 08:38:44 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] terminus-font: add new recipe for
	version	4.38
Thread-Index: AQHPRGLJRRV/Y8K3U0ueIIoAGc5gF5rv3uEw
Date: Mon, 24 Mar 2014 07:38:43 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B5754DF69@COSNADEXC13.usr.ingenico.loc>
References: <1395313904-6600-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqxERqVRbKkSfz1eJ4s_8WiWLbpK10RHpvBdRzfi7e5FQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] terminus-font: add new recipe for version	4.38
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
X-List-Received-Date: Mon, 24 Mar 2014 07:38:49 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Most recipes are using ??=3D and not ?=3D
What is a best way?

Matthieu

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Khem Raj
Envoy=E9=A0: jeudi 20 mars 2014 18:34
=C0=A0: openembeded-devel
Objet=A0: Re: [oe] [meta-oe][PATCH] terminus-font: add new recipe for versi=
on 4.38

On Thu, Mar 20, 2014 at 4:11 AM, Matthieu Crapet <Matthieu.Crapet@ingenico.=
com> wrote:
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"

why use ??=3D and not ?=3D here
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

