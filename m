Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EAD196BA9D
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 09:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Rwws1wj0z4q;
	Tue,  3 Dec 2019 10:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575363757;
	bh=p2aek6HCR1+YGUYON9NHlSoPc1vbmMUqtbNAIdlxzaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWgoiXKczywXKlox2CMZgVRapPzAdFNIxvVxKvAydD3NQ14xrFCBtbFZR9G6l4Xt6
	COmb2/ScuI4Kd/bHUbV472A/r5b8VgbKUMDNA1JWaEYYbxDWIgz6d/CQOsTOIeWWUr
	Mt10ypgEt14XGgaW81dQJAXfY9xyZGnOoivYTprFarakufxm9yYabZQUwQPHCgScPN
	J/EDG712pqfEdIHJeyCNz41HRQ1Hz1CsdG3HPl1WJNmrv0q2eVnVAGUpLZPM/PSwxF
	33sVkkZFIGqbpQ3Mn+9KVmLdHUVQt2C7hUl/NS5zIG6f+L5kTsgjGJ7QkvkEwEzAXl
	rrAa5a4iDUj4JmoeraQG80NQMFS63jMigFnEdVcsHTZo7zAXJ7PLS1xqgRG+h7n8sL
	qXZup908b3KlziOHm2rWiMcz4MtnL8gY0tKPOr07pvHcYqxIypc4OW079IcJBgTicp
	qh9vGdEb0InqI4kzsUdfNWhjh3oKOi+wyQY9OM47FL+cAEpRrVQP5bfi2d6itbAvOU
	WeVUKwVGVh+gtlb2epl3t91/hhaa4+ult6wOxDLOXmWzRCEJVlYQJadmgwAUZNgipM
	0slPxJ29dselPK8xTDC9gp5ZsQEsDCaLzsQgXlC4dsAcsbLUTUBp1RxGRkrEhnn9ax
	jjE6f5n0xLp9tBBUGQMh+1rY=
Date: Tue, 3 Dec 2019 11:02:35 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20191203090235.GA14760@localhost>
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
	<CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
	<CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Tue, 03 Dec 2019 09:02:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 02, 2019 at 08:10:17PM -0800, Tim Orling wrote:
> On Mon, Dec 2, 2019 at 8:07 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > Thanks
> >
> > It would be nice to delete all branches except master. Only master branch
> > makes sense now for meta-python2, right?
> >
> > " The stable branches were also kept, to make it easier to refer back to
> prior history
> and allow developers to use meta-python2 only in their workflow."
> 
> I can see use cases where a developer may want to replace meta-python with
> meta-python2 and still be on a "stable" release. It also makes reviewing
> what existed in which release much easier with cgit or git log --oneline,
> which I do VERY frequently. If this is contentious then the OE-TSC will
> make the decision.
>...

Martin beat me since I was about to make the same comment.

Adding a layer with contents that in the best case duplicates what is 
already in another layer (and in the worst case is broken) only creates 
confusion.

Replacing meta-python with meta-python2 sounds like a weird usecase,
and LAYERDEPENDS from layers like meta-multimedia or meta-networking
usually do not even make it an option to not include meta-python.

In practice the most common case where meta-python2 would be included in 
a zeus or earlier distribution would be when someone includes both the 
meta-python and meta-python2 layers.

cu
Adrian

