Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEE5A7317C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 09:05:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 1so2969037wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 01:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mHxd3Xgk0sD3Ka38wj8u0SrOPqbl+tzk/KWY+/KU6j8=;
	b=yoqoHATl31jOu9vh6YsHALzwsvanv5XJgJLIlxM3Vxo599yR/+X3qI1Ke66W9ugjHG
	vw3eqRUoGYHeBMbNambU+oMfvOusQVn/tZzPVbIDBaZkG7k6DogVCnd3+e4QWiUEewFw
	C+DYN9RElW3eCYj+imQWYNllKYnKR33BKM6EBRZzZvmV7afVLtiuO8yx6ZelR0PGOS7P
	5g+RR9sOhMFWYLaxA0+Q4RWQGXuNJ4FpVR50B+5wSsjzX8R7m63C9U7G8a6f2utL3YPL
	3YQ2H1NZjfXuZdlxEhnm61VngiK0ecyAC0XXaItDwYge94ZE9iHDBQ0zcQI2TYn5Apcz
	gxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mHxd3Xgk0sD3Ka38wj8u0SrOPqbl+tzk/KWY+/KU6j8=;
	b=eMFP+ajXmT7sKGLl+BvvIybnSe3HXMZn5btDWfpAEC9HnK7pm9hyOfnGYSy8C46mAw
	aww4aRugM5EU7MFgwFMBe4cPkwwnFgVjBShlkloVfKHhtu4/ISS01oqd/vMlhElDkrzs
	gGHYcP9Uo9ZqLhsVuKmOgQhNXROPfE0jDilLXxTgp1u0aUOLfNw8S2tH1CzhxEMxo/EM
	FMxBfF16REPYisR8X+iN432D3A/kErVla4VqjVIJq1NWLC9DkzF1cqTKzuYbJpjaQ7IZ
	HYib/NIu9hbmx1lihmPvQU+WnnB0nNb4XuEGkNF5a3AeWoCCmgaFPGOhezyIpq5wwKPr
	lc3g==
X-Gm-Message-State: AD7BkJLFOMY4bQgDe19cR2Pz7QNvuXP2CstZKYNaRYp+k371i0KvWQTR1YSiR3As0qYphA==
X-Received: by 10.28.175.139 with SMTP id y133mr4219372wme.45.1456995930950;
	Thu, 03 Mar 2016 01:05:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u202sm3999642wmd.24.2016.03.03.01.05.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 01:05:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 10:07:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160303090734.GB2569@jama>
References: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
	<1455622845-14510-3-git-send-email-pascal.bach@siemens.com>
MIME-Version: 1.0
In-Reply-To: <1455622845-14510-3-git-send-email-pascal.bach@siemens.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver][PATCH 2/2] nginx: add stable version 1.8.1 as alternative to the mainline version 1.9.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 09:05:31 -0000
X-Groupsio-MsgNum: 60309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2016 at 12:40:45PM +0100, Pascal Bach wrote:
> The 1.8 branch is the current stable branch of nginx.
> This means the branch doesn't get new features, but is still supported wi=
th bugfixes.
>=20
> Depending on the use case it is more suitable to use on an embedded device
> than the 1.9 branch which adds new features with every release.

NOTE: recipe nginx-1.8.1-r0: task do_configure: Started
ERROR: nginx-1.8.1-r0 do_configure: QA Issue: nginx: The
LIC_FILES_CHKSUM does not match for
file://LICENSE;md5=3D0bb58ed0dfd4f5dbece3b52aba79f023
nginx: The new md5 checksum is 3845852aedfa8d6d7765f55d06cc3ebd
nginx: Check if the license information has changed in
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/ngi=
nx/1.8.1-r0/nginx-1.8.1/LICENSE
to verify that the LICENSE value "BSD-2-Clause" remains valid
[license-checksum]
ERROR: nginx-1.8.1-r0 do_configure: Fatal QA errors found, failing task.
ERROR: nginx-1.8.1-r0 do_configure: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/ngi=
nx/1.8.1-r0/temp/log.do_configure.26965
NOTE: recipe nginx-1.8.1-r0: task do_configure: Failed
ERROR: Task 21522
(/home/jenkins/oe/world/shr-core/meta-openembedded/meta-webserver/recipes-h=
ttpd/nginx/nginx_1.8.1.bb,
do_configure) failed with exit code '1'

> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb b/meta-web=
server/recipes-httpd/nginx/nginx_1.8.1.bb
> new file mode 100644
> index 0000000..ec3aef2
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.8.1.bb
> @@ -0,0 +1,4 @@
> +require nginx.inc
> +
> +SRC_URI[md5sum] =3D "2e91695074dbdfbf1bcec0ada9fda462"
> +SRC_URI[sha256sum] =3D "8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb=
4646c27d09f797b7"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbX/tUACgkQN1Ujt2V2gBz42wCggpsNUFFMOIEny62RfnZToy80
wscAniIhLNcgmOaENaLS3wU1yWobnNsG
=r1QL
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
