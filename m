Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIbNV-0005gg-Ad for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 08:52:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QIbKs-0005c3-2G for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 08:49:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 08:49:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 08:49:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 07 May 2011 08:49:42 +0200
Message-ID: <iq2q26$1qg$1@dough.gmane.org>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>	<1304666954.3162.3.camel@lenovo.internal.reciva.com>	<BANLkTinMP8C0WQ5yEpckn7rM5yMap6QkZg@mail.gmail.com>	<iq1p0t$q68$1@dough.gmane.org>
	<BANLkTikfVwAR=LEXbe9JXevu3oVze2i2Wg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTikfVwAR=LEXbe9JXevu3oVze2i2Wg@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Sat, 07 May 2011 06:52:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-11 01:09, Khem Raj wrote:
> On Fri, May 6, 2011 at 2:25 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> On 06-05-11 21:59, Khem Raj wrote:
>>>> On Fri, May 6, 2011 at 12:29 AM, Phil Blundell <philb@gnu.org> wrote:
>>>>> On Thu, 2011-05-05 at 20:47 -0700, raj.khem@gmail.com wrote:
>>>>>>  # We have a conf and classes directory, prepend to BBPATH to prefer our versions
>>>>>> -BBPATH := "${LAYERDIR}:${BBPATH}"
>>>>>> +BBPATH .= ":${LAYERDIR}"
>>>>>
>>>>> This patch seems to cause the code to do the opposite of what the
>>>>> comment says.  If changing it to be an append rather than a prepend is
>>>>> deliberate, please adjust the comment to match.  (It would also be nice
>>>>> to have some commentary in the commit message explaining why this is
>>>>> being done, since it isn't obvious to me why append would be better.)
>>>>>
>>>> That comment should be fixed. Since previously I has prepend and then
>>>> changed it to append but forgot
>>>> to correct the comment.
>>>> It needed to follow some order for consistency and I chose append. Now
>>>> it depends on the order of
>>>> layers specified in BBLAYERS from bblayer.conf. Which means 1st entry
>>>> gets priority
>>>> over second entry when bitbake searches BBPATH. Right now there are
>>>> two criteria's
>>>> BBFILES are selected per priority set by BBFILES_PRIORITY for the
>>>> layer but BBPATHs dont have this
>>>> capability they get searched as they appear in the list.  Ideally I
>>>> would think it would be simpler to have just one order for BBFILES and
>>>> BBPATH
>>>> so if BBPATHS followed the BBFILES priority too would make it easier
>>>> to comprehend.
> 
> For meta-oe we need 2 different things:
> 
> 1) prepend to BBPATH to get our classes in first (e.g. kernel.bbclass,
> gnome.bbclass)
> 2) append to BBFILES to use our version of recipes (.bbs) and overrides
> (.bbappends)
> 
> It seems that using layer priorities won't work the way we need it.
> 
>> we can change the order in BBLAYERS define in oebb.sh to achieve that
>> so higest priority layer in terms of BBPATH appears first and so on

That only fixes BBPATH, but not BBFILES :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFNxOuGMkyGM64RGpERArpFAJ9HNwWB8IfyttZh46IZCo37unkcwACXQnZi
SCM+PoZfIwKgplELJyZD/A==
=2TIM
-----END PGP SIGNATURE-----



