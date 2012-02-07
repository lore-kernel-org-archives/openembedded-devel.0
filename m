Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RunCc-0005PE-I9
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:43:30 +0100
Received: by eekd41 with SMTP id d41so2187363eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g8Cj9RjxFczX7CNJTk7BE2i/MIZUERrAAOSNkxckhVM=;
	b=G6uQbrWj23MCarbf/cY7Ey928hVQu3G8CJnG9xPEWP4XAHarfqtZIFmjJvqzGORkn3
	0zNYz9zlOmosi6vWZAQ5diDBPtvRy+sQ44lkfqKol8KkmLwjqFm/1TIGwu0qkeT83Uu8
	eMI9fnNhFDY8aHMfTnJLxXrv4ZEa3jlanHZcw=
Received: by 10.14.8.146 with SMTP id 18mr7215886eer.102.1328628928220;
	Tue, 07 Feb 2012 07:35:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm74572178eeb.4.2012.02.07.07.35.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:35:27 -0800 (PST)
Date: Tue, 7 Feb 2012 16:35:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120207153525.GC3893@jama.jama.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-20-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1328627573-5217-20-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][RFC 19/27] polkit: conditional DEPEND systemd
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
X-List-Received-Date: Tue, 07 Feb 2012 15:43:30 -0000
X-Groupsio-MsgNum: 36970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mvpLiMfbWzRoNl4x"
Content-Disposition: inline

--mvpLiMfbWzRoNl4x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 04:12:45PM +0100, Andreas M=FCller wrote:
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>=20
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta=
-oe/recipes-extended/polkit/polkit_0.104.bbappend
> new file mode 100644
> index 0000000..f521183
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +DEPENDS +=3D "${@base_conditional('INIT_MANAGER', 'systemd', 'systemd', =
'', d)}"

With this please force systemd support enabled/disabled
EXTRA_OECONF +=3D " ${@base_conditional('INIT_MANAGER', 'systemd', '--enabl=
e-systemd', '--disable-systemd', d)}"

Or even better use PACKAGECONFIG and initialize it wrt INIT_MANAGER.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mvpLiMfbWzRoNl4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8xRL0ACgkQN1Ujt2V2gBzdpQCfb6N/iMIqHZQwQYEpA4Z7iRJd
3K4AnjC4GVO+WJjKzDeE5ASg3Sktvr3D
=8ymn
-----END PGP SIGNATURE-----

--mvpLiMfbWzRoNl4x--
