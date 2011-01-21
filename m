Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PgI1R-0002gj-9A
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 15:31:57 +0100
Received: (qmail 1883 invoked by uid 1003); 21 Jan 2011 14:30:43 -0000
Received: from unknown (HELO ?192.168.0.104?) (philip@opensdr.com@207.47.37.2)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Jan 2011 14:30:43 -0000
Message-ID: <4D39988B.5020204@balister.org>
Date: Fri, 21 Jan 2011 06:30:35 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
References: <20110120181233.GA1789@lit.local.igalia.com>	<ihbp5c$4ov$1@dough.gmane.org>
	<AANLkTimBieqoDRmVfoYmTVpehrmtCk-N=M8bKgRWumN0@mail.gmail.com>
In-Reply-To: <AANLkTimBieqoDRmVfoYmTVpehrmtCk-N=M8bKgRWumN0@mail.gmail.com>
Cc: board@openembedded.org, openembedded-devel@lists.openembedded.org
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Fri, 21 Jan 2011 14:31:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2011 03:29 AM, Frans Meulenbroeks wrote:
> Dear board,
>
> Can you please take action to developers badmouthing distro's and the
> work of others.
> This is now (at least) the 2nd time in 3 weeks (and actually Koen has
> already quite a track record bashing others).

Frans, I'm not going to google IRC and mailing list archives looking for 
similar remarks about Angstrom.

>
> Thank you very much.
> Frans
>
> 2011/1/21 Koen Kooi<k.kooi@student.utwente.nl>:
>> Switching to minimal will only get you anguish, since it's broken by design.
>
> and:
>
> Am Freitag, den 31.12.2010, 20:38 +0100 schrieb Koen Kooi:
>> The configurations I'm concerned about use angstrom-mirrors.bbclass, I
>> don't care about others. I can send you my rate card if you want to pay
>> me to support crap like minimal.

I think these remarks come from discussion over the pandaboard u-boot 
situation? If so, let's consider these options:

1) Remove the pandaboard machine from OE since it does not build for 
some people.

2) Force Koen to update the recipe to something that builds.

3) Do nothing.

No one is happy with the set of options, but the reality is some distros 
use source mirrors and do not have issues. Distros that do not use 
source mirrors are going to have problems with this and other recipes, 
so the onus is on them to resolve these issues. Resolving this is issue 
does not revolve around updating the recipe and pushing it un tested for 
the Panda, since this is not something that can be tested on another set 
of hardware.

So until someone who has a panda and the time and patience to work with 
u-boot, minimal will not work for panda. This is because the minimal 
distro is supposed to not use advanced OE features such as source 
mirrors and PREFERRED_VERSION pinning. Because of these decisions, it is 
entirely possible that minimal will not build for all combination by design.

Philip


