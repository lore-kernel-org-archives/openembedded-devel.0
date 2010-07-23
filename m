Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcCeL-0007Tw-4I for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 09:27:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcCdv-0005Do-06 for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 09:26:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:26:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:26:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jul 2010 09:25:49 +0200
Message-ID: <i2bg5t$mvp$1@dough.gmane.org>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 23 Jul 2010 07:27:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-07-10 20:04, Khem Raj wrote:
> Hi
> 
> The following 4 patches are based on  Jushua's work in poky to get rid of
> cross dir and install the toolchain in  native sysroot.
> 
> I have done native-sdk-builds for uclibc and eglibc. It could build the images
> and the images booted fine in qemu on mips and arm.
> 
> I would  appreciate if someone could lend a hand in testing these patches
> 
> And as we have changed tmpdir layout with this patch I have also bumped ABI
> which means tmp has to be nuked before you try these patches.
> 
> Please review/ack/nack

There is a BIG problem with these patches, they break multimachine builds.

The previous situation had:

cross/armv7a-angstrom-foo/usr/bin/
cross/armv5te-angstrom-foo/usr/bin/
etc

The new situation has:

x86_64-linux/usr/bin

So all the toolchains get dropped into the *same* directory, which
breaks horribly.

I see 2 courses of action to fix this quickly:

1) add ${TARGET_SYS} back, bump ABI
2) revert these patches, bump ABI

So, what do other people think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMSUP9MkyGM64RGpERAkkbAKCbMy47668egFF707rfNYNsiKSSKQCcDpbn
53k+LcpMKzu2x8uwQUbqrl0=
=Hy7k
-----END PGP SIGNATURE-----



