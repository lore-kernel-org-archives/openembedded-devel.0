Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N7q2C-0001xs-7j
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 13:41:23 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSW008TL5QBNMCQ@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	10 Nov 2009 05:39:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CA89414AF64; Tue,
	10 Nov 2009 06:39:46 -0500 (EST)
Date: Tue, 10 Nov 2009 06:39:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091110113946.GA24738@denix.org>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
	<d1b08f940911011459i7e8403ees7e509843a0854e2@mail.gmail.com>
	<200911020309.56350.holger+oe@freyther.de>
	<20091109065322.GD16449@ibawizard.net>
MIME-version: 1.0
In-reply-to: <20091109065322.GD16449@ibawizard.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Tue, 10 Nov 2009 12:41:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Nov 09, 2009 at 07:53:22AM +0100, Petr ?tetiar wrote:
> Holger Hans Peter Freyther <holger+oe@freyther.de> [2009-11-02 03:09:56]:
> 
> > On Sunday 01 November 2009 23:59:18 Andrea Adami wrote:
> > > And what about having a checksum file in each dir of  /recipes ?
> > > If the checksum changes the PR should be changed too.
> > 
> > 
> > I think that is the best way in terms of scalability and BB collections. We 
> > have some weird cases where we might do require ../ but these are broken or 
> > need to duplicate the checksums...
> 
> I like this idea more than one monolitic checksum file. checksums.ini is place
> for storing of a duplicate information anyway. You need to enter URL in checksums,
> you need to enter URL again into recipe.
> 
> Wouldn't it be better to write URL with checksum once at one place and reuse
> it than in recipe as some kind of variable or something like that?

It was discussed during OEDEM and the conclusion was to switch to using 
checksums in SRC_URIs of corresponding recipes.

--
Denys


