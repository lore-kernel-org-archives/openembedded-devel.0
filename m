Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1C576075
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 20:05:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r15-v6so13710811wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VutHdJKppTy11S7SXXtvY4TcD6f8QRbVMekepbKQK/o=;
	b=DgDG6REV6rKDql7/i1Ur6Ae2IvX8SrzTYoO8UNLmZ010GCNdLJeP9CxHKvP9sCm18m
	IfATRYOSBrxvvXmsLSJCUNFqfXXeEYiI4DGeWIRt7moARvGofUFJoNASH8jwI1kCr8xL
	y9wjIqc1aqBeHMl+Y9B9/BU63hvXQ1/ZQMhddLMU7iGV6BUn0el9k9AdW0p71KXv8KaU
	j0dtkDhIXA2jSReNoQWMFO+pq+PqbESJooKeNzZ5WjgmdFNTb3ze5Vt+dCTQNX1dtKUe
	O+2MR42IzSg3jQlza7LbA0Cm8AFD793xn9ZMjAxaNMuBFvBXs7OLzlbS4DlRqy1n5noA
	YwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VutHdJKppTy11S7SXXtvY4TcD6f8QRbVMekepbKQK/o=;
	b=ftn+HCCiopxs2/ccHhzuAM2MPTj93lcE5SWpesoaENSG9fQ/5G7fsHBxL7SNEbZYhX
	RA0/wbVHh1BufRv1DSmuTtF5PtRWe+Gn50M1lBusIT+EN7DfVrCVM8mzgw4QYAivjRfy
	2dMeN/nnxTsIDWHH1iCTWUPE0I4OOyVtNWj003CM2eMbt/b7Z9RfupjP8ueAYL+DPvSB
	QnhlKeQahrdVxATvUrrWYx9Y4slPiJHE5dp1tSzKH7kohw1sdoeA9gvv/8q5OuOCLNI7
	N/3/Obc890xT1O4+WfMs+luCpIA2u9snxBMUMXqtcYt4u03+E8HQLgEQrAvL9fLXJTB3
	OIHA==
X-Gm-Message-State: APt69E3cQgmoJd7psfkq8YzyjQj9C7ngIqkmwiAmLSX1ujwtZdy0NPY2
	u/yBuK2SJ761c3tEw2+qHTA=
X-Google-Smtp-Source: ADUXVKJ/8tLBdp/yryWOrNOsmuQ/DsPOdJ0A6plBubpHjFLV2MtbOx4QIG2XeU4xDypsbJ36IdZ2EQ==
X-Received: by 2002:a1c:b807:: with SMTP id
	i7-v6mr2725793wmf.126.1528315506081; 
	Wed, 06 Jun 2018 13:05:06 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p6-v6sm20963570wrq.19.2018.06.06.13.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Jun 2018 13:05:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Jun 2018 22:05:06 +0200
To: Samuli Piippo <samuli.piippo@qt.io>
Message-ID: <20180606200506.GA1353@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
MIME-Version: 1.0
In-Reply-To: <20180529092556.25053-1-samuli.piippo@qt.io>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Wed, 06 Jun 2018 20:05:05 -0000
X-Groupsio-MsgNum: 72660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 29, 2018 at 12:25:56PM +0300, Samuli Piippo wrote:
> Add recipes for Qt OPC UA and Qt WebGL platform plugin.

Unfortunately qtremoteobjects is causing gcc 8.1 to segfault
during the build:
http://errors.yoctoproject.org/Errors/Build/60747/
the same with slightly older SRCREV currently in meta-qt5/master:
http://errors.yoctoproject.org/Errors/Build/60753/

Can you check what in qtremoteobjects is triggering that and report the
issue to gcc?

Cheers,

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWxg+cgAKCRA3VSO3ZXaA
HDvEAJ9dx20Yv6AVBazLrHBetoYh/dLjDwCferxvqb20t2RQF+MUrVXoccITSrQ=
=elDC
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
