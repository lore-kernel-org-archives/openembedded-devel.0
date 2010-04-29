Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O7XEj-00077u-SR
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 19:09:18 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 19:05:33 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 29 Apr 2010 19:04:47 +0200
Received: from [192.168.1.116] ([80.117.39.139]) by FBCMCL01B05.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 29 Apr 2010 19:04:46 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hqicrj$dp9$1@dough.gmane.org>
References: <alpine.DEB.1.10.1004161912440.13411@vitus.devnet.local>
	<1271687665-23003-1-git-send-email-vjensen@gmx.de>
	<1271687665-23003-2-git-send-email-vjensen@gmx.de>
	<hqicrj$dp9$1@dough.gmane.org>
Date: Thu, 29 Apr 2010 19:04:46 +0200
Message-ID: <1272560686.2313.34.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 29 Apr 2010 17:04:46.0681 (UTC)
	FILETIME=[12177490:01CAE7BE]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008: make PREFERRED_VERSION_linux-libc-headers a weak assignment
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
X-List-Received-Date: Thu, 29 Apr 2010 17:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> > -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
> > +PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
> 
> NACK, there's is a good reason it's not soft assigned. Your hack to make
> it machine specific is worse, since it means that other machines with
> the same arch now get a "random" version.
> 
> What we can do is globally increase the version, which was planned
> anyway. Does can need .32 or .33? I tested using llc .32 locally, but
> hadn't pushed that change yet.
eee701 require 2.6.33 headers(or libdrm to stage the headers) for the
latest xf86-video-intel xorg driver
So I did that locally(I know I can't commit such stuff) and it worked.
But the correct fix may be to modify libdrm to stage the libs I bet...

Denis.



