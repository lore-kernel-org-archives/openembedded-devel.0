Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N7O98-0003iE-Ny
	for openembedded-devel@openembedded.org; Mon, 09 Nov 2009 07:54:42 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id EFA351D36078; Mon,  9 Nov 2009 07:53:22 +0100 (CET)
Date: Mon, 9 Nov 2009 07:53:22 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091109065322.GD16449@ibawizard.net>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
	<d1b08f940911011459i7e8403ees7e509843a0854e2@mail.gmail.com>
	<200911020309.56350.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <200911020309.56350.holger+oe@freyther.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
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
X-List-Received-Date: Mon, 09 Nov 2009 06:54:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Holger Hans Peter Freyther <holger+oe@freyther.de> [2009-11-02 03:09:56]:

> On Sunday 01 November 2009 23:59:18 Andrea Adami wrote:
> > And what about having a checksum file in each dir of  /recipes ?
> > If the checksum changes the PR should be changed too.
> 
> 
> I think that is the best way in terms of scalability and BB collections. We 
> have some weird cases where we might do require ../ but these are broken or 
> need to duplicate the checksums...

I like this idea more than one monolitic checksum file. checksums.ini is place
for storing of a duplicate information anyway. You need to enter URL in checksums,
you need to enter URL again into recipe.

Wouldn't it be better to write URL with checksum once at one place and reuse
it than in recipe as some kind of variable or something like that?

Well, at least that hrw's modification avoids sorting process...

-- ynezz


