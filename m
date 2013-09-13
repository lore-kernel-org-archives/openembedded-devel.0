Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4444560EE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:55:15 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id e14so3603604iej.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Jrg0kbgixc20alX+zOZNSc3nQJ0m07IWO+2l7odKahw=;
	b=TaoKpEUA8Pg0N3FCj9y622QYV79+dqzkGtLVGNxnZ7p7o7H6VIKzMvGvJ5SLo7L/3N
	rcIRSCIarH3/7YXpcRCXI0nhhYjCImNUC66J5VtVglBO5JZ8mw4h4EYmVcz7yxk8gQp7
	FNlSR+bjkYTRDAPPUam9Qji4vr/Ng8yI+44n9VFB7f8UEviGHO9V97CyvbZtemNdz7Pp
	VcLd9GT2/nY5QxZTYDnfRw3S5SCgwR1QaQzVsV1VBq7pWIWp1ZzgtsAeWNtujjh/Cqty
	bxrH3nGTfSEtxz9ZBui/hdJ/QlSdhhzRkPgUK19R16odCBeteCWv9VnZNnPQYphygYUB
	G5Vw==
X-Gm-Message-State: ALoCoQkVIw8m7WqcxWQtISSdSkPE3XGCCI03HwbPlCOacunDGFX7F7ajKKe3OifbqIEX6/DOaVDD
X-Received: by 10.50.9.37 with SMTP id w5mr1964662iga.29.1379102116637;
	Fri, 13 Sep 2013 12:55:16 -0700 (PDT)
Received: from deserted.net (198-84-238-35.cpe.teksavvy.com. [198.84.238.35])
	by mx.google.com with ESMTPSA id k6sm1351789igx.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 12:55:16 -0700 (PDT)
Date: Fri, 13 Sep 2013 12:55:09 -0700
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130913195507.GA10892@deserted.net>
References: <1378651932-25060-1-git-send-email-fathi.boudra@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1378651932-25060-1-git-send-email-fathi.boudra@linaro.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH V3] fping: add recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 19:55:16 -0000
X-Groupsio-MsgNum: 46178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH V3] fping: add recipe] On 13.09.08 (Sun 17:52=
) Fathi Boudra wrote:

> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta-networking/recipes-support/fping/fping_3.5.bb | 25 ++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-networking/recipes-support/fping/fping_3.5.bb
>=20
> diff --git a/meta-networking/recipes-support/fping/fping_3.5.bb b/meta-ne=
tworking/recipes-support/fping/fping_3.5.bb
> new file mode 100644
> index 0000000..fe88934
> --- /dev/null
> +++ b/meta-networking/recipes-support/fping/fping_3.5.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "sends ICMP ECHO_REQUEST packets to network hosts"
> +DESCRIPTION =3D "fping is a ping like program which uses the Internet Co=
ntrol \
> +Message Protocol (ICMP) echo request to determine if a target host is \
> +responding. fping differs from ping in that you can specify any number o=
f \
> +targets on the command line, or specify a file containing the lists of \
> +targets to ping.  Instead of sending to one target until it times out or=
 \
> +replies, fping will send out a ping packet and move on to the next targe=
t \
> +in a round-robin fashion."
> +HOMEPAGE =3D "http://www.fping.org/"
> +SECTION =3D "console/tools"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D09d77789fe32be35acde9637a5ee3=
9b1"
> +
> +SRC_URI =3D "http://www.fping.org/dist/fping-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "2e17cb655aa4eb59b5a4a38a89e746ed"
> +SRC_URI[sha256sum] =3D "09b8960e235341bae6000085d38106357eae656a79e0119b=
d27e816c9003656a"
> +
> +S =3D "${WORKDIR}/fping-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-ipv4"
> +
> +PACKAGECONFIG ?=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', =
'', d)}"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
--=20
-Joe MacDonald.
:wq

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIzbZsACgkQwFvcllog0XxbfQCdG4JBa/6uyPH5KlMkSIfOGSuk
CaUAn1awbMbf76zAiQiHd3qtydVdeHvw
=topM
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
