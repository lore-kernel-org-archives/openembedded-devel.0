Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Osl4I-000118-12 for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:25:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Osl3f-0004re-Lw for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:25:04 +0200
Received: from adsl-68-95-255-40.dsl.rcsntx.swbell.net ([68.95.255.40])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 01:25:03 +0200
Received: from amir by adsl-68-95-255-40.dsl.rcsntx.swbell.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 01:25:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Amir brgulja <amir@amirbrg.com>
Date: Mon, 6 Sep 2010 23:19:56 +0000 (UTC)
Message-ID: <loom.20100907T011253-209@post.gmane.org>
References: <4C77D8E7.3030109@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 68.95.255.40 (Mozilla/5.0 (Windows; U; Windows NT 6.1;
	en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127
	Safari/533.4)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Mon, 06 Sep 2010 23:25:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Gary Thomas <gary <at> mlbassoc.com> writes:

> 
> This patch addresses the problem where the TI tools that need
> the EULA unpack into the wrong place if the user has write
> permission in /opt.  The current behaviour of relying on the
> unpacker to fall back to the $HOME environment variable should
> not be relied on.  The patch changes the unpack step to use
> the --prefix= option which will always work.
> 
> Note: only tested with these [recent] packages:
>    ti-cgt6x-1_6_1_9-r4
>    ti-cgt6x-1_6_1_14-r4
>    ti-codecs-omap3530-1_1_01_00-r2
>    ti-dspbios-5_41_04_18-r1
>    ti-edma3lld-01_11_00_03-r0
>    ti-xdctools-3_16_01_27-r2
> 


I have a similar problem running bitbake on Ubuntu in virtual machine. I am 
trying to build an image for the Gumstix Overo which uses the above recipes. The 
xdctools does not unpack the sources to the correct location resulting in the 
following error. At least I think thats the source of the error. I really need 
help resolving this and wonder if there is a patch for this as well. 


ERROR: function do_install failed
ERROR: log data follows (/home/amir/oe/tmp/work/overo-angstrom-linux-gnueabi/ti-
xdctools-3_16_01_27-r2/temp/log.do_install.4456)
| cp: cannot stat `/home/amir/oe/tmp/work/overo-angstrom-linux-gnueabi/ti-
xdctools-3_16_01_27-r2/xdctools_3_16_01_27/*': No such file or directory

Thank You.





