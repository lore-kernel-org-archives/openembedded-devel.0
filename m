Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 093DC77CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:44:05 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l50so4970047wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=erum+JymNPB5MDLN9z4d83Fgas8ZEzLYaPx7nbVmSPg=;
	b=EnAN7cXaPby9Tg3XYXDXYLu3z4erfnEDq7GvXW7B4tzsPO0ep/v9Za9GeEGdDuqNrN
	/8VkYmNy1bkuwNw4j108isnRmxDam7L2IVTIuIfGZna7jWdE8SgSBmoqI+na+QJnNdFq
	c5nJVAEVGkn6HFDFVOBrVNbzOQS0wPibgE9qr9NqtFL6mULxnrfLmLV/w46pNxYoMAIo
	bAvGeEF5eFDHetkorSXlFCe2pyaKDYaidAe0DTcTxm77Kk8P7izNym4JLJy3s05BsExy
	V7rpS4ZHERPEYFwLLyCuYP8zAVV8jS2oBlx2whyBVmdM3MZgvIaKBUkpXYHxUUxO1hRv
	bjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=erum+JymNPB5MDLN9z4d83Fgas8ZEzLYaPx7nbVmSPg=;
	b=o1Ck0qdX91di2Cl3AiRw3QqpHnbt1cRRBWu2sqeKaXEEzI3KjBKPhgYajUfDzXkHf3
	n9M9CM/3ynlSYd524d0G86+6r13aA5PGHi98reUwq0j9+OaKVlHr6INxpwQedA694rST
	gryb2P6kx++z5ss+iqBJU8D1A6XS2Mxf2jOc3wsp50GARbeo83viFeif8OB1W7yuwz9G
	O+h3ZVTPZUi9eabVzFvWizROwcpYfkU+ldZTYoDn39Ost6pejZ/Nz9lc7LbDUxBi/aPV
	5g5+rbCH0YrMJOfkwu7+mhE5nAnxKWgRK541FSL3jtKDrqUyZN8iVwRT8+hAB+qkcffm
	SilQ==
X-Gm-Message-State: AN3rC/65LQK7hhHQIjjHFcNlrELtgSq7jZWG7wodjKXrF7yzbOz0+oGL
	Siy+MHEy9v5Ht8HR
X-Received: by 10.223.153.181 with SMTP id y50mr829296wrb.41.1493232246433;
	Wed, 26 Apr 2017 11:44:06 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m83sm9899031wmc.7.2017.04.26.11.44.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 11:44:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 20:44:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170426184422.GG3258@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 26 Apr 2017 18:44:06 -0000
X-Groupsio-MsgNum: 66558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline

--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

as every 6 months I'm looking for some volunteer(s) to step-up and
maintain "pyro" release branch.

You can sign-up by replying to this thread and then one of you need to
send README update like this:
https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae

More details in thread searching for daisy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html
http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html
or dizzy maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html
or fido maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html
or jethro maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103810.html
or krogoth maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/106952.html
or morty maintainer:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109452.html

Regards,

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQDqhAAKCRA3VSO3ZXaA
HASzAKCwxoGKDtZlpEGYZ65r50ORcaDTvwCfYfThjKEM/8LexJpH6NQURXltheo=
=RCL4
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--
