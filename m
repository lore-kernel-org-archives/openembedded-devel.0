Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDCBC77BEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 19:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C80AE184AB;
	Mon, 29 Jan 2018 20:00:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9sH5A7sbgWjc; Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D098018489;
	Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B54881E081;
	Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9DA01E080;
	Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 9DA6731C4;
	Mon, 29 Jan 2018 20:00:10 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 29 Jan 2018 20:00:10 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 29 Jan 2018 20:00:10 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Scott Rifenbark
	<srifenbark@gmail.com>
Thread-Topic: [oe] [PATCH] ref-manual: Document the task feature of
	BUILDHISTORY_FEATURES
Thread-Index: AQHTmTKeHM0Vq662QEWJsvv/C5rttqOLM8Zg
Date: Mon, 29 Jan 2018 19:00:10 +0000
Message-ID: <db3695d4a74d4112829131e4610ebf73@XBOX02.axis.com>
References: <20180129184547.25199-1-pkj@axis.com>
In-Reply-To: <20180129184547.25199-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] ref-manual: Document the task feature of	BUILDHISTORY_FEATURES
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
X-List-Received-Date: Mon, 29 Jan 2018 19:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bah. One of these days I will learn to send mails to the correct=20
mailing list...

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 29 januari 2018 19:46
> To: openembedded-devel@lists.openembedded.org; Scott Rifenbark
> <srifenbark@gmail.com>
> Subject: [oe] [PATCH] ref-manual: Document the task feature of
> BUILDHISTORY_FEATURES
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  documentation/ref-manual/ref-variables.xml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/r=
ef-manual/ref-variables.xml
> index 521eaeaed2..70e5e3428b 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -1927,8 +1927,8 @@
>                  </para>
>=20
>                  <para>
> -                    You can specify three features in the form of a
> -                    space-separated list:
> +                    You can specify features in the form of a space-sepa=
rated
> +                    list:
>                      <itemizedlist>
>                          <listitem><para><emphasis>image:</emphasis>
>                              Analysis of the contents of images, which
> @@ -1942,12 +1942,17 @@
>                              Analysis of the contents of the software
>                              development kit (SDK).
>                              </para></listitem>
> +                        <listitem><para><emphasis>task:</emphasis>
> +                            Save output file signatures for sstate tasks=
.  This
> +                            saves a file per task listing the SHA-256 ch=
ecksums
> +                            for each file staged, i.e., the output of th=
e task.
> +                            </para></listitem>
>                      </itemizedlist>
>                  </para>
>=20
>                  <para>
>                      By default, the <filename>buildhistory</filename> cl=
ass
> -                    enables all three features:
> +                    enables the following features:
>                      <literallayout class=3D'monospaced'>
>       BUILDHISTORY_FEATURES ?=3D "image package sdk"
>                      </literallayout>
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

