Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [87.98.181.248])
 by mx.groups.io with SMTP id smtpd.web11.35993.1599460708801429081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2020 23:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 87.98.181.248, mailfrom: jakub.lecki@3mdeb.com)
Received: from player159.ha.ovh.net (unknown [10.108.54.13])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 5EB4F1E70A6
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Sep 2020 08:38:26 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: jakub.lecki@3mdeb.com)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id A82D615DC8914;
	Mon,  7 Sep 2020 06:38:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002398c1af9-e213-491f-9e30-923026dbecc9,
                    9BCB9AB12DB878E5A2078035E2D2BE51E997A089) smtp.auth=jakub.lecki@3mdeb.com
From: jakub.lecki@3mdeb.com
To: openembedded-devel@lists.openembedded.org
Cc: maciej.pijanowski@3mdeb.com
Subject: [meta-oe][PATCH] cukinia: new package
Date: Mon,  7 Sep 2020 08:37:51 +0200
Message-Id: <20200907063751.13480-1-jakub.lecki@3mdeb.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 15375570603705375560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudegledgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomheplhgvtghkihhjrghkuhgsuceojhgrkhhusgdrlhgvtghkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdegvdffteefgedtleefgefgleelgfethfeihedvffduudefiefghefhtddtvddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkeehrddvvddvrdduudejrddvvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjrghkuhgsrdhlvggtkhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh

Signed-off-by: leckijakub <jakub.lecki@3mdeb.com>
---
 meta-oe/recipes-test/cukinia/cukinia_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-test/cukinia/cukinia_git.bb

diff --git a/meta-oe/recipes-test/cukinia/cukinia_git.bb b/meta-oe/recipes-test/cukinia/cukinia_git.bb
new file mode 100644
index 000000000000..fc723671d5f7
--- /dev/null
+++ b/meta-oe/recipes-test/cukinia/cukinia_git.bb
@@ -0,0 +1,20 @@
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
+PV = "0.5.1"
+SRCREV = "ea934c5393ad99c37bec3c621a364122720cce02"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    install -d ${D}${sbindir}
+    install -m 0744 ${S}/cukinia ${D}${sbindir}
+}
-- 
2.17.1

