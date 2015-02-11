Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85DFF732A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:29:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2015 08:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="676406153"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2015 08:29:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: dpquigl <dpquigl@tycho.nsa.gov>
Date: Wed, 11 Feb 2015 16:29:03 +0000
Message-ID: <6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1423669983.23617.78.camel@tycho.nsa.gov>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: meta-selinux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 16:29:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

(Adding yocto@yoctoproject.org to CC since that is where meta-selinux patches 
tend to go at least)

On Wednesday 11 February 2015 10:53:03 dpquigl wrote:
> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> by the yocto project. I'm trying to use it with a base openembedded core
> and its not in sync with oe-core because its based on pokey. 

To be clear, poky and OE-Core are in lock-step. No patch to core recipes goes 
into Poky directly, they are applied to OE-Core and then they flow into Poky 
immediately thereafter (Richard, who does the merging of patches into OE-Core, 
does the sync to Poky immediately afterwards.)

What's more likely happening I suspect is that you are on a newer 
branch/revision of OE-Core/Poky than the meta-selinux maintainers have tested. 
I can't speak to the maintenance schedule for meta-selinux but maybe others 
with knowledge there can chime in.

> This made me think of two questions. 1) Why is this not in OE core since so
> many packages in core can potentially have SELinux support enabled and 2) if
> its not supposed to be in core where should turning on SELinux support
> in a recipe go? For example coreutils can have SELinux support enabled.
> Currently this is in meta-selinux as a bbappend to the coreutils
> package. This works out because its always going to be there. However
> there is also a bbappend for an LXC recipe. LXC isn't in core which
> means it has a dependency on a layer not in core.
> 
> Ideally I would put the recipes needed for SELinux support in core and
> have a distro feature which is checked in the recipes in core for
> whether or not to add --with-selinux to the build flags. Then LXC could
> check a core distro feature and enable SELinux if it wants to.

We have to draw the line somewhere for what to include in OE-Core, and at the 
moment I guess we have considered SELinux to be outside its scope. Obviously 
these things get re-evaluated from time to time, and SELinux is a little bit 
painful for this because of how many recipes it has to touch. Ultimately it 
depends on how many people in the embedded space want to enable and use 
SELinux.

Thoughts from others?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

