Return-Path: <changhyeok.bae@lge.com>
Received: from lgemrelse7q.lge.com (LGEMRELSE7Q.lge.com [156.147.1.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0E71265D33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 23:51:32 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.151 with ESMTP; 24 Apr 2014 08:51:31 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <martin.jansa@gmail.com>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
	<20140423144521.GI2486@jama>
In-Reply-To: <20140423144521.GI2486@jama>
Date: Thu, 24 Apr 2014 08:51:49 +0900
Message-ID: <007601cf5f4e$fe3b4a20$fab1de60$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKUhjvRjrRtWj6UivVHcYzCnB5QuAK5J1BLmX/H3yA=
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] fim: Add mirror site
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
X-List-Received-Date: Wed, 23 Apr 2014 23:51:38 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Hi,

I agree with your opinion.
However there is no mirror classes in meta-oe.
Is it fine to add the mirror site to oe-core/meta/classes/mirrors.bbclass?

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Martin Jansa
Sent: Wednesday, April 23, 2014 11:45 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 1/3] fim: Add mirror site

On Wed, Apr 23, 2014 at 08:18:46PM +0900, Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
> 

at this point I think we should add variable for http://savannah.nongnu.org
and add this MIRROR setting globally:
meta/recipes-devtools/dmidecode/dmidecode_2.12.bb:SRC_URI =
"http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI =
"http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb:SRC_URI =
"http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:SRC_URI =
"http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.
gz \ meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb:SRC_URI =
"http://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.tar
.bz2 \ meta-oe/recipes-support/libunwind/libunwind.inc:SRC_URI =
"http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"

we have also couple of recipes referencing gnu.org version:
meta-networking/recipes-protocols/quagga/quagga.inc:SRC_URI =
"http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV
}.tar.gz;name=quagga-${PV} \
meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb:SRC_URI =
"http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
meta-oe/recipes-support/lzip/lzip_1.14.bb:SRC_URI =
"http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb:SRC_URI =
"http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV
}.tar.bz2 \ meta/recipes-devtools/quilt/quilt-0.61.inc:SRC_URI =
"http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
meta/recipes-extended/ed/ed_0.5.bb:SRC_URI =
"http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
meta/recipes-extended/texi2html/texi2html_5.0.bb:SRC_URI     =
"http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2 \
meta/recipes-support/attr/acl.inc:SRC_URI =
"http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
meta/recipes-support/attr/attr.inc:SRC_URI =
"http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \

> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb 
> b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> index 6e5000b..c6537ac 100644
> --- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> +++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> @@ -16,6 +16,8 @@ SRC_URI = 
> "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV
>  SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
>  SRC_URI[sha256sum] =
"3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
>  
> +MIRRORS += "http://download.savannah.nongnu.org/releases/
http://download-mirror.savannah.gnu.org/releases/ \n"
> +
>  PARALLEL_MAKE = ""
>  
>  inherit autotools
> --
> 1.7.9.5
> 
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


