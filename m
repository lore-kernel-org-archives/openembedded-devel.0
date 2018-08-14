Return-Path: <prvs=75725d379=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 590 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Aug 2018 08:00:57 UTC
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 94B2274583
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 08:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1534233660; x=1565769660;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=tBk6GWWCfRf8Dym+Fz5XeG3xbF2sIJ6E4u6NHHe50uI=;
	b=bfe7HhlMS618nLBXaEl20qCBtqRNfQRcBXux/vsSqd2B5YS4jMYygKZS
	Ar4qeNXw3BIU71SHlFX8519N24esoZlzqrzdYudiPQZcYnQaOuBSg03zW
	8JQZrCy/ZMl73Zy9Kgfus9RQfaG4nLnfDnBmZXp4a4uOj9TwGN0w69gRj 0=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 14 Aug 2018 09:51:07 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw2.muc with ESMTP/TLS;
	14 Aug 2018 09:51:06 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb6.muc with ESMTP/TLS; 14 Aug 2018 09:51:06 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Tue, 14 Aug 2018 09:51:06 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Tue, 14 Aug 2018 09:51:06 +0200
From: <Mikko.Rapeli@bmw.de>
To: <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] ltrace: added alternate source
Thread-Index: AQHUMwDSMnDyCBQUUkuCSq7KnoqMWqS93gaAgADhjQA=
Date: Tue, 14 Aug 2018 07:51:06 +0000
Message-ID: <20180814075105.GN8291@hiutale>
References: <MAXPR01MB0348B0F7FCE0B995544DA5B291390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<CAMKF1sosfZqgHsHaKi7ifNPobSiZxnzULf=15BLOXRw9TCa-nA@mail.gmail.com>
In-Reply-To: <CAMKF1sosfZqgHsHaKi7ifNPobSiZxnzULf=15BLOXRw9TCa-nA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ltrace: added alternate source
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
X-List-Received-Date: Tue, 14 Aug 2018 08:00:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D735247C961F8F4B8B5C25F2998ADCEC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 11:23:49AM -0700, Khem Raj wrote:
> On Mon, Aug 13, 2018 at 5:37 AM Aditya Tayade <Aditya.Tayade@kpit.com> wr=
ote:
> >
> > Description:
> > As alioth (the Debian service hosting anonscm) has been discontinued us=
ing https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new=
 source for ltrace.
> > The new source tree SRCREV SHA "ea8928dab8" and old source tree (from d=
iscontinued link)SRCREV SHA "c22d359433" points to same git history but hav=
e some diffs.
> > Hence added a patch which applies the diff to SHA "ea8928dab8" to make =
it same as SHA "c22d359433" from the earlier git source.
> >
>=20
> it might be better to push a repo from
> https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz into
> github or some place. Have we asked the debian salsa migration team if
> this is planned for migration at all ?

Yes, but hosting the git repo feels like taking over maintenance of it too.

This patch enables building ltrace from poky master and sumo again without
ltrace sources in download caches. Thus I would take it.

-Mikko=

