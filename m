Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MVsYy-00020l-9Y
	for openembedded-devel@openembedded.org; Tue, 28 Jul 2009 21:42:16 +0200
Received: (qmail 29776 invoked from network); 28 Jul 2009 19:27:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 28 Jul 2009 12:27:26 -0700
Date: Tue, 28 Jul 2009 12:27:26 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090728192725.GN13724@smtp.west.cox.net>
References: <20090716202438.GC32273@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090716202438.GC32273@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Busybox ifupdown usage
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
X-List-Received-Date: Tue, 28 Jul 2009 19:42:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2009 at 04:24:38PM -0400, Denys Dmytriyenko wrote:

> Busybox has the following warning about using ifupdown:
> 
> http://git.busybox.net/busybox/tree/docs/ifupdown_design.txt
> 
> AFAICS, ifupdown from Busybox is used in most of the images. Are there any 
> concerns? How valid is the warning above?

In all 5 defconfigs for 1.13.2 FEATURE_IFUPDOWN_EXTERNAL_DHCP is
disabled and UDHCPC is enabled.  So yes, if busybox ifupdown is used
rather than the ifupdown package (and I don't see runtime update
alternatives magic in ifupdown_0.6.8.bb) only udhcpc is going to be a
working client.  It's probably luck then that people either use busybox
or they use not-busybox and some other dhcp client and real ifupdown.

-- 
Tom Rini


