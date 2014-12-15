Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E696E72548
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 21:11:32 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so12403927pde.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 13:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KETnRlGqKUQ00mo2I5tYFjPsJ55dxdH+rYqt1gyDICc=;
	b=Nvz+YYC/3wR1MLzNQBrY8AHpHIr860XQIJZ3t0CE8pBALAn97/Xp9YJWwlfg2Vu7Ru
	4nVReeyTh52Huv62iJYdehKxzkAfWCBWMBC2813Yb84GqhnzvCXC8VZYw1JBruhG1vdy
	Qak/+CBc4oi4RjK8Q390EUj8tXZPBY4HY+eoEzOqrt9LZb8dP6oa2NuzH/Nx7yUwKy3g
	ZteNKWsr0DcQ1wl7b6Ivxus4oKygx4Lf3FtnvgNySCfqvH5k5eTEIPdGVCN9/8Nl7/vE
	15/z8KcyigUUHjyOG76Woltfo0bcbFYJjOm5NAnDuUE3UPiupOPLIZz3J1d88YP2nl/e
	N+Uw==
X-Gm-Message-State: ALoCoQmZ5goO7pcMJevqwFTXQbwMEA/+YmJME0H8dFFbeWDFTVttJEn+b8GpwzGy96IEGxhdlvKk
X-Received: by 10.68.139.201 with SMTP id ra9mr27170357pbb.41.1418677893235;
	Mon, 15 Dec 2014 13:11:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	vf6sm10088591pbc.73.2014.12.15.13.11.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 13:11:32 -0800 (PST)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Dec 2014 13:11:28 -0800
Message-Id: <1418677888-15303-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH][Dizzy] openvpn: fix CVE-2014-8104
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
X-List-Received-Date: Mon, 15 Dec 2014 21:11:35 -0000

This addresses a security fix for openvpn CVE-2014-8104

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openvpn/openvpn/CVE-2014-8104.patch            | 54 ++++++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.3.4.bb       |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2014-8104.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2014-8104.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2014-8104.patch
new file mode 100644
index 0000000..a032b87
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2014-8104.patch
@@ -0,0 +1,54 @@
+openvpn: CVE-2014-8014
+
+From 97597e732bda083e9aefc7a9f1b05056bf6ffd55 Mon Sep 17 00:00:00 2001
+From: Steffan Karger <steffan.karger@fox-it.com>
+Date: Thu, 20 Nov 2014 13:43:05 +0100
+Subject: [PATCH] Drop too-short control channel packets instead of asserting
+ out.
+
+This fixes a denial-of-service vulnerability where an authenticated client
+could stop the server by triggering a server-side ASSERT().
+
+OpenVPN would previously ASSERT() that control channel packets have a
+payload of at least 4 bytes. An authenticated client could trigger this
+assert by sending a too-short control channel packet to the server.
+
+Thanks to Dragana Damjanovic for reporting the issue.
+
+This bug has been assigned CVE-2014-8104.
+
+Signed-off-by: Steffan Karger <steffan.karger@fox-it.com>
+Acked-by: Gert Doering <gert@greenie.muc.de>
+Message-Id: <1CED409804E2164C8104F9E623B08B9018803B0FE7@FOXDFT02.FOX.local>
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+(cherry picked from commit c5590a6821e37f3b29735f55eb0c2b9c0924138c)
+
+Upstream-Status: Backport
+
+Armin Kuster <akuster@mvista.com>
+
+
+---
+ src/openvpn/ssl.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/openvpn/ssl.c b/src/openvpn/ssl.c
+index 2373582..daffbf3 100644
+--- a/src/openvpn/ssl.c
++++ b/src/openvpn/ssl.c
+@@ -2035,7 +2035,11 @@ key_method_2_read (struct buffer *buf, struct tls_multi *multi, struct tls_sessi
+   ASSERT (session->opt->key_method == 2);
+ 
+   /* discard leading uint32 */
+-  ASSERT (buf_advance (buf, 4));
++  if (!buf_advance (buf, 4)) {
++    msg (D_TLS_ERRORS, "TLS ERROR: Plaintext buffer too short (%d bytes).",
++	buf->len);
++    goto error;
++  }
+ 
+   /* get key method */
+   key_method_flags = buf_read_u8 (buf);
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
index 1fb722a..d91fb45 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
@@ -8,7 +8,9 @@ DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libp
 inherit autotools
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
-           file://openvpn"
+           file://openvpn \
+           file://CVE-2014-8104.patch \
+           "
 
 SRC_URI[md5sum] = "04d47237907faabe9d046970ffe44b2e"
 SRC_URI[sha256sum] = "af506d5f48568fa8d2f2435cb3fad35f9a9a8f263999ea6df3ba296960cec85a"
-- 
1.9.1


