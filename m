Return-Path: <heinold@inf.fu-berlin.de>
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5BD66101C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 19:26:56 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1) with esmtp
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQj7R-001Ao7-9Q>; Mon, 30 Sep 2013 21:26:57 +0200
Received: from f052067244.adsl.alicedsl.de ([78.52.67.244]
	helo=mail.zedat.fu-berlin.de)
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1) with esmtpsa
	(envelope-from <heinold@inf.fu-berlin.de>)
	id <1VQj7Q-001xi6-Hg>; Mon, 30 Sep 2013 21:26:57 +0200
Date: Mon, 30 Sep 2013 21:26:44 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130930192643.GA22970@mail.zedat.fu-berlin.de>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-2-git-send-email-riku.voipio@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1380548771-13812-2-git-send-email-riku.voipio@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: 78.52.67.244
Cc: patches@linaro.org
Subject: Re: [meta-java][PATCH 2/3] jamvm: update to latest in openjdk-7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2013 19:26:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2013 at 04:46:10PM +0300, Riku Voipio wrote:
> jamvm has wrong wrong checksums for version referred. Update
> the version to match that is in jamvm_git.bb and make checksums
> match.
> ---
>  recipes-core/openjdk/openjdk-7-release-25b30.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
> index 363b6e2..60f4f43 100644
> --- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
> +++ b/recipes-core/openjdk/openjdk-7-release-25b30.inc
> @@ -43,11 +43,11 @@ CACAO_URI = "http://icedtea.classpath.org/download/drops/cacao/${CACAO_FILE};nam
>  SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
>  SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"
>  
> -JAMVM_VERSION = "0972452d441544f7dd29c55d64f1ce3a5db90d82"
> +JAMVM_VERSION = "ac22c9948434e528ece451642b4ebde40953ee7e"
>  JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
>  JAMVM_URI = "http://icedtea.classpath.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
> -SRC_URI[jamvm.md5sum] = "740c2587502831cac6797d1233a7e27b"
> -SRC_URI[jamvm.sha256sum] = "47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"
> +SRC_URI[jamvm.md5sum] = "3a67d0f3471bd2d5b2446d91bfa73f73"
> +SRC_URI[jamvm.sha256sum] = "4662da1fe3e0e11d8fa685c7f2fc748576b9f3d3e37dc56b798dd6a5bd6b61e7"
>  
>  # Allow overriding this separately
>  OEPATCHES = "\
> -- 
> 1.8.1.2

Hi,

jamvm version is fine we use the one openjdk 2.3 expect for now, but I have to update the cacao one.

So this patch will be dropped.

Bye Henning

