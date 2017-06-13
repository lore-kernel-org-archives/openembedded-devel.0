Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 452C478313
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D63D20B7D;
	Tue, 13 Jun 2017 16:24:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jFwAMjwdFDCq; Tue, 13 Jun 2017 16:24:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 16C5E207AF;
	Tue, 13 Jun 2017 16:24:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 810E01624FD; Tue, 13 Jun 2017 12:24:25 -0400 (EDT)
Date: Tue, 13 Jun 2017 12:24:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Message-ID: <20170613162425.GC28053@denix.org>
References: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [PATCH] qtbase: add ptest
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
X-List-Received-Date: Tue, 13 Jun 2017 16:24:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 09, 2017 at 09:06:25AM +0800, Huang Qiyu wrote:
> Add ptest for qtbase  by using provided testsuite.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28 ++++++++++++++++++++++
>  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
>  recipes-qt/qt5/qtbase_git.bb                       | 17 ++++++++++++-
>  3 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
>  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
> 
> diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> new file mode 100644
> index 0000000..975cd28
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> @@ -0,0 +1,28 @@
> +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00 2001
> +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> +Date: Wed, 7 Jun 2017 21:00:49 +0900
> +Subject: [PATCH] Delete qlonglong and qulonglong

1. Reason for this?
2. Upstream-Status?


> +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> +---
> + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> +index 09458bd..59a120e 100644
> +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> +@@ -5,10 +5,8 @@ SUBDIRS=\
> +     char32_t \
> +     int \
> +     long \
> +-    qlonglong \
> +     qptrdiff \
> +     quintptr \
> +-    qulonglong \
> +     schar \
> +     short \
> +     uchar \
> +-- 
> +2.7.4
> +
> diff --git a/recipes-qt/qt5/qtbase/run-ptest b/recipes-qt/qt5/qtbase/run-ptest
> new file mode 100644
> index 0000000..044f834
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +for x in ` awk '{print $1}' tst_list `;do
> +    ./${x};
> +done
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 27d0de1..39fc272 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -23,8 +23,12 @@ SRC_URI += "\
>      file://0005-configure-bump-path-length-from-256-to-512-character.patch \
>      file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
>      file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
> +    file://0001-Delete-qlonglong-and-qulonglong.patch \
> +    file://run-ptest \
>  "
>  
> +inherit ptest
> +
>  # only for target qtbase
>  SRC_URI += "\
>      file://0008-configure-paths-for-target-qmake-properly.patch \
> @@ -48,7 +52,7 @@ PACKAGECONFIG_DISTRO ?= ""
>  PACKAGECONFIG_RELEASE ?= "release"
>  # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
>  # PACKAGECONFIG_OPENSSL ?= "openssl"
> -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype"
> +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
>  
>  PACKAGECONFIG ?= " \
>      ${PACKAGECONFIG_RELEASE} \
> @@ -170,6 +174,17 @@ do_configure() {
>          ${QT_CONFIG_FLAGS}
>  }
>  
> +fakeroot do_install_ptest() {
> +    mkdir -p ${D}${PTEST_PATH}
> +    t=${D}${PTEST_PATH}
> +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
> +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> +            echo ${var##*/} >> ${t}/tst_list
> +            install -m 0644 ${var} ${t}
> +        fi
> +    done
> +}
> +
>  do_install_append() {
>      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
>      touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

