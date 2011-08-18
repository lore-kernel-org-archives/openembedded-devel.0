Received: from fed1rmfepi103.cox.net ([68.230.241.134])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <housel@acm.org>) id 1Qu7AE-0002d0-3V
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 20:18:00 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmfepo202.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110818174825.IBFE21362.fed1rmfepo202.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 13:48:25 -0400
Received: from expanse-fc64.housel.dyndns.org ([70.187.191.250])
	by fed1rmimpo03.cox.net with bizsmtp
	id MtoE1h00P5QcEoe04toRZa; Thu, 18 Aug 2011 13:48:25 -0400
X-CT-Class: Clean
X-CT-Score: 0.00
X-CT-RefID: str=0001.0A020207.4E4D5069.013D,ss=1,re=0.000,fgs=0
X-CT-Spam: 0
X-Authority-Analysis: v=1.1 cv=WGs1gEUVXZUJrUDQB/yCRT/nuRGGBX4laugbTQfpMGY=
	c=1 sm=1 a=YF_Kx5e5mTUA:10 a=kWQ6D_09QQAA:10 a=IkcTkHD0fZMA:10
	a=xqWC_Br6kY4A:10 a=LOs0VYpzTwivkXMu4ZAcfg==:17 a=2Aa9k38lAAAA:8
	a=WwwFOpnPnDGs__CM-AoA:9 a=05WiAKsrI3DhZZsicQMA:7 a=QEXdDO2ut3YA:10
	a=LOs0VYpzTwivkXMu4ZAcfg==:117
X-CM-Score: 0.00
Authentication-Results: cox.net; none
Received: from [IPv6:::1] (expanse-fc32.housel.dyndns.org [10.0.0.164])
	by expanse-fc64.housel.dyndns.org (8.14.4/8.14.4) with ESMTP id
	p7IHmNXg004960 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 10:48:23 -0700 (PDT) (envelope-from housel@acm.org)
From: Peter Housel <housel@acm.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110818131043.GC26690@golden>
References: <20110818131043.GC26690@golden>
Date: Thu, 18 Aug 2011 10:48:04 -0700
Message-ID: <1313689684.7918.2.camel@eng-phousel-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Thu, 18 Aug 2011 18:18:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2011-08-18 at 15:10 +0200, fabian büttner wrote:
> Hi,
> 
> I am having troubles compiling the Angstrom SDK.
> 
> I used the angstrom-setup-scripts to configure OE, sourced the
> environment settings and built the base-image/console-image with bitbake.
> 
> While trying to compile the meta-toolchain, just when bitmake finishes
> downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an error 
> output like this:
> 
> http://pastie.org/2390409
> 
> After that, I tried building the meta-toolchain(i did a bitmake clean
> meta-toolchain) without '-j2' but the error I receive is ultimately the same:
> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> * for task-sdk-bare:
> *   libstdc++-dev * 
> * opkg_install_cmd: Cannot install package task-sdk-bare.
> 
> Unfortunately I am too unexperienced with OE/Angstrom to fix bugs like that.
> Maybe someone could give me a hint how to get around this show-stopper?

I can confirm that I've been seeing this as well on recent
2011.03-maintenance, but haven't had a chance to troubleshoot the root
cause yet.

-Peter-




