Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 696F560800
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:18:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T7I1b5022000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:18:01 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:18:00 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:33 +0800
Message-ID: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 00/24] add UPSTREAM_CHECK_URI for recipes
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
X-List-Received-Date: Tue, 29 May 2018 07:18:00 -0000
Content-Type: text/plain

Some recipes can not get upstream version with bitbake foo -c checkpkg. Add UPSTREAM_CHECK_URI for these recipes.

Yi Zhao (24):
  iozone3: add UPSTREAM_CHECK_REGEX
  libhugetlbfs: add UPSTREAM_CHECK_GITTAGREGEX
  lmbench: add UPSTREAM_CHECK_URI
  lmsensors: add RECIPE_UPSTREAM_VERSION
  libnet: add UPSTREAM_CHECK_URI
  libmcrypt: add UPSTREAM_CHECK_URI
  mariadb: add UPSTREAM_CHECK_URI
  log4cplus: add UPSTREAM_CHECK_URI
  haveged: add UPSTREAM_CHECK_URI
  hwloc: add UPSTREAM_CHECK_URI
  iotop: add UPSTREAM_CHECK_URI
  libpwquality: add UPSTREAM_CHECK_URI
  libreport: add UPSTREAM_CHECK_GITTAGREGEX
  rsyslog: add UPSTREAM_CHECK_URI
  crash: add UPSTREAM_CHECK_URI
  makedumpfile: add UPSTREAM_CHECK_URI
  libestr: add UPSTREAM_CHECK_URI
  lvm2: add UPSTREAM_CHECK_URI
  mce-inject: add UPSTREAM_CHECK_COMMITS
  sdparm: add UPSTREAM_CHECK_REGEX
  sg3-utils: add UPSTREAM_CHECK_REGEX
  syslog-ng: add UPSTREAM_CHECK_URI
  thin-provisioning-tools: add UPSTREAM_CHECK_GITTAGREGEX
  unixodbc: add UPSTREAM_CHECK_URI

 meta-oe/recipes-benchmark/iozone3/iozone3_465.bb                  | 2 ++
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb        | 2 ++
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb               | 3 +++
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb                 | 8 ++++++++
 meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb             | 3 +++
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb               | 3 +++
 meta-oe/recipes-dbs/mysql/mariadb.inc                             | 2 ++
 meta-oe/recipes-devtools/log4cplus/log4cplus_1.2.0.bb             | 3 +++
 meta-oe/recipes-extended/haveged/haveged_1.9.2.bb                 | 2 ++
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb                    | 2 ++
 meta-oe/recipes-extended/iotop/iotop_0.6.bb                       | 3 +++
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb       | 2 ++
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb             | 3 +++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb                | 3 +++
 meta-oe/recipes-kernel/crash/crash_7.2.0.bb                       | 2 ++
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.2.bb         | 3 +++
 meta-oe/recipes-support/libestr/libestr_0.1.10.bb                 | 2 ++
 meta-oe/recipes-support/lvm2/lvm2.inc                             | 4 ++++
 meta-oe/recipes-support/mcelog/mce-inject_git.bb                  | 2 ++
 meta-oe/recipes-support/sdparm/sdparm_1.10.bb                     | 2 ++
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb               | 2 ++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc                   | 2 ++
 .../thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb      | 2 ++
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb                | 2 ++
 24 files changed, 64 insertions(+)
 mode change 100755 => 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb

-- 
2.7.4


