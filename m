Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou9A7-00007c-Mn
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 21:21:28 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J00J3DPQ8HZHD@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 14:20:33 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8E50414AF64; Fri,
	10 Sep 2010 15:20:32 -0400 (EDT)
Date: Fri, 10 Sep 2010 15:20:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910192032.GK28148@denix.org>
References: <1284141740-24059-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1284141740-24059-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 10 Sep 2010 19:21:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Sep 10, 2010 at 01:02:20PM -0500, Chase Maupin wrote:
> From: Chase <chase@chase-laptop.(none)>
> 
> * Added patch to allow using older versions of automake such
>   as 1.10.3 when building jpeg version 8b.
> * Only use the AM_SILENT_RULES if it is available.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  ...igure-make-jpeg-work-with-older-autotools.patch |   30 ++++++++++++++++++++
>  recipes/jpeg/jpeg_8b.bb                            |    7 +++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch
> 
> diff --git a/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch
> new file mode 100644
> index 0000000..dd6fd52
> --- /dev/null
> +++ b/recipes/jpeg/jpeg-8b/0001-configure-make-jpeg-work-with-older-autotools.patch
> @@ -0,0 +1,30 @@
> +From e9e77ee999553f9b94de0288688a0bdc60b92e0f Mon Sep 17 00:00:00 2001
> +From: Chase Maupin <chase.maupin@ti.com>
> +Date: Tue, 17 Aug 2010 08:30:56 -0500
> +Subject: [PATCH] configure: make jpeg work with older autotools
> +
> +* Only use the AM_SILENT_RULES variable if it is defined.  Older
> +  versions of automake don't support this option.
> +
> +Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> +---
> + configure.ac |    3 ++-
> + 1 files changed, 2 insertions(+), 1 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 96da13b..9a58c51 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -26,7 +26,8 @@ AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist foreign])
> + # Make --enable-silent-rules the default.
> + # To get verbose build output you may configure
> + # with --disable-silent-rules or use "make V=1".
> +-AM_SILENT_RULES([yes])
> ++# only use if available
> ++m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> + 
> + # This is required when using the de-ANSI-fication feature.
> + AM_C_PROTOTYPES
> +-- 
> +1.7.0.4
> +
> diff --git a/recipes/jpeg/jpeg_8b.bb b/recipes/jpeg/jpeg_8b.bb
> index 4251ca6..688dcd8 100644
> --- a/recipes/jpeg/jpeg_8b.bb
> +++ b/recipes/jpeg/jpeg_8b.bb
> @@ -2,12 +2,15 @@ DESCRIPTION = "libjpeg is a library for handling the JPEG (JFIF) image format."
>  LICENSE = "jpeg"
>  SECTION = "libs"
>  PRIORITY = "required"
> -PR = "r0"
> +PR = "r1"
>  
>  # TODO: really needed?
>  RPROVIDES_${PN} = "jpeg"
>  
> -SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz"
> +SRC_URI = "\
> +    http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
> +    file://0001-configure-make-jpeg-work-with-older-autotools.patch \
> +    "
>  S = "${WORKDIR}/jpeg-${PV}"
>  
>  inherit autotools
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


