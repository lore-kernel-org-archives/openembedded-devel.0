Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9488A60169
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:34:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T0YGq8017291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 17:34:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 28 Oct 2014 17:34:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <otavio@ossystems.com.br>
Date: Wed, 29 Oct 2014 08:30:51 +0800
Message-ID: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: Yue.Tao@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/8] V2: Some CVE fixes of postgresql and libyaml
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
X-List-Received-Date: Wed, 29 Oct 2014 00:34:20 -0000
Content-Type: text/plain

V2:
* reword head line of commits

Kai Kang (8):
  postgresql: add fix for CVE-2014-0064 Security Advisory
  postgresql: add fix for CVE-2014-0060 Security Advisory
  postgresql: add fix for CVE-2014-0061 Security Advisory
  postgresql: add fix for CVE-2014-0062 Security Advisory
  postgresql: add fix for CVE-2014-0063 Security Advisory
  postgresql: add fix for CVE-2014-0067 Security Advisory
  postgresql: add fix for CVE-2014-0065 and CVE-2014-0066 Security
    Advisory
  libyaml: add fix for CVE-2014-2525 Security Advisory

 .../libyaml/files/libyaml-CVE-2014-2525.patch      |   42 +
 meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb   |    4 +-
 ...integer-overflow-to-avoid-buffer-overruns.patch |  605 +++++++++++
 .../0003-Shore-up-ADMIN-OPTION-restrictions.patch  |  273 +++++
 ...vilege-escalation-in-explicit-calls-to-PL.patch |  267 +++++
 ...ted-name-lookups-during-table-and-index-D.patch | 1082 ++++++++++++++++++++
 ...ix-handling-of-wide-datetime-input-output.patch |  465 +++++++++
 ...al-available-to-pg_regress-of-ECPG-and-is.patch |   75 ++
 ...-potential-overruns-of-fixed-size-buffers.patch |  393 +++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |   11 +-
 10 files changed, 3214 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0002-Predict-integer-overflow-to-avoid-buffer-overruns.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0005-Avoid-repeated-name-lookups-during-table-and-index-D.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0006-Fix-handling-of-wide-datetime-input-output.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch
 create mode 100644 meta-oe/recipes-support/postgresql/files/0008-Prevent-potential-overruns-of-fixed-size-buffers.patch

-- 
1.9.1


