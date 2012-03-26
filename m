Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCBuY-0001G1-SV
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 17:32:47 +0200
Received: by qatm19 with SMTP id m19so2508179qat.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+SVn5DyeOig7LW4D6jCSbhH9cnmcWbbem2PMeg6lY98=;
	b=C8YhoHuTf+gbuOxhLG2tCducv5r9SB0DGfnp0LL3PjEFmSVAnH26F4uRM4LP8fAeR4
	+i01TSoqwvqI2ruFGC4EaAYVPCII9iIfZXOhWvkShrvE9CY9Szz2TF8XonCFJgCGBxJh
	4c+IPXqhrUJoXcHlq0Vfse22GEHSSGRXbtnVZ3ulSz8gRCwJOwRIj34/EAj3N0BlmyCh
	pRnf/ZXflGhko33A5SUmftKW9XoaZnsVwMgR9OlJAvmA+Ar3So9QN0rAGBtBhgHjIu8T
	hdXVBQTpJroSnnjG2q5EO8LuDJmRUa8QibIosUb2ZOmFaNPjaW8NnVpW1FOMD5UiS1il
	HI6Q==
Received: by 10.60.25.73 with SMTP id a9mr28584763oeg.63.1332775426410;
	Mon, 26 Mar 2012 08:23:46 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id h7sm12870596oeh.9.2012.03.26.08.23.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 08:23:45 -0700 (PDT)
Date: Mon, 26 Mar 2012 08:23:43 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120326152343.GB21518@bill-the-cat>
References: <1332537058-13783-1-git-send-email-heinold@inf.fu-berlin.de>
	<20120323214210.GJ9551@bill-the-cat>
	<20120324110546.GB19971@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20120324110546.GB19971@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Mon, 26 Mar 2012 15:32:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 24, 2012 at 12:05:46PM +0100, Henning Heinold wrote:
> On Fri, Mar 23, 2012 at 02:42:10PM -0700, Tom Rini wrote:
> > On Fri, Mar 23, 2012 at 10:10:57PM +0100, Henning Heinold wrote:
> > 
> > > Hi,
> > > 
> > > while building openjdk I discovered that relocatable.bbclass strips
> > > all PATHS with ORIGIN, that is problematic, when binaries like an jdk
> > > is installed not in the standard paths /lib or /usr/lib.
> > > 
> > > This patch let all exisiting ORIGIN stay in the binary. So
> > > far I only saw problems with some perl-native libs, where chrpath fails
> > > now, because the path is to long. But it seems they work anyway.
> > 
> > Perhaps my memory is hazy, but this feels like an openjdk problem.  Why
> > is openjdk putting things other than were our $ORIGIN mangle expects
> > them to have been placed?
> 
> Hi Tom,
> 
> we install openjdk to /usr/lib/jvm/icedteaX-native  where it has bin jre lib under jre you have
> lib/server/$ARCH/lib1 lib2 .. . Openjdk links from /usr/lib/jvm/icedteaX-native/bin to $ORIGIN/../jre/lib/$ARCH/lib1 .
> So relocatable.bbclass strips this path from rpath.

I need to kick off a build and poke some stuff since perl does something
similar, or needed to be doing so.

-- 
Tom


