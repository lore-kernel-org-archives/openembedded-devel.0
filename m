Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E247571ADE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 08:18:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1R8IIxq012866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 00:18:19 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 27 Feb 2017 00:18:18 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Feb 2017 16:09:58 +0800
Message-ID: <20170227080959.27797-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] dnsmasq: add info for port setting
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
X-List-Received-Date: Mon, 27 Feb 2017 08:18:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The info is taken from CentOS which is usefull
when bind (provides named) and dnsmasq are both
installed and one may fail to start:
| dnsmasq: failed to create listening socket for port 53: Address already in use

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
index 34d5135..9e5ab9f 100755
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
@@ -4,6 +4,11 @@
 # as the long options legal on the command line. See
 # "/usr/sbin/dnsmasq --help" or "man 8 dnsmasq" for details.
 
+# Listen on this specific port instead of the standard DNS port
+# (53). Setting this to zero completely disables DNS function,
+# leaving only DHCP and/or TFTP.
+#port=5353
+
 # Change these lines if you want dnsmasq to serve MX records.
 # Only one of mx-host and mx-target need be set, the other defaults
 # to the name of the host  running dnsmasq.
-- 
2.8.3


