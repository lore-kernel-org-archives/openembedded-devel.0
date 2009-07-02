Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MMNyz-0003Ri-QM
	for openembedded-devel@openembedded.org; Thu, 02 Jul 2009 17:13:54 +0200
Received: (qmail 5192 invoked from network); 2 Jul 2009 15:01:50 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 2 Jul 2009 08:01:50 -0700
Date: Thu, 2 Jul 2009 08:01:49 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090702150148.GH27822@smtp.west.cox.net>
References: <200907020914.04919.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <200907020914.04919.holger+oe@freyther.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: uclibc questions and impressions
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
X-List-Received-Date: Thu, 02 Jul 2009 15:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2009 at 09:14:04AM +0200, Holger Hans Peter Freyther wrote:

[snip]
> 2.) libc-uclibc unawareness...
> 
> What:
> conf/distro/include/uclibc.inc at least sets the OVERRIDES .= ":libc-uclibc" 
> but is only included by angstrom and not minimal-uclibc, micro-uclibc...

This isn't quite right.  minimal uses sane-toolchain which in turn
brings in uclibc.inc.  micro had a bug until recently that was causing
it to not set LIBC but PREFERRED_LIBC and thus didn't bring in
uclibc.inc.

> Proposal:
> Kill linux-uclibc and linux-uclibcgnueabi in favor for the libc-uclibc 
> override

Please do.

-- 
Tom Rini


