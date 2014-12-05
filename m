Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5594272380
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Dec 2014 12:48:07 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so786043wgh.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6X4sm/8SVilXMVqmn9wHGB8qsSMBsQpi2GWDIyQnfZE=;
	b=BXsltezouPJJmp7/uD/bTmC4ngLpBE0MieyiH1iHdEuwYHAJTajitGEpPVS7EKgn0Z
	1RNfO2/4WAB8UVwVewVrnmi4iAWS7BsYG7wfTKPk/6HZraiEXCCku4JuFGX1TchH7dX8
	HBfLsaCrxryzhtajrt6UaCSzmRQP02Gk03iW1Fs9Axf7ZkuteydaD6abUUI+We4MZSTo
	2djagJspxw3f9ADEErO3rvXOQMppZaj+fbI+Q5vh353PT7V8nCElGxsc/YzkpeRwTwsc
	I3lHhRPVw9t5Q7OvV9RAgy+Hs7ulb2ZZI34qvIIB8RNr5w2On9F2V2tvlhdFCimnQ0/s
	iy0Q==
X-Received: by 10.180.8.202 with SMTP id t10mr3982627wia.15.1417783686898;
	Fri, 05 Dec 2014 04:48:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bs2sm27616423wjc.43.2014.12.05.04.48.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 04:48:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Dec 2014 13:48:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141205124810.GA2446@jama>
References: <1417779660-18387-1-git-send-email-awais_belal@mentor.com>
	<1417779660-18387-2-git-send-email-awais_belal@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1417779660-18387-2-git-send-email-awais_belal@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 2/2] mplayer2: cleanup empty directories
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
X-List-Received-Date: Fri, 05 Dec 2014 12:48:08 -0000
X-Groupsio-MsgNum: 53205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 04:41:00PM +0500, Awais Belal wrote:
> The mplayer "make install" phase leaves an empty
> /usr/lib directory seemingly regardless of the setting
> of libdir.  Remove it to avoid a packaging warning.

Any idea why I'm not using both these issues in world builds?

Are you using the recipe exactly as is with PNBLACKLIST removed in your
distro and PREFERRED_VERSION for newer libav?

> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb
> index 4656057..7e6ff0d 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -142,4 +142,5 @@ do_install() {
>      install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
>      install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
>      install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
> +    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
>  }
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSBqYoACgkQN1Ujt2V2gBz4MQCcCGPU0Lhf+wWQp6qnf5wQy22n
r7EAoLME7UA4z0EqAl8PuNdLKrlYT29k
=tOrc
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
