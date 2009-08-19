Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1MdmPC-000178-7D
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 16:44:53 +0200
X-AuditID: 0a1e000a-b7ba8ae000000dd5-96-4a8c0bd9b769
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200908190517.21656.holger+oe@freyther.de>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
	<200908190517.21656.holger+oe@freyther.de>
Date: Wed, 19 Aug 2009 10:26:59 -0400
Message-Id: <1250692019.6785.61.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Wed, 19 Aug 2009 14:44:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-08-19 at 05:17 +0200, Holger Hans Peter Freyther wrote:
> Have you seen this:
>    http://docs.openembedded.org/usermanual/html/commonuse_prebuilt_toolchain.html#id388796
> 
> 
> does it help in any way? To be honest I'm still missing how you try to create 
> the image and if you rebuilt glibc or application or such..
> 
> 	z.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Yes, but I get the sense (perhaps wrongly) that these directions are a
bit out of date since they don't mention the meta-toolchain or
external-toolchain. I'm trying to both build and use a toolchain
entirely within OE.

I have a feeling that Phil's suggestion to look into what's going on
with pkgdata is the right approach since I think a few things were
slightly out of place there when I started to work on this.

--Chris Conroy


