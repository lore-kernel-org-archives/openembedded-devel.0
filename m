Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 729D86B513
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 02:22:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x472MV7n025701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 May 2019 19:22:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 6 May 2019 19:22:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 May 2019 10:11:05 +0800
Message-ID: <1557195066-32670-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] netkit-rsh: add tag to CVE patch
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
X-List-Received-Date: Tue, 07 May 2019 02:22:30 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
index 4381f5b..dc71141 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
@@ -10,6 +10,8 @@ Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa88
 Upstream-Status: Backport [Debian]
 [https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
 
+CVE: CVE-2018-7282 CVE-2018-7283
+
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  rcp/rcp.c | 5 +++++
-- 
2.7.4


