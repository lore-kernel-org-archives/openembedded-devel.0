Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NSerB-0008T1-6W
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 00:00:04 +0100
Received: (qmail 5718 invoked by uid 1003); 6 Jan 2010 22:57:55 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 6 Jan 2010 22:57:55 -0000
Message-ID: <4B451571.70305@balister.org>
Date: Wed, 06 Jan 2010 17:57:53 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
In-Reply-To: <hi31m7$hc3$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 23:00:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2010 05:09 PM, Rolf Leggewie wrote:
> Holger Hans Peter Freyther wrote:
>> 	*) Does bitbake world work? If not it would be cool if someone could take
>>              a look?
>
> I was hoping for bitbake world to work as a QA tool.  But my efforts on
> the world target didn't really receive a warm welcome.  By now world is
> so utterly broken that bitbake won't even ever start to execute any
> tasks (I killed bitbake after two days when it still did nothing the
> last time I tried).

Can someone explain what bitbake world does?

I would be happier working toward a set of images building for a set of 
distributions.

Philip


>
> Unfortunately, currently there is no consensus in OE that
> "MACHINE=$machine bitbake $bb" shouldn't arbitrarily fail somewhere.
> Right now, OE does not have the tools in place to specify that for
> example $bb1 does not compile for $machineA (some people are very
> allergic to COMPATIBLE_MACHINE for no particular reason).  Bitbake can't
> do versioned depends and so we can't say that $bb2-$version does not
> compile with gcc less than 3.4.x, for example.  Those are just two
> examples.  XorA "solved" this in a hackish way with angsstrom.bbclass.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


