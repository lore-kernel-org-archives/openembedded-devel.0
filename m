Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P61uG-0005ET-5x
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:02:13 +0200
Received: by gwb17 with SMTP id 17so1691265gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LFuBB6LYEWW+loxNqhpk9F5zxqpQQTiSbN4eGSGAJzE=;
	b=KCES8fK8vSZgMj2z7K/SS/BcP3ug170pd57rBHzytK1m6hd0qCmxX++Vl8MXqK0uJr
	yayVwB1rKyfH2AuCxPNV1zjBIO8l60KxkfLtwdTxU1m2Y9NLFnJrvEE3a7Fqn457Onvp
	RvotkTZ9YtrE+bcKec9zajQaaGNEwSd2Lgp/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=p8j2XpVRNK30K3n2ZmVh5t+afhEqrme/ZoFQqAXZT/ZlbJJjwQoX7LqXzCxEdKMSZF
	qhSoylibLUk8aWGPNGT39EiiEBxzOBIgdmtRu51XUJIayNm9dfrfL+7ERnRcxjkOxfMJ
	NVyHpEjCjpnJbCZPSx+yaX4RFdrdX7FdqrbWM=
Received: by 10.150.206.16 with SMTP id d16mr1199322ybg.123.1286978496732;
	Wed, 13 Oct 2010 07:01:36 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm5073769ybk.4.2010.10.13.07.01.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 07:01:35 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 09:01:27 -0500
Message-Id: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/5] matrix-gui-common: skip qa check on prebuilt binaries
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
X-List-Received-Date: Wed, 13 Oct 2010 14:02:15 -0000

* Skip the QA check on the prebuilt binaries used for dm365
  devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index 096c321..46c0bd6 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -32,4 +32,7 @@ do_install() {
 
 }
 
+# Skip the QA for pre-built binaries
+INSANE_SKIP_${PN}_dm365 = "True"
+
 FILES_${PN} += "${datadir}/matrix/*"
-- 
1.7.0.4



