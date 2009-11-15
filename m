Received: from [64.202.165.33] (helo=smtpauth11.prod.mesa1.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N9olk-00052H-Ds
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:44:35 +0100
Received: (qmail 12123 invoked from network); 15 Nov 2009 23:36:29 -0000
Received: from unknown (75.49.209.68)
	by smtpauth11.prod.mesa1.secureserver.net (64.202.165.33) with ESMTP;
	15 Nov 2009 23:36:28 -0000
Message-ID: <4B009073.6070607@mwester.net>
Date: Sun, 15 Nov 2009 17:36:19 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911141040530.14929@localhost>
In-Reply-To: <alpine.LFD.2.00.0911141040530.14929@localhost>
X-SA-Exim-Connect-IP: 64.202.165.33
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: removing superseded packages?
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
X-List-Received-Date: Sun, 15 Nov 2009 23:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robert P. J. Day wrote:
>   is there a protocol for suggesting the removal of obsoleted(?)
> packages?...

Removal of packages has been discussed in the past; it's not as simple
as it seems.
...
>   given the above, it would seem reasonable that version 3.0.1 can be
> tossed, no?  unless there's a compelling reason to keep it around.

It does seem reasonable, and in this case I have no opinion one way or
the other.  However, I want to point out that in the past, it has been
the case where a "dot-dot" version difference has made substantial
problems for one distro or another.

It's my opinion that disk space is cheap, and the cost of parsing a few
extra bb files is not so high that we cannot afford to keep a few
versions about.  There's nothing more frustrating than taking a weekend
set aside for making significant progress on a distro issue, and instead
spending it sorting out what changed that made the distro not build or
not boot, and then struggling to sort out why the new version won't
work, and then the infuriating part is when you decide to just use a
PREFERRED_VERSION so that you can go work on your original issue, only
to discover that path is blocked because somebody decided, for no reason
other than aesthetics, to delete the old version that used to work!

Again, no opinion on this specific package, just a strong opinion
regarding the removal of old versions.

And yes, I'm quite aware that there are others who disagree with my
opinion very strongly as well -- there is unlikely to be agreement on
any protocol or policy for this, I think.

-Mike (mwester)


