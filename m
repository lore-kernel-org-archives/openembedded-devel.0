Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1N7sMy-0005kK-Rv
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:10:59 +0100
Received: from w1203.wlan.rz.tu-bs.de ([134.169.204.187] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1N7sLd-0005JU-5u by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 16:09:41 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1N7sLc-0000fC-N6
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:09:32 +0100
Date: Tue, 10 Nov 2009 16:09:13 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091110150913.GE3998@excalibur.local>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
	<d2b9ea600911100635v67079116ifb3ba70b83177f13@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600911100635v67079116ifb3ba70b83177f13@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 15:11:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2009-11-10 at 15:35, Esben Haabendal wrote:
> On Tue, Nov 10, 2009 at 2:27 PM, Stefan Schmidt
> <stefan@datenfreihafen.org> wrote:
> >
> > On Tue, 2009-11-10 at 14:07, Michael 'Mickey' Lauer wrote:
> >>
> >> We will do changes on the git layout, e.g. org.oe.dev is becoming
> >> 'master'
> >> and user branches will live in a seperate repository.
> >
> > While I can understand the former I can't see the reason for the later. Can you
> > explain why that was decided?
> >
> > For me user and other topic branches worked well on the main repository. The
> > only issue I have is the flood of commits on the commit ml when a branch gets
> > rebased, but that is something that a filter in the commit mail hook should be
> > able to solve.
> 
> Splitting out user branches into separate repository gives:
> 
> * option of giving developers access to push to user branches but not master
>   branches

Maybe it's time to do the full step then go over to a pull based model?

> * git clone of master repository does not pull down all users objects

Is that really an issue for people?

> * namespace of master repository is not "polluted" by user branches.

The real problem is here that the git commit hooks forbid a branch delete in our
setup. If you want to ahve a branch removed you have to ping an admin.

> Working with a master and a user repository should work just as well
> as the current setup in all other aspects than having to do an (extra)
> "git remote add" command.

I know and I don't have a problem with the change. Just curious what the reasons
are. I neither have a problem with Otavios proposal that everytone should have
their own tree. The point is more about a good way of getting the changes _back
into master_. :)

regards
Stefan Schmidt


