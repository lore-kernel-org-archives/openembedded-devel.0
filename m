Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZKTe-0002RB-Sq
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:39:23 +0100
Received: by ywh8 with SMTP id 8so965207ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 00:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DOuXrMCqYRDywVmEzzO0ORTeE5oByDUd9h4IaYbNsSk=;
	b=J+SYUCfu1+xItWcLGmN7jgIM1srnDRWEQekRwznnzKM/kBtpM+xOq6ZIotG5RD1muK
	+UggRrRdIOl3ZDri8BPNeiBdb1b79LC2d5UWhbX1l+cvxJLk28RexOB2SvGvnIoNF+SS
	eVR666E+KooR8+bdYJYQwJM3kkVwkRoZMdwUY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pfe7V5jnE0KjpS+coXVJqcoYyACn9k8tn+5uAJORj/XDf+CA3K3M8pziTYenor8ydN
	JOEpLiVsHFh+jGOQ1Ahr+YicSoU7QXNOfNwv9CMCh30BaDvfFDp1Ba9cmqkWkIVrot7K
	DorIJIdUv97DxwlIJDoXwYTsEiqT8PvmhJHaQ=
Received: by 10.150.47.31 with SMTP id u31mr6167827ybu.334.1264408614859;
	Mon, 25 Jan 2010 00:36:54 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 7sm1641577ywc.36.2010.01.25.00.36.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 Jan 2010 00:36:54 -0800 (PST)
Date: Mon, 25 Jan 2010 00:37:12 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100125083712.GB26355@gmail.com>
References: <20100125081044.GA26355@gmail.com>
	<ac9c93b11001250015h1a8c325fk1eb13229924c40b8@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11001250015h1a8c325fk1eb13229924c40b8@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Remove gcc configure option --enable-target-optspace for powerpc
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
X-List-Received-Date: Mon, 25 Jan 2010 08:39:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/10 09:15), Frans Meulenbroeks wrote:
> 2010/1/25 Khem Raj <raj.khem@gmail.com>:
> > Hi
> >
> > I have run into a problem where compiling libgcc with -Os for powerpc SPE
> > targets caused some symols like _restgpr_Y_x to be referenced in
> > libgcc_s.so.1 due to gcc generating them for out-of-line prologues which
> > happens with Os. But these symbols are defined in libgcc.a so when linking
> > a shared library which uses libgcc we get errors from linker complaining
> > that DSO is accessing a hidden symbol from libgcc.a which is a static
> > archive.
> >
> > I thought we could remove --enable-target-optspace. In general it is only
> > used to compiling the gcc libraries e.g. libgcc libstdc++ etc. in OE
> > context so its not of a much hit on space usage if we let this option go
> > which would mean that these libraries would be compiled with -O2
> >
> > I propose to remove this option for all powerpc and we can still leave it
> > in for other architectures.
> >
> > Does this sound reasonable ?
> 
> What about just removing the option when building libgcc for ppc ?

Yes its possible I guess although wont be as straight forward plus I did
not want to muck with gcc configury when we have options to control it.



> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


