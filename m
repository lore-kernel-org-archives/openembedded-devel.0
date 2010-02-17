Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NhpdL-0007dz-Li
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:32:30 +0100
Received: (qmail 12706 invoked by uid 1003); 17 Feb 2010 19:29:46 -0000
Received: from localhost (HELO ?192.168.1.182?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Feb 2010 19:29:46 -0000
Message-ID: <4B7C43A7.8010201@balister.org>
Date: Wed, 17 Feb 2010 11:29:43 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>	<hk12nm$sdo$1@ger.gmane.org>	<hlhc1p$t19$1@ger.gmane.org>
	<hlhcpu$nn$1@ger.gmane.org>
In-Reply-To: <hlhcpu$nn$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Wed, 17 Feb 2010 19:32:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2010 10:33 AM, Rolf Leggewie wrote:
> Koen Kooi wrote:
>> of all the ways to solve it, you just had to go out of your way to annoy
>> people.
>
> I thought that was your specialty.  Everybody agreed on this, except
> you, for IMHO very incomprehensible reasons.
>
> Now, people are going out of their way to please you little princess,
> address your silly concerns and you're still not satisfied.
>
> First, you complain about the image not having the angstrom- prefix
> anymore.  Now, when that's reinstated you complain again and revert a
> meaningful patch back to before its broken state.  Maybe it's time to
> check your mental state?
>
> I hope OE can soon find a way to finally end your dictatorship ways.  OE
> has been held hostage to you and Angstrom for far too long.

Slow down guys, you are spinning out of control. The problem is not so 
much the change, just the silent method in which it was accomplished.

The basic problem here is that console-image is used by a variety of 
people. We do not like the name of the var for adding extra packages, 
but we use it anyway.

If this change was not reverted, I had the potential of losing lots of 
build time because of a silent change. Right now, I am working at a 
customer site and am not closely following the irc channel, so the only 
way I have of keeping up with things is on the mailing list.

Rolf, yes, this change has been flogged to death over the years, but you 
need to be more careful when making changes that impact a large 
audience. If in doubt send a patch to the list.

Personally, I would be happier just adding back the Angstrom var so 
peoples stuff didn't break and nag them to change it before removing the 
Angstrom var. But the I tend to take non-confrontational approach to 
solving problems. And this sets me up for constantly fixing other 
peoples bad commits.

Philip


