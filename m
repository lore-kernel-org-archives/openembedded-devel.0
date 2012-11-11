Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TXh72-0001ft-3g
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 00:38:53 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so3515824pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2012 15:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=v/IYOqUJwfAXchsmvbfI2NJf+Isd2iWmGprGrQEm3JA=;
	b=SYKH7GsqG9m8SxHJV0LamL5sGB8mvRPmX+7JfGja3tBx7L3n0eQWda8WwyDYADoRHV
	en85Rw+K8gobN8DdDDN9XCxkzy5DsS7LWkxgp66quZZVe0YJw28phx7WQZ4qPh8wi/az
	enjVf5jeHzr+UqgQN6m/DsaT717ZqbqJYEiDFGuVH6COtDVLYKmxeYJp3LricjVpuxtO
	RB71hR13S7fDhBeD7v0rMH2Lv8MYf/1MInHbzovnzdClABHe1qdqyzrWwVSEc9zB33KG
	YsyuO+UchhrdqnTGvmFH1HT0MwxGAdoWgAjyaemF7gAybOb9CnFB9IfFkzDElbN78Wwy
	ocVA==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr52043494pbc.130.1352676295418; Sun,
	11 Nov 2012 15:24:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sun, 11 Nov 2012 15:24:55 -0800 (PST)
In-Reply-To: <4701269.Boc8pSq2zM@helios>
References: <12301427.Yf0uchSh3U@helios> <2026428.K88ggMmWnu@helios>
	<20121111201613.GB3407@jama.jama.net> <4701269.Boc8pSq2zM@helios>
Date: Sun, 11 Nov 2012 21:24:55 -0200
X-Google-Sender-Auth: uX67lbaEpEhzub2R9DODi-Z1PtQ
Message-ID: <CAP9ODKoiaAJzAZEcH0doQkNZSXuqaOzM0_rsopLCswR-uHOOAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-core@lists.linuxtogo.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [OE-core] OE-Classic recipe migration status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Nov 2012 23:38:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 11, 2012 at 6:49 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Sunday 11 November 2012 21:16:13 Martin Jansa wrote:
> > On Sun, Nov 11, 2012 at 07:58:09PM +0000, Paul Eggleton wrote:
> > > On Sunday 11 November 2012 20:52:26 Martin Jansa wrote:
> > > > I've noticed quite a few recipes listed here, which does exist in
> some
> > > > layer (recipes mostly from meta-fso, meta-aurora, meta-shr), should I
> > > > remove them from that wiki page or add layer name in 2nd column?
> > >
> > > I did have all the layers in meta-smartphone included in the list I
> used
> > > to
> > > filter this one, so if there are items that somehow didn't get removed
> I'd
> > > like to figure out why. Can you list them here so I can look into that?
> >
> > Ah sorry, you're probably right
> >
> > I've noticed e.g this:
> > libfsobasics  [distro]
> > libfsoresource        [distro]
> > libfsosystem  [distro]
> > libfsotransport       [distro]
> > but those are now provided by single libfsoframework recipe and I've
> > forgot this change
> >
> https://github.com/shr-distribution/meta-smartphone/commit/0298befc97dc5dca2
> > a3721fb0ff9d4caf8d24f84
> >
> > So I'll just update [distro] flag to something like obsoleted by
> > libfsoframework.
>
> Ah ok, sounds good.
>
> > The rest is probably also not 1:1 like qfsodbusxml2cpp-native
> > ./meta-fso/recipes-freesmartphone/freesmartphone/qfsodbusxml2cpp_git.bb
> >
> > Maybe you can try to update scripts to show matches after "-native"
> > suffix strip?
>
> I'd prefer to handle this manually - there are cases when newer recipes
> haven't been BBCLASSEXTENDed to handle -native so I've been checking this
> by
> hand.
>

You might grep for it and match it properly. So it drops a manual step.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

