Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyHV-0006zZ-0m for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:36:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyEN-000486-3V for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:33:07 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:33:07 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:33:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Mar 2010 21:32:53 +0200
Message-ID: <hooat6$p3d$1@dough.gmane.org>
References: <1269730499.4033.176.camel@mattotaupa>	<hon5i2$8iq$1@dough.gmane.org>
	<1269797481.8018.80.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269797481.8018.80.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: enna: do_configure failed: automake: unknown warning category `cross'
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
X-List-Received-Date: Sun, 28 Mar 2010 19:36:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-03-10 19:31, Paul Menzel wrote:
> Am Sonntag, den 28.03.2010, 10:55 +0200 schrieb Koen Kooi:
>> On 27-03-10 23:54, Paul Menzel wrote:
>>> I am trying to write the recipe for Enna [1].
>>
>> [..]
>>
>>> Now I am getting the following error message during `configure`.
>>>
>>>         […]
>>
>>>         configure.ac:35: required file `./config.rpath' not found
>>
>>> Any hint is appreciated.
>>
>> do_configure_prepend() {
>> 	autopoint || touch config.rpath
>> }
> 
> Thanks that worked!
> 
> Sorry for the next question. Is that workaround needed because of not
> having Automake 1.11.1? Or is the recommended fix, that upstream ships
> `config.rpath`?

It's a caused by this:

../../classes/autotools.bbclass:EXTRA_AUTORECONF = "--exclude=autopoint"

I don't know why we exclude it deliberately, but some recipes do need
it. And hence we try to run autopoint in efl.bbclass and create an empty
config.rpath when it fails.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLr67lMkyGM64RGpERAtG5AJ9xP8FP79T6+z61wtDTafs3keETgACgnA0S
Xc/1dzbc9EOB9aeV3gICJcY=
=BXrI
-----END PGP SIGNATURE-----



