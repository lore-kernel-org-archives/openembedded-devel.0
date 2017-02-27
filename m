Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E534671ADE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 08:18:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1R8IKrL009433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 00:18:21 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 27 Feb 2017 00:18:19 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Feb 2017 16:09:59 +0800
Message-ID: <20170227080959.27797-2-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20170227080959.27797-1-jackie.huang@windriver.com>
References: <20170227080959.27797-1-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] dnsmasq: disable the service by default
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
X-List-Received-Date: Mon, 27 Feb 2017 08:18:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The service will fail to start/stop when dnsmasq and
bind (provides named) are both installed since they
are using the same port 53:

| dnsmasq: failed to create listening socket for port 53: Address already in use

So disable the service by default, if the user really
want to use two dns servives, the config needs to be
changed to use different interfaces or ports.

As reference, other distro like centos/fedora also
disables the services by default on installation.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 424a06b..9c2276f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -81,3 +81,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
+SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
2.8.3


