Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id C80E36FE5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 20:38:57 +0000 (UTC)
Received: from [99.240.204.5] (port=58370 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X644Q-0003nY-I5 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jul 2014 16:38:58 -0400
Date: Sat, 12 Jul 2014 16:38:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CABcZAN=Qg5nqW=52SvHQ0F_jmp7Ktx6-0yq7HD8gZ1A6aAQQ_Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407121636400.29303@localhost>
References: <alpine.LFD.2.11.1407120725360.20531@localhost>
	<CABcZAN=Qg5nqW=52SvHQ0F_jmp7Ktx6-0yq7HD8gZ1A6aAQQ_Q@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: is it "PROVIDES =" or "PROVIDES +=" for setting an alternate name?
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
X-List-Received-Date: Sat, 12 Jul 2014 20:39:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 12 Jul 2014, Christopher Larson wrote:

> On Sat, Jul 12, 2014 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
> >   i notice that the OE-core codebase likes to mix these two forms of
> > using PROVIDES. for instance, for a number of libraries to provide
> > their basename, i see stuff like:
> >
> > recipes-graphics/xorg-lib/libxmu_1.1.2.bb:PROVIDES = "xmu"
> > recipes-graphics/xorg-lib/libice_1.0.8.bb:PROVIDES = "ice"
> > recipes-graphics/xorg-lib/libxdamage_1.1.4.bb:PROVIDES = "xdamage"
> > recipes-graphics/xorg-lib/libxfont_1.4.7.bb:PROVIDES = "xfont"
> > recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb:PROVIDES = "xdmcp"
> >
> >   on the other hand, there is the occasional example of the same thing
> > that uses "PROVIDES +=" instead:
> >
> > recipes-support/libpcre/libpcre_8.35.bb:PROVIDES += "pcre"
> >
> > is there a deliberate distinction made in the recipes between these
> > two forms?
> >
>
> I don't think there's ever a valid reason to not use +=, unless it
> explicitly wants to remove something. That said, bitbake hardcodes
> addition of ${PN} to the PROVIDES list regardless of what the recipe
> says, so I expect from a practical perspective there isn't a
> difference. That said, I do think they should be switched to += to
> more accurately reflect the intent, and to improve future
> compatibility (e.g. if the default PROVIDES in bitbake.conf were to
> change).

  ok, i'm good with that, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

