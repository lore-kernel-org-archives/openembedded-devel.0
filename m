Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7286099F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 11:16:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2013 04:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,719,1363158000"; d="scan'208";a="317688832"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2013 04:16:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2013 12:16:24 +0100
Message-ID: <2891290.BElKJ1Rkl4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1369189009-18847-1-git-send-email-raj.khem@gmail.com>
References: <1369189009-18847-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] ezxd: Add LIC_FILES_CHKSUM to recipe and -fPIC to CFLAGS
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
X-List-Received-Date: Wed, 22 May 2013 11:16:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 May 2013 19:16:49 Khem Raj wrote:
> This recipe has been failing to build. With this patch
> it now builds. build tested for beaglebone
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  recipes-bsp/ezx/ezxd_svn.bb |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/ezx/ezxd_svn.bb b/recipes-bsp/ezx/ezxd_svn.bb
> index 6dbcd0f..7b69454 100644
> --- a/recipes-bsp/ezx/ezxd_svn.bb
> +++ b/recipes-bsp/ezx/ezxd_svn.bb
> @@ -1,12 +1,12 @@
>  DESCRIPTION = "Open implementation of motorola's tapisrv, replaces
> opentapi" -LICENSE = "GPLv2"
> +LICENSE = "GPLv2+"
>  SECTION = "devel"
>  AUTHOR = "Daniel Ribeiro"
> 
>  SRCREV = "2513"
>  PV = "0.0+svnr${SRCPV}"
>  PR = "r4"
> -
> +LIC_FILES_CHKSUM =
> "file://plugin.c;endline=19;md5=16da36fbb577507b411368f133ce2067" SRC_URI =
> "svn://svn.openezx.org/trunk/src/userspace/;module=ezxd;protocol=http \
> file://ezxd.init \
>            "
> @@ -18,9 +18,9 @@ INITSCRIPT_PARAMS = "start 00 S ."
> 
>  S = "${WORKDIR}/${PN}"
> 
> -CFLAGS_append = " -DDEBUG "
> +CFLAGS_append = " -DDEBUG -fPIC "
> 
> -TARGET_CC_ARCH += "${LDFLAGS}"
> +TARGET_CC_ARCH += "${LDFLAGS} -fPIC"
> 
>  do_configure() {
>          # Comment out both CC and CROSS definitions

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

