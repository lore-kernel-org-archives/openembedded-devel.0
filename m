Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NuTCN-0000hO-F6 for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 17:12:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NuT9J-00086u-1M for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 17:09:41 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 17:09:41 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 17:09:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 24 Mar 2010 17:09:28 +0100
Message-ID: <hoddfo$6ql$1@dough.gmane.org>
References: <201003211505.39554.roman@khimov.ru>	<1269381068-5518-1-git-send-email-khimov@altell.ru>
	<201003241557.44087.khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <201003241557.44087.khimov@altell.ru>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/44] cpan-base: add perl version to PR
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
X-List-Received-Date: Wed, 24 Mar 2010 16:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-10 13:57, Roman I Khimov wrote:
> В сообщении от Среда 24 марта 2010 00:51:08 вы написали:
>> Makes perl modules rebuild on perl version change, since binary
>>  compatibility could be broken with that (although perl itself tries to
>>  maintain it  within patchlevel range, like 5.8.7 -> 5.8.8).
>>
>> This is conditional on PACKAGE_ARCH, since there is nothing to rebuild for
>> pure perl modules (and those should use 'PACKAGE_ARCH = "all"') even if
>>  they break with perl version change.
>>
>> This also should ease transition to perl 5.10.1.
> 
> OK to push?

Yes

> I've realized yesterday that without it or similar thing many 
> binary modules would be broken when someone would try to use 5.10.1 and manual 
> cleaning and rebuilding a ton of perl modules is no fun.

And manually bumping PR as well, which is why I asked for this :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLqjk4MkyGM64RGpERAtHuAJ9UNAvsTQJcRG8stOt0zXI5TeWjzQCeOC2J
HSypchX1JCQ3Uj6nexlelYs=
=aSbz
-----END PGP SIGNATURE-----



