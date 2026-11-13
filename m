Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7759.1794563754822810251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Ytbv1wTm;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout03.t-online.de (Postfix) with SMTP id 1D0DC12B44
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:55:01 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnzk-134ocK0; Fri, 13 Nov 2026 10:54:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] kmscon: install the PAM service file to /etc/pam.d
Date: Fri, 13 Nov 2026 10:54:49 +0100
Message-ID: <20261113095449.4152793-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794563696-A1FF887C-D9C3FD6E/0/0 CLEAN NORMAL
X-TOI-MSGID: 84740b7e-44f8-46e8-8009-3bcafa9e31b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794563701; i=f_l_k@t-online.de;
	bh=kUdSbLwBH8VXaf8FXwS0pRUvw/qsfhguEnIbfNswKoI=;
	h=From:To:Subject:Date;
	b=Ytbv1wTmzW5UbsQpwEPoyuTczTxsOvjB26zoQFYQ/sVKrr8uv/CMh/PCw6Vil5UNj
	 Y+nlxFlgwmbCZod0paLI1Aowb+h5HA/yfS4BhViAFaygZnLrVv+u+BYcgPEUBrwC4O
	 HxRROidWr7fs4R/s+yY+9nw1l7IY8xxWrpukq9Whm5BLtIRil2NAqS1o2b3jqh7ajR
	 mKvn+7ck/lsr7uIsemZN9asWZi7jj+B3JcJFZlY8caXIFfcUwLRCYIpKzUgx3TMTon
	 TDM4tXH4hfmspLV5UplRRpuZeznIpbS/0VkHeyqv0hc607Fe1EvQAZtPHdC6VmbJMI
	 e6Nxb/7uS3NvA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132246
Content-Type: text/plain; charset="utf-8"

Since 10.1.0 kmscon installs its PAM service file to ${libdir}/pam.d.
libpam in oe-core is built with -Dvendordir=3D${sysconfdir}, so it reads
service files from /etc/pam.d only. The kmscon file in /usr/lib/pam.d
is never read and PAM falls back to /etc/pam.d/other, which denies
everything. Move the file back to ${sysconfdir}/pam.d when kmscon is
built with libseat, the only case in which it is installed. Tested by
building kmscon with libseat for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb b/meta-oe/r=
ecipes-graphics/kmscon/kmscon_10.1.1.bb
index 65db5115ca..d498c39d20 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
@@ -60,6 +60,12 @@ do_install:append() {
         rm -rf ${D}${libdir}/systemd
     fi
=20
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libseat', 'true', 'false',=
 d)}; then
+        install -d ${D}${sysconfdir}/pam.d
+        mv ${D}${libdir}/pam.d/kmscon ${D}${sysconfdir}/pam.d/kmscon
+        rmdir ${D}${libdir}/pam.d
+    fi
+
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', =
d)}; then
         mv ${D}${sysconfdir}/kmscon/kmscon.conf.example ${D}${sysconfdir=
}/kmscon/kmscon.conf
         sed -e "s@#drm@drm@g" \
--=20
2.56.0

