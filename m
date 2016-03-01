Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 48A8F62135
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 00:59:20 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 4so23523696pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0gHDn4BtOABzaJ9GM8ZP0qQJY6nMNJRM8fDVFtTnrY4=;
	b=iCFmZlTzp1d+J37Rg4BX6w6ddNCow4D0egVCQ1wC3YZCvTeBEYPbvMN6BCVD24bKQL
	yFQCD2jBu2l35NmhHkgopNVMah++X8qF46QmsdI6lXYoTT1t5kQ8NRVs5dMn7hgHg3Wj
	g1lq9TxiMh/m1/EqJp8SY2rVl9o/AJbRvVI7+TL4L1kBif/vGdK3Q9iTdqa9qBv/Ikei
	xr6tyK1JqDMXuYUnZFBqk5OBVbhjxnNcd4K4gZ9z9yzETduWS/oq9xAyiR6B95ULo4T5
	0tcfMZb0cIozmJorQgFMlsHa7y9a8XZ4zZJW76XznhoGVllTh+1iwjhK4ISa70J1xon/
	bdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0gHDn4BtOABzaJ9GM8ZP0qQJY6nMNJRM8fDVFtTnrY4=;
	b=hFj3m08yaxE0S7dUuu7WOoOzsjHfZjxNUr980dM9WU/1xJhSAV0YldG7XVqT4g4Yni
	qWCkVlFm+gJOsuCxUjr5Wd5XXevggk87Y1tfB5Hoq2wBiddrPknUCJnrggzmQZrOA9Ff
	+fWnlSLFh4bBONVMRTBcmpcgrxKFd6os1+izgw+HOVjzM+iHDLctAv9nyMjj8GVCNrx8
	uLZWe/MhuhpnoivEp3SFA1sy990dN5WUP9X33qR4WAgaoK4xigdV3uwU1rjxsmECb/hG
	ggCtGflEa+WQHoMNSXOpgysoFVxu9EM6562kjVG33gjZdzRA36aKYZy67WfLdPVb1gci
	waKA==
X-Gm-Message-State: AD7BkJIAQIElvvoIJmyJpIblBJWFkBZ52wgMB0Nzd1nc/UZo2VDPwHpQDPbdZO6jZ90Btg==
X-Received: by 10.98.67.92 with SMTP id q89mr26260938pfa.137.1456793960895;
	Mon, 29 Feb 2016 16:59:20 -0800 (PST)
Received: from ?IPv6:2601:646:8800:5a9a:cd21:284f:6e89:9eaa?
	([2601:646:8800:5a9a:cd21:284f:6e89:9eaa])
	by smtp.gmail.com with ESMTPSA id
	p9sm25938626pfj.67.2016.02.29.16.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 16:59:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1456793382-4567-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Date: Mon, 29 Feb 2016 16:59:18 -0800
Message-Id: <DA09302D-6443-42B7-AE48-FE2DBAE402DD@gmail.com>
References: <1456793382-4567-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1456793382-4567-2-git-send-email-rebecca.swee.fun.chang@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: Re: [meta-oe] [PATCH v3] libvpx: upgrade to version 1.5.0
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
X-List-Received-Date: Tue, 01 Mar 2016 00:59:20 -0000
X-Groupsio-MsgNum: 60272
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0204E20-1816-4B3F-963A-D2BB745F5366";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E0204E20-1816-4B3F-963A-D2BB745F5366
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 29, 2016, at 4:49 PM, rebecca.swee.fun.chang@intel.com wrote:
>=20
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> This version had improved VP9 encoder and speeds up the encoding and
> decoding process.


much better. Why do we keep v8 enabled
>=20
> Signed-off-by: Chang Rebecca Swee Fun =
<rebecca.swee.fun.chang@intel.com>
> ---
> .../recipes-multimedia/webm/{libvpx_1.4.0.bb =3D> libvpx_1.5.0.bb}   | =
7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
> rename meta-oe/recipes-multimedia/webm/{libvpx_1.4.0.bb =3D> =
libvpx_1.5.0.bb} (88%)
>=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb =
b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> similarity index 88%
> rename from meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> rename to meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> index c963a9c..8ac178d 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dd5b04755015be901744a78cc30d390d4"
> SRC_URI +=3D =
"http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${B=
P}.tar.bz2 \
>             file://libvpx-configure-support-blank-prefix.patch \
>            "
> -SRC_URI[md5sum] =3D "63b1d7f59636a42eeeee9225cc14e7de"
> -SRC_URI[sha256sum] =3D =
"f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4"
> +SRC_URI[md5sum] =3D "49e59dd184caa255886683facea56fca"
> +SRC_URI[sha256sum] =3D =
"306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
>=20
> -# ffmpeg links with this and fails
> +# ffmpeg links with this and fails
> # =
sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0=
xc4): unresolvable R_ARM_THM_CALL relocation against symbol =
`memcpy@@GLIBC_2.4'
> ARM_INSTRUCTION_SET =3D "arm"
>=20
> @@ -48,4 +48,3 @@ do_install() {
>     oe_runmake install DESTDIR=3D${D}
>     chown -R root:root ${D}
> }
> -
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_E0204E20-1816-4B3F-963A-D2BB745F5366
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbU6WYACgkQuwUzVZGdMxQgNgCdH6x3RH9qevaDDcO9EqFgkbqw
3+4An1u6UlnkpD+6i1xFwaB6UTFYSWa7
=tFYg
-----END PGP SIGNATURE-----

--Apple-Mail=_E0204E20-1816-4B3F-963A-D2BB745F5366--
