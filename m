Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA7560119
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 02:18:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u672I6kT013111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jul 2016 19:18:06 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 19:18:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jul 2016 22:18:02 -0400
Message-ID: <cover.1467857744.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] net-snmp: fix AgentX crash and initscripts packages
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
X-List-Received-Date: Thu, 07 Jul 2016 02:18:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 1cb7275961fd4bca3a6cb70e064ad6e6e1ff04d6:

  gnome-terminal, toscoterm, vala-terminal, xfce4-terminal: use vte9 (2016-06-23 15:21:27 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/fp_net-snmp_160707_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/fp_net-snmp_160707_0

Jackie Huang (1):
  net-snmp: fix snmpd crash via AgentX connection

Li Wang (1):
  net-snmp: initscripts are located in net-snmp-server-snmp package

 .../net-snmp/net-snmp/net-snmp-agentx-crash.patch  | 75 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  7 +-
 2 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch

-- 
2.8.1


