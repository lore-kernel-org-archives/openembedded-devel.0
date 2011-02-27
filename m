Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jic23@cam.ac.uk>) id 1Ptj5O-0005gi-OQ
	for openembedded-devel@openembedded.org; Sun, 27 Feb 2011 17:03:06 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:34187)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1Ptief-0003KG-Et (Exim 4.72)
	(return-path <jic23@cam.ac.uk>); Sun, 27 Feb 2011 15:35:29 +0000
Message-ID: <4D6A6F66.7050400@cam.ac.uk>
Date: Sun, 27 Feb 2011 15:36:06 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20110122 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <1298049536.11289.3126.camel@rex>
In-Reply-To: <1298049536.11289.3126.camel@rex>
X-Enigmail-Version: 1.1.2
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
X-List-Received-Date: Sun, 27 Feb 2011 16:03:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sorry for repeat copies, wasn't subscribed to openembedded-devel with this account so
it bounced the first time.

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




