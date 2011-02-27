Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Ptiah-0004zG-Cl
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 16:31:24 +0100
Received: (qmail 25054 invoked from network); 27 Feb 2011 15:29:56 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	27 Feb 2011 15:29:55 -0000
Message-ID: <4D6A6DFA.5040305@mwester.net>
Date: Sun, 27 Feb 2011 09:30:02 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298049536.11289.3126.camel@rex> <4D6A5FB2.4070604@cam.ac.uk>
In-Reply-To: <4D6A5FB2.4070604@cam.ac.uk>
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
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
X-List-Received-Date: Sun, 27 Feb 2011 15:31:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2/27/2011 8:29 AM, Jonathan Cameron wrote:
> On 02/18/11 17:18, Richard Purdie wrote:
>> Bitbake 1.12.0 has been released.
>>
>> http://prdownload.berlios.de/bitbake/bitbake-1.12.0.tar.gz
>>
>> This release has many cleanups and improvements to the bitbake core. The
>> biggest and most user visible change is the parallel parsing work which
>> is the driving reason for the release.
>>
>> A git log of the differences between 1.10 and 1.12 follows.
>>
> It's a dumb question, but what are the intended restrictions on python version
> for running bitbake?  1.10 seems to work fine with python2.7 whereas I can
> only get 1.12 to work with python2.6.

Just to add another datapoint to the python version restrictions: it
seems that bitbake 1.12 requires python 2.6.4 and fails with python
2.6.2 (which means that bitbake 1.12 doesn't work on Fedora 12 or earlier).

-Mike (mwester)

> Issue is:
> 
> Traceback (most recent call last):
>   File "./bitbake", line 43, in <module>
>     from bb.server.process import ProcessServer, ServerCommunicator
> ImportError: No module named process
> 
> I'm not having a great deal of luck tracking down why that happens but then
> I haven't put all that much effort into it as yet!
> 
> Jonathan


