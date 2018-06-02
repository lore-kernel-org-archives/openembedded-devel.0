Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7D66752B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Jun 2018 11:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2A0F9181A7;
	Sat,  2 Jun 2018 13:06:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 5c2FxcwXnMn6; Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D749618153;
	Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAA451E060;
	Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF21D1E056;
	Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id A110F2542;
	Sat,  2 Jun 2018 13:06:18 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 2 Jun 2018 13:06:18 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 2 Jun 2018 13:06:18 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sat, 2 Jun 2018 13:06:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [V2][meta-oe][PATCH] nmap: move recipe from meta-security
	to	meta-oe
Thread-Index: AQHT+gKS+HGyKSWw4ku6qg/qj9/P+aRMzb6A
Date: Sat, 2 Jun 2018 11:06:18 +0000
Message-ID: <e93763a4d5554a2a977b7d9372e9e48c@XBOX02.axis.com>
References: <1527896694-9778-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1527896694-9778-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [V2][meta-oe][PATCH] nmap: move recipe from meta-security to	meta-oe
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
X-List-Received-Date: Sat, 02 Jun 2018 11:06:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: den 2 juni 2018 01:45
> To: akuster808@gmail.com; openembedded-devel@lists.openembedded.org
> Subject: [oe] [V2][meta-oe][PATCH] nmap: move recipe from meta-security
> to meta-oe
>=20
> [V2]

You should never include patch version related info in the commit message.
It belongs after the --- below.

> Remove obsolete sed operations
> Remove zenmap as python-pygtk was obsoleted in core

Since you are now both moving and modifying the recipe, maybe you should=20
do it as two commits.

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../nmap-redefine-the-python-library-dir.patch     | 37
> +++++++++++++++++
>  ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48
> ++++++++++++++++++++++
>  meta-oe/recipes-security/nmap/nmap_7.60.bb         | 46
> +++++++++++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-redefine-
> the-python-library-dir.patch
>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-
> shtool-mkdir-with-coreutils-mkdir-command.patch
>  create mode 100644 meta-oe/recipes-security/nmap/nmap_7.60.bb
>=20

//Peter


