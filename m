Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2C460684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 03:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4A39vic004341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 May 2017 20:09:58 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 9 May 2017 20:09:56 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 May 2017 11:09:54 +0800
Message-ID: <cover.1494382496.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/1 v3] freeradius: add new recipe
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
X-List-Received-Date: Wed, 10 May 2017 03:09:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v3 comments:
update to the latest version 3.0.13

---
The following changes since commit 6418010bf0d74b21247962edbc63dd5e6fb1069a:

  ninja: extend to nativesdk (2017-05-04 09:18:58 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_upstream-freeradius-v3_170510_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_upstream-freeradius-v3_170510_0

Jackie Huang (1):
  freeradius: add new recipe

 .../freeradius/files/freeradius                    | 110 ++++++++++
 .../freeradius-avoid-searching-host-dirs.patch     | 197 +++++++++++++++++
 ...radius-configure.ac-add-option-for-libcap.patch |  70 ++++++
 ...dius-configure.ac-allow-cross-compilation.patch |  31 +++
 .../files/freeradius-enble-user-in-conf.patch      |  28 +++
 ...eeradius-fix-error-for-expansion-of-macro.patch |  61 ++++++
 ...ius-fix-issues-related-to-m4-include-path.patch | 236 +++++++++++++++++++++
 .../freeradius-fix-quoting-for-BUILT_WITH.patch    |  55 +++++
 .../files/freeradius-libtool-detection.patch       |  89 ++++++++
 .../freeradius-libtool-do-not-use-jlibtool.patch   | 160 ++++++++++++++
 .../freeradius-rlm_python-add-PY_INC_DIR.patch     |  33 +++
 .../freeradius/files/radiusd-volatiles.conf        |   2 +
 .../freeradius/files/radiusd.service               |  16 ++
 .../freeradius/files/volatiles.58_radiusd          |   3 +
 .../freeradius/freeradius_3.0.13.bb                | 223 +++++++++++++++++++
 15 files changed, 1314 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-avoid-searching-host-dirs.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-add-option-for-libcap.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-configure.ac-allow-cross-compilation.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-enble-user-in-conf.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-error-for-expansion-of-macro.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-issues-related-to-m4-include-path.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-fix-quoting-for-BUILT_WITH.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-detection.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-libtool-do-not-use-jlibtool.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/freeradius-rlm_python-add-PY_INC_DIR.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/radiusd.service
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/volatiles.58_radiusd
 create mode 100644 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.13.bb

-- 
2.11.0


