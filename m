Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYgnk-0006Zn-Dm for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 15:17:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYglU-0000YV-98
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 15:15:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 15:15:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 15:15:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Jan 2010 15:10:31 +0100
Message-ID: <hjf00m$lld$2@ger.gmane.org>
References: <201001230943.24210.holger+oe@freyther.de>	<hjejrf$m65$1@ger.gmane.org>
	<1264249142.3630.41.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264249142.3630.41.camel@mattotaupa.wohnung.familie-menzel.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New state for patches not complying with commit policy
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
X-List-Received-Date: Sat, 23 Jan 2010 14:17:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-01-10 13:19, Paul Menzel wrote:
> Am Samstag, den 23.01.2010, 11:42 +0100 schrieb Koen Kooi:
>> On 23-01-10 09:43, Holger Hans Peter Freyther wrote:
>>> right now I'm writing a Qt 4.6 based application that might help us
>> a bit with 
>>> the patchwork queue.
>>>
>>> The idea of the script is to have two things at the end:
>>>       1.) a branch with all the patches that applied and that can be published
>>>       2.) a list of patches that don't apply.
>>>
>>>
>>> What people are supposed to:
>>>
>>> 1.) Cherry pick from the branch
>>> 2.) Send updated patches, close the reports on patchwork...
>>
>> I think people that apply those patches to oe.dev should fix up the
>> commit message as well. The stack Khem pushed this week is just
>> awfull.
>>
>> I guess we should flag patches with bad commit messages as 'rejected' in
>> pw ASAP. We can weed out most of them by reject anything that lacks a
>> ':' in the subject line.
> 
> I am just getting into Patchwork [1][2], so I am sorry if I miss the
> obvious.
> 
> If it is possible, I suggest to add a new state (»Rejected – Commit
> Policy«) for patches not complying with the commit policy [3]?

We can add that easily, we did the same for the 'applied' state.

> As a bonus an automatically answer is sent to the message with the patch
> to the list with the following content, which is just a draft/suggestion
> of course.

I'm unsure if we can do that. Patchwork does support sending emails, but
I left it disabled since I suck at email stuff.
If someone knows how to make patchwork do that we can consider turning
such a feature on.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLWwNXMkyGM64RGpERAp59AJ476WIGYubuaxiqdmQ4yl4r+z2EWgCeOGqM
6D0qHrY1hvikflj9fpVLXAk=
=VKyT
-----END PGP SIGNATURE-----



