Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2B46277D17
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:04:36 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k6so33034176wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rVhY0dwYKOKdjCsbo7vk6jQlohbpwcwwIJGI322gemI=;
	b=sHGGOCbU22RpjFTHXnSMsU89x8pj+X4fzAR734jm9/l0Fkfx0ptisRrqWeH4V46Ca3
	q8IllXq/mg92jTat8MFUuXz0+wt4SneK5AG59mpy3WXrj2rbDz1ThWV+ffmOBbR65zGl
	LVT8e2eNbBSLY8ST34vNmTAtKCW/oFUNSBC3+Vu8REcxtQVTWDLTWsqb8j60nWrNM7IU
	4OZpTUtFeM/H4C/mI4wkclGvRmLzQvpkk9FZn7OiK+VLO56B0rAhT/OXbqeW3OHGDCZK
	8ARhlrPKr2sLOJwBU0PFOzDkYF8Wy3tvcd9UlSDuY6mz7d7v0yGmOMkjbvfxWMLp67yx
	ohQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rVhY0dwYKOKdjCsbo7vk6jQlohbpwcwwIJGI322gemI=;
	b=bRZCXOY9QJBIIPYpYNeJlLR3TX7yr708UWycLRFAsk+ZKvY9zUJqnki/7bK/VXn9+T
	pYCLjgN7ZZY90/WXiwJxnD5bMUJ0k+F7Q8goyAqcd9tpt9aMtEHeCGQxke97K2VXgEgW
	seCKWzywPnwGVvZrT+5BuYCZwiMFJYXM2X/SXb8LnJOYg63vWWgG8HHp+lSz/JVMCBq8
	IbXd+PJ1lgJxCPG6/ZBC7WZfTQj4rBNXqDi1ZUHANvfyw+Y7OOTYlsnanQagrs+rYa13
	adg29yX7DohGVf+LH1sBnPJh+n9HLlaLDB0fyCr38Jq/JzY2pcV+VYyPUNIv+9ZZx8MF
	jPJQ==
X-Gm-Message-State: AFeK/H377KGXtvKWUjQR3Wza3CR7fvqUWrusZ1T74ZH1ttmp1sbrUP4hV5VocJcsx28KiQ==
X-Received: by 10.223.153.142 with SMTP id y14mr15320899wrb.193.1491231877974; 
	Mon, 03 Apr 2017 08:04:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d7sm8516524wrc.6.2017.04.03.08.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Apr 2017 08:04:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Apr 2017 17:04:41 +0200
To: "Puustinen, Ismo" <ismo.puustinen@intel.com>
Message-ID: <20170403150441.GE3311@jama>
References: <20170323104816.22461-1-ismo.puustinen@intel.com>
	<20170330093953.GA3060@jama> <1491230014.32538.9.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1491230014.32538.9.camel@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: do not depend on swig.
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
X-List-Received-Date: Mon, 03 Apr 2017 15:04:37 -0000
X-Groupsio-MsgNum: 66075
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 02:33:36PM +0000, Puustinen, Ismo wrote:
> On Thu, 2017-03-30 at 11:39 +0200, Martin Jansa wrote:
> > On Thu, Mar 23, 2017 at 12:48:16PM +0200, Ismo Puustinen wrote:
> > > Since swig is a code generator, just depend on swig-native.
> >=20
> > Seems to cause following failure:
> > http://errors.yoctoproject.org/Errors/Details/138491/
>=20
> This is bit of a mystery to me. Gflags should be unrelated to swig...
> Was this build done with a special PACKAGECONFIG?

There was another change which caused this issue, send version rebased
on master-next because one of your colleagues decided to drop target
python as well.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOJkiAAKCRA3VSO3ZXaA
HO7yAJ465BU3W6kgTAMVC16i9KY15tp+MQCeIq1l16OcZzGxqmVn/PaiY3tfuvc=
=6OLL
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
