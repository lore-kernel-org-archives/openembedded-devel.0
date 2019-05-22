Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDE0C7E3B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 21:43:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458R3H6pzHz9W;
	Wed, 22 May 2019 23:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558561436;
	bh=n97F2YUBmgm/u0lCvJY+phB2szAHT6551L3ge17kM28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXEWqSxEAr0fhpjglCShPZpPzw6zvRLELnb7kc+DpB6eldIxdm/7T9vsShQk2mthy
	R8NIsAgZRytqRDQfz/Hizb9QUqB/L7uRDUp1JhgD8wqq8P1PZGPH/sl+YV6rhEj+zU
	4RU/y16vIFV3w5Bp7L3G/rreR0fx4IoLjHdhwz4IQlpxJVqWfmgsv0izsvPv0GtLMa
	yQ5Km8HeU1IMWQINrzdha8ze8V0zGiY1dVQeDAvS5eJp4Jrt+2kDV9bSJZ5CIu8v7a
	kVj+b/ljxhdmwvpFXdruz42YiGQzCI6qB48Zjd3WP6W0hb1a+V3qh9X2UGR+cxd0gq
	X1SYC8PO22byYe/UNmWVqgzB+Whgxya1DiN4X2mHflklwewDd888TdMZD56sfGladc
	/f1sfVT+7uO60++b3k71+GG7wo/3yZN/rIv8o2yfZ040a1LqQuf0Xt0kHTa2ZVI/hn
	bQ49KMrBSIhwytES9vY3S+JZVWSS8L5M3DwAjFuKbAbLGbNxLl+0bl5bBG0b3mAxlP
	aBhn1XP2CxnNlnDgXfsYrYATLn4+utR6CeQVua5kfFJDyaDpIynnvCIl4b4AC2rt0u
	FO041Jcr4icAIX2IMIKQAnZA3f/hnKoZiHF98+Vdc/4RsYiNBUGsittOGjQqnVfkY5
	R/wd89OBgPlRH49e0/zF62MI=
Date: Thu, 23 May 2019 00:43:53 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190522214353.GA3164@localhost>
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.B6296235353@git.openembedded.org>
	<CALbNGRQ7VT88mxPhnW44pEOHRhGQ_QUg4WORMCyH17Q6KfE8wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ7VT88mxPhnW44pEOHRhGQ_QUg4WORMCyH17Q6KfE8wg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 08/09: networkmanager: Update to 1.18.0
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
X-List-Received-Date: Wed, 22 May 2019 21:43:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 22, 2019 at 10:45:14PM +0200, Andreas Müller wrote:
> On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> >
> > This is an automated email from the git hooks/post-receive script.
> >
> > khem pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 8ac5fe0ca3d32e2cf6be7555c1f84dba9106f96c
> > Author: Andrei Gherzan <andrei@gherzan.ro>
> > AuthorDate: Wed May 22 14:13:45 2019 +0100
> >
> >     networkmanager: Update to 1.18.0
> >
> >     One patch was dropped (0003-dlopen-failure.patch) as a similar one was
> >     merged upstream. See:
> >     https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78a0e64d26459e94ab3b84c91cd6f5f
> >
> >     Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Wanted to do same but did not yet because of [1]: --with-libnm-glib
> was removed. That means
> 
> * PACKAGECONFIG[glib] has to go
> * bbappend in meta-oe has to go
> * maybe glib-2.0 must be an unconditional dependency

glib-2.0 has always been an unconditional runtime as well as an
indirect build dependency.

PACKAGECONFIG[glib] was building the libnm-glib library that had been 
deprecated since NetworkManager 1.0.

> * please check if network-manager-applet builds (that required PACKAGECONFIG[glib]) set in the past
>...

network-manager-applet needs it only for building the libnm-gtk library,
which meta-gnome stopped building 2 months ago.

> Cheers
> 
> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


