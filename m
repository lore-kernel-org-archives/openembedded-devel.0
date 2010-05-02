Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O8OTH-0004Kj-Hi
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 03:59:52 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O8OPd-0003BA-LG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 18:56:05 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 1 May 2010 18:56:05 -0700
Received: from 172.30.80.14 ([172.30.80.14]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun,  2 May 2010 01:56:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 May 2010 18:55:52 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
References: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
Organization: Mentor Graphics Corporation
Date: Sat, 01 May 2010 18:55:52 -0700
Message-ID: <1272765352.21120.118.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 May 2010 01:56:05.0362 (UTC)
	FILETIME=[A017A520:01CAE99A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode: update tzdata to latest version (2010i).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 May 2010 01:59:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2010-05-01 at 23:12 +0200, Adrian-Ken Rueegsegger wrote:
> Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
> ---
>  recipes/tzcode/tzcode-native_2010f.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcod=
e-native_2010f.bb
> index f2fbffd..8585de2 100644
> --- a/recipes/tzcode/tzcode-native_2010f.bb
> +++ b/recipes/tzcode/tzcode-native_2010f.bb
> @@ -6,11 +6,11 @@ require tzcode-native.inc
>  # Also, tzdata (and it is needed to build tzcode) version can differ fro=
m
>  # tzcode version, thus this variable
> =20
> -TZDATA_PV =3D "2010h"
> +TZDATA_PV =3D "2010i"
> =20
>  SRC_URI[tzcode-2010f.md5sum] =3D "e530cc9bbdfd5e8c1eac21a68f4d5656"
>  SRC_URI[tzcode-2010f.sha256sum] =3D "651d866c91ada925b4ac9491e69ebd5c355=
c46b2c01dd1741b5e6a609d93eb1e"
> -SRC_URI[tzdata-2010h.md5sum] =3D "d384ac091e6d56802f9b3e6b3d3f0f2e"
> -SRC_URI[tzdata-2010h.sha256sum] =3D "a4918d60f63440ba9b6050205881e8a98d7=
18dc0c2b7df5955f43e781eab6e7d"
> +SRC_URI[tzdata-2010i.md5sum] =3D "4d2a90afd5bffe8df97f3def245e178e"
> +SRC_URI[tzdata-2010i.sha256sum] =3D "bee0a26cca54db3413416d968c0a6361d83=
188b112d2512559d0e3602f254dc3"

You weren't the first but can you please do the git mv like in your
tzdata patch instead (and drop the 2010f sums).  Thanks!

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


