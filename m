Return-Path: <prvs=0995cbc558=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9581F60119
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2016 15:35:48 +0000 (UTC)
X-AuditID: 0a00029b-f79876d000000e4a-44-577d2554d139
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	F3.E4.03658.4552D775; Wed,  6 Jul 2016 10:35:48 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 6 Jul 2016 10:35:47 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [OE-core] problem with blacklisted packages
Thread-Index: AQHR15d7/AAptruz1ESnACoRRKFahKAL3MSA
Date: Wed, 6 Jul 2016 15:35:47 +0000
Message-ID: <2476892.ILE9ZpP5Yr@localhost.localdomain>
References: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
	<577D1D64.8080604@elfin.de>
In-Reply-To: <577D1D64.8080604@elfin.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWyRiBPQzdEtTbc4NgnEYuLh5cyW1xduZ/N
	gcnjxssGRo9zG1cwBjBFcdskJZaUBWem5+nbJXBnLHjUzlLQxV4xdU14A+Mp1i5GTg4JAROJ
	3qsLoWwxiQv31rN1MXJxCAkcZZQ40v+YHcKZySix5f9XNpAqNgEjiXPXNzGC2CICsRLzNs1k
	ArGZBXQlri9+zQJiCwvYSvT+PgtVYycx8c41NgjbSOLqw4tg9SwCKhKbD3xjBrF5Bcwklq8/
	BWRzAC3LkGj4kQMS5hTQkPh07D1YOSPQcd9PrYFaJS5x68l8JoijBSSW7DnPDGGLSrx8/I8V
	ZIyEgJzE/y0eEOU6Egt2f2IDCTMLWElsXuAEEdaWWLbwNdQBghInZz5hmcAoPgvJgllIumch
	dM9C0j0LSfcCRtZVjHy5RnqpxcVl+SWpesn5uZsYgbHFxcA0ewfjngkOhxgFOBiVeHgvyNeE
	C7EmlhVX5h5ilOZgURLnVRFSChcSSE8sSc1OTS1ILYovKs1JLT7EyMTBeYhRgoNLSqQ4NS8l
	tSixtCQjHhSt8cXAeJVqYNQ+HiD42uyPhbVFPafzmpttWz9cm5iUamZVnNZc+rXnfflheYW0
	SIXjThZLm5ZcXde69YjJ0dkn485FXg9N01jPlHAnTWXucds9FifkFhu1v/u0//wLhS0p5Zt3
	7AnTD+iNCbQVEuI6vX8pv/qmclOekPDf22PmhkydN/X23VuH598uWKm5JF6JpTgj0VCLuag4
	EQBWuQ65qQIAAA==
Subject: Re: [OE-core] problem with blacklisted packages
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
X-List-Received-Date: Wed, 06 Jul 2016 15:35:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9ED85F869FC523488452256D6FA8A174@essvote.com>
Content-Transfer-Encoding: quoted-printable

You can override the blacklist to off.  That is what I have been doing.
Put the following in your local.conf or distro conf file.
PNBLACKLIST[crda] =3D ""

On Wednesday, July 06, 2016 05:01:56 PM piotr. lewicki wrote:
> Hi,
> I'm having problem with some of the recipes which are blacklisted due to=
=20
> problems with compilation using GCC-6.
>=20
> I wonder if there is a way to "whitelist" those packages without=20
> changing content of original recipe?
>=20
> For now I have:
>=20
> GCCVERSION =3D "5.%"
>=20
> in my distro.conf so if a recipe is not building due to problems with=20
> gcc6 I simply edit the recipe and remove the line with PNBLACKLIST.
>=20
> Is there a better way to deal with those problems?
> Can this blacklisting depend on "GCCVERSION" ?
>=20
> Example of problematic recipe : crda (from crda_3.18.bb)
>=20
>=20
>=20
> Thanks,
> Piotr Lewicki
> =

