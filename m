Return-Path: <fgretief@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id BBBC46B22E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2013 10:28:48 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so320171lbh.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2013 03:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6Hq1wbPiAtGdZzKlP5Xb0IK48QOPJjQaE+A//avcjxQ=;
	b=XxWTt33C6monI71EoDM83NM4cHu14B8nIBnzQHS+GOLCTz+1kVHJh42Ck7/jO/7HVX
	UJqgIQeHpl1bUDHAEuZC74NbwNPgCeCm+H4VIhhRi+AGMOVmxm4WVinNnqtmrd+y8DY6
	jCpRy21kssyjhhrZbXwuAuZHVVlSjQJ/D2xvhemc7af4heR5lpsARMPV7JCpXHA5lnHs
	KHKxCDn8DGWmgLWro8VNh1d2ktobSZLzld70Mv+0rkvwIzcNkmpCikUYY50zwjLlbW6N
	w9+l2YaDzkmlhK4R80Sa5HXQcYhMRtoElMeiRsCwAshTmAzxVbx87gx3C550HxxLAggr
	2LQg==
MIME-Version: 1.0
X-Received: by 10.152.22.42 with SMTP id a10mr2757548laf.30.1375439328338;
	Fri, 02 Aug 2013 03:28:48 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Fri, 2 Aug 2013 03:28:48 -0700 (PDT)
Date: Fri, 2 Aug 2013 12:28:48 +0200
Message-ID: <CAFpw0gJBdr3jwhYBx2M0QjNM8HSOf1WOB3rFzkR12T3cc5SWJg@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Cross compiling for x86_64-mingw32
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
X-List-Received-Date: Fri, 02 Aug 2013 10:28:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hallo,

For an upcomming project we need to build a x86_64-mingw32 SDK.   So I
started
down the road to create such an SDK. I am using [1] as reference to build
OE packages.

So far I gathered that I need to create a sdk conf file for this target:

# cat ${OECORE}/meta/conf/machine_sdk/x86_64-mingw32.conf
SDK_ARCH=x86_64
SDK_OS=mingw32

Then the next steps is to make sure I can build binutils:

# SDKMACHINE=x86_64-mingw32 bitbake binutils-crosssdk

This works. The next step is to build the gcc-initial:

# SDKMACHINE=x86_64-mingw32 bitbake gcc-crosssdk-initial

But this step requires the mingw-w64 headers. Using references to recipies
from
the old oe-classic tree, I was able to craft a recipe for the
mingw-w64-headers.

recipes-devtools/mingw/mingw-w64-headers_2.0.8.bb
-----------------------------------------------------------
DESCRIPTION = "Header files from the MingGW-w64 project"
LICENSE = "ZPL"
LIC_FILES_CHKSUM = "file://../COPYING;md5=3194ff3a0d16f018784d1847bc6a3c4d"

PR = "r1"

BBCLASSEXTEND = "nativesdk"

DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_mingw32 = "1"

SRC_URI =
"${SOURCEFORGE_MIRROR}/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v${PV}.tar.gz"
SRC_URI[md5sum] = "659e5baf45ac8e8b8526f29786ee1112"
SRC_URI[sha256sum] =
"1a5a2c57f90c7f1b5eb8402a52f93de645925a8af62c2cfe748f39ce66008cf4"

S = "${WORKDIR}/mingw-w64-v${PV}/mingw-w64-headers"
B = "${WORKDIR}/build-${TARGET_SYS}"

inherit autotools

INHIBIT_DEFAULT_DEPS = "1"
DEPENDS = ""

do_configure() {
    oe_runconf
}

do_compile() {
    :
}
-----------------------------------------------------------

My question is how do one get the resulting header fiels in the right place
so that
gcc-crosssdk-initial can pick it up. From the error messages I can see that
GCC is looking in
${TMPDIR}/sysroots/x86_64-nativesdk-angstromsdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-mingw32/usr/include

What is missing from the recipe?  When I run the recipe, it builds fine,
but the sysroot folder is still empty.

# SDKMACHINE=x86_64-mingw32 bitbake nativesdk-mingw-w64-headers

Any suggestions is helpful.

Cheers
  Francois

[1] http://www.nathancoulson.com/proj_cross.php

