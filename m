Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U8T8M-0005qI-2w
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 11:12:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Feb 2013 01:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,708,1355126400"; d="scan'208";a="288706789"
Received: from unknown (HELO helios.localnet) ([10.252.120.83])
	by orsmga002.jf.intel.com with ESMTP; 21 Feb 2013 01:55:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2013 09:55:55 +0000
Message-ID: <10163036.J0OQEGjt9t@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
References: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] kdepimpi: Fix multiline comments
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
X-List-Received-Date: Thu, 21 Feb 2013 10:12:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 February 2013 23:42:04 Khem Raj wrote:
> Makes parsing go through
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qtopia/kdepimpi/kdepimpi-base.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> b/recipes-qtopia/kdepimpi/kdepimpi-base.inc index 27cc237..5d6bb0d 100644
> --- a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> +++ b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> @@ -33,7 +33,7 @@ LIBS+=-lz \
>  # That changes will be needed for KMicroMail/PI to get it build with OE
> libs #
>  #             LIBS-=-lkmicromailwrapper LIBS+=-lmailwrapper
> LIBS+=-lopiecore2 \ -
> +#
>  QMAKE_PROFILES= "all.pro"
> 
>  SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde
> libkcal libkdepim \ @@ -47,7 +47,7 @@ SUBDIRS="qtcompat libical/src/libical
> libical/src/libicalss microkde libkcal lib #       
> pwmanager/libcrypt/cipher  \
>  #        pwmanager/libcrypt/zlib \
>  #        pwmanager/pwmanager \
> -
> +#
>  inherit palmtop
> 
>  do_configure_prepend() {

Thanks, but you already sent a patch for this and I already merged it:

http://cgit.openembedded.org/meta-opie/commit/?id=93df88a1cc88c4db2616b9e31aa13477f2c7f63e

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


