Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1Gav1l-00071Y-Nj
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 16:07:13 +0200
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id k9KDAU3U031233 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 15:10:31 +0200
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Fri, 20 Oct 2006 16:08:42 +0200
User-Agent: KMail/1.9.1
MIME-Version: 1.0
Message-Id: <200610201608.42551.christopher.lang@plus.cablesurf.de>
Subject: inherit both kernel and autotools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 14:07:14 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi,

In a .bb recipe, if I write: "inherit kernel autotools", which one of the two 
overlapping exported methods "do_configure" and "do_install" will be the ones 
used when bitbaking the .bb file?

The methods from kernel or autotools?

Does it depend on the order of the two classes? "kernel autotools" or 
"autotools kernel"?

thanks
Chris


kernel.bbclass: EXPORT_FUNCTIONS do_compile do_install do_stage do_configure
autotools.bbclass: EXPORT_FUNCTIONS do_configure do_install



