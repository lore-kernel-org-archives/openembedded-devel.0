Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Trpbo-0005Do-UE
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 13:45:51 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so8285498dad.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xrzy3Pv4Xyb+3q2j5Fk6Rern47cjCeBNCFakh/LJYZw=;
	b=YyCdp0h23Z9bNhdEtghE8agg6SpU9rBRRQDzI+hJSKdDoaTkjKh/9DaCZbnIoQK2+m
	9a267fC3FcucX9gpfGVFHZ34sFfIL0x78dk0bAu5OLAQVOP1BnAfiT5vEbnt+W7sOnUw
	6MbWul4tA+FhOHbwJYbGxfkOax3Z0ZRjK4hsB93zntAtt7AxbMGyxyS/udefe/yJeE6y
	nul+7ksphFqJSoI8gV9n20aCn51KDSlVtX+kCoXMBs8otM3MojYLF56K1++O3W1k96zo
	7R7nRJ3ftbgsgBg3gs0AGNUvKUrvYLp7f/AljtxGFHZdcdeYaNfQsDPLxbTcQBYVwUJb
	HuLw==
X-Received: by 10.68.143.100 with SMTP id sd4mr169039775pbb.107.1357475440496; 
	Sun, 06 Jan 2013 04:30:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id c2sm36771276pay.34.2013.01.06.04.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:30:39 -0800 (PST)
Date: Sun, 6 Jan 2013 13:30:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106123039.GJ3272@jama>
References: <1357130330-2531-1-git-send-email-riku.voipio@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1357130330-2531-1-git-send-email-riku.voipio@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] krb5: reconfigure for aarch64
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
X-List-Received-Date: Sun, 06 Jan 2013 12:45:58 -0000
X-Groupsio-MsgNum: 42537
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline

--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2013 at 02:38:50PM +0200, Riku Voipio wrote:
> krb5 needs reconfigure, since the current config.sub included doesn't
> include aarch64.
> ---
>  meta-oe/recipes-connectivity/krb5/krb5_1.11.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Merged, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpbm8ACgkQN1Ujt2V2gBwrXgCgj250sWUaDyRQ9Fhf7fc34f+2
gKYAoLE7kOX8f229Z8ufXzNfxQSWzeOm
=SPGD
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
