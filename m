Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLmbo-0000Ly-Ey
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 02:24:01 +0200
Received: by pwj4 with SMTP id 4so1599640pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 17:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cpjdwlypcKs9oS3lrijvKnIORQt0r/VDdFBlcM5XOuI=;
	b=iLYcmKc5Bcz/J8rwVhRo/Z1Go10uG8jcND4MUtSG1bLio69RVTJgXbVJ8b3ygYF136
	q6GXVXDQbyj9ZlfrJy7v63sg+0G6uGr7eAMeV8w9DmkxtMthv2DRzV27kL0us1HVXLKl
	maEwPreeO0p6e6nySbeUWgXixx4VhF/2OyLZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wnwYqOX2dlmz45NiuwCTGU7oj+pQHZpXdAyfv+FdO5LILV9uFbQ7XDhOYWZUDEEwkw
	zntDSmzVO5xTp/L9///vSRaMddF/HOKJXGGs0qMcfrTk8CyMdKrniz6Cr45gDqDBz2bw
	zEbrL4rFDtHPXXkPqciMB7nhLHXeJb3LfPIK8=
Received: by 10.142.117.14 with SMTP id p14mr11145206wfc.144.1275956378914;
	Mon, 07 Jun 2010 17:19:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 21sm3450823pzk.12.2010.06.07.17.19.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 17:19:38 -0700 (PDT)
Date: Mon, 7 Jun 2010 17:19:41 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608001941.GA26738@gmail.com>
References: <4C0D498A.4030709@mentor.com>
	<AANLkTil8i1-1ie4msx9B09WeJ5ggquP7WisRIyWKMUpx@mail.gmail.com>
	<AANLkTil27vjcFzRuEIAZp6rEYY7xq2_ozqdU_QdjtEWI@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTil27vjcFzRuEIAZp6rEYY7xq2_ozqdU_QdjtEWI@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default dep for native
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
X-List-Received-Date: Tue, 08 Jun 2010 00:24:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/06/10 14:31), Chris Larson wrote:
> On Mon, Jun 7, 2010 at 2:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On Mon, Jun 7, 2010 at 12:33 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > > On some host distributions the provided linux kernel headers are too old
> > > to compile utilities we need[1].  Given that we need these utilities to
> > > run things on the target the best solution is to provide
> > > linux-libc-headers-native.  Rather than get things into an inconsistent
> > > state, we make linux-libc-headers-native be a default dependency.
> >
> > could it be made optional so people who use distribution where this is not
> > needed are not penalized.
> >
> 
> You mean like ASSUME_PROVIDED += "linux-libc-headers-native"?

heh sure,I had that in mind but I was thinking if it was otherway around
where the distros which new these headers have to specify to include them
and not the ones which already have them.


> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


