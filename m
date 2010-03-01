Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nm8jy-0004FA-7P
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:45:07 +0100
Received: (qmail 13328 invoked by uid 1003); 1 Mar 2010 16:42:14 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Mar 2010 16:42:14 -0000
Message-ID: <4B8BEE62.2090809@balister.org>
Date: Mon, 01 Mar 2010 11:42:10 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>	<20100227165600.GD30145@xora-desktop.xora.org.uk>	<1267303607.5437.446.camel@lenovo.internal.reciva.com>	<1267306071.9295.1.camel@trini-m4400>
	<hmeii7$q7e$1@dough.gmane.org>
	<1267459505.9295.107.camel@trini-m4400>
In-Reply-To: <1267459505.9295.107.camel@trini-m4400>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Mon, 01 Mar 2010 16:45:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2010 11:05 AM, Tom Rini wrote:
> On Sun, 2010-02-28 at 21:09 +0100, k.kooia wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 27-02-10 22:27, Tom Rini wrote:
>>> On Sat, 2010-02-27 at 20:46 +0000, Phil Blundell wrote:
>>>> On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
>>>>> NAK on creating extra levels.
>>>>>
>>>>> Changing the level where recipes are held is not an option do to the way
>>>>> you tell bitbake how to find them.
>>>>>
>>>>> BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"
>>>>
>>>> Is that really such a big deal?  We seemed to manage to switch BBFILES
>>>> from /packages/ to /recipes/ without any major casualties, and I would
>>>> have thought that adding an extra level in there would be equally
>>>> straightforward.  Or of course, even better, the distro-specific recipes
>>>> could go in an overlay which the distro config would select.
>>>
>>> I think you've just hit on a potentially great idea.  Say that
>>> 'openembedded' supports 'micro' and 'minimal' as two example
>>> distributions.  Move everyone else into their own distro overlay.  The
>>> only problem with this, perhaps, is easily adding the distro overlay
>>> itself into the right env vars. :(
>>
>> Move every distro out of OE, that way people need to set the overlays
>> correctly.
>>
>> This does mean that we abandon the "sharing" aspect that started OE
>> since every little "improvement" will be done in the distro overlay
>> instead of OE.
>
> Outside of the OE repo, no.  Outside of "conf/" yes.  And yes, this
> would require some re-org, perhaps.  Or perhaps not (and we make
> something like contrib/ but, I don't know, I suck at naming).  And yes,
> with an updated local.conf.sample, getting the overlay stuff right is
> trivial.
>
> But yes, not generically done at all improvements would end up in the
> distro overlay until someone wanted to fix it generically.
>
> Think of it this way, it would also make it easier to show how to make a
> "custom Angstrom" the right way, rather than cp
> conf/distro/angstrom-2008.1.conf conf/distro/mydistro.conf which I have
> gathered would be a good thing.

I am also in the all or nothing camp. If we leave any distro specific 
data in the OE repository, people will continue to copy it and start 
committing it back. Also, by leaving one or two distros in tree, people 
will use them as test cases and catch issues that will impact the out of 
tree distros.

Although there may be some short term pain, I believe this will have 
long term benefits for the project.

Philip


