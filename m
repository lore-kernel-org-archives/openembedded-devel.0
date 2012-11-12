Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TXqis-0008N0-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 10:54:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAC9dm4S023880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2012 01:39:49 -0800 (PST)
Received: from Xouyang-Ubuntu-Desktop.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 12 Nov 2012 01:39:48 -0800
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Nov 2012 17:39:45 +0800
Message-ID: <1352713186-2637-1-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: [PATCH V2][meta-networking] netperf: import from oe-classic and upgrade to 2.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Nov 2012 09:54:30 -0000
Content-Type: text/plain

V2 Updates:
 * merge two patches into one
 * bb recipe: LICENSE back to "netperf"
 * initscript: add LSB headers
 * initscript: "sed" to replace the hardcodes /usr/sbin to $sbindir.

Xin Ouyang (1):
  netperf: import from oe-classic and upgrade to 2.6.0

 .../recipes-support/netperf/files/cpu_set.patch    |   30 ++++++++++
 meta-networking/recipes-support/netperf/files/init |   62 ++++++++++++++++++++
 .../recipes-support/netperf/files/vfork.patch      |   58 ++++++++++++++++++
 .../recipes-support/netperf/netperf_2.6.0.bb       |   57 ++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/cpu_set.patch
 create mode 100644 meta-networking/recipes-support/netperf/files/init
 create mode 100644 meta-networking/recipes-support/netperf/files/vfork.patch
 create mode 100644 meta-networking/recipes-support/netperf/netperf_2.6.0.bb

-- 
1.7.10.4



