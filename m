Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QS3iB-0007JL-4C for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 10:57:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QS3eY-0003s4-6t for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 10:53:18 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 10:53:17 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 10:53:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jun 2011 10:53:02 +0200
Message-ID: <is7j1e$j7h$1@dough.gmane.org>
References: <cover.1306962838.git.Martin.Jansa@gmail.com>	<is6d2d$11c$1@dough.gmane.org>
	<20110602043530.GF3281@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110602043530.GF3281@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/2] Pull request #15
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
X-List-Received-Date: Thu, 02 Jun 2011 08:57:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-06-11 06:35, Martin Jansa wrote:
> On Thu, Jun 02, 2011 at 12:05:01AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-06-11 23:14, Martin Jansa wrote:
>>> Initial bits are already in oe-core so it's time to push this too.
>>>
>>> The following changes since commit 7da05acc4665dcfcd008e6ce698169b8e9503b33:
>>>
>>>   udev-extra-rules: remove modprobe rule, it has moved back to udev (2011-05-31 20:37:45 +0200)
>>>
>>> are available in the git repository at:
>>>   git://git.openembedded.org/meta-openembedded-contrib jansa/allarch
>>>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/allarch
>>>
>>> Martin Jansa (2):
>>>   siteinfo: add allarch-linux target
>>>   recipes: use allarch.bbclass instead just PACKAGE_ARCH = all
>>
>> koen@dominion:/OE/tentacle/sources/meta-openembedded$
>> MACHINE=beagleboard bitbake ccid udev-extra-rules freerdp pcsc-lite libinih
> 
> Can you please test with
> http://patches.openembedded.org/patch/5265/
> applied to oe-core?
> 
> Strange this I've seen this error after it was renamed s/all/allarch 
> http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=5d7d4e1ed9bedf2b6510796d76ea8f94739b9de2
> and allarch was missing in oe-core/meta/classes/siteinfo.bbclass
> and then I still see it with allarch missing in
> meta-oe/classes/siteinfo.bbclass
> 
> looks like both siteinfo.bbclass are sometimes used

The class in meta-oe has all the methods from after the big overhaul in
.dev and the old ones before the overhaul that match oe-core. We need
both since meta-oe gets recipes from both .dev and -core.
I hope siteinfo in oe-core gets updated to the one after the overhaul to
reduce the divergence.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN509uMkyGM64RGpERAsvbAJ4kBs4S1LSYU1yXz5pMo+sbVbpGaACfe18S
F1Tnz3Pt8AaetMIngkYN+Mw=
=EfrM
-----END PGP SIGNATURE-----



