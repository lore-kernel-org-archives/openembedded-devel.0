Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBX9y-0006EC-3R for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:57:26 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBX7h-0001UA-9T for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:55:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 20:55:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 20:55:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 17 Apr 2011 20:54:53 +0200
Message-ID: <iofd1t$oat$1@dough.gmane.org>
References: <20110414193436.GA26286@denix.org>
	<4DAA505E.4000305@mentor.com>	<ioe35g$lb4$1@dough.gmane.org>
	<4DAB2CEC.1030008@mentor.com> <20110417182117.GB4068@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110417182117.GB4068@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and sgx/gles
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
X-List-Received-Date: Sun, 17 Apr 2011 18:57:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-04-11 20:21, Denys Dmytriyenko wrote:
> On Sun, Apr 17, 2011 at 11:09:48AM -0700, Tom Rini wrote:
>> On 04/17/2011 12:00 AM, Koen Kooi wrote:
>>> On 17-04-11 04:28, Tom Rini wrote:
>>>> On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
>>>>> Tom,
>>>
>>>>> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
>>>>> new ti-ipc version and sgx/gles fixes for ti816x.
>>>>> All are cherry picked from oe.dev
>>>
>>>
>>>>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>>>>>   Branch: 2011.03-maintenance
>>>>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
>>>
>>>>> Thanks,
>>>>>     Denys Dmytriyenko <denys@ti.com>
>>>
>>>> Applied, thanks.
>>>
>>> Tom, can you please unmerge it? The SGX commit is bogus, I have already
>>> asked Denys to revert it from .dev. I do not want crap like that in
>>> maintenance.
>>
>> All of the parts of the merge or just a specific one?
> 
> Tom,
> 
> Can we hold off with unmerging/reverting for now? I'm trying to understand the 
> damage level and see the best course of action... But the commit in question 
> is "ligles-omap3: Remove SGX Fixup for TI816x"

Right, only the "ligles-omap3: Remove SGX Fixup for TI816x" needs to get
reverted.

> 
> Koen,
> 
> I replied to your email. Please let me know if you still prefer the complete 
> revert or if it can be worked around, as it still works, while may not be 
> optimal, and doesn't break anything else. Thanks.

As I said in my response to the patch:

- ------
So, I'm back from travelling now and I'll have to NAK this patch:

1) it assumes netra will never have an sgx core update and makes it
diverge from the other platforms.

2) it adds a useless 2 second boot delay

So the net result is a harder to maintain slower version of the scripts,
which is not acceptable.
- ------

So I'd very much like to get this patch reverted both from .dev and
2011.03-maintenance. Especially considering I'm the actual maintainer
for that recipe.

For fun, try booting on omap3 and moving the SD to netra and see what
happens. This is what we do at the office and customers do as well.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNqzd9MkyGM64RGpERAgbZAKCxNJ0LcjgN3YAqxOBAJaj+cNdkmgCeITE9
yLuY53VNNQEZo5BnZODgQTE=
=xwT9
-----END PGP SIGNATURE-----



