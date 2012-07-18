Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SrQ6c-0006A7-BB for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 10:59:38 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SrPvb-0008Bc-0o for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 10:48:15 +0200
Received: from 92.69.204.68 ([92.69.204.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 10:48:15 +0200
Received: from koen by 92.69.204.68 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 10:48:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Jul 2012 10:48:03 +0200
Message-ID: <ju5t83$ml1$1@dough.gmane.org>
References: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 92.69.204.68
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-java][PATCH 1/3] llvm: Use default PACKAGES var
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
X-List-Received-Date: Wed, 18 Jul 2012 08:59:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-07-12 03:56, Khem Raj schreef:
> avoids packaging errors with oe-core master
> 
> Signed-off-by: Khem Raj <rak.khem@gmail.com> --- 
> recipes-core/llvm/llvm.inc |    2 -- 1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc 
> index 578cd40..5a46092 100644 --- a/recipes-core/llvm/llvm.inc +++
> b/recipes-core/llvm/llvm.inc @@ -65,8 +65,6 @@ EXTRA_OECMAKE = "\ # We
> need to reset this to avoid breakage as we build out of tree 
> TOOLCHAIN_OPTIONS = ""
> 
> -PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}" - PACKAGES_DYNAMIC =
> "llvm-*"
> 
> # the difference to the non-native build is that we do not need

Missing PR bump
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD4DBQFQBnhDMkyGM64RGpERAiZOAJiZ/WWBJsjB0e8KfZ1WnQXss+yBAKCo3EPs
UyuZpsd67ZRQgQy64w3kXg==
=SiHr
-----END PGP SIGNATURE-----



