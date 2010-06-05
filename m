Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OKqSh-0001sG-GJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 12:18:55 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 808141100208
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jun 2010 12:14:27 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 58F14110009F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jun 2010 12:14:26 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225146192.adsl.alicedsl.de
	[92.225.146.192]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jun 2010 12:14:26 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6A7483C12F; Sat,  5 Jun 2010 12:14:19 +0200 (CEST)
Date: Sat, 5 Jun 2010 12:14:19 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100605101418.GA7682@rhein.zuhause.netz>
References: <BAY127-W96D63AA89D16355433704D8D30@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY127-W96D63AA89D16355433704D8D30@phx.gbl>
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
Subject: Re: glib configuration failed
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
X-List-Received-Date: Sat, 05 Jun 2010 10:18:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 05, 2010 at 03:34:59PM +0600, saleh usman wrote:
> 
>  Hello
> I am bitbaking console-image and  getting an error of failing configuration of glib-2.0. Kindly tell me how to remove it.Terminal log follows.
> Saleh
> 
> | checking for unistd.h... yes
> | checking for inflate in -lz... no
> | configure: error: *** Working zlib library and headers not found ***

Try bitbake zlib first.


> | FATAL: oe_runconf failed
> NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/glib-2.0-2.23.6-r1/temp/log.do_configure.3044
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb do_configure failed
> ERROR: Task 1122 (/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb, do_configure) failed
> NOTE: Tasks Summary: Attempted 431 tasks of which 431 didn't need to be rerun and 1 failed.
> ERROR: '/sdr/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb' failed

Bye Henning


