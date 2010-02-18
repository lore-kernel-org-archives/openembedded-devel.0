Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2R6-0007I3-8Z for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:12:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2OX-0007dO-1o for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:10:01 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:10:01 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:10:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Feb 2010 10:09:40 +0100
Message-ID: <hlj04i$926$1@ger.gmane.org>
References: <E1Nhfko-0005KL-8Z@melo.openembedded.org>	<1266437931.5691.30.camel@trini-m4400>
	<hlhmn0$5c2$1@ger.gmane.org> <1266443018.5691.42.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <1266443018.5691.42.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-native: bump to r522 to get a fix to remove duplicate messages from do_rootfs logs
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
X-List-Received-Date: Thu, 18 Feb 2010 09:12:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-02-10 22:43, Tom Rini wrote:
> On Wed, 2010-02-17 at 22:22 +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 17-02-10 21:18, Tom Rini wrote:
>>> On Wed, 2010-02-17 at 08:59 +0000, git version control wrote:
>>>> Module: openembedded.git
>>>> Branch: org.openembedded.dev
>>>> Commit: 74501117c261f743c76ae3c2988cbcfdc141cf3a
>>>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=74501117c261f743c76ae3c2988cbcfdc141cf3a
>>>>
>>>> Author: Koen Kooi <koen@openembedded.org>
>>>> Date:   Tue Feb 16 13:08:53 2010 +0100
>>>>
>>>> opkg-native: bump to r522 to get a fix to remove duplicate messages from do_rootfs logs
>>>
>>> I'd like to RFC that we do something like:
>>> OPKGREV ?= "522"
>>> SRCREV_pn-opkg ?= "${OPKGREV}"
>>> SRCREV_pn-opkg-native ?= "${OPKGREV}"
>>> SRCREV_pn-opkg-sdk ?= "${OPKGREV}"
>>>
>>> And if -nogpg or what have you is broken, it either gets fixed or the
>>> distribution takes advantage of that ?=. 
>>
>> I haven't been able to properly test a target opkg yet, so no bump for
>> that. Unless people would like broken opkg binaries on their target ;)
> 
> Seriously tho, this isn't the first or fifth time the revs have gotten
> wildly out of sync.  I'm suggesting that we want to keep them together,
> intentionally.  We don't say we have different versions of gcc or bison
> between native and target.  This is possibly even more important to make
> sure all of the operations are right, all around.

Testing various things on target (upgrading >500 packages on one,
installing >1k packages on another) seems to show no (new) errors. I'll
do some more testing and bump the rev if things look OK.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfQPTMkyGM64RGpERAvu/AJ9S6DSMrLKrO4BNlRhU4/n4gCGcTQCfRLOw
P88zmIMjuH0spzxXj3meKGA=
=gnRq
-----END PGP SIGNATURE-----



