Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnStL-0000eI-4K for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:00:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSsu-0007o0-75 for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:00:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 11:00:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 11:00:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Aug 2010 10:50:01 +0200
Message-ID: <i4tcnp$qie$6@dough.gmane.org>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 09:00:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-08-10 05:04, AJ ONeal wrote:
>>
>>
>>> +do_install () {
>>> +install -d ${D}${bindir}/
>>> +install -m 0755 ${S}/node ${D}${bindir}/
>>> +}
>>
>> 'make install' doesn't work?
>>
>>
> No, if I do `make install` it will try to install to the host location. I
> tried adding ./configure --prefix=${D}, but that ends up installing to
> `./work/arm......./usr/bin/bin`
> 
> 
> I don't know how to add the [v2] onto a patch, but I'm going to submit again
> with what I have working.

Doesn't nodejs have some form of DESTDIR option? I think it did when I
built it natively.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMcjY5MkyGM64RGpERAjXEAKCFFujj6YTak9NMbwqahDlyqotSigCdH+b5
wTjCxcVVoDHk4QJSVRxawqo=
=zN0i
-----END PGP SIGNATURE-----



