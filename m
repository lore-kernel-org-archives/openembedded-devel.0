Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B02246AF31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:23:48 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so1055278eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=C0sZAi4r6Q2tXgysquKmxVNO8Xy/7Wi4KYuVe5QoAJY=;
	b=pa4WjqEX0H+Kaq89UeWtyFuy8cZu5FEuLm/arQQ6i6w4UfAnVXrgY+PGh5WZJFO9Xa
	6xvjgoQt89MXOoG50LzpXC40gxHF3uZx7XeEUxdhVavFSkRQAVHm6sBPJmMMYukYjuk4
	kNOU0AA5pJVFJEnLZBEuZXV6C2FkpQiXSA+clrPNaDvco3eGDEk+ayJ+ocN/uriO4eM0
	XO9QSAxE8qiQyybiXRS9QLR7QfeLzNKBNDj8ocsq06ptpcm+aogP/rhCKkykIRjhTrAM
	ihhGjBEhhz85NeccSJ5nQS2G3pgPhEenEpWUoaI1frJwwPCHjXlTq7bSyPmCWj9qi0H0
	2LrQ==
X-Received: by 10.15.63.204 with SMTP id m52mr9470805eex.59.1372987428748;
	Thu, 04 Jul 2013 18:23:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cg12sm9684163eeb.7.2013.07.04.18.23.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:23:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:51 +0200
Message-Id: <cover.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 00/10] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Fri, 05 Jul 2013 01:23:49 -0000

I was using simple script to build each component alone:

#!/bin/bash

rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/*
rm -rf log.*

ls -d buildhistory/packages/*/* | xargs -n 1 basename | sort -u > component.list
ncomponents=`cat component.list | wc -l`
i=1
for component in `cat component.list`; do
  echo "Building component: ${component} ($i/$ncomponents)"
  bitbake -c cleansstate ${component} | tee log.${component};
  bitbake ${component} | tee -a log.${component};
  rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/*
  i=`expr $i + 1`
done
grep "NOTE: Tasks Summary: Attempted.*failed.$" log.*

That should cover missing mandatory dependencies.
Comparing depends.dot files in buildhistory between incremental build and this per-component build should detect at least some autodetected dependencies. In per-component builds it can find only libraries already included in dependency tree, so dependencies lost in buildhistory aren't deterministic.
Even better would be to run per-component build once after building world without removing tmp-eglibc, that will allow components to autodetect all possible libraries and then run another per-component build with removing tmp-eglibc which allows to detect libraries from dependency-tree.

The following changes since commit 46354a697c18a64c5836159adf8dbd92e6547e85:

  vsftpd: add missing dependency on openssl (2013-07-02 14:39:17 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/deps

Martin Jansa (10):
  f2fs-tools: add util-linux dependency
  ruby: add missing dependency on ruby-native
  xorg-gsml-doctools: add missing dependency on util-macros
  cpufrequtils: inherit gettext
  cryptsetup: add missing dependency on libgcrypt
  gsoap: add missing dependency on zlib
  libspatialite: add missing dependency on sqlite3
  wbxml2: add missing dependency on expat
  fbida: define -I when checking jpeg version
  iso-codes: add missing dependency on gettext-native

 meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb         | 3 +++
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb                | 2 +-
 meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 2 ++
 meta-oe/recipes-navigation/libspatialite/libspatialite.inc  | 2 +-
 meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb    | 2 ++
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb      | 2 +-
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb               | 2 +-
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb          | 4 ++++
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb           | 2 ++
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb          | 2 +-
 10 files changed, 18 insertions(+), 5 deletions(-)

-- 
1.8.2.1


