Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288A8C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 19:46:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.29383.1678477601729560966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 11:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K+GYFT7D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BF37FF804;
	Fri, 10 Mar 2023 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678477599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUAzvB70aAeufhgpSKC9V8SizTFJ2dQK95JO0hp9tWw=;
	b=K+GYFT7DQlBWCwzManCTQDgVs+p2k6wTKSQUxIAxbtEO9/I05rw9D7VvlAtpOlU77O9OF4
	dTcGGVs+9cMpqZLHVYhGP0YjwyloOd4z3ZNi+7O4yyzDdTceO1C0x4ATD8OUVYn6UiZxBH
	6A9C5pjvLoQsUSytzpMAxXgM6wnT33XWUmA1q3U2CCf4WN96GDynG6HB8orp/iYpD/nLVB
	hKYkt5nUBs41b+58YGIxT9+8gDLvdmC+BgjYsS5AFqD//SR4MkarST4jpXRZOBpnZWq6og
	JdNtwttqMD1yz8MeD15MjXXLC6Tzcwst37PM9KJlnLx2GGa45I/49ncpZj8xwQ==
Date: Fri, 10 Mar 2023 20:46:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yi Zhao <yi.zhao@eng.windriver.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 2/2] netplan: add missing runtime
 dependencies
Message-ID: <2023031019202299276139@mail.local>
References: <20230308135705.796596-1-yi.zhao@windriver.com>
 <20230308135705.796596-2-yi.zhao@windriver.com>
 <2023031016464269dcfd97@mail.local>
 <CAMKF1srB7mrZvy9y4QmaAfw3xXw=hoybuv==bCOP_OykDr=66w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1srB7mrZvy9y4QmaAfw3xXw=hoybuv==bCOP_OykDr=66w@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 19:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101497

On 10/03/2023 10:24:20-0800, Khem Raj wrote:
> On Fri, Mar 10, 2023 at 8:46 AM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > This broke check-layer-nightly on the autobuilders:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/15/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/21/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/23/logs/stdio
> >
> > I'm not completely sure why yet.
> 
> it started to depend on python-rich and the recipe for python-rich is
> now in meta-python but perhaps this went in ahead of the new recipe.

Ok, this would explain why I found python-rich when looking for it but
not check-layer at the time.

> Ideally they should have
> gone in atomically.
> 
> >
> > On 08/03/2023 21:57:05+0800, Yi Zhao wrote:
> > > Add python3-dbus and python3-rich[1] to RDEPENDS.
> > >
> > > [1] https://github.com/canonical/netplan/pull/290
> > >
> > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > ---
> > >  .../meta-python/recipes-connectivity/netplan/netplan_0.106.bb   | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> > > index b7fe7ae3e..8c1eaa550 100644
> > > --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> > > +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> > > @@ -26,7 +26,7 @@ PACKAGECONFIG ?= ""
> > >
> > >  PACKAGECONFIG[tests] = ",,,python3-nose python3-coverage python3-netifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
> > >
> > > -RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan"
> > > +RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan python3-dbus python3-rich"
> > >
> > >  inherit pkgconfig systemd
> > >
> > > --
> > > 2.25.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101494): https://lists.openembedded.org/g/openembedded-devel/message/101494
> > Mute This Topic: https://lists.openembedded.org/mt/97472579/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

