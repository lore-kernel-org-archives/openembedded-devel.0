Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvbWI-0001hf-5A for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 20:18:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvbTC-0007gz-N5 for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 20:14:54 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 20:14:54 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 20:14:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 27 Mar 2010 20:14:43 +0100
Message-ID: <hollf3$mcq$1@dough.gmane.org>
References: <1269437224.1681.134.camel@rex>	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>	<ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>	<1269467167.1681.169.camel@rex>	<ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>	<1269714709.2382.6.camel@gnutoo-desktop>
	<1269716090.23548.28.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269716090.23548.28.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reproducible builds (Was Re: Checksums in Bitbake)
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
X-List-Received-Date: Sat, 27 Mar 2010 19:18:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-03-10 19:54, Tom Rini wrote:
> On Sat, 2010-03-27 at 19:31 +0100, GNUtoo wrote:
>> On Thu, 2010-03-25 at 08:45 +0100, Frans Meulenbroeks wrote:
>>> I've seen too often (also outside OE) that two engineers take the same
>>> source yet still get different results, and that bugs at a customer
>>> site cannot be reproduced in the lab (and yes, I do know there are
>>> other ways to tackle this problem) 
>> Also:
>> bitbake optionaldep
>> bitbake package
>> And:
>> bitbake package
>>
>> could result in different binaries/packages due to configure picking
>> optionaldep in the first case and not in the second one.
>>
>> Maybe we should start hardcoding --without-optionaldep for all optional
>> dependencies that are not in DEPENDS?
>>
>> OR...maybe packaged-staging could save us from that issue?
>>
>> ( http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gives/ )
> 
> pstaging catches the implicit required deps, but not the implicit
> optional deps.  IMHO it would be nice, and I think there's been a
> general OK in this direction, to move towards DISTRO_FEATURES (or so?)
> toggling --enable-<feature>.  That's what's needed in this particular
> case.

DISTRO_FEATURE should only be used as last resort, per-recipe staging
would be better :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLrlkjMkyGM64RGpERAg1jAJ4y8sgtx9IDeGxndv0SedzgpewLVwCggGTl
S6eFOiavvxEeRl3qlDQuwZk=
=JyEG
-----END PGP SIGNATURE-----



