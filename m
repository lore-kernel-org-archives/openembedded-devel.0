Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id CC8F2601A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:56:51 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.127 with ESMTP; 3 Oct 2014 19:56:51 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: <martin.jansa@gmail.com>
References: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
	<20141001152158.GE25706@jama>
In-Reply-To: <20141001152158.GE25706@jama>
Date: Fri, 3 Oct 2014 19:57:11 +0900
Message-ID: <00cd01cfdef8$c86aeca0$5940c5e0$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIuLIPQUHzAPiMY3p0nzgT9U9INAgKXt/EBm0zaW/A=
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gdal: update to version 1.11.0
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
X-List-Received-Date: Fri, 03 Oct 2014 10:56:54 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

I successfully built in qemux86. But I didn't test by qemuarm.

I'll test it on qemuarm.

Q: If I change the recipes, then which environment should I test (qemux86,
qemuarm, both)?

Thanks
-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Martin Jansa
Sent: Thursday, October 02, 2014 12:22 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] gdal: update to version 1.11.0

On Mon, Sep 29, 2014 at 10:09:21AM +0900, Changhyeok Bae wrote:
> ---
>  .../gdal/{gdal_1.10.1.bb => gdal_1.11.0.bb}        |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)  rename 
> meta-oe/recipes-navigation/gdal/{gdal_1.10.1.bb => gdal_1.11.0.bb} 
> (94%)
> 
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb 
> b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> similarity index 94%
> rename from meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> rename to meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> index 14f1a57..8526cee 100644
> --- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "GDAL is a translator library for raster geospatial data
formats"
>  HOMEPAGE = "http://www.gdal.org/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
"file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
> +LIC_FILES_CHKSUM =
"file://LICENSE.TXT;md5=0952e17969fab12227096b5228f23149"
>  
>  DEPENDS = "proj sqlite3 tiff"

Missing dependency on json-c and sqlite3 check doesn't seem to work
correctly

| checking for SQLite3 library >= 3.0.0... yes
| cat: 
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/inc
| lude/sqlite3.h: No such file or directory
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueab
| i/gdal/1.11.0-r0/gdal-1.11.0/configure: line 25763: test: !=: unary 
| operator expected
| configure: WARNING: Can not find SQLITE_VERSION macro in sqlite3.h header
to retrieve SQLite version!
| checking for sqlite3_column_table_name in -lsqlite3... yes disabled 
| checking Checking for DWGdirect... disabled
| configure: "IBM Informix DataBlade support disabled."
| configure: checking whether we should include ESRI SDE support...
|         ESRI SDE support not requested.
| checking for geos-config... 
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/bin/cro
| ssscripts/geos-config checking for GEOS version >= 3.1.0... yes 
| checking for GEOSversion in -lgeos_c... yes
| configure: Using C API from GEOS 3.4.2 checking for OpenCL support... 
| no checking for FreeXL support... checking for 
| json_object_set_serializer in -ljson-c... yes using pre-installed 
| libjson-c
| configure: error: could not find json-c/json.h Configure failed. The 
| contents of all config.log files follows to aid debugging 
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueab
| i/gdal/1.11.0-r0/gdal-1.11.0/config.log
| This file contains any messages produced by compilers while running 
| configure, to aid debugging if configure makes a mistake.
| 
| It was created by configure, which was generated by GNU Autoconf 2.69.  
| Invocation command line was


>  
>  SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
>  
> -SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
> -SRC_URI[sha256sum] =
"e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
> +SRC_URI[md5sum] = "31f2c4a7230b40e5fdc3cf12a100f96b"
> +SRC_URI[sha256sum] =
"b5186b5817e94743de1bceef66aeee1461687e14f73bf81034fcf0377eacbcc3"
>  
>  inherit autotools-brokensep lib_package binconfig
>  
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


