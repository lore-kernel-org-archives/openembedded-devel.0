Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mdn6B-00089h-PL
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:29:16 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 740C91B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 15:15:54 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 17:11:22 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250176750.29049.1003.camel@conroy-linux>
	<200908190517.21656.holger+oe@freyther.de>
	<1250692019.6785.61.camel@conroy-linux>
In-Reply-To: <1250692019.6785.61.camel@conroy-linux>
MIME-Version: 1.0
Message-Id: <200908191711.22652.holger+oe@freyther.de>
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
X-List-Received-Date: Wed, 19 Aug 2009 15:29:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 19 August 2009 16:26:59 Chris Conroy wrote:
> On Wed, 2009-08-19 at 05:17 +0200, Holger Hans Peter Freyther wrote:
> > Have you seen this:
> >   
> > http://docs.openembedded.org/usermanual/html/commonuse_prebuilt_toolchain
> >.html#id388796
> >
> >
> > does it help in any way? To be honest I'm still missing how you try to
> > create the image and if you rebuilt glibc or application or such..
> >
> > 	z.
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Yes, but I get the sense (perhaps wrongly) that these directions are a
> bit out of date since they don't mention the meta-toolchain or
> external-toolchain. I'm trying to both build and use a toolchain
> entirely within OE.

meta-toolchain is a bit irrelevant as this page doesn't care for where the 
toolchain comes from, you are right about the external-toolchain part and the 
documentation needs to be updated. ASSUME_SHLIBS will still help you to hint 
OE which package contains libc6.so

regards
	holger


