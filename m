Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OULMu-0002XD-UY for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 17:08:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OULII-0000eK-2u for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 17:03:14 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 17:03:14 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 17:03:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 01 Jul 2010 17:03:04 +0200
Message-ID: <i0ian8$pt3$1@dough.gmane.org>
References: <4C2AC77A.70102@gmail.com> <4C2ACDE8.7080801@gmail.com>
	<lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <lyfx03gsjv.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Thu, 01 Jul 2010 15:08:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-07-10 16:55, Enrico Scholz wrote:
> Graham Gower <graham.gower@gmail.com> writes:
> 
>> None of the distros in OE 
> 
> At least the openmoko SHR distribution fetches ipkg from network and
> requires curl support hence.

That's not true, with curl disabled, it calls (busybox) wget.

>> appear to want/need gpg or curl support in opkg; so have opkg.inc
>> remove them by default.
> 
> I do not think that supporting only offline mode (due to removal of
> curl support) is a good idea.  Although the opportunistic signature
> verification is not secure, it would be imo bad to remove gpg support
> completely because updating embedded devices in a secure manner is
> important.
> 
> A better way might be to conditionalize your '--disable-*' options
> resp. make them depend on some DISTRO_FEATURE.

Introducing USE flags would be a step backwards, so NAK on that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMLK4oMkyGM64RGpERAi1LAJ92At87I57tSF/kRSlR+JAkGThQTACguKBy
JqkzXKxs4DLPWSbAtSTxqIc=
=RGMg
-----END PGP SIGNATURE-----



