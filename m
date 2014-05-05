Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9542C607BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 21:45:43 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so5680048eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 14:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g5TiWuxWFYjURWPWcLG4EAe6nZ8khy7WKfwHmlCesO4=;
	b=rWyL91vomzZey4GPkwpQgKEmOLetQa6iynYaKoY68dSrN4KAm+8OhikLmvmxpcHcR0
	f7R37g5kwkTixY/vHkh5XUJDu9sLprkYc5s5mObBdvOCACNIjr/Lu/SmGKFdHYz2CfXM
	46Fjxt+/S5fpJvFyyUkZPRmnE3DYJ9bgaiNrf0F4H+jDKIu+O7O4BQpdbFYs8VaeyaCd
	q/avPuGpyqSWTMrrgJaiCZatcc47LmUEOo2pUKm5YtmSEuiRTm4mSLwL6abu7OAaFeRx
	1C0bYTizEkrmjMRsN6Dc26GQ0d0owKH2YgIlNfrbuTTn1f947AAsN0oG71+1sy1TyGq8
	oM9g==
X-Received: by 10.14.122.196 with SMTP id t44mr5766002eeh.61.1399326344629;
	Mon, 05 May 2014 14:45:44 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id a4sm32904875eep.12.2014.05.05.14.45.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 14:45:43 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 5 May 2014 21:45:41 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org,
	Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20140505214541.GB12987@gmail.com>
References: <cover.1397816030.git.Chong.Lu@windriver.com>
	<deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <deccbaa80823665caeaa2763f587303595cc6115.1397816030.git.Chong.Lu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Mon, 05 May 2014 21:45:48 -0000
X-Groupsio-MsgNum: 49700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 06:16:30PM +0800, Chong Lu wrote:
>  FILES_${PN}-data =3D "${datadir}/${PN}"
> +FILES_${PN}-common =3D " \
> +    ${datadir}/${PN}/${VIMDIR}/*.vim \
> +    ${datadir}/${PN}/${VIMDIR}/autoload \
> +    ${datadir}/${PN}/${VIMDIR}/colors \
> +    ${datadir}/${PN}/${VIMDIR}/compiler \
> +    ${datadir}/${PN}/${VIMDIR}/ftplugin \
> +    ${datadir}/${PN}/${VIMDIR}/indent \
> +    ${datadir}/${PN}/${VIMDIR}/keymap \
> +    ${datadir}/${PN}/${VIMDIR}/lang \
> +    ${datadir}/${PN}/${VIMDIR}/macros \
> +    ${datadir}/${PN}/${VIMDIR}/plugin \
> +    ${datadir}/${PN}/${VIMDIR}/print \
> +    ${datadir}/${PN}/${VIMDIR}/spell \
> +    ${datadir}/${PN}/${VIMDIR}/tools \
> +"
> =20
>  # Recommend that runtime data is installed along with vim
>  RRECOMMENDS_${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-data"

Sorry to reply to an old commit but this has broke things for me. Installin=
g vim
after this commit gives:

    vim: unsatisfied recommendation for vim-data

As everything that was in vim-data is now in vim-common. Your commit message
says "Split binary file into vim package and put others in vim-common.", but
this split was already in effect with everything in vim-data. It then got
installed by default as vim-data is in RRECOMMENDS_vim, but could be disabl=
ed by
adding things to BAD_RECOMMENDS.

What is the benefit of moving things to vim-common? I'm probably just
misunderstanding what this change is aiming to solve.

As vim-data is now left empty, can we remove it from PACKAGES and
RRECOMMENDS_vim and instead add vim-common to RRECOMMENDS_vim? Just want to=
 make
sure that won't break anything for you before I send a patch.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTaAaFAAoJEBwoJlo7UPQDq8oH/381Coq697Ph5b7rjKLPaMSg
qrCPB1gR9BZhk8zuPA2y2fPU4QVYEQNN5kJ/8ASe9ti1t86d/Gs3zaxqI93xSCS4
fimJYl0y8HCrtuFq/YTsqHx5W3Wcl67McCb64JlfPYTbst2kWbp7iHqnsz4gXGFD
vPYpBPVXVXXWfOO9CiYaGnTvY3hsiXHa75vCZ0rWsrsKQ8cSiwVc+oV9djAKSVPc
zQbDgD3pTKKUlhgGkG34LU5vhmM5r4XdS7YYYbHkvmFbIWBHwEPieX286u1u7V7W
Vm/D5wUnUN2wrmAVkANvn6YzBMwYb/Jn49muzLJCvYBK3AICS7Q0x73O9ZrHDuc=
=3coo
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
