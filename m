Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 87109731CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:07:09 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so174307943wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 06:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nxOjIoyFKh1iy2n80lp7ZFtpQOkQ6bemqBa/xuxBtUo=;
	b=C2FIJwUhAZCJxGYh/w7liR7yHfm8zMzxQS2g2aKqs3qLZqy/adbugfhIIvcQzBVjj7
	jCOKigF8QjA8yxLjRJvCifPCUhdFKNduzjHwS/+VSPYnshcyVd9IHS7MKm5ATsKqierS
	hb+f6o0ETbO8VygkajQXXS3OIsmNjFfn4wC17o7scwoPxEa9KjdIsJ2M3XtFqHyoJDEC
	YRG8bq83lntAtQ0Lu+r1OaA8nzGyJlRFbLsi0NyqfBITdfafR7Qz019a0s3acUPwXHkY
	PGYgwZogJ8KNcNCAFPfyw1LITKOqSlYfWvQlt6L8OuYohDYfYktfDr9dUQsipcWjLjmp
	eUiA==
X-Received: by 10.194.172.35 with SMTP id az3mr110229315wjc.64.1451916429300; 
	Mon, 04 Jan 2016 06:07:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o132sm73158842wmb.7.2016.01.04.06.07.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 06:07:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 15:11:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104141119.GC2581@jama>
References: <1451902358-1844-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1451902358-1844-2-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1451902358-1844-2-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][jethro][PATCH 2/4] python-pyasn1: Error fix for recipes depend on python-pyasn1
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
X-List-Received-Date: Mon, 04 Jan 2016 14:07:09 -0000
X-Groupsio-MsgNum: 59310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline

--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 01:12:36PM +0300, Li Xin wrote:
> If you bitbake recipes which depends on python-pyasn1 such as
> python-cryptography. And also your network is not very well.
> Error will occur as following:
>    Download error on https://pypi.python.org/simple/pyasn1/:
>    [Errno -5] No address associated with hostname -- Some packages may no=
t be found!
>     Couldn't find index page for 'pyasn1' (maybe misspelled?)
>     No local packages or download links found for pyasn1
> So add do_compile_append() to fix it.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)

Is this change needed in master as well? Where we have 0.1.9 version.

1/4 and 3/4 do apply in master

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKfYYACgkQN1Ujt2V2gBwpDACfWrJruplQLzV2NK1RCLSj0gjf
VZYAoJ/GFpkysU9KhJ/+ckY+LyguyjkP
=f3mW
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
