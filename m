Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.21045.1594921829261974671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 10:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1B44920B4909
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 10:50:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1B44920B4909
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Remmina: Upgrade to 1.4.7
Date: Thu, 16 Jul 2020 10:50:19 -0700
Message-Id: <20200716175019.4922-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../remmina/{remmina_1.4.3.bb => remmina_1.4.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.3.bb => remmina_1.4.7.bb} (92%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.3.bb b/meta-oe/recipes-support/remmina/remmina_1.4.7.bb
similarity index 92%
rename from meta-oe/recipes-support/remmina/remmina_1.4.3.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.7.bb
index 3c93493f7..661673d6b 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.3.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.7.bb
@@ -11,7 +11,7 @@ LDFLAGS_append_libc-musl = " -lexecinfo"
 
 SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
 "
-SRC_URI[sha256sum] = "3ed23be326be0bf3c98428c1b4f4c948c1ded2048bd27f107380e12574797930"
+SRC_URI[sha256sum] = "7614d447dc588403aff2ff97b253f46c5f03a6347d024618e84490b8ab4cd87b"
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-- 
2.17.1

