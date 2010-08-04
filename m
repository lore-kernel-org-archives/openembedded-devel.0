Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgWov-0002dc-8R
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 07:47:18 +0200
Received: by bwz10 with SMTP id 10so2643283bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+syFX4c1im8zbOb7lBR4P0ls3bZjwyEmjQeJwKDTEvI=;
	b=hnJVwL9bPAOeo4K5ML7BM+ThR6i6nYOGySCxue/xYX7OG+HxgqfqEaik44FVOdii+C
	KIcEP1lWKKjLoYhL6CWRqoGzihJcLCRDOiPYiujcMk/cEb/x2Tangy8o9Pyj/5DBfu0x
	PKW5rt5B1FK2NtsMWxzqv+dl+AHSZ2HKnjYQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MHigjxu2Nz1YutTkj2duDoKNzZEQ/PqyjcCcleHP5g9ZLXA49rF0pMXdgJQy6VTyam
	gBs2UO/QWrSOYPlrPUvChgMopIMxUGIB8atB2bUaT4Ry18BKOliIqR3NFFFyJ9UjjgbJ
	mHpAM+7wKeIbWV8jenl9aqF1CT03z+o9EgWMQ=
MIME-Version: 1.0
Received: by 10.204.82.200 with SMTP id c8mr5924159bkl.102.1280900831011; Tue, 
	03 Aug 2010 22:47:11 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 22:47:10 -0700 (PDT)
In-Reply-To: <20100804001040.GE17391@denix.org>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
Date: Wed, 4 Aug 2010 07:47:10 +0200
Message-ID: <AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 05:47:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Denys Dmytriyenko <denis@denix.org>

>
> >
> > First collateral damage - libxcb was broken, due to xcb-proto.inc having
> > do_stage(). Worked with Khem to find the cause and thanks for pushing the
> fix:
> >
> >
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b0061845a60d7781f9287ae6955585485f5ba8e9
>
> BTW, just wanted to mention - if corresponding PRs had been bumped, it
> would
> have been spotted sooner and not only by people with clean TMPDIR... :)
>

Thanks for noticing and fixing.
Actually to some extend xcb was at fault. Having both the recipe and the
.inc file define a do_stage is no good I'd say (and it would be nice if the
tools would capture this and emit at least a warning, but preferably an
error).

Wrt the PR bump, it was my understanding that the cross patches from Khem
would require cleaning of tmp anyway. It was requested (in the cross patches
thread) to apply this before the cross patch so we would be on a clean slate
anyway.
(and yeah, the patch was generated automatically, and manually adding some
500+ recipes to bump PR is somewhat labourous).

Anyway, apologies for the inconvenience. Hope this is the only recipe
causing an issue.

Frans.

