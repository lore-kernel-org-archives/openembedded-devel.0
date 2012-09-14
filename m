Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TCeEs-0005oU-Q0
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 00:19:54 +0200
Received: by daks35 with SMTP id s35so2540394dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=rQdIpDCxmqOU06hhAmjRwtQD4zQMxRloeS5He1hper8=;
	b=qZKhDBoIQgmM7PSxs2w0q7HWFSSPMpuu4FXCk6rRDK134TdYboiFE850sTVHU5jwCY
	jQe6XWIh7j7s6M7R4Mu9lW/5C0LglynX7jUqNTVUVvno7enBJXtkm4hCKp2yYKpT3aGF
	QdVwV3OAY60uHkswNu/fe7uxX1JqR1GLIcu+Ve0sR5YtT38v/b2t847CuF9p6AYOaBYV
	FBdK8cYBMYcPhBSBaerWcIBMcN8b5MQh4VH0uBukCLsT5mJ/xnP+52WCxAn0vCeThuAn
	DU5L2OYh1MvszioJ6u/F4BFiqDpxRM9roCaEJ39WVY0FbxHGZpWQ7/6bT2tUMKpLbCNu
	GSWQ==
Received: by 10.68.134.97 with SMTP id pj1mr6880171pbb.55.1347660438953;
	Fri, 14 Sep 2012 15:07:18 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:e81d:b69a:2f88:8c48])
	by mx.google.com with ESMTPS id pq7sm1663680pbb.25.2012.09.14.15.07.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 15:07:17 -0700 (PDT)
Date: Fri, 14 Sep 2012 15:07:24 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120914220724.GR22028@bill-the-cat>
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Fri, 14 Sep 2012 22:19:55 -0000
X-Groupsio-MsgNum: 40671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline

--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 02:42:54PM +0200, Steffen Sledz wrote:

> This fixes an error in do_configure step for target and native build.
>=20
> | checking for BASE_DEPENDENCIES... configure: error: Package requirement=
s (glib-2.0 >=3D 2.12.0    atk >=3D 1.9.0    pango >=3D 1.12.0    cairo >=
=3D 1.2.0) were not met:
> |
> | No package 'atk' found
> | No package 'pango' found
> | No package 'cairo' found
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>

Applied, thanks!

--=20
Tom

--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlBTqpwACgkQdZngf2G4WwPpbQCfe4/x9rJzlLU4TwVs3fdY1fD+
HJIAnR0dD9qsyV0d2ygE3eYkOVg8lsUR
=fuoL
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
