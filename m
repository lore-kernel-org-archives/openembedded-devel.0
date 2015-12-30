Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED196011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 17:28:29 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b14so56831448wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mroR+AmSrWp7RblTDKAg8o3BsL1ZTo/p7eJwp7m8kzM=;
	b=oHdlECmibMcoPJuGFYeqvSZBqG7LjtHVdvGivEIvAG+bnf51wgp32L9J04oN0oOL9v
	F61LeRfxF91yQdSgLNsJNLf47i3hX8vzvAUjwFkRUBKPmeeWZHOXOh1Qi4Rbkhv8xcyz
	Q/sTV6RYWbboAvxhhfcYHTAPgnxvzx8EwmpCtgilMaLcnhK73DhDdYxgtsHw+/eXIULb
	u8OE3D/6LCVfTv29tkuuzgY98HEQjUhMQeSJG+/KbgjIwEruBUnAinFSLLUoYfKjYwxg
	EubHsBw/i/2Nq/ozcYqylW1iP0MnCQcTGv3vBInk531FCvE1/CZqCNBM2neya4G3phhb
	7lpg==
X-Received: by 10.194.117.163 with SMTP id kf3mr71380727wjb.139.1451496510008; 
	Wed, 30 Dec 2015 09:28:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pn6sm66294283wjb.15.2015.12.30.09.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 09:28:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 18:32:04 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20151230173204.GG2263@jama>
References: <56840B6A.3080001@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56840B6A.3080001@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: next bitbake world run and updates
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
X-List-Received-Date: Wed, 30 Dec 2015 17:28:30 -0000
X-Groupsio-MsgNum: 59229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sw7tCqrGA+HQ0/zt"
Content-Disposition: inline

--Sw7tCqrGA+HQ0/zt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 11:50:50AM -0500, Trevor Woerner wrote:
> Hi Martin,
>=20
> I'm hoping my nodejs_4.2.3.bb makes it into your next "State of bitbake
> world" run and passes this time. When do you think your next "bitbake
> world" will occur? I ask because since sending my v4 patches for
> nodejs_4.2.3, node-v4.2.4 has been released.

It's running for last 2 days already, it should be finished in next 2
days. Your recent v4 is included (at least for qemux86*, qemuarm was
already running when I've updated master-next and jansa/master
branches).

Previous "christmas" build was wasted, because of server issues in the
middle of the build. As bonus I had time to go through cumulated logs
and fix few more issues around for current build.

> Do I send the list a patch of the delta between 4.2.3 and 4.2.4? Or do I
> update my entire patchset and send a v5?

I also hope that last 4.2.3 build will be OK and your change merged in
master, so I would prefer separate patch just for 4.2.4.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sw7tCqrGA+HQ0/zt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaEFPwACgkQN1Ujt2V2gBzDyACdG1fDb6BqiYUGcxHozHoD7Ujf
KNUAn2b316f/ILH9+sUAxkpoksJU7/Dj
=u3ms
-----END PGP SIGNATURE-----

--Sw7tCqrGA+HQ0/zt--
