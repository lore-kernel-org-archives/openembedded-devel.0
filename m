Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7FAC17F9B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:01:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47tg8C2jRcz1n;
	Thu,  9 Jan 2020 10:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578560475;
	bh=VHpdwvMsM6PiMdWFmyAngumh/Y8p0UdziRcvIX6T+ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPZSAb3OuErJVs9rWMO0ebKd+zAgML+LcSegD7kE5uHQW4MEsfp+6gYIGiMgx1wTj
	3nY5OqUfwQexpuLLlxkCAD1PCY54E/1POrSpKzpxB0W2Bw7BGSs34hhlvcIveeeE6m
	wrtWaLciQDrf1oKzUEl3jmj5haCCGxQMhbWcP7WSkAYr1lS+/rieM/yLNRiMtDUNoJ
	tzls/RyVYK9snn8eOQr8/Sd4rLybOfoaR2i9AtLtPXwVwEtQOMSA7rXgpDMQsfZZ4I
	QLL9q52ZmLtFJ+GJbFkOxaVf09Q/MnXPCbyYWOL8KF+46nQjZvp4M9r+IfP4bpYI6X
	ECoqVmo9Z54jQ6tHbqpWfvZifXXjKnHiKbGWoiCn9y85IO+p8hFojm+j4grqkTkMb+
	Z8dfAoqXHlkk0H0w0HBb/lpMLErxJDPn7aLiBh6KBDRAucLQmAV6AXPxvj55gu+MJe
	H39ty1yx2b9l38BxJZo2jBqAY7iLRx1eHbgWg6ImBcPA6HCQ+YRro7t8ujeW+u1Wtx
	p8qOla7vNQ45DIMYj9EK9WMrugc2yS9am8ThoOHgHsgofE7aze+D3PhJd443QtUfT+
	Wyf958z98hqIk2F9qGD3KiQdPngwxQdTyRnw3yOfrZVlGCGtuzCIycjjmxiNg9EXDa
	IvLLtjJDjQugMocdVUWO2UKM=
Date: Thu, 9 Jan 2020 11:01:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20200109090112.GA26602@localhost>
References: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
	<20200108092700.GA25926@localhost>
	<133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
	<20200109081406.GA6849@localhost>
	<aae96c30-db44-b4ef-9c4c-ec44088e18ee@windriver.com>
MIME-Version: 1.0
In-Reply-To: <aae96c30-db44-b4ef-9c4c-ec44088e18ee@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rocksdb: Fix compile error for DEBUG_BUILD
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
X-List-Received-Date: Thu, 09 Jan 2020 09:01:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 09, 2020 at 04:30:41PM +0800, Robert Yang wrote:
> On 1/9/20 4:14 PM, Adrian Bunk wrote:
> > On Thu, Jan 09, 2020 at 03:13:57PM +0800, Robert Yang wrote:
> > > 
> > > 
> > > On 1/8/20 5:27 PM, Adrian Bunk wrote:
> > > > On Wed, Jan 08, 2020 at 02:09:03PM +0800, Robert Yang wrote:
> > > > > Fixed do_compile error when DEBUG_BUILD = "1":
> > > > > db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > > ...
> > > > 
> > > > -Og warnings are not 100% reliable, and in general -Werror is
> > > > problematic for distributions.
> > > > 
> > > > Does building with -DFAIL_ON_WARNINGS=OFF fix this problem?
> > > 
> > > Yes, it works.
> > > 
> > > I think that the correct way to fix it is initialize it rather than ignore
> > > the error.
> > 
> > Is the error a bug in the code, or is it a bogus warning from the compiler?
> > 
> > When the warning happens only with -Og this is a known case of bogus
> > warnings in gcc, and the correct way to fix it is to ignore the bogus
> > warning.
> 
> I checked the code, it won't be used before uninitialized. But I still think
> that assign it an initial value is better than ignore the warnings, there
>  might be other vars really have this issue.

Silencing a warning can be worse than ignoring it.

The first question should be *why* a variable has this problem.

Often the problem is that something is wrong with the code that was 
supposed to set the variable, and just setting some default might
also result in misbehaving code - only the warning is no longer
visible hiding the problem.

From a distribution point of view it does not make sense to fix random 
warnings in the old codebases of the few upstreams that default to 
-Werror while noone cares about warnings indicating actual problems
in all the other recipes - -Werror is a very useful tool for upstream
but mostly pain for distributions.

> // Robert

cu
Adrian

