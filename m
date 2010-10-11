Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5Ktr-00083w-UR for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 18:06:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5KtT-0003WI-Si for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 18:06:31 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 18:06:31 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 18:06:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Oct 2010 18:06:21 +0200
Message-ID: <i8vclt$9te$1@dough.gmane.org>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>	<DB561678F08F554EB0D9F21B70E268A505AF27@exchange.intern.dresearch.de>
	<DB561678F08F554EB0D9F21B70E268A505AF2A@exchange.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <DB561678F08F554EB0D9F21B70E268A505AF2A@exchange.intern.dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Mon, 11 Oct 2010 16:06:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-10-10 17:34, Sledz, Steffen wrote:
> On 10/11/2010 09:34 AM, Sledz, Steffen wrote:
>> do_configure still fails for epiphany-2.30.2-r3 (see
>> <http://tinderbox.openembedded.net/packages/835265/>) with:
>>
>> "checking location of system Certificate Authority list...
>> configure: error: could not find. Use --with-ca-file=path
>> to set, or --without-ca-file to disable"
>>
>> I thought the additional ca-certifactes dependency (see thread
>> <http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=37585>)
>> fixes this, but it does not seem so. :(
>>
>> I'd a look into my openSUSE-system and there epiphany uses
>> a file /var/lib/ca-certificates/ca-bundle.pem (linked to
>> /etc/ssl/ca-bundle.pem) installed by the ca-certificates package.
>>
>> The OE ca-certificates package does not install such a bundle.
>> So may be that's the real problem.
> 
> A look into the ca-certificates recipe shows this:
> 
>   pkg_postinst_${PN} () {
>           /usr/sbin/update-ca-certificates
>   }
> 
> I think this is to late if another package needs the result from this call in its configuration stage.

That's missing a $D check as well, since in that form it can't be run
off-line

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMszX9MkyGM64RGpERAntxAJ4ks0QTGm4TYe0I4oFZkJkVibnYxQCfX383
lMq5v0la+u26N9XyIUdTVFk=
=6Bnt
-----END PGP SIGNATURE-----



