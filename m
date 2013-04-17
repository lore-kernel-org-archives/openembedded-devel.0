Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USPln-0001KK-SL
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 12:39:32 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so856708pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7Jcc1JVUYFKsEbBJTOtKUO/jThVdwdAnmMcDBgNT8+g=;
	b=Glvwd36tytw370sn5xxGeNO5FQk0k1Z50SNsfOIQPAldLV9lABskGQCgMpeu9jRFGV
	BMKBW+48rbLGWLdtvJ0S4RIKo27u4FgMLvLHIFxDcly9c4Vy2+E7JFWU1pbqS4T/l+cp
	XyVb81scrTsx3vJDnBpVqhmi9fQ0iuAUBQfRxV2UA9Xr/bwbovMT7NOH5A/hYa24Zaq+
	giSN39inS+Xde6sagpu0W7RW9Gf9zm74+E+qV902wsJOS7OyyDuQrcTlbaMMfftSpddi
	FlK8KtfoXB2mi97nPkEhQoPDWyFs/r4sFeNwuSF0OsW44cgPcWl58jfj4a4P43peH2XH
	cAvw==
X-Received: by 10.68.181.131 with SMTP id dw3mr8327209pbc.188.1366194107747;
	Wed, 17 Apr 2013 03:21:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fc8sm6586728pad.21.2013.04.17.03.21.43
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 03:21:46 -0700 (PDT)
Date: Wed, 17 Apr 2013 12:21:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417102144.GE26007@jama>
References: <1366193237-12197-1-git-send-email-ml@communistcode.co.uk>
	<1366193237-12197-2-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366193237-12197-2-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCH 2/2] net-snmp: Update to 5.7.2
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
X-List-Received-Date: Wed, 17 Apr 2013 10:39:47 -0000
X-Groupsio-MsgNum: 44275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline

--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 11:07:17AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> - Removed some un-needed patches
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  .../net-snmp/files/libnl-3-support.patch           |    69 -
>  .../net-snmp/files/sync-with-5.7-branch.patch      | 19998 -------------=
------
>  .../recipes-extended/net-snmp/net-snmp_5.7.2.bb    |    31 +
>  3 files changed, 31 insertions(+), 20067 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/net-snmp/files/libnl-3-suppo=
rt.patch
>  delete mode 100644 meta-oe/recipes-extended/net-snmp/files/sync-with-5.7=
-branch.patch
>  create mode 100644 meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb

Is there reason to keep net-snmp_5.7.1.bb?

If no, then please remove it in the same commit and send with -M.

Cheers,

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFud7gACgkQN1Ujt2V2gBxpSACcC8NFO1Nx/x2VIUc+75DuN7Wd
+XUAn0WiYy+GHN1+ptGZoDPHnwgUDJd5
=r3mp
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
