Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBC7F70100
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O74A5q029141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jul 2017 00:04:10 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 00:04:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 03:04:03 -0400
Message-ID: <cover.1500878698.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/5] add 5 recipes
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
X-List-Received-Date: Mon, 24 Jul 2017 07:04:11 -0000
Content-Type: text/plain

Changed in V3:

- xmlrpc-c, usermode: fixed when compile with "-Wformat -Wformat-security -Werror=format-security"
  (already updated the status on patchwork)

- Add recipe libpwquality, libbytesize and libtimezonemap

Changed in V2:

- xmlrpc-c, usermode: fix compile failure against musl C library

//Hongxu


The following changes since commit 86e87c049f612534ce85301de8110a045596b7f7:

  keybinder: add recipe 3.0 (2017-07-24 02:04:30 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipe1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe1

Hongxu Jia (5):
  libpwquality: add recipe 1.4.0
  libbytesize: add recipe 0.10
  libtimezonemap: add recipe 0.4.5
  xmlrpc-c: add recipe 1.31.0
  usermode: add recipe 1.111

 .../libtimezonemap/libtimezonemap_0.4.5.bb         | 22 +++++++++
 ...ix-compile-failure-against-musl-C-library.patch | 27 +++++++++++
 .../usermode/usermode/0001-formatting-issues.patch | 34 ++++++++++++++
 .../recipes-support/usermode/usermode_1.111.bb     | 29 ++++++++++++
 ...ix-compile-failure-against-musl-C-library.patch | 52 ++++++++++++++++++++++
 .../xmlrpc-c/0002-fix-formatting-issues.patch      | 34 ++++++++++++++
 .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   | 24 ++++++++++
 .../add-missing-python-include-dir-for-cross.patch | 48 ++++++++++++++++++++
 .../libpwquality/libpwquality_1.4.0.bb             | 45 +++++++++++++++++++
 .../files/0001-remove-python2-support.patch        | 30 +++++++++++++
 .../libbytesize/libbytesize_0.10.bb                | 34 ++++++++++++++
 11 files changed, 379 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.5.bb
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
 create mode 100644 meta-gnome/recipes-support/usermode/usermode_1.111.bb
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issues.patch
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
 create mode 100644 meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
 create mode 100644 meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb

-- 
2.8.1


