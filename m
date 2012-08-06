Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SyI9i-000752-II for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 09:55:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SyHyM-0006vy-Ly for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 09:43:30 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 09:43:30 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 09:43:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 06 Aug 2012 09:43:51 +0200
Message-ID: <jvnsim$5e9$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
	<jvlm56$r75$1@dough.gmane.org>
	<CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
X-Enigmail-Version: 1.4.3
X-Enigmail-Draft-Status: 513
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 06 Aug 2012 07:55:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-08-12 23:37, Chris Larson schreef:
> On Sun, Aug 5, 2012 at 4:41 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>>> doent sound logical to me. Would it be acceptable if angstrom used
>>> this feature from OE-Core as well ? then it will remove the usecase 
>>> completely.
>> 
>> I keep waiting on the person that pushed it to oe-core to provide
>> patches for distro layers using the old functionality, see above.
> 
> This doesn't make much sense to me. It's impossible to know what all 
> layers use a given piece of functionality, particularly ones that aren't
> published in public places, so expecting every person changing something
> in oe-core will go and submit changes to every layer that exists is
> entirely unreasonable. If you maintain a layer, it's your responsibility
> to make sure your layer retains compatibility with upstream. It's not
> upstream's responsibility to make sure everyone using their functionality
> stays compatible.

In this specific instance the class was moved from meta-angstrom to meta-oe
as is and then moved to oe-core and changed to make it "less angstrom
specific".
I don't see how you can  argue that the person making that change was/is
unaware of the existence of the angstrom layer. Or of the SHR usage of that
class.

But yes, some people don't know that layers exist, there was a nice example
last week when I asked if someone checked *all* the layers out there on the
impact of the patch in question and the response was "Yes, I checked both
oe-core and meta-intel".

I agree with your generic point that changes in oe-core can not and should
not require updating of all layers by the submitter. On the other hand: if
you know you're moving functionality between layers while breaking it in the
process it is anti-social to not fix up the user(s) of that functionality
that you know of.

This is similar to asking a oe-core patch to be held back for a few days
because a number of layers have a matching bbappend that will need updating.
Especially if those layers have maintainers where the patch review latency
is measured in days instead of hours (e.g. me with non-denzil based stuff).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQH3W3MkyGM64RGpERAlbgAKCBvZTQD38H44mB+JzjQ2t92ttMzQCfVxeJ
nX2o+AfM7mrFEZnBT7YAV5s=
=v8kK
-----END PGP SIGNATURE-----



