Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbWD9-00042c-Sd
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 13:48:55 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3117112eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=i1lZQoBEts9WpvvV4Hwo5bX4C120DTGZ7PE86pcZmAk=;
	b=jgP/uXTHeUbCZto9+31K3d4tfIvC6mqiU4f8NHjlLowNLqFZ236PQC8Kwk/cvQY2Z7
	SV+C6XzcEiLlXAmZlulT65jqAlsZtbl3B/28hSQnTXDwXQT9ZVKPcIimPCUEHvslABm4
	IKFCokduYmHG3xiaQS63rERZ8KrL5J7YCpl1B3aVk7SCETN/yddV4I12AXAGZQ2uzcgN
	goxtICGuFpjqrqdJw/3HqO4V4rBrgFkgo8ZGhKi/xZT756SsQKel2QF/4JqXBiW3Cfxp
	v8vEflE8kITPFWyCt8WU0TbveEu9AQaQUn+zLV4z+I3A0DPyqgdthQXehAKRBCyW76ym
	Gbpw==
Received: by 10.14.207.68 with SMTP id m44mr1036279eeo.40.1353587689830;
	Thu, 22 Nov 2012 04:34:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm6730955eep.5.2012.11.22.04.34.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 04:34:49 -0800 (PST)
Date: Thu, 22 Nov 2012 13:34:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122123447.GB12637@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: evolution-data-server and php-native broken by libxml2 upgrade in oe-core
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
X-List-Received-Date: Thu, 22 Nov 2012 12:48:56 -0000
X-Groupsio-MsgNum: 41634
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VE1+SxTILTm8udN6"
Content-Disposition: inline

--VE1+SxTILTm8udN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just FYI:

meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
virtual:native:meta-openembedded/meta-oe/recipes-devtools/php/php_5.3.6.bb

are broken after lixml2 upgrade from 2.8.0 to 2.9.0 (oe-core rev
a65ea43e26866ddc60051c52b2eb226507fae346)

They are pretty low priority for me right now, so I'm just sending this
e-mail instead of patches :).=20

Hrw is already working on php.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VE1+SxTILTm8udN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuG+cACgkQN1Ujt2V2gByQxgCeMKrOWbbWLxenq+UG3ht9SQ2v
EisAnRYoGGxgYUOcPglZu2BdNMJqUUVN
=/yPO
-----END PGP SIGNATURE-----

--VE1+SxTILTm8udN6--
