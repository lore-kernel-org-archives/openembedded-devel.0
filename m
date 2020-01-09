Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EE0157FD4E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 08:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47tf5s1wpcz4K;
	Thu,  9 Jan 2020 09:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578557649;
	bh=nrmBmY+C2uKZzTmg6NbwlT6jVOUJbxNaswPU4JEq3A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgZQ7J/YW8qr3DBCNA8qTnn1omtZ+HQ79vg9p061A/3Nv6gCcabRPPt5jdIm2CDXD
	LSGCvBdbX5zUfITZZo4As2JCU3zlzJSEPgsxw5kAnAH7p8oPI5NK58DSupOHQLGHve
	sMHOtH9vtPV0hfgrexM1ppVScS/qG3wK4+he8RpLV35ebNsCRrFfiOFkapxsfq/8HY
	/Uu+jXCRrGtgpkQSNSutRd14+TvX4M/bDmRZ0e41SZoNluVvLc2Rs+AP/A9o5Xzg7V
	Y2EXWAuYH17PbwfKCzVyHI72mQfeooMlW8+2dZklK8y6o9QH5E3jbguNOwnSBUHa/j
	XNoJQW5ADcfUJz5Gi+EVJkGxTqj/LF+pLNaB0gE/FL1Gu7KOhLLbban5DEvG2LXH1z
	yA+8APCrMQVmeyeAiHk2TxcrbBKVvS7U7Fk2kT9rhSbXM56FXnw+cCGtAc9M2tajfD
	IaWvVeLqPRI0R+++IP+GRJbllttSuK+wCkmlNSgm5NrZYcEV9SJrsTDQQW4A3oS5nd
	dhotgid0OrZQI2dGAfESaEJC1Bhns5KURte0VBMaKHVOZEiANIT517XupTiEivNo/J
	mtgexIGnNhBLZH7TnI9fqxIBAIl2if5AOHjUwHMBh3QHu+Cq0SATKGNFlz6Rmt+o7o
	KueWKHr/DqKFPFfb2wETY+rM=
Date: Thu, 9 Jan 2020 10:14:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20200109081406.GA6849@localhost>
References: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
	<20200108092700.GA25926@localhost>
	<133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
MIME-Version: 1.0
In-Reply-To: <133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
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
X-List-Received-Date: Thu, 09 Jan 2020 08:14:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 09, 2020 at 03:13:57PM +0800, Robert Yang wrote:
> 
> 
> On 1/8/20 5:27 PM, Adrian Bunk wrote:
> > On Wed, Jan 08, 2020 at 02:09:03PM +0800, Robert Yang wrote:
> > > Fixed do_compile error when DEBUG_BUILD = "1":
> > > db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > ...
> > 
> > -Og warnings are not 100% reliable, and in general -Werror is
> > problematic for distributions.
> > 
> > Does building with -DFAIL_ON_WARNINGS=OFF fix this problem?
> 
> Yes, it works.
> 
> I think that the correct way to fix it is initialize it rather than ignore
> the error.

Is the error a bug in the code, or is it a bogus warning from the compiler?

When the warning happens only with -Og this is a known case of bogus 
warnings in gcc, and the correct way to fix it is to ignore the bogus
warning.

> // Robert

cu
Adrian

