Received: from [209.225.28.227] (helo=mxsf27.cluster1.charter.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <erik@hovland.org>) id 1GYlHZ-0003wO-N7
	for openembedded-devel@openembedded.org; Sat, 14 Oct 2006 17:18:37 +0200
Received: from mxip27a.cluster1.charter.net (mxip27a.cluster1.charter.net
	[209.225.28.184])
	by mxsf27.cluster1.charter.net (8.12.11.20060308/8.12.11) with ESMTP id
	k9EFBvhs022441 for <openembedded-devel@openembedded.org>;
	Sat, 14 Oct 2006 11:12:02 -0400
Received: from 24-205-43-70.dhcp.gldl.ca.charter.com (HELO charter.net)
	([24.205.43.70])
	by mxip27a.cluster1.charter.net with SMTP; 14 Oct 2006 11:11:52 -0400
X-IronPort-AV: i="4.09,311,1157342400"; 
	d="scan'208"; a="1788832509:sNHT226952114"
Received: by charter.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Sat, 14 Oct 2006 08:11:51 -0700 (PDT)
Date: Sat, 14 Oct 2006 08:11:43 -0700
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org
Message-ID: <20061014151143.GA15562@hovland.org>
References: <698474498.20061013195107@gmail.com>
	<20061013173454.GA25324@mage.jpl.nasa.gov>
	<137495124.20061014162300@gmail.com>
Mime-Version: 1.0
In-Reply-To: <137495124.20061014162300@gmail.com>
User-Agent: Mutt/1.5.11
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 15:18:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 14, 2006 at 04:23:00PM +0300, Paul Sokolovsky wrote:
> > On Fri, Oct 13, 2006 at 07:51:07PM +0300, Paul Sokolovsky wrote:
> >> 2. "pxa" there is misleading, as 2.6 tree supports different
> >> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
> >> (Samsung) devices. To the various degrees, but that's improving.
> 
> > Technically, the pxa is not misleading per se. That recipe only builds a
> > kernel for pxa devices.
> 
>   Well that's why I brought this to discussion. By "only builds" do
> you mean the current state of affairs or some inherent constraint on
> that recipe?

An inherent constraint of the recipe is that it will build a kernel
which will only run on h3900 and h5400, which are pxa devices, h3600
cannot run a kernel built with the recipe. That is traditionally why we
named the recipes -pxa and -sa.

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request


