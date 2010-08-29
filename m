Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Opebx-0001ps-6c for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:55:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OpebR-0000Ku-2Z for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:55:05 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:55:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 29 Aug 2010 11:54:40 +0200
Message-ID: <i5dap0$v2$2@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-6-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1283027073-12308-6-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/23] meta-toolchain-arago-dvsdk.bb: Exclude from world build.
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
X-List-Received-Date: Sun, 29 Aug 2010 09:55:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-08-10 22:24, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/meta/meta-toolchain-arago-dvsdk.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/meta/meta-toolchain-arago-dvsdk.bb b/recipes/meta/meta-toolchain-arago-dvsdk.bb
> index 8e5b233..6deb2bc 100644
> --- a/recipes/meta/meta-toolchain-arago-dvsdk.bb
> +++ b/recipes/meta/meta-toolchain-arago-dvsdk.bb
> @@ -1,3 +1,4 @@
> +EXCLUDE_FROM_WORLD = "1"
>  TOOLCHAIN_HOST_TASK = "task-arago-toolchain-dvsdk-host"
>  TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-dvsdk-target"
>  

NAK, you're not saying why this needs to get excluded from world, it
seems to build fine over here.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMei5gMkyGM64RGpERAtn8AJ9f73BbHxsaMB//KfFcL2PVjBuq3ACfU/Fm
wcSPTERL/9JjMXlzY38bmyY=
=jouZ
-----END PGP SIGNATURE-----



