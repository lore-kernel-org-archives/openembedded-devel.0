Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NJpyF-0003V8-QZ for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 16:02:54 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 7E5D399
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 14:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 2+NlShu2zcj6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 15:59:30 +0100 (CET)
Received: from [192.168.0.100] (102-101.echostar.pl [213.156.102.101])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 3649491
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 15:59:30 +0100 (CET)
Message-ID: <4B2501B1.1000300@cs.put.poznan.pl>
Date: Sun, 13 Dec 2009 16:01:05 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W12CD092294401BAF297F8DD88F0@phx.gbl>	<4B1E7699.7000004@mlbassoc.com>,
	<b6ebd0a50912080821r295faf03rd8b4159561a497c6@mail.gmail.com>,
	<BAY127-W19F38E3292656B84EAB3A3D88D0@phx.gbl>,
	<b6ebd0a50912100702s63a6db1lc3ce936f15ce0ad1@mail.gmail.com>
	<BAY127-W6237F900F669541AE5747D88C0@phx.gbl>
In-Reply-To: <BAY127-W6237F900F669541AE5747D88C0@phx.gbl>
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Sun, 13 Dec 2009 15:02:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

saleh usman wrote:
> Oh sorry,I've missed to set oe.Thanks a lot for guidance.
> Now it is showing a different kind of error in terminal window as
> below.Where to find these missing dependencies?
> 
> [saleh@localhost build]$ bitbake helloworld-image
> NOTE: Handling BitBake files: | (0001/0001) [100 %]
> NOTE: Parsing finished. 0 cached, 1 parsed, 0 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Required build target 'helloworld-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['helloworld-image', 'shasum-native']

Still wrong BBFILES... Please, read Getting Started carefully. The
pattern for BBFILES is clearly written there:

  BBFILES = "/stuff/openembedded/recipes/*/*.bb"

You need "stars" to let bitbake load all (a few thousand) .bb files and
resolve dependencies.

Przemek



