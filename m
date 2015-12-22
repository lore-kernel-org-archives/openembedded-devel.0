Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 316A873FA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:49:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBM8nj2G008795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:49:45 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 22 Dec 2015 00:49:44 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Dec 2015 16:36:51 +0800
Message-ID: <1450773411-24974-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1450773411-24974-1-git-send-email-kai.kang@windriver.com>
References: <1450773411-24974-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] iperf3: fix build-deps qa warning
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
X-List-Received-Date: Tue, 22 Dec 2015 08:49:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add PACKAGECONFIG lksctp to fix qa warning:

| WARNING: QA Issue: iperf3 rdepends on lksctp-tools, but it isn't a
| build dependency? [build-deps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index 58818bb..4a0f28e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -22,4 +22,7 @@ SRCREV = "e396134952a01199326665d1df7c51ae9e62e945"
 S = "${WORKDIR}/git"
 
 inherit autotools
+
+PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
+
 BBCLASSEXTEND = "native"
-- 
2.6.1


