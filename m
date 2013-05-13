Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ubmwg-0006VF-Jx
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 09:13:25 +0200
Received: by mail-ea0-f175.google.com with SMTP id q10so3349954eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 23:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=9u4JWGn9nV/Z+Vq/34ZXYKrakkZQZyUsTTPdfQF1900=;
	b=Rwb6+Wq9jbgL7oOIwvuTQDDHflslidr+vw9/sUlDQwnqij4OhjCIO0wUN5Og1Cp5Fw
	6lzdIMsySalleN1q+RYbRvAk2stt8fjejZv4jhEwFPbxmTsWSxjOV38Nz9hDMIlfbyEq
	lwF/1JdGPQNKZwsCdBe3NzbppA32Po/pRQpNjaEuUAtxnFPFdrDb+nkBaJvNgVUvWo7L
	ZWU50YIRg8OUJTpKBGjO7buYkXjrbPv6YWFajR8trLStda2mFCxhozl5xaZEBOnAhLPL
	m4mAf+1fdqntgLoqmpt5KxtgpvDwY61EBOimLN4Ah/pE/3arCL2GVskOrtV3ddPvLHdJ
	dZzw==
X-Received: by 10.14.5.5 with SMTP id 5mr75525938eek.21.1368428109070;
	Sun, 12 May 2013 23:55:09 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id q1sm20848713eez.6.2013.05.12.23.55.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 23:55:08 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 08:55:01 +0200
Message-Id: <1368428101-22402-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1368428101-22402-1-git-send-email-koen@dominion.thruhere.net>
References: <1368428101-22402-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnXhBFXY8RZkt15FYMY5C6zx/s3uNBh7IHkmQhLjCSMugzgtNO/2TGUUh//QgOh1k+F21OF
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] pv: add pipe viewer, version 1.4.6
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
X-List-Received-Date: Mon, 13 May 2013 07:13:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/pv/pv_1.4.6.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/pv/pv_1.4.6.bb

diff --git a/meta-oe/recipes-support/pv/pv_1.4.6.bb b/meta-oe/recipes-support/pv/pv_1.4.6.bb
new file mode 100644
index 0000000..8aec14c
--- /dev/null
+++ b/meta-oe/recipes-support/pv/pv_1.4.6.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "pv - Pipe Viewer - is a terminal-based tool for monitoring the progress of data through a pipeline."
+
+LICENSE = "Artistic-License-2.0"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
+
+SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.bz2"
+SRC_URI[md5sum] = "d55ff76f5caa83efc23aa527dbb0b191"
+SRC_URI[sha256sum] = "edfea0033ec6222eb60b4ec6d905dd2dccdb5900beef03f67f42ca9ed67e9fe2"
+
+inherit autotools
+
+# broken autotools
+do_configure() {
+	cp ${S}/autoconf/configure.in ${S}
+	gnu-configize --force
+	oe_runconf
+}
-- 
1.8.1.4



