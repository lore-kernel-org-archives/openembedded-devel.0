Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B58BC6D2FB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 16:45:55 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2013 08:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="386078352"
Received: from unknown (HELO helios.localnet) ([10.252.121.102])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2013 08:45:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Javier Viguera <javier.viguera@digi.com>, Tom King <ka6sox@gmail.com>
Date: Thu, 07 Nov 2013 16:45:53 +0000
Message-ID: <1678132.5T9pc4s1xI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <527BB991.8060008@digi.com>
References: <5256CE06.60502@digi.com> <20131107161445.589ad9ea@e6520eb>
	<527BB991.8060008@digi.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: cherokee wrong SRC_URI (was Dylan backports)
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
X-List-Received-Date: Thu, 07 Nov 2013 16:45:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 07 November 2013 17:02:25 Javier Viguera wrote:
> Hi Eric,
>=20
> On 07/11/13 16:14, Eric B=E9nard wrote:
> > that's now pushed, thanks for the reminder.
> >=20
> > Eric
>=20
> Well I should have probably checked that the mirror was still working=

> before sending my e-mail but you know ... Murphy's law.
>=20
> The thing is that for cherokee the mirror I used to download the pack=
age
> from has removed it since i sent the patch a couple of months ago.
>=20
> I'm sorry to have pushed you to merge the patches. Anyway from
> meta-openembedded point of view the status has *not* gone any worse. =
It
> was not working before (with old cherokee url) and it's not working n=
ow
> as well.
>=20
> I've found a couple of sites with the original package (same md5sum a=
nd
> sha256sum):
>=20
> <ftp://ftp.nluug.nl/pub/internet/cherokee/1.2/1.2.98/cherokee-1.2.98.=
tar.gz>
> <ftp://ftp.heanet.ie/mirrors/cherokee/1.2/1.2.98/cherokee-1.2.98.tar.=
gz>
>=20
> but at this moment I'm not sure whether it's worth to keep changing t=
he
> SRC_URI time and time again.
>=20
> Probably the way to go is to revert my patch leaving the original
> cherokee as a reference and include the package in any of the
> yoctoproject mirrors.
>=20
> By the way the recipe is now broken not only in Dylan, but also in
> *Dora* and *master*.
>=20
> Comments?

1) Let's get the file added to the OE source mirror, that will at least=
 stop=20
failures for all branches. Tom, could you please add the file from one =
of the=20
above URLs to our source mirror?

2) Longer term the recipe should just be upgraded; last I checked we've=
 fallen=20
quite far behind the current version. Javier, if you're relying on Cher=
okee is=20
that something you'd be prepared to do?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

