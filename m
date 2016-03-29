Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1E71860670
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 11:48:06 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 127so55351724wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=72tTzn/BEpQ/AnTfwTmstutgZWhU835qM3HrbqkUUBc=;
	b=IVveiT7CPqmBL16f7+V16w26Cu1P2Wxk7uE2ZmnJu15Eshs8c3Ii2MOfRUyr3LvuZ+
	C+T58G7+dW9zSn4hUvXFE7L+idsN9+XoLupUwkutb3p3ci1xVghik2CFfjzvEXZk0jjG
	BcyKW4VkVrsAg+CEzXLxhWNuaM80jdJ60VS3WXbIOAPK4l7Q/ujP+tv/y0Y9MOTNmLEF
	p1P0eEs7nqtG+C/UXaDVJMkx0c0dOxipHcRlZPlqjnlxWT5rhEyoyNTn8bQd9MGm/XK2
	xH8lJ5NSuJW1RW0Vsei++mg7VTt20l6DIH615S73KlLGmMJbHsygHzheeB8V+Zb6cXeP
	6UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=72tTzn/BEpQ/AnTfwTmstutgZWhU835qM3HrbqkUUBc=;
	b=LIEovGLUWLEezetuwI9feBOfzJxAoDfVDIXmofp3yJZVVLEEH07pn62Tox2UcNcISc
	bWNJ+0sUA41CEHe8ruvv+7etku6O2wEsyl+1ZQR951QnoZ94vvjH9opKzC9rodtxyGOW
	a9Zg/Ku3LRezURC0I7E5HVXZssX6e3VOtHxz44d23kF+pvwYNw7zzGl35Be5zjBi6wye
	Vh+NGoPFHbIjraOIxHhYV3iLZPBfYiSHtTLsoCl6IflwXob7AqGwJ2dRTE/Co3FnZg0K
	1+zBNrwrzUpgdts2A57YQnhOtfKE5TbcW1rQygXs4DK3YvPtpy2Mtv+lnmyjpUsc2+Ab
	U7SQ==
X-Gm-Message-State: AD7BkJLj2Qr8Kwk1sGWkQfYbDIunb6JTA9nrZLj1pbmcqRFvh0UwLcq4yjq8kjIZ9IpUAg==
X-Received: by 10.28.135.1 with SMTP id j1mr15440101wmd.20.1459252087182;
	Tue, 29 Mar 2016 04:48:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm28923966wjb.26.2016.03.29.04.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 04:48:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Mar 2016 13:47:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160329114759.GC2555@jama>
References: <1459236848-1236-1-git-send-email-fan.xin@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1459236848-1236-1-git-send-email-fan.xin@jp.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] ntp: Upgrade 4.2.8p4 -> 4.2.8p6
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
X-List-Received-Date: Tue, 29 Mar 2016 11:48:09 -0000
X-Groupsio-MsgNum: 60722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2016 at 04:34:08PM +0900, Fan Xin wrote:
> Fix CVE-2015-7974 and other bugs.
> http://archive.ntp.org/ntp4/ChangeLog-stable

4.2.8p6 is already in meta-oe for couple days

commit 1ddc9a5e653d0869df5fd9ccf16128cee88008c6
Author:     Armin Kuster <akuster808@gmail.com>
AuthorDate: Fri Jan 29 12:14:26 2016 -0800
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Mon Feb 22 15:51:19 2016 -0500

    ntp: update 4.2.8p6


>=20
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
> ---
>  .../recipes-support/ntp/{ntp_4.2.8p4.bb =3D> ntp_4.2.8p6.bb}            =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/ntp/{ntp_4.2.8p4.bb =3D> ntp_4.2.=
8p6.bb} (97%)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.8p6.bb
> similarity index 97%
> rename from meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> rename to meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> index f9f900e..1ecd8c7 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p4.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
> @@ -23,8 +23,8 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/n=
tp4/ntp-4.2/ntp-${PV}.tar.g
>             file://ntpd.list \
>  "
> =20
> -SRC_URI[md5sum] =3D "6af96862b09324a8ef965ca76b759c8b"
> -SRC_URI[sha256sum] =3D "0d6961572548d2c4af96f58f763e22ac620f5afef717384d=
dc317a0e365cfdb9"
> +SRC_URI[md5sum] =3D "60049f51e9c8305afe30eb22b711c5c6"
> +SRC_URI[sha256sum] =3D "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c02=
6e485a0dda4ba048"
> =20
>  inherit autotools update-rc.d useradd systemd pkgconfig
> =20
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb6a28ACgkQN1Ujt2V2gBwzfACfWJ6sZ9opr0hG1ntNxnz+9Hza
glMAnjVxZDCi7KT+87H3rJrdrb22aMRC
=+XPj
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
