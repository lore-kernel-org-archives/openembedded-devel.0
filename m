Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsDZe-0005uf-4T
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:12:06 +0100
Received: by fxm8 with SMTP id 8so3504377fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 04:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qpqaNj0NVJBstxxlBPabZ8ZX+48S44fizGWxf92rMe8=;
	b=l5x6EwvupmJR8VNjr5L/T5gFr7gpGZ0RuGS7dC9noe+U8QsWEQfaKObtGGFmlvgZ1m
	sriF8O+HGEAPHXBjy8lfAIMwEM4Od6e+sI7LvQZ+1aUwtkGnTBVrdoVLQmnBV+U6B7xA
	p8jEsPFb1U/Y3vVB+gi8sm40GEg+qUgCBwihE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nZh/SJUshbNFzShyl6VpUh/Iohef/cMKDe/XAkNPktkB4R5tVBGiMGufHkfPuN5pqf
	BPqAJWEeVZGtOJX2bVQhJf+L+Vl4jNgvUh8l+58l2bOENpOHPgXI4I58VFbE4OPmVhBl
	Q38kjb9C5jRkBG24cdeKQeeyHMA3OnGsa+gVI=
Received: by 10.223.96.66 with SMTP id g2mr273073fan.61.1298463041400;
	Wed, 23 Feb 2011 04:10:41 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f24sm365045fak.0.2011.02.23.04.10.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 04:10:40 -0800 (PST)
Date: Wed, 23 Feb 2011 13:10:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110223121038.GC3478@jama.jama.net>
References: <1298461861-12737-1-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1298461861-12737-1-git-send-email-morphis@gravedo.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] e-module: introduce INC_PR and use it in all depending recipes
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
X-List-Received-Date: Wed, 23 Feb 2011 12:12:06 -0000
X-Groupsio-MsgNum: 29599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 12:51:01PM +0100, Simon Busch wrote:
> We set INC_PR initially to r5 as some of the dependencies already defined=
 a PR which max
> was r4.

>=20
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  recipes/e17/cpu_svn.bb          |    1 +
>  recipes/e17/diskio_svn.bb       |    1 +
>  recipes/e17/e-module.inc        |    1 +
>  recipes/e17/efm-path_svn.bb     |    1 +
>  recipes/e17/efm-pathbar_svn.bb  |    3 ++-
>  recipes/e17/flame_svn.bb        |    1 +
>  recipes/e17/forecasts_svn.bb    |    1 +
>  recipes/e17/news_svn.bb         |    1 +
>  recipes/e17/notification_svn.bb |    1 +
>  recipes/e17/places_svn.bb       |    3 +--
>  recipes/e17/rain_svn.bb         |    1 +
>  recipes/e17/screenshot_svn.bb   |    1 +
>  recipes/e17/uptime_svn.bb       |    1 +
>  13 files changed, 14 insertions(+), 3 deletions(-)
>=20

Acked-by: Martin.Jansa <Martin.Jansa@gmail.com>

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1k+T4ACgkQN1Ujt2V2gBxZEACgh3db08CgyNlX9z5WtZmZtweS
Kk8An2I3pPVpjs5KzgOkw2KSX3sK3Qfi
=6S3H
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
