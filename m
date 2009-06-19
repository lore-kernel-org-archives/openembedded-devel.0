Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MHlWj-0002LK-6P
	for openembedded-devel@openembedded.org; Fri, 19 Jun 2009 23:21:37 +0200
Received: (qmail 17763 invoked from network); 19 Jun 2009 21:10:55 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 19 Jun 2009 14:10:55 -0700
Date: Fri, 19 Jun 2009 14:10:55 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090619211055.GT15477@smtp.west.cox.net>
References: <E1MHjjt-00019r-UN@melo.nslu2-linux.org>
MIME-Version: 1.0
In-Reply-To: <E1MHjjt-00019r-UN@melo.nslu2-linux.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Phil Blundell : micro-uclibc: avoid selection of	crazy iphone stuff as provider for iconv
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
X-List-Received-Date: Fri, 19 Jun 2009 21:21:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2009 at 07:27:05PM +0000, git version control wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 91cdbe63a724125d65d3ec7bf81d84cef16ec653
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=91cdbe63a724125d65d3ec7bf81d84cef16ec653
> 
> Author: Phil Blundell <philb@gnu.org>
> Date:   Fri Jun 19 20:26:26 2009 +0100
> 
> micro-uclibc: avoid selection of crazy iphone stuff as provider for iconv

So, micro and micro-uclibc have a bug that's masked by this commit.
Both use PREFERRED_LIBC rather than LIBC.  Switching to LIBC should
allow for a few things to be removed from both confs (the libintl
settings in the main one and the iconv one in uclibc, possibly the
libintl one if you want to use gettext instead).

-- 
Tom Rini


