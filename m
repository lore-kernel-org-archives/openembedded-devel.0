Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTt4C-0004uY-Gf for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 10:54:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTszb-0004CT-9A for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 10:50:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 10:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 10:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Jun 2010 10:49:48 +0200
Message-ID: <i0f0fc$b11$2@dough.gmane.org>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>	<1277858599-27400-3-git-send-email-joaohf@gmail.com>	<i0epn0$ke6$1@dough.gmane.org>
	<AANLkTim86--1-sAePXz04w2xygyDpIPfCzOAw8U0mBKe@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <AANLkTim86--1-sAePXz04w2xygyDpIPfCzOAw8U0mBKe@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] replace sdk -> nativesdk
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
X-List-Received-Date: Wed, 30 Jun 2010 08:54:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-06-10 09:03, Frans Meulenbroeks wrote:
> 2010/6/30 Koen Kooi <k.kooi@student.utwente.nl>:
> Hi,
> 
> Martin and I chatted about nativesdk a bit last week and after rereading
> the email thread it seems that 'nativesdk' and 'sdk' should coexist for
> awhile, so have both in BBCLASSEXTENDS?
> 
>> Care to share the rationale for this?
> 
>> Wrt the BBCLASSEXTEND:
>> if we have
>> BBCLASSEXTEND = "native sdk"
>> should that imply we also get native_sdk (or sdk_native or something
>> like that) (so do they extend each other), or should things like
>> nativesdk be mentioned explicitly?

You misunderstands how bbclass extend works, it just adds an 'inherit
<foo>' for each entry, it doesn't combine entries.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMKwUsMkyGM64RGpERAiRfAJ9mccFByrea0a7RrKC7n6w903liUQCgqq9f
nQdQZPOsIotHD6ym9FWvYHk=
=qEEI
-----END PGP SIGNATURE-----



