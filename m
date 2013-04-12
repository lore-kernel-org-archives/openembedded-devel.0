Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQbWM-0005cI-Jh
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:48:00 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so1397266pad.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ckgA3uGkfa5t8VE6CG/Ag0d5xvBFV6ERghCmJclFnFU=;
	b=yYM/MJjXpBBUVsfB2JXf7upFBKq6ZsWWF7SOIrUFLOgoyOwoKw4A9QXD+bIi8w0iD1
	4QQP3J9rBtVQsOz28K2psdmi2K3z+9hnV2Y0xk8AORKvShrAwZFbkz8rrxBzGdXEsoZw
	VqDrlsxu5oS5oQPMjsETjRSPT+sSjdjMLwvY1as/w7uij4/hBDPl8Wgjx1cGDLs9eIZR
	+nImsy4Lih0YKgRhu1o4h+W+eF6gFPwf8lkTgcWw+NIa62fYAOWcsAbTV8Ht2dhdKPDh
	QEBA7VqxvsxBoM3VAw/3ibfmpBXu5FgtUqzU6cdQNgFtHss6JeGy3/CkvSmfA0NGAcbM
	1XlA==
X-Received: by 10.68.117.135 with SMTP id ke7mr14286236pbb.0.1365762629470;
	Fri, 12 Apr 2013 03:30:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id lf12sm9004146pab.13.2013.04.12.03.30.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:30:28 -0700 (PDT)
Date: Fri, 12 Apr 2013 12:30:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130412103022.GK2477@jama>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
	<1365761087-1229-5-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365761087-1229-5-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3 5/5] nodejs 8.8.18: unset RDEPENDS for native builds
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
X-List-Received-Date: Fri, 12 Apr 2013 10:48:04 -0000
X-Groupsio-MsgNum: 44091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pN9MePJoZbRKbUk1"
Content-Disposition: inline

--pN9MePJoZbRKbUk1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 12:04:47PM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.8.18.bb
> index 3ab2ed6..2db9e68 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> @@ -36,6 +36,7 @@ do_install () {
>  }
> =20
>  RDEPENDS_${PN} =3D "curl python-shell python-datetime python-subprocess =
python-crypt python-textutils python-netclient "
> +RDEPENDS_${PN}_class-native =3D ""

Sorry if I caused problems by removing it before, why is this needed?=20
I haven't seen any issues without it.

Also we have patch to upgrade nodejs to 0.10.0, do you know if other
components using nodejs are compatible with it? We'll also need to add
node-gyp if that's useful for someone else too.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pN9MePJoZbRKbUk1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlFn4j4ACgkQN1Ujt2V2gBxiawCfQ9OuybFR2HRBs48VPVV2oQCb
jWkAl0NothZa835ZrFcVoVRs1lianC4=
=gxbF
-----END PGP SIGNATURE-----

--pN9MePJoZbRKbUk1--
