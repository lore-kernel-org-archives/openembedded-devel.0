Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PthdO-00041I-Q8 for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 15:30:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pthc1-0005Xf-3g for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 15:28:41 +0100
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 15:28:41 +0100
Received: from jic23 by arcturus.eng.cam.ac.uk with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 15:28:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jonathan Cameron <jic23@cam.ac.uk>
Date: Sun, 27 Feb 2011 14:29:06 +0000
Message-ID: <4D6A5FB2.4070604@cam.ac.uk>
References: <1298049536.11289.3126.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: arcturus.eng.cam.ac.uk
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20110122 Lightning/1.0b3pre Thunderbird/3.1.7
In-Reply-To: <1298049536.11289.3126.camel@rex>
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.12.0 released!
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
X-List-Received-Date: Sun, 27 Feb 2011 14:30:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/18/11 17:18, Richard Purdie wrote:
> Bitbake 1.12.0 has been released.
> 
> http://prdownload.berlios.de/bitbake/bitbake-1.12.0.tar.gz
> 
> This release has many cleanups and improvements to the bitbake core. The
> biggest and most user visible change is the parallel parsing work which
> is the driving reason for the release.
> 
> A git log of the differences between 1.10 and 1.12 follows.
> 
It's a dumb question, but what are the intended restrictions on python version
for running bitbake?  1.10 seems to work fine with python2.7 whereas I can
only get 1.12 to work with python2.6.

Issue is:

Traceback (most recent call last):
  File "./bitbake", line 43, in <module>
    from bb.server.process import ProcessServer, ServerCommunicator
ImportError: No module named process

I'm not having a great deal of luck tracking down why that happens but then
I haven't put all that much effort into it as yet!

Jonathan





