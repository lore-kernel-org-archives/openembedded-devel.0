Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EB3D2E02C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:10:29 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.4571.1729674623380027755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=UimJmv+E;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729674621;
	bh=pYPbpzsxX5njZljkw4ZskKkWHPSJ/wAE3uZpToF2U7M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UimJmv+E1P+AA9m3+dHSb7CvZ8wI1i7dd0sOVx3wE8Jd249c5ATAax1LNeuThX3WW
	 3aoaCv0XXvgeQhoYpkFfQhHxQawk0ybdR5qtkCJtji7UUZhKAWy68KPw7KLO0DLXlO
	 1lC963j9u3l6/MdEmluX7YpGXEKfGz71L2/vXYtWDzYn/N2qizZI2CZ2QOCM98xeNh
	 SlsexyJwvuNz3TcZYf+lIMFlggCnZ9OrWiTEZ/jdaQsdR7rpZpjMR3x6v4BMhJSIDi
	 AT10KyPRiHKi6m0hVKDq8V9oLfSEXiPXGNUQeHWX7qsl3cYr9IW4nCLDtIeaLSU5qD
	 vFqB3Mj8O/unA==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 279FC64BF3;
	Wed, 23 Oct 2024 17:10:21 +0800 (AWST)
Message-ID: <47b8db3d72878e096363b5d56cd2b316b1be7378.camel@codeconstruct.com.au>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, 
 openembedded-devel@lists.openembedded.org, Phong Vo
 <phong@os.amperecomputing.com>, Thang Nguyen
 <thang@os.amperecomputing.com>,  Quan Nguyen <quan@os.amperecomputing.com>,
 Khanh Pham <khpham@amperecomputing.com>, Thu Nguyen
 <tbnguyen@amperecomputing.com>
Date: Wed, 23 Oct 2024 17:10:20 +0800
In-Reply-To: <1026a7a9-829a-4ce8-9da9-e91b8299c394@amperemail.onmicrosoft.com>
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
	 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
	 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
	 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
	 <7eebebc1-6c64-49e2-976d-247c8c0fd22c@amperemail.onmicrosoft.com>
	 <CAMKF1sp0ujF6n6TT_o5vcH=n-ZmcawockNNcxOArbiRkLZNjbw@mail.gmail.com>
	 <1026a7a9-829a-4ce8-9da9-e91b8299c394@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 09:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113143

Hi Chanh,

> I don't know how to fix the musl compiler to pass this error without=20
> fixing in mctp repo.

Just rebase your change on top of the current oe tree. Khem has
integrated v2 of yours, so you will need to send a delta from v2, which
updates to the new mctp upstream,for the musl fix.

Cheers,


Jeremy


