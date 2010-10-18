Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P7ptN-0003lL-Mf
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 15:36:48 +0200
Received: by ywl5 with SMTP id 5so389521ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=naFVl4Z/ZJghYkyEONIB7+Z/jzFB+i+DmGaihy8cvPI=;
	b=EmY9Ruju9WmBJhek0ieySax7tQJKs4jEzN2VY/DgbBB3W17JedNRiDWieOdpDrajVr
	rum7U7br69KPPnXnee9jjNPHTv7XCY7WAU64HqK34Ks6OUgnMWiiipdwyef78ueFwqg1
	iuyQc8RyKHIAQxtvZZmQPdXv1vbrFSM0oZZDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=u85mg5R4vRpH3ONg27CNuOXESnoBGnw+REqFuimFCpFYvE+xuwYyicW67lqY4shTG5
	xZ0mnNqsZ0pMbX57Vn4HakgqK6NRwZqgdEFqF4E30YeYpyN1sBKXDjkkt3nWsgwNWwbu
	m2VaI9VGGOw+b8WzOCqIsw1H9phYa/qk8j+qw=
Received: by 10.42.164.5 with SMTP id e5mr1102285icy.84.1287408968406;
	Mon, 18 Oct 2010 06:36:08 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i64sm7616165yha.10.2010.10.18.06.36.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Oct 2010 06:36:07 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 08:36:03 -0500
Message-Id: <1287408964-18448-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2] matrix-gui-common: use am-sysinfo
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
X-List-Received-Date: Mon, 18 Oct 2010 13:36:48 -0000

* Created a new version of the matrix-gui-common recipe that
  RRECOMMENDS the am-sysinfo package to provide mem_util
  rather than distributing a pre-built version.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/matrix-gui-common_1.3.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/matrix-gui-common_1.3.bb

diff --git a/recipes/ti/matrix-gui-common_1.3.bb b/recipes/ti/matrix-gui-common_1.3.bb
new file mode 100644
index 0000000..a879720
--- /dev/null
+++ b/recipes/ti/matrix-gui-common_1.3.bb
@@ -0,0 +1,8 @@
+require matrix-gui-common.inc
+
+# Use the mem_util application from am-sysinfo instead of a
+# prebuilt version in the repository.
+RRECOMMENDS_${PN} = "am-sysinfo"
+
+SRCREV = "156"
+PR = "${INC_PR}.0"
-- 
1.7.0.4



