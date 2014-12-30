Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 1038 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Dec 2014 19:05:54 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 804296017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 19:05:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBUIma0v023343 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 12:48:36 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014123012483666-1524143 ;
	Tue, 30 Dec 2014 12:48:36 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 12:48:10 -0600
Message-Id: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.2.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/30/2014 12:48:36 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/30/2014 12:48:36 PM,
	Serialize complete at 12/30/2014 12:48:36 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-30_08:2014-12-30, 2014-12-30,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 0/2] Add recipe for iperf3 and fix build
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
X-List-Received-Date: Tue, 30 Dec 2014 19:06:03 -0000

This patch series adds back the iperf3 recipe added earlier by Guy Morand and
fixes it up to build properly under newer versions of OE (tested on Dizzy and
master).

Ben Shelton (1):
  iperf3: fix recipe and upgrade to 3.0.10

Guy Morand (1):
  iperf3: Adds git and 3.0.8 version

 .../iperf3/files/automake-foreign.patch            | 12 +++
 .../iperf3/files/fix-examples.patch                | 98 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3.inc        | 22 +++++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb  |  6 ++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |  8 ++
 5 files changed, 146 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/files/automake-foreign.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/files/fix-examples.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3.inc
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.10.bb
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb

-- 
2.2.1


