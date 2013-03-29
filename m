Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ULcvL-000514-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 18:17:08 +0100
Received: by mail-pb0-f49.google.com with SMTP id um15so326799pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 10:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=4Ps+yhcxUwoAOPo5Si7XiPOlwNO8tNUW6moVDw3f02E=;
	b=LpmNQNEUE8o2RYSqXhi4xr8G5st375k7PB8ikpsDgMcNNSghy+PV94xMJ3hYUwHTfR
	BywB7ajFtq8RbLZPVZInJsNDujhqxygPNe0rdpVE6fPJgWLG8knVNzZY0XsGchYXPUHJ
	7rZgqPKB7ACIejig+HaUNX+IZ/zjBf/WeqcuuC+JzMpemEx8bcjSXsb0MFmGK+sGC3mh
	knjImKsPxnANgz3X5eshKDdooloukLHGInYvfatKF4Tvvo2P1cBzluQ8m140/Yg8Qiq0
	2V24k/5M4wouPNaa+zdbAoFerslf6ijFzq7uRdx6gLj/Pjv4L8t7wP/3DQWyHmsbUlqz
	7S9g==
X-Received: by 10.68.39.195 with SMTP id r3mr4725197pbk.53.1364576402941;
	Fri, 29 Mar 2013 10:00:02 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id cy4sm3451215pbc.13.2013.03.29.10.00.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 10:00:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 09:59:24 -0700
Message-Id: <1364576364-26866-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] libnetfilter-queue: Add missing libmnl to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2013 17:17:08 -0000

otherwise Errors are seen with sstate

| configure:11780: error: Package requirements (libmnl >= 1.0.3) were
not met:
|
| No package 'libmnl' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnetfilter/libnetfilter-queue_1.0.2.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
index 7276f5c..b932ff6 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Userspace library providing a programming interface (API) to acce
 HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_queue/index.html"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-DEPENDS = "libnfnetlink"
+DEPENDS = "libnfnetlink libmnl"
 
 SRC_URI = "http://www.netfilter.org/projects/libnetfilter_queue/files/libnetfilter_queue-${PV}.tar.bz2;name=tar"
 SRC_URI[tar.md5sum] = "df09befac35cb215865b39a36c96a3fa"
-- 
1.7.9.5



