Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC52677253
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 12:00:20 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u13C0LdN010268 for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Feb 2016 06:00:21 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020306002112-597400 ;
	Wed, 3 Feb 2016 06:00:21 -0600 
Date: Wed, 3 Feb 2016 14:00:19 +0200
From: Alexandru But <alexandru.but@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160203120019.GA12718@zdravan.emea.corp.natinst.com>
References: <1454434802-29633-1-git-send-email-alexandru.but@ni.com>
	<56B167FC.3010901@windriver.com>
MIME-Version: 1.0
In-Reply-To: <56B167FC.3010901@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/03/2016 06:00:21 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/03/2016 06:00:21 AM,
	Serialize complete at 02/03/2016 06:00:21 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-03_05:, , signatures=0
Subject: Re: [meta-oe][PATCH] efivar: nvme header was renamed in linux 4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 12:00:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2016 at 10:37:48AM +0800, Robert Yang wrote:
> 
> 
> On 02/03/2016 01:40 AM, Alexandru But wrote:
> >nvme.h was renamed to nvme_ioctl.h in linux uapi headers since 4.4. Patch
> >taken from the gentoo repository.
> >
> >Signed-off-by: Alexandru But <alexandru.but@ni.com>
> >---
> >  .../efivar/efivar/0.21-nvme_ioctl.h.patch          | 30 ++++++++++++++++++++++
> >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 ++-
> >  2 files changed, 32 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
> >
> >diff --git a/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
> >new file mode 100644
> >index 0000000..221ec5a
> >--- /dev/null
> >+++ b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
> >@@ -0,0 +1,30 @@
> >+From ae0869b71a90bc14e67f3c917bd9c96db25c99a6 Mon Sep 17 00:00:00 2001
> >+From: Mike Gilbert <floppym@gentoo.org>
> >+Date: Thu, 14 Jan 2016 17:02:31 -0500
> >+Subject: [PATCH] Workaround rename of linux/nvme.h
> >+
> >+Bug: https://bugs.gentoo.org/571548
> >+---
> >+ src/linux.c | 5 +++++
> >+ 1 file changed, 5 insertions(+)
> >+
> >+diff --git a/src/linux.c b/src/linux.c
> >+index 5ebc151..e551377 100644
> >+--- a/src/linux.c
> >++++ b/src/linux.c
> >+@@ -22,7 +22,12 @@
> >+ #include <inttypes.h>
> >+ #include <limits.h>
> >+ #include <linux/ethtool.h>
> >++#include <linux/version.h>
> >++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
> >++#include <linux/nvme_ioctl.h>
> >++#else
> >+ #include <linux/nvme.h>
> >++#endif
> >+ #include <linux/sockios.h>
> >+ #include <net/if.h>
> >+ #include <scsi/scsi.h>
> >+--
> >+2.7.0
> >+
> >diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> >index 1684a10..3c34a7b 100644
> >--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> >+++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> >@@ -9,7 +9,8 @@ DEPENDS_class-target = "popt efivar-native"
> >
> >  SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> >  SRC_URI = "git://github.com/rhinstaller/efivar.git \
> >-           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
> >+           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch \
> >+           file://0.21-nvme_ioctl.h.patch"
> 
> This path is based on your previous, so it can't be applied.
> 
> And I got errors after fix conflicts:
> 
> | linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory
> | compilation terminated.
> 
> My kernel is 4.1.
> 
> 
> // Robert

It is weird that the patch is generating this error with 4.1 kernel. Is the
linux-libc-headers version also 4.1? The headers responsible for the
KERNEL_VERSION are installed in the sysroot with that recipe.

I should of added more context to the patch and not rush to send this change
before the fix goes in the oe-core layer. Associated discussions:
http://patches.openembedded.org/patch/114409/
http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105790.html

I will come back with the patch created on top of the master branch after the
headers backport is done in oe-core.

Regards,
Alex But

> 
> >  SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
> >  SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
> >
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

