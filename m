Received: from mail-qy0-f193.google.com ([209.85.221.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NtlsB-0005Ry-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 18:57:12 +0100
Received: by qyk31 with SMTP id 31so1699513qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=bmd1LNSz90ZjtNAKPPkhqFPtETn/gO2s2gMeWi6vBh0=;
	b=RFA74UKw1D5tyRzX2nMOJH+PLv+2zPLSD8rSDfPmC1nmsHKqCPZpBa45XwC47/DL6r
	jhEP4I0pWOVKDNRRVA6GjBFe0LI+5fjfCs5N+gAyI+rxZqNO3hxGRFk5LQyqZoT4zPyy
	BpMp1EFGtCPEfnaFgEutcQwPzhdiJlqde/Gpk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BMkqLvX5R7/v4rzWlIDKSTUD4mzeHaGzIhExMAVbxG1TUo2/CWvnqGfNln111oO5zv
	iuZGaffZXnq4H0pGjjbyiP8XCQkpAdRmojxLh2grF0YHr5uJWs0Rh/hHjK5jB8RpOqNF
	atl43JiWvtGsEAjN+KmyTVlpxiCJC7tg7kox0=
Received: by 10.224.91.202 with SMTP id o10mr362497qam.175.1269280439190;
	Mon, 22 Mar 2010 10:53:59 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 5sm818182qwg.38.2010.03.22.10.53.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Mar 2010 10:53:55 -0700 (PDT)
Date: Mon, 22 Mar 2010 10:53:58 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100322175358.GA10417@gmail.com>
References: <4B9E1C0D.5050806@dresearch.de> <20100321081236.GA6455@gmail.com>
	<4BA720E0.10806@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BA720E0.10806@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.221.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc atomic instruction support for armv5te
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
X-List-Received-Date: Mon, 22 Mar 2010 17:57:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/10 08:48), Steffen Sledz wrote:
> Khem Raj wrote:
> >> As mentioned before i try to create a recipe for rsyslog.
> >>
> >> Now i hit the next big problem. The last item at
> >> http://www.rsyslog.com/doc-build_from_repo.html says that
> >>
> >> "The availability of atomic instructions is vital for rsyslog"
> >>
> >> The gcc version 4.3.3 which is used for armv5te by default
> >> misses this. :(
> >>
> >> Is there a newer gcc version with atomic instruction for armv5te
> >> machines available/tested? I heard rumors that 4.4.3 shell
> >> have it?
> > 
> > yes 4.4+ should have them as intrinsic functions.
> 
> Unfortunately angstrom uses 4.3.3 by default.
> 
> Is it possible to build just this one package with a newer gcc?

though its possible I wouldnt go for having a different gcc for one package
is there an older version of rsyslog which does not use the intrinsics ?
you might also look at backporting intrinsics to gcc 4.3 which might be a
bit hairy

> 
> > Which ones are needed by rsyslog ?
> 
> __sync_fetch_and_sub
> __sync_fetch_and_add
> __sync_fetch_and_or
> __sync_fetch_and_and
> __sync_sub_and_fetch
> __sync_lock_test_and_set
> __sync_bool_compare_and_swap
> __sync_val_compare_and_swap
> 
> Steffen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


