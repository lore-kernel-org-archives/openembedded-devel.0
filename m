Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Oum3H-0000bw-AN
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:53:00 +0200
Received: (qmail 19644 invoked by uid 1003); 12 Sep 2010 12:52:13 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Sep 2010 12:52:13 -0000
Message-ID: <4C8CCCFC.1070409@balister.org>
Date: Sun, 12 Sep 2010 08:52:12 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C8C9C66.7030006@freyther.de>	<1284288866.4698.81.camel@lenovo.internal.reciva.com>
	<1284287817.18010.7488.camel@rex>
In-Reply-To: <1284287817.18010.7488.camel@rex>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Check for the presennce of libc.a
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
X-List-Received-Date: Sun, 12 Sep 2010 12:53:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2010 06:36 AM, Richard Purdie wrote:
> On Sun, 2010-09-12 at 11:54 +0100, Phil Blundell wrote:
>> On Sun, 2010-09-12 at 17:24 +0800, Holger Freyther wrote:
>>> The insmod.static binary links statically and requires the libc.a
>>> to be present. On Fedora glibc-static is not installed by default
>>> when installing development headers. Warn the user that he needs
>>> to have that installed.
>>
>> Why are we building insmod.static for native anyway?  That seems a bit
>> silly.
>
> It is. FWIW, Poky now patches the modutils-cross recipe so it only
> builds the dynamically linked version to resolve exactly this issue.

I'd rather just have insane check for glibc-static and not have an extra 
patch we need to carry around. I know everytime I install OE on a Fedora 
based machine, I spend a few minutes remembering why modutils-native 
does not build.

Having a reminder to install glibc-static if needed would really help 
the new user experience for people using Fedora. I'd like to see 
Holger's change go in.

Philip


>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


