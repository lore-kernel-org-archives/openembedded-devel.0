Received: from 5.mo179.mail-out.ovh.net (5.mo179.mail-out.ovh.net [46.105.43.140])
 by mx.groups.io with SMTP id smtpd.web12.2620.1599806697742055226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 23:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.43.140, mailfrom: jakub.lecki@3mdeb.com)
Received: from player750.ha.ovh.net (unknown [10.110.103.199])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id E54EC174094
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 08:44:54 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: jakub.lecki@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 26FCE15FA6671;
	Fri, 11 Sep 2020 06:44:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005db00ca9b-270b-44dd-9cc7-544ecd8dc24a,
                    801D277072DD616328E1EB7251E343C8DEE75424) smtp.auth=jakub.lecki@3mdeb.com
From: "leckijakub" <jakub.lecki@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: maciej.pijanowski@3mdeb.com
Subject: [meta-oe][PATCH] cukinia: new package
Date: Fri, 11 Sep 2020 08:44:16 +0200
Message-Id: <20200911064416.29822-1-jakub.lecki@3mdeb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1sry=-RUJFQKVPYz7Q4wEWPbEW73RCEMvDvP8MZb5bQyhg@mail.gmail.com>
References: <CAMKF1sry=-RUJFQKVPYz7Q4wEWPbEW73RCEMvDvP8MZb5bQyhg@mail.gmail.com>
X-Ovh-Tracer-Id: 2082351878072048456
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffojghfsedttdertdertddtnecuhfhrohhmpehlvggtkhhijhgrkhhusgcuoehjrghkuhgsrdhlvggtkhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeufeduvedtiefgjefhiefhteffkeekhfeijeeggeeuvdfhkedvvefgfedvvddvjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhgrkhhusgdrlhgvtghkihesfehmuggvsgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg

Signed-off-by: leckijakub <jakub.lecki@3mdeb.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb b/meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb
new file mode 100644
index 000000000000..34dd8c868625
--- /dev/null
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.5.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Linux firmware validation framework" 
+DESCRIPTION = "Cukinia is designed to help Linux-based embedded firmware \
+developers run simple system-level validation tests on their firmware." 
+HOMEPAGE = "https://github.com/savoirfairelinux/cukinia"
+LICENSE = "GPLv3 & Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
+
+SRCREV = "ea934c5393ad99c37bec3c621a364122720cce02"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 0755 ${S}/cukinia ${D}${sbindir}
+}
-- 
2.17.1

