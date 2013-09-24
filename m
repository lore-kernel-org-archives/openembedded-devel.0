Return-Path: <joe@deserted.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D60160EDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 18:11:05 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id t60so4927378wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 11:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=+xPlmYyXeqBJ+HccVWOcfZPrV2kANJMioMR7JmwFn8o=;
	b=OPRIpQIAngblFeUeTScu5r0/Ypb6PFhmET35WrUrwV7CPapN01wE0ZW3djnT3WBMgu
	6bjINlVWDVtITVgLAjXqYDcsSoW6ARuR0sI8fuJ4cSG4mXnG9NFKnZbtfLRAKirCKz6V
	8evCK30t3l4hqSuFxkZrplcSDu4fCtVRvisBoF6SngwX5V5Q7b0ok3bCSPhuc3ifGu1O
	SuhOW/yWXf9kvGNLuEpNnVZY476wAenjuPomsdl7JjCfSm9q9oTxVvQ8fu0dqC58OyuN
	DQANtkMabaRhtuaY8qcvmVD79PpigEjLn12OjUe57n1ZAGbg6mjmh5XMNZxJW0xy1tpH
	8cxQ==
X-Gm-Message-State: ALoCoQnHmTLMqjvYuJ1yXSgIOzIEnX9vwV8//98cNmSk2z8lEpS5qthCGhEBAySzhyHW1iG6Yf8t
X-Received: by 10.194.5.35 with SMTP id p3mr2983198wjp.47.1380046266623;
	Tue, 24 Sep 2013 11:11:06 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id ey2sm9939127wib.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 11:11:05 -0700 (PDT)
Date: Tue, 24 Sep 2013 14:11:02 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130924181100.GB23080@deserted.net>
References: <1380027255-15489-1-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1380027255-15489-1-git-send-email-paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH] lowpan-tools: add git version
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
X-List-Received-Date: Tue, 24 Sep 2013 18:11:05 -0000
X-Groupsio-MsgNum: 46344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline

--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-networking][PATCH] lowpan-tools: add git version] On 13.09.24 (=
Tue 13:54) Paul Eggleton wrote:

> The 0.3 release was a year ago and git HEAD contains fixes to make it
> work with contiki, so build from git instead of backporting all of the
> patches.
>=20
> Based on a patch by Koen Kooi <koen@dominion.thruhere.net>
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../lowpan-tools/lowpan-tools_git.bb               | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-t=
ools_git.bb
>=20
> diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> new file mode 100644
> index 0000000..cf78b45
> --- /dev/null
> +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Utilities for managing the Linux LoWPAN stack"
> +DESCRIPTION =3D "This is a set of utils to manage the Linux LoWPAN stack=
=2E \
> +The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE=
 802.15.4-2006) compatibility."
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "libnl python"
> +
> +PV =3D "0.3+git${SRCPV}"
> +SRC_URI =3D "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee=
/linux-zigbee"
> +SRCREV =3D "a1d9615adde6d1a568813c24a128273ed755af04"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_install_append() {
> +	rmdir ${D}${localstatedir}/run
> +}
> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/lowpan-tools/.debug/"
> +
> +PACKAGES =3D+ "${PN}-python"
> +FILES_${PN}-python =3D "${libdir}/python*"
--=20
-Joe MacDonald.
:wq

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJB1bQACgkQwFvcllog0XxfdwCgsqq6dDPaHEkGo5BUAChXd9lu
4cQAn042ktAGMWagOUm6I11fBdVtM94t
=ndbt
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
