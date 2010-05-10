Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBWFa-0002RX-HD
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 18:54:39 +0200
Received: by pvc30 with SMTP id 30so61964pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NIH5ZFM6jpuOty+/Sgy966OnDiSiwQK0lmvBSnG0s3w=;
	b=blNlEUjnNizPlrArL9prEgSgOMsK4y9fSLDP+xfq4HIAxQqxbcD5u14+FYlO6zOHZB
	DoIKAR19wsz7J+U47KEomVbsXSDAdBZ1Npq0TfWpLI0MYJIDMcJaAGuRkLxKgTd6V2G+
	PpBc/N5ZbM6jRUweb2p0PyPouK6sEjZtuD89Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Cuj/SwnV9l5+jDdfr0Y/BkQsZbPd19qo04VHlWtg1UWPu1OP4gplhwZFQ59C10+5on
	CrRBfXr4yf/hf15VWVopL2CvZb3WhTgaHOUklSEMwRGUthZClHWTjm0GN59R/CSA3+wl
	I1brbQiNNE1AwvVOCgAJDuUp6g8tjGxu/ydSY=
Received: by 10.140.83.37 with SMTP id g37mr2797627rvb.222.1273510244991;
	Mon, 10 May 2010 09:50:44 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o38sm1990819rvp.12.2010.05.10.09.50.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 09:50:44 -0700 (PDT)
Date: Mon, 10 May 2010 09:50:54 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510165054.GC11797@gmail.com>
References: <1273507486.2994.189.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1273507486.2994.189.camel@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Supported Python version for OE?
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
X-List-Received-Date: Mon, 10 May 2010 16:54:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/05/10 17:04), Joshua Lock wrote:
> Hi,
> 
> A question, (perhaps for the TSC?):
> 
> 	"What's the minimum Python version we want to support in OE?"
> 
> According to the wiki we support Python 2.4 and above but I wonder if
> people have any thoughts with regards to bumping it?

I think it was in recent discussions that we now use new 2.5+ features
so it should be bumped for git master atleast.

> 
> The reason I ask is because I had a user contact me about using Python
> 2.5 features (str.partition) in relocatable.bbclass, I hadn't even
> noticed this and seems like not many others have but it's clearly
> affecting at least one person.
> 
> I have a pretty trivial (if ugly) patch to work around this, but it
> raised an interesting question so I thought I'd ask that before sending
> the patch.
> 
> Cheers,
> Joshua
> -- 
> Joshua Lock
>         Intel Open Source Technology Centre
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


