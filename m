Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpaL-0001WR-Du for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:17:53 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NlpXb-0003EM-6B for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:15:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 21:15:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 21:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Feb 2010 21:09:43 +0100
Message-ID: <hmeii7$q7e$1@dough.gmane.org>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>	<20100227165600.GD30145@xora-desktop.xora.org.uk>	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<1267306071.9295.1.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <1267306071.9295.1.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 28 Feb 2010 20:17:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-02-10 22:27, Tom Rini wrote:
> On Sat, 2010-02-27 at 20:46 +0000, Phil Blundell wrote:
>> On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
>>> NAK on creating extra levels.
>>>
>>> Changing the level where recipes are held is not an option do to the way
>>> you tell bitbake how to find them.
>>>
>>> BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"
>>
>> Is that really such a big deal?  We seemed to manage to switch BBFILES
>> from /packages/ to /recipes/ without any major casualties, and I would
>> have thought that adding an extra level in there would be equally
>> straightforward.  Or of course, even better, the distro-specific recipes
>> could go in an overlay which the distro config would select.
> 
> I think you've just hit on a potentially great idea.  Say that
> 'openembedded' supports 'micro' and 'minimal' as two example
> distributions.  Move everyone else into their own distro overlay.  The
> only problem with this, perhaps, is easily adding the distro overlay
> itself into the right env vars. :(

Move every distro out of OE, that way people need to set the overlays
correctly.

This does mean that we abandon the "sharing" aspect that started OE
since every little "improvement" will be done in the distro overlay
instead of OE.

Maybe the u-boot custodian model would make sense for that type of scenario.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLis2HMkyGM64RGpERAgR2AJ9/q3Xc9iYXzOnmE1DOvameXej0dACeO8eN
3CVU85QKVuinvK4wmN0c+lk=
=q0y3
-----END PGP SIGNATURE-----



