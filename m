Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 763F86E608
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:37:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H9bAnD006354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 02:37:10 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 17 Jul 2014 02:37:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 05:37:06 -0400
Message-ID: <cover.1405589465.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/2 v3] syslog-ng: move back from nonworking and uprev to 3.5.4.1
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
X-List-Received-Date: Thu, 17 Jul 2014 09:37:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v3 comments:
- rebase as syslog-ng.inc changes 
- fix a dev-deps QA issue

tested on qemuarm and qemux86-64

--
The following changes since commit 239debcd8a0359aad64406476b801948f9b8ff14:

  usleep: add 1.0 recipe (2014-07-15 15:03:43 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_uprev-syslog-ng_140717_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_uprev-syslog-ng_140717_0

Jackie Huang (2):
  syslog-ng: move back from nonworking
  syslog-ng: uprev to 3.5.4.1

 .../nonworking/syslog-ng/syslog-ng.inc             |   98 ----
 .../nonworking/syslog-ng/syslog-ng_3.2.5.bb        |   10 -
 .../Fix-the-memory-leak-problem-for-mutex.patch    |   58 +++
 ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch |   27 ++
 .../files/afsql-afsql_dd_insert_db-refactor.patch  |  494 ++++++++++++++++++++
 ...init-the-new-config-when-reverting-to-the.patch |   36 ++
 .../fix-a-memory-leak-in-log_driver_free.patch     |   33 ++
 .../syslog-ng/files/fix-config-libnet.patch        |   66 +++
 .../syslog-ng/files/fix-invalid-ownership.patch    |   28 ++
 .../files/free-global-LogTemplateOptions.patch     |   30 ++
 .../{nonworking => }/syslog-ng/files/initscript    |   29 +-
 .../logwriter-still-free-the-unconsumed-item.patch |   47 ++
 .../syslog-ng-verify-the-list-before-del.patch     |   38 ++
 .../syslog-ng/files/syslog-ng.conf                 |    8 +-
 .../syslog-ng/files/volatiles.03_syslog-ng         |    1 +
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   90 ++++
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |   17 +
 17 files changed, 992 insertions(+), 118 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
 delete mode 100644 meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/files/initscript (50%)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
 rename meta-oe/recipes-support/{nonworking => }/syslog-ng/files/syslog-ng.conf (97%)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/volatiles.03_syslog-ng
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb

-- 
1.7.9.5


