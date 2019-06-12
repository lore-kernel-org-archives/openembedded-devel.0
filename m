Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDF7B7E767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:46:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5CBjbWs010161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jun 2019 04:45:47 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 12 Jun 2019 04:45:26 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 07:45:23 -0400
Message-ID: <20190612114524.96123-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH v2 0/1] lxdm: provides fake gdmflexiserver for xfce desktop environment
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
X-List-Received-Date: Wed, 12 Jun 2019 11:46:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* call lxdm with full path in script gdmflexiserver that /usr/sbin is not in PATH of unprivilege user

Kai Kang (1):
  lxdm: provides fake gdmflexiserver for xfce desktop environment

 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver | 3 +++
 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend     | 7 +++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm/gdmflexiserver
 create mode 100644 meta-xfce/recipes-graphics/lxdm/lxdm_%.bbappend

-- 
2.20.0


