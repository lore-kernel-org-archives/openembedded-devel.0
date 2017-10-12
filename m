Return-Path: <prvs=45173159e=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 816 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Oct 2017 07:17:26 UTC
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id 96E8071DDD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1507792649; x=1539328649;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=M4+6DbpcNPyyGR8VIW3mIgqIZVsOyrFy7DYbRYAJSAY=;
	b=bP/1WDfyvDIJum5GGYZS/QuqJlY8a+SPTmYm9r9O5hGWBna0MGrFpJ/D
	7H4LNi3d3yhpWUHaI5y+l2WMrPPgLw9Tt9kQol+lH7IaUfnAggOoWpDyW
	56r9BpG8zAaHe3E3EWhU1tiQxFcWG+2rrYZj1cYa4MbtTbq4emPe3cKnf o=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 12 Oct 2017 09:03:22 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
	12 Oct 2017 09:03:21 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb6.muc with ESMTP/TLS; 12 Oct 2017 09:03:21 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 12 Oct 2017 09:03:21 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1320.000;
	Thu, 12 Oct 2017 09:03:21 +0200
From: <Mikko.Rapeli@bmw.de>
To: <changhyeok.bae@gmail.com>
Thread-Topic: [oe] [meta-qt5] Keep Qt 5.6.x
Thread-Index: AQHTQvXmiE+dDs1gn0GoM7BY5822xaLfqO2A
Date: Thu, 12 Oct 2017 07:03:21 +0000
Message-ID: <20171012070321.i6ajfn5bcgmjnwx5@hiutale>
References: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
In-Reply-To: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: stephen.lawrence@renesas.com, otavio@ossystems.com.br,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Keep Qt 5.6.x
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
X-List-Received-Date: Thu, 12 Oct 2017 07:17:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB3DA00C48F4894A822230627B047FD1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 10:03:01AM +0900, Changhyeok Bae wrote:
> Hi maintainers
>=20
> Qt 5.6 is LTS version and not GPL3 license.
> So why don't you keep v5.6.x in master branch?
> Many companies, opensource projects and developers would like to use Qt
> v5.6 in master branch to use it with latest yocto release.

Hear, hear. Another complication is that users like us might be stuck with =
an
older Yocto release.

Even if v5.6.x were not maintained in master branch, it would make sense
for users of Qt v5.6.x in yocto world to share patches in meta-qt.

I'll check if we could share our branch to bring Qt 5.6.2 base to jethro wh=
ich
is mostly just cherry-picked patches from krogoth branch.

-Mikko=

