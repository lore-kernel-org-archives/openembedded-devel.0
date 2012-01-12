Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RlU9Z-0008SF-3Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 00:33:53 +0100
Received: by wgbdt11 with SMTP id dt11so2419556wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 15:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=6RWYh1kgyQCnt2x+hZH5kKjuBTUhUVQoVrC1djR+6DA=;
	b=kvxt/3UHO/Rj1AwL2nr7qVLfMV4l8Uqt4TqpDHCZDzrHTL9OYShIp2OT80c6IeOqqJ
	0Rm0j73ZANjdagB3QgXWD2Ird/eR4MtVQ1RljZ7c5I/DvihmrdWn5meQAkFnRPbCGDC8
	N+DA+X1nuUV406X6Rr8tIKtyZXHKcnYkSj3C8=
MIME-Version: 1.0
Received: by 10.180.101.40 with SMTP id fd8mr10184993wib.15.1326410781326;
	Thu, 12 Jan 2012 15:26:21 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.155.209 with HTTP; Thu, 12 Jan 2012 15:26:21 -0800 (PST)
In-Reply-To: <jemqcg$1q0$1@dough.gmane.org>
References: <jemqcg$1q0$1@dough.gmane.org>
Date: Thu, 12 Jan 2012 17:26:21 -0600
X-Google-Sender-Auth: PmeQBNVFIE42IPVfo8TRbY-r3lQ
Message-ID: <CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Thu, 12 Jan 2012 23:33:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 8:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> tl;dr version: get your subject-prefix right
>
> Hi,
>
> I've cleaned up patchwork by marking every meta-oe patch as archived, minus
> the one Martin just sent.
>
> This means all the pending patches for meta-oe are listed here:
>
> http://patches.openembedded.org/project/oe/list/?q=meta-oe
>
> If your patches are missing, resend them using the method outlined in the
> README of the respective meta-openembedded layer.
>
> I'll include the meta-oe one below, since too many patches still don't comply:
>
> - ---------------------------------------------------------------------------
>
> This layer depends on:
>
> URI: git://git.openembedded.org/openembedded-core
> branch: master
> revision: HEAD
>
> Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
>
> When sending single patches, please use something like 'git send-email -1
> - --to openembedded-devel@lists.openembedded.org --subject-prefix meta-oe'
>
> You are encouraged to fork the mirror on github
> https://github.com/openembedded/meta-oe/ to share your patches, this is
> preferred for patch sets consisting of more than one patch. Other services
> like gitorious, repo.or.cz or self hosted setups are of course accepted as
> well, 'git fetch <remote>' works the same on all of them. We recommend
> github because it is free, easy to use, has been proven to be reliable and
> has a really good web GUI.
>
> Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
>
> - ---------------------------------------------------------------------------
>
> The most important thing of that is the subject prefix. I only read emails
> with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
> http://patches.openembedded.org/project/oe/list/?q=meta- more often than
> oe-devel.
>
> So: Get your subject-prefix right
>
> And kudos to Andreas, Martin and Otavio for getting their pull requests
> right pretty much all the time.

While I appreciate that a blanket "throw it out; if they care they'll
resend it" approach is an effective way to deal with the backlog
resulting from an absence, I don't appreciate that in addition to the
time I spent crafting patches to improve oe-core and submitting them
(with the right prefix AFAIK), I am now expected to do so again.
Further, the archived discussion of one of my patches included a
request for clarification on how to address a licensing issue which
was never answered, and which now presumably never will be.

This sort of practice discourages people (well, me at least) from
contributing to this project.

Peter

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk8O7MoACgkQMkyGM64RGpFPUgCfQlCodSyFbuqPSfY6PVL2cPsR
> YE8AoIRcwaHFCyvULMbFSH3PeFY8Fjmj
> =cU1X
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


