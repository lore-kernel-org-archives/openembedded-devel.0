Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKx0B-0004kJ-3R
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:22:15 +0200
Received: by fxm19 with SMTP id 19so2166786fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ufk0gj64fCKpdtiQm5Evapa9AQtNIY1ugWBvMSM1ryY=;
	b=ue6DsHW7wSrztRqtlgiEMHJXoOPUvR+WAtJJOaEL2NKu3lL6MBtulkWUdDH0Om79ga
	lK2xy50ONyCkz0nWAsclJQAyP5d5AcguOgm/Gp5prboCRM1G0sYw+otGGZj1FpMMxZGV
	uG/gv5bT3o9RtA50c9xe3k9LfG+mUKpq3Sg0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=AjFZMj6Fk6h6ZNJCipLlxyu8TmWRulJRgi5WRp1WmSpSCKVYRy5CsnI4n3NyKTB0b9
	SlEG+yNmX4OytDN8JW5lenK5zjTSMmyXehX6oQDc7wF4TDWVBOxv0mabIwH+kfFq7iMi
	fmreTAabPEsMvQn8RZ/3RUqqIVofjerINbLuI=
Received: by 10.223.25.152 with SMTP id z24mr187613fab.133.1305310764631;
	Fri, 13 May 2011 11:19:24 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t15sm926349fau.0.2011.05.13.11.19.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:19:23 -0700 (PDT)
Date: Fri, 13 May 2011 20:19:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110513181914.GG3162@jama.jama.net>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-2-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-2-git-send-email-GNUtoo@no-log.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 02/12] xserver-common-1.34: sync with oe-core
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
X-List-Received-Date: Fri, 13 May 2011 18:22:15 -0000
X-Groupsio-MsgNum: 32008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline

--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 02:43:00PM +0200, Denis 'GNUtoo' Carikli wrote:
> Without this patch(that require xserver-common-1.34 to be preferred)
>   Some issues are present, for instance:
>  * xorg starting but not x-window-window manager, unless there is an exte=
rnal
>    window manager script like /etc/X11/Xsession.d/90matchbox-session
>  * xinput-calibrator's calibration not taken into account.
>=20
> This patch was taken from
>   meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
>   in git://git.openembedded.net/meta-openembedded at commit
>   e55afd32d8718534403cb871fc776b7f078250dc
>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Looks good to me

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  recipes/xserver-common/files/gplv2-license.patch |  353 ++++++++++++++++=
++++++
>  recipes/xserver-common/xserver-common_1.34.bb    |   45 ++--
>  2 files changed, 375 insertions(+), 23 deletions(-)
>  create mode 100644 recipes/xserver-common/files/gplv2-license.patch

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3NdiIACgkQN1Ujt2V2gBwEpACeL81esrrV/N2gXBG0HIlnzqQG
se4An1gknmyoZ4hfbZ7Bj1hR5hiXTkad
=4/wO
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--
