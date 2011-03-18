Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aGK-0005OF-Qq
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:02:44 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3154740bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=CnbxM/jgQSO/utJvNIcMVLcQKKXltLlEv9PBc7EPcX0=;
	b=min4alntghMQfW8m5RhnxjnSKiCrGbfYS/QKNEDxIqj/vj0DRqGyt9wBkiHax6SduB
	EzUX8WQ0HA+FFl4VTj2R4E5ZkizL3noCPCbE2RuRu259XxaOg4m097AOiJY7A6TJUv3T
	xBMGmy8dqKe8DUuC7OqcSXqcHAVh93ZxukXbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EaStHCEMILtbN2c12+e87iHaiOCU17aMe0W6BCh486xMC0B/1wTC2J9rxUHTPgA2UD
	SkAWfYIrHjrE/u0lfqdCjAwoyuvQG8Y6muR5RPCteaFL2JfNSo7tSthaTv1kI/je1wsN
	r2LeZ2pV7srF3fpyNfMuP5DUqJeGHjbdegz0g=
Received: by 10.204.76.83 with SMTP id b19mr989443bkk.126.1300456860097;
	Fri, 18 Mar 2011 07:01:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2170219bkl.1.2011.03.18.07.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:00:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:20 +0100
Message-Id: <1300456829-25755-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 03/12] libnl: add RREPLACES libnl2 for upgradable path
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
X-List-Received-Date: Fri, 18 Mar 2011 14:02:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/libnl/libnl_2.0.bb |    7 +++++++
 recipes/libnl/libnl_git.bb |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/recipes/libnl/libnl_2.0.bb b/recipes/libnl/libnl_2.0.bb
index 8b77d07..6614478 100644
--- a/recipes/libnl/libnl_2.0.bb
+++ b/recipes/libnl/libnl_2.0.bb
@@ -23,3 +23,10 @@ FILES_${PN}-route = "${libdir}/libnl-route.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
 FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
 FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
+
+# for upgradable path from libnl2_2.0 to libnl_2.0
+RREPLACES_${PN} = "${PN}2"
+RREPLACES_${PN}-route = "${PN}2-route"
+RREPLACES_${PN}-nf = "${PN}2-nf"
+RREPLACES_${PN}-genl = "${PN}2-genl"
+RREPLACES_${PN}-cli = "${PN}2-cli"
diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
index b3bb749..b844bdd 100644
--- a/recipes/libnl/libnl_git.bb
+++ b/recipes/libnl/libnl_git.bb
@@ -23,3 +23,10 @@ FILES_${PN}-route = "${libdir}/libnl-route.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
 FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
 FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
+
+# for upgradable path from libnl2_2.0 to libnl_2.0
+RREPLACES_${PN} = "${PN}2"
+RREPLACES_${PN}-route = "${PN}2-route"
+RREPLACES_${PN}-nf = "${PN}2-nf"
+RREPLACES_${PN}-genl = "${PN}2-genl"
+RREPLACES_${PN}-cli = "${PN}2-cli"
-- 
1.7.4.1



