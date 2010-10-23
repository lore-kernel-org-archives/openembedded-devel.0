Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9dw9-0002MF-Vm for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 15:15:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P9dvT-0007zR-BB for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 15:14:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 15:14:23 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 15:14:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 23 Oct 2010 15:14:15 +0200
Message-ID: <i9un38$trm$1@dough.gmane.org>
References: <i9s8nh$e2$1@dough.gmane.org>
	<AANLkTi=NBNEgPe5j3vb74KTmGJALSmNqbPx_Bg-kKxMu@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTi=NBNEgPe5j3vb74KTmGJALSmNqbPx_Bg-kKxMu@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] using kernel.bbclass rename hook for external modules as well
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
X-List-Received-Date: Sat, 23 Oct 2010 13:15:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-10-10 09:46, Frans Meulenbroeks wrote:
> 2010/10/22 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Currently kernel.bbclass splits and renames modules into
>> kernel-module-<foo>, but module.bbclass doesn't. What's your opinion on
>> making modules.bbclass follow the same logic for consistency?
>> To make upgrade paths work the 'kernel-modules' metapackage would be
>> ${PN} for external modules.
> 
> The idea looks good to be, but can you explain the last sentence?
> I would expect the recipes that use these modules get changed too and
> with a PR bump they will drag in the new module with the new name, and
> not too much additional work needed.
> What I am missing?

Khem asked a similar question which I tried to answer:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/026053.html

Does that address your question as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwt+nMkyGM64RGpERAhFhAJ9pLDQc9ngI0AB+/t+QAH9SSmnbRgCdHqOZ
O+vzfAYutIkZqD5OOfOBDY8=
=anSR
-----END PGP SIGNATURE-----



