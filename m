Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUaCD-00020m-Ll for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:57:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUa7Z-0003b2-Kt for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:53:09 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 08:53:09 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 08:53:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 02 Jul 2010 08:52:59 +0200
Message-ID: <i0k2cb$tkr$1@dough.gmane.org>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>	<i0iv84$7qt$1@dough.gmane.org>
	<4C2D13AE.9030903@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <4C2D13AE.9030903@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Fri, 02 Jul 2010 06:57:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-07-10 00:16, Tom Rini wrote:
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-07-10 18:24, Graeme Gregory wrote:
>>> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
>>> can use overrides to change behaviors of recipes.
>>>
>>> Maybe USE flags could be implemented in a similar fashing.
>>>
>>> DISTRO_USE = "nossl nox11"
>>>
>>> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
>>>
>>> ${PN} of the recipe becomes XXXX-nossl
>>>
>>> Thoughts?
>>
>> Just that USE flags shouldn't be used if seperate recipes can solve it
>> as well.
> 
> If I may, I'd like to articulate what I believe to be the technical
> argument behind this statement.
> 
> One of the issues with some form of USE flags, and I believe this is one
> of the big ones for Angstrom as well as any other public feed publishing
> distribution is that having a single recipe that does different things
> based on variables makes maintaining their feed (and allowing users to
> publish their own compatible feeds) a nightmare.

That's not what I'm getting at. If 2 *packages* can safely co-exist in
the feeds *and* and image can choose which it wants to install USE flags
artificially limit the choice.
Example: opkg, nopkg-nopgp

This extends to things like "shadow or tinylogin?" as well.

regards,

Koen

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMLYzLMkyGM64RGpERAqz5AJ0WYMyg9VkgKfHEz22ZWkXcX8ik0ACfdJir
AzXGjeywXg5XnbtRIqXIEhI=
=8aWE
-----END PGP SIGNATURE-----



