Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Oe9C8-00077g-O2
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:09:27 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 38F7111000A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:09:02 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B82B5110009E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:09:00 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052229176.adsl.alicedsl.de
	[78.52.229.176]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 18:09:00 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8ECC33C0EF; Wed, 28 Jul 2010 18:09:00 +0200 (CEST)
Date: Wed, 28 Jul 2010 18:09:00 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728160900.GB9553@rhein.zuhause.netz>
References: <BAY127-W2DE0FDEACF7F8948D3BC7D8A80@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY127-W2DE0FDEACF7F8948D3BC7D8A80@phx.gbl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: kernel for DM6446
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
X-List-Received-Date: Wed, 28 Jul 2010 16:09:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2010 at 08:54:12PM +0600, saleh usman wrote:
> 
> I am bitbaking linux davinci recipe in openembedded to build a just kernel image for DM6446. Weather this is the suitable recipe for this?
> Also it is giving an error of permission denied to /root as shown in terminal log. how I may remove this error? plz help.
> 
> [Saleh@localhost root]$ bitbake linux-davinci
> NOTE: Handling BitBake files: \ (0004/8169) [ 0 %]ERROR: [Errno 13] Permission denied: '/root' while parsing /sdr/openembedded/recipes/oprofile/oprofileui_svn.bb
> NOTE: Handling BitBake files: - (8169/8169) [100 %]
> NOTE: Parsing finished. 7530 cached, 308 parsed, 330 skipped, 0 masked.
> ERROR: Parsing errors found, exiting...
> [Saleh@localhost root]$ 
> 
> 
> Saleh

Hi,

Seems an error in your setup and you are using root to build the stuff which we not recommend. You can use
the debug-output of bitbake to see more, whats going on.

bitbake -DDD your_recipe.

Bye Henning


