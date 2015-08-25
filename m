Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B30757689C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:31:33 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so9082145wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XY+3q6ri7FtF2Y3qterxJpkjwd3GD4hUF3U5D+SAi+s=;
	b=sL1Moia4RvqPtkNvlBv/ajx5wqZw2/QMP+gjcJ+KlOS7WdJHlo6frnew3an4NJehs1
	jXY/EQ+iygT8xynLaGLOBzkUnvKxz49AnPyULyUUTBpMCltvV5wKVx++R4fQmIWDXqSO
	i5iKWSPJVFqQXYZ16YbqxjIpyKY62vZvpqOuuPOTT0bOpCJRXVndZhBsPTREtHVHA+S7
	8w1PyUmx6v9T47vZmBI2DCqLv3ZhEAMDlIPigxmmGhax+w0od/fGvUWSj7lIXcY5svdx
	P+p9vXz9u/k1l2iip9zJIQbB2Dpu6NytvtVAyNZzHMebQlDHQJdJjUGizXMpJuAcvRsG
	AP9g==
X-Received: by 10.194.117.5 with SMTP id ka5mr46840607wjb.50.1440495093865;
	Tue, 25 Aug 2015 02:31:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p1sm27168303wjq.28.2015.08.25.02.31.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 02:31:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Aug 2015 11:31:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150825093136.GA2459@jama>
References: <1440470514-26608-1-git-send-email-soren.brinkmann@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1440470514-26608-1-git-send-email-soren.brinkmann@xilinx.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH RFC] Add analyze-boot
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
X-List-Received-Date: Tue, 25 Aug 2015 09:31:36 -0000
X-Groupsio-MsgNum: 57004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 07:41:54PM -0700, Soren Brinkmann wrote:
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
> Hi,
>=20
> I saw a demo of the analyze_suspend.py script recently and thought it to =
be a
> nice little utility. Hence, I'd love to have it easily added in my OE flo=
w and
> was looking for an appropriate place. I hope, to have found an OK location
> with meta-oe/recipes-benchmark?

Seems OK to me.

> Apart from the location, the tool does depend a couple of kernel configur=
ation
> option. Could anybody provide some resources/guidance on what the best wa=
y for
> specifying those would be?

Just document them in the recipe.

>=20
> 	Thanks,
> 	S=F6ren
>=20
>  .../analyze-suspend/analyze-suspend_git.bb           | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-sus=
pend_git.bb
>=20
> diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_gi=
t.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> new file mode 100644
> index 000000000000..8ec3076ba186
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Analyze Suspend"
> +HOMEPAGE =3D "https://01.org/suspendresume"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
> +
> +RDEPENDS_${PN} +=3D "python-core python-datetime python-stringold"
> +
> +SRCREV =3D "${AUTOREV}"

NAK, use known-to-work revision.

> +SRC_URI =3D "git://github.com/01org/suspendresume.git;protocol=3Dhttps"
> +S =3D "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d -m 0755 ${D}${bindir}
> +	install -m 0755 analyze_suspend.py ${D}${bindir}
> +
> +	install -d -m 0755 ${D}${docdir}/analyze-suspend
> +	install -m 0755 README ${D}${docdir}/analyze-suspend
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.5.0.3.g52d66ab
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXcNfgACgkQN1Ujt2V2gByGUACePz7rf6tn4bBEDzD6fzl0Pggn
rgkAnjyTMBu9RkfulsA1QQDD3qYv6mxJ
=m1KM
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
