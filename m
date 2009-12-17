Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NLCUb-0008KN-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 10:17:56 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 56C87B94006;
	Thu, 17 Dec 2009 10:16:05 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NLCSr-000878-2d; Thu, 17 Dec 2009 10:16:05 +0100
Date: Thu, 17 Dec 2009 10:16:05 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091217091605.GB32444@lundinova.se>
References: <200912161526.36033.holger+oe@freyther.de>
	<1260980999-27920-1-git-send-email-johan.hovold@lundinova.se>
	<1260993181.6896.442.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1260993181.6896.442.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] openvpn: remove dependency on kernel module
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
X-List-Received-Date: Thu, 17 Dec 2009 09:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

 > -RDEPENDS = "kernel-module-tun"
> > +RRECOMMENDS = "kernel-module-tun"
> 
> Did you want RRECOMMENDS_${PN} there? 

What is the reason for preferring the _${PN} form here? I notice a lot
of recipes do not use it.

Thanks,
Johan



