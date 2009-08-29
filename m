Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MhDYz-0006Qm-Tk
	for openembedded-devel@openembedded.org; Sat, 29 Aug 2009 04:21:10 +0200
Received: (qmail 6412 invoked from network); 29 Aug 2009 02:02:41 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 28 Aug 2009 19:02:41 -0700
Date: Fri, 28 Aug 2009 19:02:54 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090829020254.GC6785@smtp.west.cox.net>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS =	linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 02:21:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2009 at 05:00:44PM -0700, Khem Raj wrote:

> Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
> which is e500 cores.

Two things.  First, doesn't that override the previous TARGET_OS?  Or
did I miss some magic in there to use the previous result?  Second, can
we trigger this on something other than the machine list?  This will get
larger, not smaller.  BASE_PACKAGE_ARCH perhaps?  Or would that not be
allowed?

-- 
Tom Rini


