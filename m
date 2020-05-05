Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.20158.1588640089421564859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 17:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dmxqRfQJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id BA1E620B717B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 May 2020 17:54:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA1E620B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1588640088;
	bh=N1oeCpTYL6ld9RrUg9qyNYUMTL1F5DIvSr5v0rb/LtI=;
	h=From:To:Subject:Date:From;
	b=dmxqRfQJJvbQ6PdJlh9JnXgPjJ/4V7iFFNQU+Tgzub/n5MYjBVOWisvKVsmUCLF0L
	 FYkfOZ4V3ibOQ7GrglQXkR2s4gRYebm4le8h6iQUWqJkFYFUrYKLgALXTXN+AAAnG2
	 onlsDxNZdmI7h53NEeswJJL5hTrSUvxCwb1ckes8=
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] remmina: Upgrade to version 1.4.3
Date: Mon,  4 May 2020 17:54:29 -0700
Message-Id: <20200505005429.4707-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

- Get rid of md5sum as well.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../remmina/{remmina_1.3.6.bb => remmina_1.4.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.3.6.bb => remmina_1.4.3.bb} (89%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.4.3.bb
similarity index 89%
rename from meta-oe/recipes-support/remmina/remmina_1.3.6.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.3.bb
index 5b663489f..a05847429 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.3.bb
@@ -11,8 +11,7 @@ LDFLAGS_append_libc-musl = " -lexecinfo"
 
 SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
 "
-SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
-SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
+SRC_URI[sha256sum] = "3ed23be326be0bf3c98428c1b4f4c948c1ded2048bd27f107380e12574797930"
 
 S = "${WORKDIR}/Remmina-v${PV}"
 
-- 
2.17.1

