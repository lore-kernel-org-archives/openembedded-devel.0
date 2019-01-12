Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id EC9507C099
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 03:10:49 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 1858928048E; Fri, 11 Jan 2019 19:14:42 -0800 (PST)
Date: Fri, 11 Jan 2019 19:14:42 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
Message-ID: <20190112031442.GW23540@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	"Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR01MB4636DE2DFD81ED5926A24F9F8F840@DM6PR01MB4636.prod.exchangelabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel modules being built, but not being included in image
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
X-List-Received-Date: Sat, 12 Jan 2019 03:10:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 04:49:36PM +0000, Muhlenkamp, Lewis wrote:
> Hello,
> 
> TLDR: How do I get docker fully functional in my openembedded linux image?
> 
> I've been trying to get docker included into my image.  All of my attempts lead to the same error messages appearing in the log file, and docker not starting.
> 
...
> 
> 
> That didn't seem to work either.  The modules always got built.  For example, br_netfilter.ko is built:
> 
...
> 
> But these modules are not included in my image.  
> For example, if I do "find / -name br_netfilter.ko" on my target install, nothing is returned.

Kernel modules are not installed into an image by default; this gives
the opportunity to choose on a per-image basis which modules are actually needed.
Then the same kernel can be used on both a tiny rescue image and a full 
production image. Each image recipe gets to list which modules it actually wants.

The core image recipe is a general one and meant to be lean, so it makes sense for 
this image to not include any modules in its package list. You can either inherit
from it for a custom recipe or use CORE_IMAGE_EXTRA_INSTALL as you have been doing.

If you don't feel like choosing each module, quick fix is to add "kernel-modules" 
to your CORE_IMAGE_EXTRA_INSTALL to ask for all that got built by your kernel config.

--SJLC

