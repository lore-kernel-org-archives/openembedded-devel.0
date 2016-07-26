Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9295606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:18:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6Q9IAad026797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:18:10 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 02:18:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jul 2016 05:18:06 -0400
Message-ID: <cover.1469524511.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2] unixodbc and psqlodbc: Add new recipes
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
X-List-Received-Date: Tue, 26 Jul 2016 09:18:11 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 5c69367d848271cdf3a3bd1a087665f324d3fd34:

  python-flask-bootstrap: update to version 3.3.6.0 and fix RDEPENDS (2016-07-22 21:45:42 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_add_odbc_160718_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_add_odbc_160718_0

Jackie Huang (2):
  unixodbc: Add the new recipe
  psqlodbc: Add the new recipe

 .../psqlodbc-donot-use-the-hardcode-libdir.patch   |  26 ++++
 .../files/psqlodbc-fix-for-ptest-support.patch     | 148 +++++++++++++++++++++
 ...bc-remove-some-checks-for-cross-compiling.patch | 118 ++++++++++++++++
 meta-oe/recipes-support/psqlodbc/files/run-ptest   |  46 +++++++
 meta-oe/recipes-support/psqlodbc/psqlodbc.inc      |  50 +++++++
 .../psqlodbc/psqlodbc_09.05.0300.bb                |  14 ++
 .../do-not-use-libltdl-source-directory.patch      |  43 ++++++
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb |  27 ++++
 8 files changed, 472 insertions(+)
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/run-ptest
 create mode 100644 meta-oe/recipes-support/psqlodbc/psqlodbc.inc
 create mode 100644 meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
 create mode 100644 meta-oe/recipes-support/unixodbc/files/do-not-use-libltdl-source-directory.patch
 create mode 100644 meta-oe/recipes-support/unixodbc/unixodbc_2.3.4.bb

-- 
2.8.1


