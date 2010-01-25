Received: from qmta02.westchester.pa.hmc1.comcast.net ([76.96.53.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NZSBG-0007XP-At
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 17:52:53 +0100
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta02.westchester.pa.hmc1.comcast.net with comcast
	id ZpXJ1d00E09Ku2s09sqWuJ; Mon, 25 Jan 2010 16:50:30 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id ZsqN1d0054SLwm302sqWK5; Mon, 25 Jan 2010 16:50:30 +0000
Message-ID: <4B5DCBCD.7070500@soundmetrics.com>
Date: Mon, 25 Jan 2010 08:50:21 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
	<201001251025.23040.holger+oe@freyther.de>
In-Reply-To: <201001251025.23040.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 76.96.53.9
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] socat: Add version 1.7.1.2
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
X-List-Received-Date: Mon, 25 Jan 2010 16:52:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Sunday 24 January 2010 00:16:46 John Faith wrote:
>   
>> Second try. Added package source checksums, changed PR to r0, and removed
>>  some trailing whitespace in the patch.
>>     
>
> First of all, thank you for the contribution. I have one question. Why did you 
> need to patch the configure script? It should be automatically regenerated in 
> the do_configure stage?
>
>
>   
Hi,
Using the default do_configure() overwrote config.h.in which lacked 
#defines like HAVE_SIGACTION and broke compilation for me.  I imagine 
that the right thing to do would be to just to patch configure.in and 
recreate the configure script and config.h.in.  This page:
http://www.gnu.org/software/hello/manual/gettext/config_002eh_002ein.html
seems to indicate that its ok to manually maintain a config.h.in, so I 
wonder what do_configure() should do in this case when this file is 
included in the source.

,
John



