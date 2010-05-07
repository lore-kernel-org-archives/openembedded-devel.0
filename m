Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAHy7-0000rA-QE for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:27:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OAHuS-0003z7-FK for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:23:44 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 09:23:44 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 09:23:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 07 May 2010 09:23:32 +0200
Message-ID: <hs0f5k$sl$1@dough.gmane.org>
References: <4BE185C7.50305@dresearch.de>	<1273140949-14699-1-git-send-email-sledz@dresearch.de>	<hru6f7$4qk$1@dough.gmane.org>	<4BE29E46.2000600@dresearch.de>
	<4BE3BA38.1010102@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <4BE3BA38.1010102@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Fri, 07 May 2010 07:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-05-10 08:59, Steffen Sledz wrote:
>>>  #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
>>> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
>>> +PREFERRED_VERSION_linux-libc-headers       ?= "2.6.31"
>>> +PREFERRED_VERSION_linux-libc-headers_hipox ?= "2.6.24"
>>
>> NACK, that creates undefined behaviour for multimachine builds.
> 
> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers       = "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
> 
> Is this better?

No, it still changes the headers for one machine, which leads to
undefined behaviour for other machines using the same arch.
Any solution that doesn't mark *all* packages as machine specific for
hipox is going to cause that behaviour.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL47/0MkyGM64RGpERAmtKAJ4i6iHnKPD3Jhc2KGiFtQzj1g2kVQCeP8aa
fthjVFJAj6ahKSlqhgHA3yk=
=v8r3
-----END PGP SIGNATURE-----



