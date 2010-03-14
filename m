Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NqnBy-0001fU-JF for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 13:45:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nqn94-0004jm-Px for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 13:42:14 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 13:42:14 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 13:42:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 14 Mar 2010 13:42:03 +0100
Message-ID: <hnilir$gqr$1@dough.gmane.org>
References: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>	<hnfpdp$mg6$1@dough.gmane.org>
	<4B9B8207.1040909@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <4B9B8207.1040909@atmel.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Sun, 14 Mar 2010 12:45:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-03-10 13:16, Ulf Samuelsson wrote:
> Koen Kooi skrev:
>> On 12-03-10 22:39, Ulf Samuelsson wrote:
>>> This package will copy the contents of "multimedia.tar.bz2."
>>> (Note the dot at the end) to the "/home/root/multimedia" directory
>>> in the target. By replacing the empty default file, you
>>> can add your own multimedia files for testing.
>>
>>> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
>>
>>
>> NAK. Package never never touch $HOME, if you want things installed into
>> $HOME, look into /etc/skel.
>>
> 
> The purpose is not to have a "multimedia" directory in each home
> so I dont think "/etc/skel" is applicable.
> 
> The purpose of this package is to be able to easily load some
> jpeg pictures, movies, mp3 files into the root file system
> when you build a demo.

Like
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=6a6d6bab519aefb44e3d49d305134057adf7539e
does?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnNmbMkyGM64RGpERAnAFAKC1w11jPy+2lXSHi5ZNHtymXpT/EACgq5cj
PXoq4JfTLv3vvA1Il7NClsY=
=DVyt
-----END PGP SIGNATURE-----



