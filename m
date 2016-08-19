Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Aug 2016 09:44:36 UTC
Received: from mail1.bemta6.messagelabs.com (mail1.bemta6.messagelabs.com
	[193.109.254.106])
	by mail.openembedded.org (Postfix) with ESMTP id ABB7965CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:44:36 +0000 (UTC)
Received: from [194.106.220.35] by server-2.bemta-6.messagelabs.com id
	5B/AB-13744-563D6B75; Fri, 19 Aug 2016 09:37:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42K5KdM1UTf18rZ
	wg/3H5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxde/eyFPxkqbj4ZBJjA+N35i5GLg4hgU2M
	EgumzmKFcPYySky71M7UxcjJwSZgJrHr1Tp2EFtEIEZi6fnzbCC2sICpxP3bTawQcTOJ+R//Q
	NlWEqt3nmAEsVkEVCXaL31iAbF5BVwlVuybATZTSKBcYs76VcwgNqeArcTqrdvAZjIKyEp8aV
	wNFmcWEJe49WQ+WL2EgIDEkj3nmSFsUYmXj/+xQtgGEluX7mOBsBUkfvSegqqxlvj34C4TxBw
	diQW7P7FB2NoSyxa+Zoa4R1Di5MwnLBMYRWchWTcLScssJC2zkLQsYGRZxahRnFpUllqka2Sq
	l1SUmZ5RkpuYmaNraGCml5taXJyYnpqTmFSsl5yfu4kRGDEMQLCDcdWCwEOMkhxMSqK8v/S3h
	QvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4C28BJQTLEpNT61Iy8wBxi5MWoKDR0mE1w4kzVtckJ
	hbnJkOkTrFqMux4MfttUxCLHn5ealS4ryGIEUCIEUZpXlwI2Bp5BKjrJQwLyPQUUI8BalFuZk
	lqPKvGMU5GJWEeTtBpvBk5pXAbXoFdAQT0BG8/FtAjihJREhJNTCWvOVVnPNg6sIozmjm6XP2
	LFzMbZ0132LCsqcvLq44Uzbh/43SDVNXdATL7NnddoHrPdfFn68cD+3ccihuztXM3VqiHc2KP
	37fu580L/TwLIW7F1PMt7Nc6dH5N+Phr3srX92Wtizelayx5zLjxIs/Ky5bfcx7nqq6+uaxTt
	mv4bHirzLSb/omLlJiKc5INNRiLipOBACxHUsTHgMAAA==
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-12.tower-91.messagelabs.com!1471599461!41085134!1
X-Originating-IP: [217.28.138.145]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23957 invoked from network); 19 Aug 2016 09:37:41 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.138.145)
	by server-12.tower-91.messagelabs.com with AES256-SHA256 encrypted SMTP;
	19 Aug 2016 09:37:41 -0000
Received: from SEHSTE15D2BE2.hs20.net (172.18.251.29) by
	SEHSTE15D2BE5.hs20.net (172.18.251.32) with Microsoft SMTP Server (TLS)
	id 15.0.1178.4; Fri, 19 Aug 2016 10:37:40 +0100
Received: from SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a]) by
	SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a%21]) with mapi id
	15.00.1178.000; Fri, 19 Aug 2016 10:37:40 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Build of u-boot with gold is broken
Thread-Index: AdH5VjLhAuTAF19QS3yoE/njm4xwfAAGcjSAACM8QjA=
Date: Fri, 19 Aug 2016 09:37:39 +0000
Message-ID: <3c98bc6242a346408819398fe3daa456@SEHSTE15D2BE2.hs20.net>
References: <b1622999964348e68e651f38dca42d59@SEHSTE15D2BE2.hs20.net>
	<530A67FF-CCDF-464A-AE0B-1BE124D4F560@gmail.com>
In-Reply-To: <530A67FF-CCDF-464A-AE0B-1BE124D4F560@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [46.17.166.30]
x-exclaimer-md-config: 266e7a57-cddd-49fd-bdea-19bca6d40303
MIME-Version: 1.0
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Fri, 19 Aug 2016 09:44:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > On Aug 18, 2016, at 6:44 AM, Andrew Goodbody
> <andrew.goodbody@cambrionix.com> wrote:
> >
> > Hi,
> >
> > It looks like the recent change to meta/recipes-bsp/u-boot/u-boot.inc t=
o
> enable out of tree builds for u-boot does not work with gold.
> > The sed at line 70 fails as it is being executed in an empty build dire=
ctory
> and so there is no config.mk.
> >
>=20
> Send this to OE-core list you might need to add cd ${B} at beginning of
> do_compile

I wish it were that simple, but it does a cd ${B} before the call to do_com=
pile, but ${B} is empty. Anyway I have resent this to oe-core, sorry for th=
e noise.

Andrew

