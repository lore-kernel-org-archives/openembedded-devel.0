Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L8Hba-0001Gt-5f
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:03:10 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L8HY6-0007aW-No
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 10:59:34 -0600
Message-ID: <49380C4F.1050809@dls.net>
Date: Thu, 04 Dec 2008 10:58:55 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <gh8v57$5nk$1@ger.gmane.org>
In-Reply-To: <gh8v57$5nk$1@ger.gmane.org>
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Thu, 04 Dec 2008 17:03:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
...
> My current ideas:
> 
> 1) remove /etc/dev.tar if its > x weeks old
> 2) recreate it on shutdown
> 3) remove it after x times
> 
> option 1) breaks on systems without an RTC and/or no /etc/timestamp
> option 2) moves the slowness to shutdown
> option 3) requires extra logic and filesystem access
> 
> and all options don't fix the first case I mentioned, they all take a
> while to make /dev/fb1 appear.
> 
> The key is that it should be transparent to users, so adding a check for
> .e.g 'ignore_dev.tar=1' in bootargs wouldn't work, since that implies
> that users are aware of the problem and know how to 'fix' it.
> 
> Does anyone have other ways to invalidate the cache, and if not, which
> option would get your vote?

A slight improvement would be to make the dev.tar file dependent upon
the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
doesn't match the current command line.  This could be a very fast
operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.

Mike (mwester)


