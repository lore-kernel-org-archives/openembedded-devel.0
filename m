Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id F3B976A9E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:24 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so2817817eei.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UM+BuOd3lZCOuXGZ1piFqWJ84e2MwJUkHdaWeVpuEuw=;
	b=TPZubdPG8ogLv9D4wt67ONjs5+YMpGpg7n29fjlvZ/ImzrvIyqHuNxL82yAn0CFoYs
	S+mkXeBVgaiEIKoA8eNdzZInYM/5HzjcD0ADCg83VPz2xSsYbIaw+PzqmbwQ0sLfD2b5
	4uRtIXKya73eNfJUdg1XUU3gSI+s6h9FJ1DFX13USJ76J2un3UTXdlgQ8h3FG1gLq0gW
	MAGEiUFQ8J9Pg6UN25NbNOK3bdNXGy3RQOtbSn8+gexG5SjTgONjMtIqrIe/pUeTn8Hc
	KNnEhi2hz+vdAEKqEjx8Nco3t3atbUr06vcd7A3I1oYHQrhmK7TbuJDSIEUrxk3OntVq
	3wNQ==
X-Received: by 10.15.35.71 with SMTP id f47mr14703512eev.15.1370929045366;
	Mon, 10 Jun 2013 22:37:25 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:28 +0200
Message-Id: <1370928876-14423-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 07/15] p11-kit: initial add 0.19.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 05:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb

diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
new file mode 100644
index 0000000..c5b6129
--- /dev/null
+++ b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Provides a way to load and enumerate PKCS#11 modules"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS = "libtasn1 libffi"
+
+SRC_URI = "http://p11-glue.freedesktop.org/releases/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
+SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
+
+FILES_${PN}-dev += " \
+    ${libdir}/p11-kit-proxy.so \
+    ${libdir}/pkcs11/p11-kit-trust.so \
+"
+FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
+FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
-- 
1.7.6.5


