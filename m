Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUHvd-0000JL-Bx for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:28:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OUHr0-0004qf-SR for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:22:50 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 13:22:50 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 13:22:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 01 Jul 2010 13:22:40 +0200
Message-ID: <i0htq1$7dm$1@dough.gmane.org>
References: <i0hp61$n03$1@dough.gmane.org>
	<20100701105500.GA12260@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100701105500.GA12260@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: java staging problem
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
X-List-Received-Date: Thu, 01 Jul 2010 11:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-07-10 12:55, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2010-07-01 at 12:03, Koen Kooi wrote:
>>
>> I'm attempting to build openjdk using the jalimo overlay and I found a
>> problem with the staging dirs:
>>
>> /OE/angstrom-dev/sysroots/java <- contains a few jars e.g. xalan2.jar
>> /OE/angstrom-dev/sysroot/x86_64-linux/usr/share/java <- contains other
>> jars, e.g. serializer.jar
>>
>> The openjdk configure tells the buildsystem that both xalan2.jar and
>> serializer.jar are in /OE/angstrom-dev/sysroots/java when only
>> xalan2.jar is.
>>
>> I vaguely remember the buglabs people talking about that and their
>> local.conf mangles some JAVA vars.
> 
> That is what we have in our local.conf:
> 
> # Stage JAR files not into ARCH related dirs
> STAGING_DIR_JAVA = "${STAGING_DIR}/java"
> STAGING_DATADIR_JAVA ?= ${STAGING_DIR_JAVA}
> 
> Full local.conf can be found here:
> http://svn.buglabs.net/svn/!source/11343/bug/trunk/com.buglabs.build.oe/build/conf/local.conf
> 
>> How should we solve this in OE properly?
> 
> That is a good question. So far I have mostly avoided the java building and left
> the honor to tarrent.
> 
> Our build setup is a bit fragile right now as javac segfault sometimes during
> building and we don't know why. Another out of memory bug should be fixed by
> Henning again.
> 
> Right now I would be happy to have a reliable build and then work towards
> getting it mor sane and bring it into OE. Thats blocking me a bit here from
> further upstream work, but we will get behind it.

I pushed all the magic needed to build it for angstrom:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=90249cc563b916a4d764573156042fd8998f0731

That should make it easier for other people to test.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMLHqAMkyGM64RGpERAtUyAJ9F5GdjHeYhnOuKZnndBKb9oVDWcACeKkme
alhGxNynaVqIPVYp9H6VEEg=
=wUSI
-----END PGP SIGNATURE-----



