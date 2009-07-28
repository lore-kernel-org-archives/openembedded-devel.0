Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MVtIL-0000ps-R0
	for openembedded-devel@openembedded.org; Tue, 28 Jul 2009 22:29:10 +0200
Received: (qmail 30126 invoked from network); 28 Jul 2009 20:14:19 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 28 Jul 2009 13:14:19 -0700
Date: Tue, 28 Jul 2009 13:14:19 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090728201418.GO13724@smtp.west.cox.net>
References: <20090728072202.GA5422@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090728072202.GA5422@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Tue, 28 Jul 2009 20:29:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2009 at 12:22:02AM -0700, Khem Raj wrote:

> I thought of putting it in metadata like TARGET_FPU and which can then be set from various other 
> conf files.
> 
> A cheap workaround is that we could assume that TLS is only supported for glibc and disable it
> for other libc variants but then NPTL is coming (whenever it comes) in uclibc so some architectures
> in uclibc will support NPTL and some wont. Therefore defining it in metadata will give us the 
> fine granularity to set it.

For the sake of other libcs, I like TARGET_TLS or whatever it's called.

-- 
Tom Rini


