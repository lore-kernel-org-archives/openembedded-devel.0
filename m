Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NB1KG-00050c-BN
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 08:21:11 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NB1Iu-0001kT-Rs for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 02:19:44 -0500
Date: Thu, 19 Nov 2009 02:19:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258613177.16656.3.camel@ubuntu2>
Message-ID: <alpine.LFD.2.00.0911190218370.28651@localhost>
References: <1258613177.16656.3.camel@ubuntu2>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Building problems
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
X-List-Received-Date: Thu, 19 Nov 2009 07:21:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 19 Nov 2009, Paolo Cremonese wrote:

> Hi ALL,
> I get suddenly a building problem.
> this is the output:
>
>
> paolo@ubuntu2:~/oe/stuff/build$ bitbake x11-image
> Traceback (most recent call last):
>   File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/home/paolo/oe/stuff/bitbake/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()
>   File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 69, in
> parseConfiguration
>     self.parseConfigurationFile( os.path.join( "conf",
> "bitbake.conf" ) )
>   File "/home/paolo/oe/stuff/bitbake/lib/bb/cooker.py", line 405, in
> parseConfigurationFile
>     bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
>   File "/home/paolo/oe/stuff/bitbake/lib/bb/event.py", line 67, in fire
>     if tmpHandler(event) == Handled:
>   File "tmpHandler(e)", line 4, in tmpHandler
>   File "<bb>", line 18, in check_sanity
> NameError: global name 'os' is not defined
> paolo@ubuntu2:~/oe/stuff/build$
>
>
> Any suggestion?

  what branch are you using?  there was a short period where that
error was produced because of a removal of "import os", but it was
replaced shortly thereafter.  make sure your checkout is up to date.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


