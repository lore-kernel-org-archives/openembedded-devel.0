Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NqpKP-0008P5-DE
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 16:02:09 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id CD24D1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 15:02:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Mar 2010 15:58:23 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <1268511676.24057.12.camel@ed-hp-laptop>
In-Reply-To: <1268511676.24057.12.camel@ed-hp-laptop>
MIME-Version: 1.0
Message-Id: <201003141558.24266.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Alignment trap - deprecation.pyo
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
X-List-Received-Date: Sun, 14 Mar 2010 15:02:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.py
> import gtk._lazyutils # precompiled
> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.py
> import gtk.deprecation # precompiled
> from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> Alignment trap: python (2412) PC=0x40bfa3c4 Instr=0x280069c0
> Address=0xffffffff FSR 0x813
> Segmentation fault
> 
> 
> Does anyone have any ideas why it chokes at deprecation.pyo?????

No. but you could enable the generation of a coredump with ulimit and then use 
gdb to figure out where it was generating this alignment trap.



