Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MWOVZ-0007Lm-1l
	for openembedded-devel@openembedded.org; Thu, 30 Jul 2009 07:48:53 +0200
Received: (qmail 12663 invoked from network); 30 Jul 2009 05:33:53 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 29 Jul 2009 22:33:53 -0700
Date: Wed, 29 Jul 2009 22:33:53 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090730053353.GF25691@smtp.west.cox.net>
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
	<4A700A74.7040507@xora.org.uk>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Thu, 30 Jul 2009 05:48:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2009 at 02:41:30PM +0930, Graham Gower wrote:
[snip]
> The real issue is that my kernel entry point is not fixed. The entry
> point can be found by searching for the 'kernel_entry' symbol in the
> vmlinux. And unfortunately, I can't search for this at an appropriate
> time to be able to set UBOOT_ENTRYPOINT.
> 
> What I would need is something like the following, post do_compile.
> 
> UBOOT_ENTRYPOINT=`${NM} ${S}/vmlinux | \
> 		awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'
> 
> Where UBOOT_ENTRYSYMBOL="kernel_entry" could be set from the ${MACHINE}.conf.

That should work.

-- 
Tom Rini


