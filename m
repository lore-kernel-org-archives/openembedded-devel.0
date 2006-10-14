Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYZ2d-0007yt-OR
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Oct 2006 04:14:24 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 02E7280364;
	Sat, 14 Oct 2006 12:07:51 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14140-10; Sat, 14 Oct 2006 12:07:49 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 4290E74389;
	Sat, 14 Oct 2006 12:07:49 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 37D64BEAA12; Sat, 14 Oct 2006 12:07:49 +1000 (EST)
Date: Sat, 14 Oct 2006 12:07:49 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061014020749.GA6061@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org,
	Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
References: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
	<1160736375.21755.86.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
In-Reply-To: <1160736375.21755.86.camel@gandalf.tm.informatik.uni-frankfurt.de>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: Bitbaking a recipe which refers to a missing bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Oct 2006 02:14:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2006 at 12:46:15PM +0200, Michael 'Mickey' Lauer wrote:
> Am Dienstag, den 10.10.2006, 15:31 +0200 schrieb Nicolas FR:
> > I have noticed that when bitbaking a recipe which refers to a missing
> > .bbclass definition, there where no warning / error.
> > 
> > For example let's say I try to bitbake example.bb which has:
> > "inherits qt3x11"
> > 
> > if qt3x11 is missing in my /opt/OE/mybranch/classes/
> > then no warning / error is isued.
> 
> This is probably an artifact of the 'inherit' and the 'include'
> statement sharing code.
> I would like to propose 'inherit' to behave like 'require'.

Yep, I'd certainly support that.

In my case I had named my new class "cpan_build.bb" and it took me ages to
figure out why it wouldn't work... should have been .bbclass of course but
I'm just sooo0 used to calling things .bb!

-- 
 Jamie Lenehan <lenehan@twibble.org>


