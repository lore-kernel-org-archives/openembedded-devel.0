Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris@2net.co.uk>) id 1NCech-0003HR-OI
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 20:30:58 +0100
Received: from [192.168.159.11] ([78.147.83.187])
	by mrelayeu.kundenserver.de (node=mreu2) with ESMTP (Nemesis)
	id 0LcCMD-1Nvr9u3cCz-00jOza; Mon, 23 Nov 2009 20:24:24 +0100
Message-ID: <4B0AE162.3030307@2net.co.uk>
Date: Mon, 23 Nov 2009 19:24:18 +0000
From: Chris Simmonds <chris@2net.co.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>	<1258990008.8426.29.camel@conroy-linux>
	<4B0AC426.3030505@2net.co.uk>
	<1259001108.19077.4.camel@conroy-linux>
In-Reply-To: <1259001108.19077.4.camel@conroy-linux>
X-Provags-ID: V01U2FsdGVkX1+HqdWhQha7o9+vW7FKLRGaXqqPY0cCDQ7oQb4
	+qfkz9uAAB15gzcDF1NCNdGkTv92t0JczvBxRj+MlVDXhoqBE0
	5dL6XbdVnKGUZ3HyxsFYoT4Zux/7g4rH566F0M1mfs=
X-SA-Exim-Connect-IP: 212.227.126.186
X-SA-Exim-Mail-From: chris@2net.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] external-toolchain: Really accept toolchains built by meta-toolchain.bb
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
X-List-Received-Date: Mon, 23 Nov 2009 19:30:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Conroy wrote:
> On Mon, 2009-11-23 at 17:19 +0000, Chris Simmonds wrote:
>> meta-toolchain does generate environment-setup and so far as I am aware 
>> it works fine as a stand-alone toolchain. Is there some reason why I 
>> should not be using it as such?
>>
>> Chris S.
> 
> It's fine as just a standalone toolchain. It's just not a "Build
> Platform." Meaning, you can't just source it and get all the other
> things that OE gives you. This is perhaps too obvious to even warrant
> mentioning.
> 
> I misinterpreted the original patch since I was comparing against my
> local tree, where we've modified to check for environment-setup rather
> than package-status (simply as a sanity check for the setting of
> ${prefix}, so you can safely disregard my previous posting.
> 


Phew! Thanks for the clarification.
Chris S.


