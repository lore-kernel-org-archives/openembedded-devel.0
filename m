Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 459 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Oct 2014 06:08:16 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 4120C65DA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 06:08:16 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B0A212232029
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 08:00:08 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 262972232026
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (ip-109-45-1-1.web.vodafone.de
	[109.45.1.1]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:58:53 +0200 (CEST)
Date: Thu, 2 Oct 2014 07:57:51 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141002055749.GB3055@mail.itconsulting-heinold.de>
References: <1411515467-16344-1-git-send-email-zibo.zhao@windriver.com>
	<1411515467-16344-2-git-send-email-zibo.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1411515467-16344-2-git-send-email-zibo.zhao@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH 2/2] icedtea: CVE-2013-4160: integrate Non happy path fixes
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
X-List-Received-Date: Thu, 02 Oct 2014 06:08:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 23, 2014 at 07:37:47PM -0400, Zibo Zhao wrote:
> From: Michel Thebeau <michel.thebeau@windriver.com>
> 
> Little CMS (lcms2) before 2.5, as used in OpenJDK 7 and possibly
> other products, allows remote attackers to cause a denial of
> service(NULL ptr deref).
> 
> Adding NULL pointer checks fix the issue.
> 
> Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
> ---
>  ...cedtea-CVE-2013-4160-Non-happy-path-fixes.patch | 74 ++++++++++++++++++++++
>  recipes-core/openjdk/openjdk-7-release-03b21.inc   |  2 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch
> new file mode 100644
> index 0000000..75e11c4
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-7-03b21/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch
> @@ -0,0 +1,74 @@
> +From 91c2db7f2559be504211b283bc3a2c631d6f06d9 Mon Sep 17 00:00:00 2001
> +From: Marti Maria <info@littlecms.com>
> +Date: Tue, 25 Jun 2013 16:09:16 +0200
> +Subject: [PATCH] Non happy-path fixes
> +
> +commit 91c2db7f2559be504211b283bc3a2c631d6f06d9 from
> +https://github.com/mm2/Little-CMS
> +[modified for Little-CMS 2.0]
> +
> +Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> +Signed-off-by: Zibo Zhao <Zibo.Zhao@windriver.com>
> +---
> + src/cmsnamed.c | 12 +++++++----
> + src/cmsopt.c   | 10 ++++++++++
> + 2 files changed, 18 insertions(+), 4 deletions(-)
> +
> +diff --git openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
> +index a916e17..acfd1c8 100644
> +--- openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
> ++++ openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsnamed.c
> +@@ -514,8 +514,8 @@ cmsNAMEDCOLORLIST* CMSEXPORT cmsAllocNamedColorList(cmsContext ContextID, cmsUIn
> +     while (v -> Allocated < n)
> +         GrowNamedColorList(v);
> + 
> +-    strncpy(v ->Prefix, Prefix, sizeof(v ->Prefix));
> +-    strncpy(v ->Suffix, Suffix, sizeof(v ->Suffix));
> ++    strncpy(v ->Prefix, Prefix, sizeof(v ->Prefix)-1);
> ++    strncpy(v ->Suffix, Suffix, sizeof(v ->Suffix)-1);
> +     v -> ColorantCount = ColorantCount;
> + 
> +     return v;
> +@@ -571,6 +571,5 @@ cmsBool  CMSEXPORT cmsAppendNamedColor(cmsNAMEDCOLORLIST* NamedColorList,
> + 
> +     if (Name != NULL)
> +-        strncpy(NamedColorList ->List[NamedColorList ->nColors].Name, Name,
> +-                    sizeof(NamedColorList ->List[NamedColorList ->nColors].Name));
> ++        strncpy(NamedColorList ->List[NamedColorList ->nColors].Name, Name, cmsMAX_PATH-1);
> +    else
> +        NamedColorList ->List[NamedColorList ->nColors].Name[0] = 0;
> +@@ -735,6 +733,10 @@ cmsSEQ* CMSEXPORT cmsAllocProfileSequenceDescription(cmsContext ContextID, cmsUI
> +     Seq -> seq      = (cmsPSEQDESC*) _cmsCalloc(ContextID, n, sizeof(cmsPSEQDESC));
> +     Seq -> n        = n;
> + 
> ++    if (Seq -> seq == NULL) {
> ++        _cmsFree(ContextID, Seq);
> ++        return NULL;
> ++    }
> + 
> +     for (i=0; i < n; i++) {
> +         Seq -> seq[i].Manufacturer = NULL;
> +diff --git openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
> +index 7478e5e..4bdf0a7 100644
> +--- openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
> ++++ openjdk/jdk/src/share/native/sun/java2d/cmm/lcms/cmsopt.c
> +@@ -1179,6 +1179,16 @@ Curves16Data* CurvesAlloc(cmsContext ContextID, int nCurves, int nElements, cmsT
> + 
> +         c16->Curves[i] = _cmsCalloc(ContextID, nElements, sizeof(cmsUInt16Number));
> + 
> ++        if (c16->Curves[i] == NULL) {
> ++
> ++            for (j=0; j < i; j++) {
> ++                _cmsFree(ContextID, c16->Curves[j]);
> ++            }
> ++            _cmsFree(ContextID, c16->Curves);
> ++            _cmsFree(ContextID, c16);
> ++            return NULL;
> ++        }
> ++
> +         if (nElements == 256) {
> + 
> +             for (j=0; j < nElements; j++) {
> +-- 
> +1.9.1
> +
> diff --git a/recipes-core/openjdk/openjdk-7-release-03b21.inc b/recipes-core/openjdk/openjdk-7-release-03b21.inc
> index 6f78d10..5b5caff 100644
> --- a/recipes-core/openjdk/openjdk-7-release-03b21.inc
> +++ b/recipes-core/openjdk/openjdk-7-release-03b21.inc
> @@ -94,6 +94,7 @@ ICEDTEAPATCHES = "\
>  	file://icedtea-corba-parallel-make.patch;apply=no \
>          file://icedtea-zero-hotspotfix.patch;apply=no \
>          file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
> +        file://icedtea-CVE-2013-4160-Non-happy-path-fixes.patch;apply=no \
>  	"
>  ICEDTEAPATCHES_append_powerpc = " \
>  	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
> @@ -127,6 +128,7 @@ DISTRIBUTION_PATCHES = "\
>  	patches/icedtea-corba-parallel-make.patch \
>          patches/icedtea-zero-hotspotfix.patch \
>          patches/icedtea-CVE-2014-1876-unpack.patch \
> +        patches/icedtea-CVE-2013-4160-Non-happy-path-fixes.patch \
>  	"
>  
>  DISTRIBUTION_PATCHES_append_libc-uclibc = "\
> -- 
> 1.9.1

Thank you very much for the patches. Unfornatly I do not have much time at the moment
for meta-java. So it will last a bit until I can integrate them. Maybe
I will switch anyway to the 2.5 release of icedtea, which includes
the patches already.

Bye Henning

