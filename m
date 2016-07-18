Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E64A26FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:08:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I18TWW000230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 18:08:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 18:08:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:06:04 +0800
Message-ID: <1468803966-9809-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Add recipes of cfengine and its dependency tokyocabinet
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
X-List-Received-Date: Mon, 18 Jul 2016 01:08:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  tokyocabinet: add recipe
  cfengine: add recipe and base policy

 .../remove-policy-of-usr-local-sbin.patch          | 28 +++++++++
 .../cfengine/cfengine-masterfiles_3.9.0.bb         | 37 +++++++++++
 .../cfengine/change-hard-coded-lib-path.patch      | 28 +++++++++
 .../cfengine/set-path-of-default-config-file.patch | 23 +++++++
 .../recipes-extended/cfengine/cfengine_3.9.0.bb    | 71 ++++++++++++++++++++++
 .../remove-hard-coded-include-and-lib-paths.patch  | 43 +++++++++++++
 .../tokyocabinet/tokyocabinet_1.4.48.bb            | 27 ++++++++
 7 files changed, 257 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles/remove-policy-of-usr-local-sbin.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.9.0.bb
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine/change-hard-coded-lib-path.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine_3.9.0.bb
 create mode 100644 meta-oe/recipes-support/tokyocabinet/tokyocabinet/remove-hard-coded-include-and-lib-paths.patch
 create mode 100644 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb

-- 
2.6.1


