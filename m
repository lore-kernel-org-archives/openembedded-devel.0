Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 873DD6DF6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 07:10:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB57Aehx003651
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Dec 2013 23:10:40 -0800 (PST)
Received: from pek-wfan-d2.wrs.com (128.224.162.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 4 Dec 2013 23:10:39 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Dec 2013 15:10:37 +0800
Message-ID: <cover.1386227209.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] mariadb-native: fix link error on Ubuntu 13.10
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
X-List-Received-Date: Thu, 05 Dec 2013 07:10:41 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Below errors only occurs on Ubuntu 13.10:

$arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
    ../../libmysqld/.libs/libmysqld.so -ldl

    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'

GCC/ld verion on the host:
    gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
    GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913

This is a strange behavior on Ub13.10, it fails even '-ldl' in the
link command line. This patch will append '-ldl' to dependency_libs
in libmysqld.la.

The following changes since commit 0abd142f0af03aa36c0c551e930b143798999066:

  inetutils: add --with-libreadline-prefix to avoid host contamination (2013-12-04 10:48:30 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/mariadb-native-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/mariadb-native-2

Wenzong Fan (1):
  mariadb-native: fix link error on Ubuntu 13.10

 .../recipes-support/mysql/mariadb-native_5.1.67.bb |    3 ++
 .../mysql/mariadb/fix-link-error-ub1310.patch      |   37 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch

-- 
1.7.10.4


