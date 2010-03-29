Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NwJ1l-0006PO-S6
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 19:45:30 +0200
Received: by pwj5 with SMTP id 5so3099611pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OfjQ3p0YSeROOTtaJWwpqhk0OLrs9g4UBfTkHH+1Za8=;
	b=FFZXuILvkNb1jhRsDWCEEWo446WZRW2GfbV3GKjj4uA0rRwi9sn8mS647gZyhgZj92
	w1Y4Ib4m06z9eGH5+zrinCue3AJgu0LKYUp8cVy6fXXcnUmyzmu8ph8+7pr72euG0OPY
	AhI5aof1xn3nqySIIEkzeg9BGwPd4Ve81BBAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LZUiI+LH7UNcpBBlFLvKr0TpeS805kf4mcPazhdrulRu8KNvzgcTPhktNKCh7dqJo/
	T7d9jRjkJEiuBoGgxjz90kVaA01jqs2Dl/erKXJgaw1vQGeusz/CASgvQQwlyqXMM+7f
	nAR3gHw2yQXzr4eHIGDGjYwpaeeECohmEL/J4=
Received: by 10.141.12.6 with SMTP id p6mr4702495rvi.195.1269884534789;
	Mon, 29 Mar 2010 10:42:14 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 36sm1073927yxh.50.2010.03.29.10.42.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 29 Mar 2010 10:42:13 -0700 (PDT)
Date: Mon, 29 Mar 2010 10:42:53 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100329174253.GC25428@gmail.com>
References: <1269878004.1681.331.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1269878004.1681.331.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Standalone gcc library builds
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
X-List-Received-Date: Mon, 29 Mar 2010 17:45:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/03/10 16:53), Richard Purdie wrote:
> Hi,
> 
> We currently build gcc and all its runtime libraries as part of at least
> "gcc-cross", "gcc", "gcc-cross-sdk". Packaging of these libraries varies
> between the different recipes and is a pretty scary place for things to
> go wrong which I've frequently seen.
> 
> I'm working on the idea of having the above packages just generate the
> compiler binaries (host tools) and having a "gcc-runtime" package which
> builds all the libraries (target libs). I think can make this work
> expect for libgcc itself which is proving a real pain (unsurprisingly).
> 
> For libgcc, we can save the bits it needs from the gcc build into
> staging and then make it build that way, or just build it as a special
> case as part of gcc, stash it in staging, then package it as part of
> gcc-runtime.
> 
> Does anyone have any better ideas of experience of playing with libgcc?

I have had gcc build all runtimes libraries separately. I think we should
device gcc build and we can disable building certain directories via
--disable-<dir>. We dont have to stash libgcc. Its not a big library and
its probably better to rebuild it along with rest of runtime libraries IMO
and probably we should have packages for each language runtime so people
who dont need C++ or Java or fortran dont have to build those. The same
should be tunable in gcc builds too.

> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


