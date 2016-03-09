Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 15E6B6FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 19:47:56 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p65so830833wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=tfMr4HLX4XhhOP10Crygnf+MWZqRdMhX+w4VAko+FUk=;
	b=IoObrLjfRt02kUjAqEJYYQBJUj1gFPuzFwCjukR+OP1pp7On9iD4/b6CxdTzsFI8nM
	mb6oAjKbF9eCs7rkXLK0Vye71APYkYai7eCerWtU3OQVzBAKx2bRLAu7M2LTow0gOURL
	N3pBL8u2fAQWPGOpZZ8vIVMXXggsDzDwToz/S1YuvOjbNmL4ZNX4JWVfVewIaTMPjRFq
	d8hJvXFMpA76+HwavJ8qUr2jzIUTpRRRONHFCiuv0K1vBc8bZwcv/9+aVeDszEg1UCsK
	DcUrjcvoBkMnXTIYhJ6VH9MePhIdJOsFSmZx50iQ7kbccj8xzUz8VBf2HUzFTMJAQgU4
	SDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=tfMr4HLX4XhhOP10Crygnf+MWZqRdMhX+w4VAko+FUk=;
	b=ehueVQpppSq16BfBUezyqEfX63mAogVOBR2PC7gywVG0YTycqUtUBv0oOqnYE5Q/Ui
	/V7jEUOeagPNXuORoz6VBtiG2Vd9y+3blhNlBaacuh67gwo5oI6ByAOuqWMUEfC6QDVn
	v0ljmabdoUHPD1hikGlf2Mq48+oz25phgX3yOTYJUejB5pnMLuBATo62JirxnyljAowD
	xWdA8lLcAKrvh8e642cOnpnHQHq/tYeyf1rtbAMIKPJ4eLeAhKlKFTpmuw9Cx9pqDT7c
	G729DblQoup/jKI6aWIueNT4Hv2+3XKTzhm+qXsC6XJWOe4CpVZjsQjjlTLTGznHHzJR
	rm9w==
X-Gm-Message-State: AD7BkJK4b8yALe0uR7Ty+uNg7ye447eZC2l7ZJfYWydYhuQMBtV7zex+ZF4rskIF+eqstA==
X-Received: by 10.194.71.135 with SMTP id v7mr37164141wju.135.1457552877141;
	Wed, 09 Mar 2016 11:47:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id gk4sm163712wjd.7.2016.03.09.11.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 11:47:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 20:50:49 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160309195049.GJ2542@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: python-cryptography failing to build since openssl upgrade
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
X-List-Received-Date: Wed, 09 Mar 2016 19:47:59 -0000
X-Groupsio-MsgNum: 60434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wIc/V6YLA2QdyfT4"
Content-Disposition: inline

--wIc/V6YLA2QdyfT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Do we really need to use that version script for openssl?

Here is another failure:
http://errors.yoctoproject.org/Errors/Details/54984/

in our local builds we use couple prebuild binaries from 3rdparty, which
now aren't compatible with openssl ABI (possibly because of
version-script update:
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118433=
=2Ehtml
)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wIc/V6YLA2QdyfT4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgfpgACgkQN1Ujt2V2gBw5AACcCzySDP/q0dCd/8YA/Yh9F+hx
TT8An0fqVEHtN03fufnrOYzh//jGhtUI
=OhNE
-----END PGP SIGNATURE-----

--wIc/V6YLA2QdyfT4--
