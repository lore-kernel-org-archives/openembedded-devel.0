Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C22060557
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 09:00:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA590noh022381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Nov 2014 01:00:49 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 01:00:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Nov 2014 17:00:45 +0800
Message-ID: <cover.1415177915.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] mariadb:fix do_compile failed: No rule to make target /path/to/sysroots/x86-kvm-guest/usr/include/krb5.h
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
X-List-Received-Date: Wed, 05 Nov 2014 09:00:56 -0000
Content-Type: text/plain

The following changes since commit 34ca3aeef1a8ff74de548c427fff8dc94f4b720a:

  vpnc: use nativeperl to run perl scripts (2014-11-04 16:02:44 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mariadb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb

Hongxu Jia (1):
  mariadb:fix do_compile failed: No rule to make target
    /path/to/sysroots/x86-kvm-guest/usr/include/krb5.h

 ...ia-CMakeLists.txt-tweak-source-file-compi.patch | 62 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.5.39.inc   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-maria-CMakeLists.txt-tweak-source-file-compi.patch

-- 
1.9.1


