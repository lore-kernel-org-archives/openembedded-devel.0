Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 799FD6EE4D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:53:44 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hm4so3243009wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qMmKv3+jXNXKI2o8Eq4AEgDMsqiZW+tBYe4pltmFEPE=;
	b=DD5DcreftG80pUcX9uU+FP5GT3fZDZ/CFTuID4OTS54c5sveDiCZsFZ1t1W6zt29ah
	iNIFnTVY/kDZihuawDA8IPeWXiDIjFMefYUaw5ep3Dm/s9uhtYMT1UD9tR/wa+R5A+y7
	miiXRn0g2YOyYNQ4ulgFZRmJQOgbN0qJE7TK8AzavEv/7UaHiIr9Ues1fqWuFO8CuSni
	z0gwhCEUIcB0HgCwJBn4HI6ZqKLtfG8AZjJjXzQ4/dpKTFzQMgIkiR3ZK8fLApehvEuv
	iwL49mx69sQszykYe9XHyGrGlFhsHo2sJsQmFQ/U9dzkPRKPT4TBHXYiqjpaImWiVK50
	yWUA==
X-Received: by 10.194.63.236 with SMTP id j12mr14393324wjs.5.1396270425304;
	Mon, 31 Mar 2014 05:53:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm32884193eep.17.2014.03.31.05.53.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 05:53:43 -0700 (PDT)
Date: Mon, 31 Mar 2014 14:53:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20140331125343.GF2425@jama>
References: <1396269770-12357-1-git-send-email-bevenson@melinkcorp.com>
MIME-Version: 1.0
In-Reply-To: <1396269770-12357-1-git-send-email-bevenson@melinkcorp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][dylan][PATCH] php: update SRC_URI for new download location
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
X-List-Received-Date: Mon, 31 Mar 2014 12:53:47 -0000
X-Groupsio-MsgNum: 48921
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sClP8c1IaQxyux9v"
Content-Disposition: inline

--sClP8c1IaQxyux9v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 08:42:50AM -0400, Bryan Evenson wrote:
> From: chase maupin <chase.maupin@ti.com>
>=20
> * The old downloads location of http://www.php.net/distributions
>   now points to a listing of all distributions and the mirrors or
>   download locations where the sources can be downloaded.
> * The new download location is http://museum.php.net/..... where
>   the rest of the URL is based on the major version on PHP being
>   downloaded.  This is a change from the previous download server
>   which had a flattened directory structure so that all versions
>   were available in a single location.
> * To account for this change in the directory structure a variable
>   called PHP_MAJVER is used based off of the PV to point the
>   SRC_URI to the proper subdirectory.
> * This issue wsa first noted by Joshua Vanderpool at
>   Joshua.Vanderpool@raymondcorp.com and there was discussion at
>   http://lists.openembedded.org/pipermail/openembedded-devel/2014-January=
/093757.html
> * This patch has been commited to that master branch
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

+ Eric B=E9nard

--sClP8c1IaQxyux9v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM5ZVcACgkQN1Ujt2V2gBxEjwCdFZNHiHbjbjUTq9vN2PLdgbaW
Fv0AoIe2Bee4Hf2osJsLRkL/MO79iQxT
=dLRC
-----END PGP SIGNATURE-----

--sClP8c1IaQxyux9v--
