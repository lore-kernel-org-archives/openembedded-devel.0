Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1i78-0005jR-1O for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 17:33:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O1i3o-0000LW-Fa for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 17:29:56 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 17:29:56 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 17:29:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 13 Apr 2010 17:29:47 +0200
Message-ID: <hq22lb$qja$1@dough.gmane.org>
References: <hq16p2$e9c$1@dough.gmane.org> <1271158854.15813.137.camel@rex>
	<hq1p6s$gnd$1@dough.gmane.org>
	<k2nb6ebd0a51004130711m88a506do61a70977aebd683a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <k2nb6ebd0a51004130711m88a506do61a70977aebd683a@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python 2.6 for bitbake?
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
X-List-Received-Date: Tue, 13 Apr 2010 15:33:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-10 16:11, Chris Larson wrote:
> On Tue, Apr 13, 2010 at 5:48 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 13-04-10 13:40, Richard Purdie wrote:
>>> On Tue, 2010-04-13 at 09:33 +0200, Koen Kooi wrote:
>>>> I just noticed bitbake master is using python 2.6, which means I can't
>>>> use it at work when the official linux is still ubuntu 8.04LTS :(
>>>>
>>>> Can we please keep bitbake working with 8.04LTS? I suspect not only TI
>>>> is on the LTS bandwagon....
>>>
>>> I thought we'd make the bits that were 2.6 optional? Which bits are
>>> breaking and I assume you do have python 2.5 a least?
>>
>> Ubuntu 8.04LTS has 2.5.2 and it could that I'm blaming the brokenness in
>> master on python, but it's broken nevertheless....
>> When I finish doing the build I'll send the error message (was something
>> with "Exception as e:").
>>
> 
> I started leveraging 2.6 capabilities in master, as I had thought master
> required 2.6.  As far as I know, the 1.10 branch I split off before I
> started this set of commits should work fine with 2.5.  Sorry for the
> hassle.

1.10 works great, which is what I'm using now. That's why I wasn't
seeing the dependency loop issues with flex, bitbake 1.10 works as
expected with BBCLASSEXTEND, 1.8 doesn't.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxI3rMkyGM64RGpERAohNAJ9UysTFVwujoUdZ3eVn+aL8QswcCACgkkTM
7hCYyrXM/ALwDSEjZPuoLe4=
=5a+c
-----END PGP SIGNATURE-----



