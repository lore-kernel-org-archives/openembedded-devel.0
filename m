Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TAlaU-0001Kn-0B
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 19:46:26 +0200
Received: by wgbdr1 with SMTP id dr1so898170wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 10:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Te0xlcRXF8X75ri8tH21nzvDWK99f1Pxgxa6IkokkHE=;
	b=A1+A2ETuCLr/LorrYLy38f27Wjkxezf2O4U9z3+k2rsYaOUV8bHh3gwQGht7Xtbq2W
	lW639cZl39yKf6m+MA+JmQnIar1+b8OebfCpntdNq/zO7Fq+6EZje8/NuhxiEnCbG/Tp
	LWoZU3gPpO3i79e7M82IQXUoAA9H2BZNSuUHRvx5HsuHyz7ojn8DQrfkmpjpS/wd5zGw
	ge6O8/q6ajkmnbZNEmHwoqxuF9ptgjZnrZGaArxOt8rX46ui5Q+RFK3VpgY2vF/tyy59
	p79pJMgROZfju9wtJ8dBHSm5WIY+uW2EbHeogfFsNI4nhE35wLHdzclvVVsrx3lHehxA
	BDPA==
Received: by 10.217.1.7 with SMTP id m7mr6638599wes.158.1347212037532;
	Sun, 09 Sep 2012 10:33:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm12509239wib.10.2012.09.09.10.33.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Sep 2012 10:33:56 -0700 (PDT)
Date: Sun, 9 Sep 2012 19:33:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120909173353.GA3647@jama.jama.net>
References: <1347210779-20115-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1347210779-20115-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-smartphone][PATCH] task-base.bbappend: Rename to packagegroup-base.bbappend to match OE-Core
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
X-List-Received-Date: Sun, 09 Sep 2012 17:46:26 -0000
X-Groupsio-MsgNum: 40585
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 09, 2012 at 10:12:59AM -0700, Khem Raj wrote:
> Fixes
> WARNING: No recipes available for:
>   meta-smartphone/meta-openmoko/recipes-core/tasks/task-base.bbappend

Thanks for reminder, I've merged shr branch (where it was fixed for a
while) to master.

I was waiting for
http://patchwork.openembedded.org/patch/35989/
in meta-oe (because I've removed PRINC for foxtrotgps in meta-shr with
it), but nobody cares about upgrade path of foxtrotgps with meta-shr I
guess (except me, but I have shr branches for that).

Cheers,

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../packagegroup-base.bbappend}                    |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openmoko/recipes-core/{tasks/task-base.bbappend =3D> package=
groups/packagegroup-base.bbappend} (100%)
>=20
> diff --git a/meta-openmoko/recipes-core/tasks/task-base.bbappend b/meta-o=
penmoko/recipes-core/packagegroups/packagegroup-base.bbappend
> similarity index 100%
> rename from meta-openmoko/recipes-core/tasks/task-base.bbappend
> rename to meta-openmoko/recipes-core/packagegroups/packagegroup-base.bbap=
pend
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBM0wEACgkQN1Ujt2V2gBx3SQCgkPrcwzBFhwm2THKLy0K+GSUf
cQoAmgP9GHVbJzw+4Ol/H4lWMGDA5Tq+
=5S4R
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
