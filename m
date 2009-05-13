Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4G0T-0007Wr-07
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 17:04:29 +0200
Received: (qmail 5401 invoked from network); 13 May 2009 14:57:43 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 13 May 2009 07:57:43 -0700
Date: Wed, 13 May 2009 07:57:42 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090513145742.GH7973@smtp.west.cox.net>
References: <87bppxe07v.wl%peter@chubb.wattle.id.au>
MIME-Version: 1.0
In-Reply-To: <87bppxe07v.wl%peter@chubb.wattle.id.au>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Building older glibc
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
X-List-Received-Date: Wed, 13 May 2009 15:04:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2009 at 09:00:52PM +1000, Peter Chubb wrote:
> 
> Is there a trick to building an older glibc than the head?  I'm
> building for x86, and I need a libc.a that'll run against a 2.6.10
> kernel --- so I've tried
> 	bitbake glibc-2.3.2
> (and 2.3.5)

You shouldn't need to get that old.  2.5 or 2.6, with
OLDEST_KERNEL=2.6.10 should work (make sure your machine.conf isn't
overriding the default of 2.4.0).

-- 
Tom Rini


