Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D858C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:11:42 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.10690.1635246700157519824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=SnF4FL2/;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.25, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	 s=20161220; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=LPekumtCOgjT9Fkb/Ff9RHsyWE5Pf434o6UO6fPWrUs=; b=SnF4FL2/abfXu57xQFuBR+Ry4b
	YQausEEB8iS9iqPka02aTCG7K2B+0frk0C73doCeLu/SyehI0D/HgW8XGXpnG9iS1DXl2tyaRcFTo
	5vm8Y4Zb30wkUCjIdykkQkyQ3GqiORc4gmWyoV/x61ca+zty+DKZ/W6Lv/A/nnrDCh7WvR+SNjrdW
	z70CV0lbqttwfxqHd+Z1GteHH1SOr3cwXiASusghODItMMDFQfK4PueMnQOJRsHh8tz3dN2Qq+ln8
	PfO0YlJSzBPOLwsA7VA5FrD+9ZRd58CBbsmMhxNHIHG+1CVtaIbXiXZ0drBTvChl4AC3JX/ZzRPv1
	GJaErX5A==;
Received: from 89-27-44-133.bb.dnainternet.fi ([89.27.44.133]
 helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1mfKMi-00087D-0E; Tue, 26 Oct 2021 14:11:36 +0300
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [oe] [meta-oe][hardknott][PATCH 7/7] jemalloc: set precise BSD
 license
From: Anders Montonen <Anders.Montonen@iki.fi>
In-Reply-To: <20211026075837.39670-7-mingli.yu@windriver.com>
Date: Tue, 26 Oct 2021 14:11:34 +0300
Cc: openembedded-devel@lists.openembedded.org,
 Armpit <akuster808@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D32FD6BC-0E02-401B-BFE8-645C0DC16F5C@iki.fi>
References: <20211026075837.39670-1-mingli.yu@windriver.com>
 <20211026075837.39670-7-mingli.yu@windriver.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 89.27.44.133
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 11:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93593

Hi,

> On 26 Oct 2021, at 10:58, Yu, Mingli <mingli.yu@windriver.com> wrote:
>=20
> From: Armin Kuster <akuster808@gmail.com>
>=20
> "BSD" is ambiguous, use the precise licenses BSD-3-Clause
...
>=20
> -LICENSE =3D "BSD"
> +LICENSE =3D "BSD-2-Clause=E2=80=9D

I realize this is a backport, but the commit message doesn=E2=80=99t =
match the change. Should the license be BSD-2-Clause, or BSD-3-Clause?

-a=

