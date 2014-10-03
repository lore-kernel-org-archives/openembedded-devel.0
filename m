Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 81D1F7029A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 02:20:35 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so374418wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2014 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y/B7d64vHcUzAu+xNUD0rF0t7tpUnIvn5NyhyINAvuw=;
	b=wMy1LAAGDrlrW6+MoUpRHKe7W7A1kSiBb5FYLkSHvo2e94xG62GV/rALGFDdoeHo5l
	XDcYAziz3WY6/jw87tFcxlh6VAWXIBmEz3XLENHR3wJzbmB+nUjpzlOTIy6Sn1ZisO6r
	+xQxBhyH95cWyJu1/rYQqu0OEgbBNyzNpRvY+/SLjJDE+jUWI4pNSNUg27RPXK3SaLUg
	6hiNHF91I220iiAhypGKFTgvWbKJSPPgV9N56vDet/EqOJhcn0QCaLpl86tnDo+WHwiZ
	qRbmr7xhqwlerPo6tqz79nipTHTNXBU3+c5iMPz8DfauXkxqhQT5st8MZEzVcGVPbPI5
	SHug==
X-Received: by 10.194.120.37 with SMTP id kz5mr3105029wjb.107.1412302836447;
	Thu, 02 Oct 2014 19:20:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id d6sm566664wiz.0.2014.10.02.19.20.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Oct 2014 19:20:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Oct 2014 04:21:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141003022132.GK25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-16-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1412151555-19865-16-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe 15/15] bash-completion: resolve sysroot conflicts for util-linux and networkmanager
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
X-List-Received-Date: Fri, 03 Oct 2014 02:20:36 -0000
X-Groupsio-MsgNum: 52340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d7fO2LonciW1X6nX"
Content-Disposition: inline

--d7fO2LonciW1X6nX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2014 at 10:19:15AM +0200, Andreas M=FCller wrote:
> * continue the priority for packages shipping bash-completion
> * oe-core's latest changes turn sysroot conflicts into critical error
>=20
> ERROR: The recipe bash-completion is trying to install files into a share=
d area when those files already exist. Those files and their manifest locat=
ion are:
>    /home/a.mueller/tmp/oe-core-glibc/sysroots/overo/usr/share/bash-comple=
tion/completions/nmcli
>    Matched in manifest-overo-networkmanager.populate_sysroot
>    /home/a.mueller/tmp/oe-core-glibc/sysroots/overo/usr/share/bash-comple=
tion/completions/su
>    Matched in manifest-overo-util-linux.populate_sysroot

Just FYI:

IMHO It's not worth adding the bash-completion as "fake" DEPENDS in
util-linux and networkmanager, but if your build happens to build
networkmanager (or util-linux) before bash-completion, then you'll still
hit this error (like I just did in world build).
=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.=
bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
> index 9a0ff35..fbe4278 100644
> --- a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
> +++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
> @@ -23,9 +23,12 @@ do_install_append() {
> =20
>  	# Delete files already provided by util-linux
>  	local i
> -	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake; do
> +	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su;=
 do
>  		rm ${D}${datadir}/${BPN}/completions/$i
>  	done
> +
> +	# Delete files for networkmanager
> +	rm ${D}${datadir}/${BPN}/completions/nmcli
>  }
> =20
>  RDEPENDS_${PN} =3D "bash"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d7fO2LonciW1X6nX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQuCCwACgkQN1Ujt2V2gBzEfQCfV0v0sqpDu8ImSIO+QBWDjjkV
0gIAnRd1AikHo69cDMJ3rGQfp9nhK8Mu
=CqBZ
-----END PGP SIGNATURE-----

--d7fO2LonciW1X6nX--
