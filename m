Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E11D0BB67
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:55:35 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web11.8605.1729752925102462824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Yv6KZyng;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729752923;
	bh=9j841xhAwxq+VBONuH7mvfQ6TLDygvIb2veK7GC1RzE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Yv6KZyngWvIUb2/MT/NmeYuLOH3Y2EqoKMwb+iliVVUa0YAliOHzZVUqDGxuOPkgK
	 wpNWN/yaxlAjkckzpP+EUxe7uyfQe5ZZhxlksvFirpMcGHTsZvVOwm+7GNMoJe8M9E
	 q+fYZIf7u/OAw+JvjMeO1Ggrsh/PWAXyYbUHT4XWmhlS94PlEPrI2lECP7preV+Hzp
	 e429tgGocNksNHXlnwuDsw6CcK/qtPhex9sMY7/rFIC1/bvOYitho812kjX5v+ienT
	 PIdXzIow4vJ3RXM7HVY8VFM3KqAVPSFLBXmXl9k/k0W1p4RAdyh+ZH5xIuSBMOAla4
	 MiPexjqMKXlTA==
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1D3569526;
	Thu, 24 Oct 2024 14:55:22 +0800 (AWST)
Message-ID: <b58d251a05b10d3e155e199a22b4b67a0149a4ff.camel@codeconstruct.com.au>
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with
 musl+clang
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, Khem Raj
 <raj.khem@gmail.com>,  openembedded-devel@lists.openembedded.org
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Thu Nguyen
	 <tbnguyen@amperecomputing.com>
Date: Thu, 24 Oct 2024 14:55:23 +0800
In-Reply-To: <20241024065109.74010-1-chanh@os.amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113161

Hi Chanh,
=C2=A0
> -SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dhttps"
> +SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Ddev/cross-fixe=
s;protocol=3Dhttps"

Note that that this (dev/cross-fixes) branch will not live for long;
it's just for getting you a set of fixes to test.

I assume you are sending this change just for a CI run, so this won't
matter. But just to be clear, this isn't suitable for an upstream
merge.

Cheers,


Jeremy

