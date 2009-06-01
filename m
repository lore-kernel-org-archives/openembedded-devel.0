Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBAyN-0008GT-QN
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 19:06:56 +0200
Received: (qmail 19809 invoked from network); 1 Jun 2009 16:58:10 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 1 Jun 2009 09:58:10 -0700
Date: Mon, 1 Jun 2009 09:58:09 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@openembedded.org
Message-ID: <20090601165809.GZ23842@smtp.west.cox.net>
References: <gr7nfd$32a$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gr7nfd$32a$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 17:06:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 04, 2009 at 03:31:25PM +0200, Koen Kooi wrote:

> Hi,
>
> For beagleboard I have a few things I need to rebuild everytime the  
> kernel changes:
>
> * powervr kerneldrivers
> * sdma kernel module
> * dmai kernel module
> * codec-engine
>
> And I have roughly two kinds of kernel changes:
>
> 1) version upgrade (e.g. 2.6.29 -> 2.6.29)

Based on the rest of the email, I assume you mean 2.6.28 -> 2.6.29

> 2) config changes (e.g. enable ethernet bridging)

So, by coincidence I had this thread around still.  For (1), you already
have kernel-abiversion, but maybe we need some helpers to make this more
useful?  For (2) that's not true unless you're changing one of the
variables that actually changes the running kernel abi (which isn't
caught in kernel-abiversion file).  This shouldn't be a frequent
operation.  There is, I suppose a 3rd problem which would be within
version API changes, for new and in-progress features.  This I'm not
sure we need a complex mechanism around for.  Use/publish WIP stuff,
make sure users understand it's WIP and bump PRs as needed, manually.

-- 
Tom Rini


