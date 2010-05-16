Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODgiD-0006OQ-7Z for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:29:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODgeF-00043b-V0 for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 18:25:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 18:25:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 18:25:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 May 2010 18:22:42 +0200
Message-ID: <hsp64i$r3s$2@dough.gmane.org>
References: <1273877583-31604-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <1273877583-31604-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cross.bbclass: fix build of meta-toolchain
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
X-List-Received-Date: Sun, 16 May 2010 16:29:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I can confirm that 'meta-toolchain' builds against with this
(angstrom/beagleboard), but I don't know what the effect of this is on
cross recipes.

regards,

Koen

On 15-05-10 00:53, Eric Benard wrote:
> - without this bitbake meta-toolchain fails because it doesn't find who
>  provides gdb-cross-sdk
> - found thanks to a hint from Phil Blundell on IRC
> - tested with Angstrom/ARMv5te
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
>  classes/cross.bbclass |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index 69f6511..5c2d5be 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -17,8 +17,6 @@ PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
>  OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
>  BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
>  
> -PACKAGES = ""
> -
>  HOST_ARCH = "${BUILD_ARCH}"
>  HOST_VENDOR = "${BUILD_VENDOR}"
>  HOST_OS = "${BUILD_OS}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL8BvSMkyGM64RGpERApFQAJ40WH4OOiFb0PZVfy/8gbQG4tFn4ACdFiHQ
9sEaKXsbeiDyzv/P/7+fQ4A=
=14NR
-----END PGP SIGNATURE-----



