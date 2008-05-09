Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JuXII-0002wZ-Ky
	for openembedded-devel@openembedded.org; Fri, 09 May 2008 20:26:10 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JuXHP-0000vp-8c
	for openembedded-devel@openembedded.org; Fri, 09 May 2008 18:25:15 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 09 May 2008 18:25:15 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 09 May 2008 18:25:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 09 May 2008 20:24:52 +0200
Message-ID: <g024tu$2kd$1@ger.gmane.org>
References: <48246A67.4030800@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
In-Reply-To: <48246A67.4030800@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 09 May 2008 18:26:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> I'd like to change the variable used for the user to add packages to a
> standard image from ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL. This
> is an image property, and not Angstrom specific.
> 
> Is there anything wrong with this idea?

IMHO this is a good idea in the spirit of keeping a clear boundary
between OE and the distros derived from it.  In an ideal world "rgrep
ANGSTROM packages/" would be empty and any functionality implemented
available to any distro via generic "stubs"/variables to dock into.

+1 from me

I guess, now is a good time though, to give a big round of applause and
thank you to the Angstrom folks (koen in particular) who have brought a
great many things to OE (I can think of multi-machine, support for lots
of machines, ANGSTROM_MODE and ANGSTROM_EXTRA_INSTALL right now, but
there are countless others)



