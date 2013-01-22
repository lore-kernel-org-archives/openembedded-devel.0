Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxgWy-0004E2-Vz
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 17:17:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2013 08:01:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="250736632"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2013 08:01:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 16:01:20 +0000
Message-ID: <2260360.3mJk12AbcU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <1358791761-10966-1-git-send-email-raj.khem@gmail.com>
References: <1358791761-10966-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] kdepimpi-base: Remove mutliline commented code
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
X-List-Received-Date: Tue, 22 Jan 2013 16:17:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 21 January 2013 10:09:21 Khem Raj wrote:
> This is now reported as error by bitbake and refused to parse.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qtopia/kdepimpi/kdepimpi-base.inc |    9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> b/recipes-qtopia/kdepimpi/kdepimpi-base.inc index 27cc237..1a78c40 100644
> --- a/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> +++ b/recipes-qtopia/kdepimpi/kdepimpi-base.inc
> @@ -30,10 +30,6 @@ LIBS+=-L${S}/dest/ \
>  LIBS-=-lzlib \
>  LIBS+=-lz \
>  "
> -# That changes will be needed for KMicroMail/PI to get it build with OE
> libs -#
> -#             LIBS-=-lkmicromailwrapper LIBS+=-lmailwrapper
> LIBS+=-lopiecore2 \ -
>  QMAKE_PROFILES= "all.pro"
> 
>  SUBDIRS="qtcompat libical/src/libical libical/src/libicalss microkde
> libkcal libkdepim \ @@ -42,11 +38,6 @@ SUBDIRS="qtcompat
> libical/src/libical libical/src/libicalss microkde libkcal lib
> gammu/emb/common \
>          gammu/emb/gammu \
>          "
> -#        pwmanager/libcrypt/mpi  \
> -#        pwmanager/libcrypt/error  \
> -#        pwmanager/libcrypt/cipher  \
> -#        pwmanager/libcrypt/zlib \
> -#        pwmanager/pwmanager \
> 
>  inherit palmtop

Merged along with a modified version of your other recent parsing patch, 
thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


