Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 011276BEDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:58:23 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so3188631eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p8hLvVFYJ/mTXikpfgoqZqGUb3S0ErQG/+pLfW4dxL8=;
	b=BsdbcXTauNrD3Z+wANzyatFNrnH9/midS5dQd+usy9sRcOttu+BaSvt3y2Kk27h7Gs
	WZUPOyeOPmwfiFRJxIpkf2gWv+JCzFtUr4uW8q+P8d/TpGz18emetSPteyGK2FhLuOeo
	76vtSsZRPFJ+IWZ9iK7Zmbq4BVrHBzhzI4vUJUib5ye3yiRHFlDUTNIP3KmPok4TldqP
	UOOfj/vi/6uVjE1XaeXsv/KZsUGzBgfSDNZRmGK+XSdKOawXolxnGN/Ny5U/c9nvu65y
	RyczPqW6sLAF+FgGV/sIFQaXXgwSX9fi0I+iZimhY9zC3Jh3g5Mu9tY5EStwkB8oYSk8
	nxgA==
X-Received: by 10.14.10.1 with SMTP id 1mr260498eeu.81.1378231104318;
	Tue, 03 Sep 2013 10:58:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm33397219eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:58:23 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:59:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175942.GA11500@jama>
References: <cover.1377257565.git.paul.eggleton@linux.intel.com>
	<da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <da4ddacdf801a6744fbdd2081bcc41586ec326ac.1377257565.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/1] busybox: remove bbappend
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
X-List-Received-Date: Tue, 03 Sep 2013 17:58:24 -0000
X-Groupsio-MsgNum: 46051
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 12:33:37PM +0100, Paul Eggleton wrote:
> This bbappend has effectively been merged into OE-Core, although the
> log buffer size is the busybox default rather than 64K - layers may
> change this either by providing their own /etc/default/busybox-syslog
> file (when using systemd) or modifying the
> CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE option in busybox's build time
> config.

Applied, thanks!

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-core/busybox/busybox/busybox-syslog.default |  1 -
>  meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend        | 11 -------=
----
>  2 files changed, 12 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/busybox/busybox/busybox-syslog.d=
efault
>  delete mode 100644 meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
>=20
> diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default =
b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
> deleted file mode 100644
> index 8a21e6d..0000000
> --- a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.default
> +++ /dev/null
> @@ -1 +0,0 @@
> -OPTIONS=3D"-C64"
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend b/meta-=
oe/recipes-core/busybox/busybox_1.21.1.bbappend
> deleted file mode 100644
> index 7a2f0c3..0000000
> --- a/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# look for files in the layer first
> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> -
> -SRC_URI +=3D "file://busybox-syslog.default"
> -
> -do_install_append() {
> -    install -d ${D}${sysconfdir}/default
> -    install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/=
default/busybox-syslog
> -}
> -
> -FILES_${PN}-syslog +=3D "${sysconfdir}/default/busybox-syslog"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImI44ACgkQN1Ujt2V2gBwGkACgrp2RSLFReENVKUy+R5yHnZ9q
pRAAoJe1EB+KJl4nGqSRA63qqF5G6ohM
=GMll
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
