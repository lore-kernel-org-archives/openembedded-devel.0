Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC8CD731B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:16:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VGFx3g007606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 31 Aug 2016 09:16:00 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 09:15:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2016 12:15:55 -0400
Message-ID: <cover.1472659887.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3 0/2]fix invoking lvm2 with modprob not found and add thin-provisioning-tools 0.6.3
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
X-List-Received-Date: Wed, 31 Aug 2016 16:16:08 -0000
Content-Type: text/plain

Changed in V2 & V3:

As Martin suggested:
- Fix too long SUMMARY.
- Closing quote should be first character (without indentation).
- Use autotools-brokensep to replace autotools

//Hongxu

The following changes since commit dc48e768f527cbed0cc3899f6a2ebb396cd9ada8:

  meta-oe: remove trailing spaces (2016-08-22 15:56:29 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/lvm2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/lvm2

Hongxu Jia (2):
  lvm2: tweak MODPROBE_CMD for cross compile
  thin-provisioning-tools: add version 0.6.3

 meta-oe/recipes-support/lvm2/lvm2.inc              |  5 ++-
 ...0005-tweak-MODPROBE_CMD-for-cross-compile.patch | 38 ++++++++++++++++++++++
 ...01-do-not-strip-pdata_tools-at-do_install.patch | 33 +++++++++++++++++++
 .../thin-provisioning-tools_0.6.3.bb               | 18 ++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
 create mode 100755 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb

-- 
2.8.1


