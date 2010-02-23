Received: from smtp-out108.alice.it ([85.37.17.108])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Nk0WH-0008SZ-3z
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 20:34:12 +0100
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out108.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Feb 2010 20:31:22 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Feb 2010 20:29:50 +0100
Received: from [192.168.1.116] ([79.50.138.186]) by FBCMCL01B09.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 23 Feb 2010 20:29:49 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1266533249.3868.4.camel@gnutoo-desktop>
References: <E1Ngbii-0008Ch-On@melo.openembedded.org>
	<1266525946-8354-1-git-send-email-GNUtoo@no-log.org>
	<1266525946-8354-2-git-send-email-GNUtoo@no-log.org>
	<1266527444.5437.126.camel@lenovo.internal.reciva.com>
	<1266533249.3868.4.camel@gnutoo-desktop>
Date: Tue, 23 Feb 2010 20:29:45 +0100
Message-Id: <1266953385.3767.4.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 23 Feb 2010 19:29:50.0159 (UTC)
	FILETIME=[90EB0DF0:01CAB4BE]
X-SA-Exim-Connect-IP: 85.37.17.108
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libxml2 : convert to new staging and fix python error in gnome-doc-utils
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
X-List-Received-Date: Tue, 23 Feb 2010 19:34:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-18 at 23:47 +0100, GNUtoo wrote:
> On Thu, 2010-02-18 at 21:10 +0000, Phil Blundell wrote:
> > On Thu, 2010-02-18 at 21:45 +0100, Denis 'GNUtoo' Carikli wrote:
> > > +do_install_append() {
> > >  	install -d ${STAGING_DATADIR}/aclocal/
> > >  	install -d ${STAGING_BINDIR_CROSS}
> > 
> > That doesn't look right.  I don't think do_install() should ever be
> > writing into ${STAGING_xxxDIR} directly.
> > 
> > What happens if you just remove those lines?
> > 
> > p.
> It seem to work just the same...Thanks a lot.
> 
> They were just left there because they came from the old version of the
> recipes But also because I did a quick thing(in fact I didn't even
> commit it)
> 
> Denis.
Now,Is it safe to commit it?
Denis.





