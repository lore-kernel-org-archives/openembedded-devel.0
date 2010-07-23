Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcFBy-0000Zi-Lj for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:09:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcFBa-0006AI-42 for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:08:58 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:08:58 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 12:08:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jul 2010 12:08:48 +0200
Message-ID: <i2bpng$m41$1@dough.gmane.org>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>	<i2bg5t$mvp$1@dough.gmane.org>	<1279872152.21888.149.camel@lenovo.internal.reciva.com>	<i2bir6$un3$1@dough.gmane.org>
	<1279875548.13006.32.camel@rex>
	<AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 10:09:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-07-10 11:35, Esben Haabendal wrote:
> On Fri, Jul 23, 2010 at 10:59 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
>>> It's all 'arm-angstrom-foo', I was just about to make the suggestion to
>>> change it to 'armv7a-angstrom-foo' :)
>>
>> I've just been talking to Koen about this. When building for armv7a,
>> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
>>
>> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
>> happen but I could be wrong.
> 
> config.sub will generally not accept something like armv7a-*
> 
> If OE had not offered the vendor part of the arch strings to distros,
> it could have
> been solved by (in this case) using arm-v7a-foo ...

Actually not, since that would break external toolchains.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSWovMkyGM64RGpERAg1CAKC5vOFH/cNptjp5FMAz0eDpvp2YtACfaU5V
cHrMjEFU8rRlDZhNXw5NTns=
=JjxT
-----END PGP SIGNATURE-----



