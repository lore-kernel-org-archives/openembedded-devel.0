Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4BB6D767
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 08:33:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAF8XA5C011943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Nov 2013 00:33:10 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 00:33:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Nov 2013 16:33:05 +0800
Message-ID: <cover.1384504242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1] mariadb: fix QA Issue ELF binary has relocations in .text while multilib enabled
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
X-List-Received-Date: Fri, 15 Nov 2013 08:33:09 -0000
Content-Type: text/plain

The following changes since commit 20f352810d46daea9a20989b77f347fb8564ebf0:

  cherokee: use cherokee-project.de mirror (2013-11-11 13:11:15 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mariadb-qa
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mariadb-qa

Hongxu Jia (1):
  mariadb: fix QA Issue ELF binary has relocations in .text while
    multilib enabled

 ...orage-forbids-absolute-addresses-on-IA-32.patch | 44 ++++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch

-- 
1.8.1.2


