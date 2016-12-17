Return-Path: <joe@deserted.net>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 205817744D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:49 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id p13so14995304ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CHoOoD1Nd/s3aHWtXWpICqnmELEL8Xz7tYi8DgIBivo=;
	b=ZZ4gCAqeUdlsw7EW1QQoMEs4gRgxp2W32yQriWG9IAau40Qo66H6jnAwAL/oXMKzQl
	2rBYt2eIA93uY69hSEush7htJqrtOez+eATVXf2zFmbW3dP9xOjYLcivOizKGgjL77P3
	C2JPuBWXvM2n2JtgAfSkD2eEbsbvlIl+X5iTODKVPTXszpgDHlDp5K+mFpgCSbTCuzDc
	TO7QJTq3bfw25w656SFslS2eZknTdyYjMrPzpza9StGVZs2mrXuwFbFyhISykRxCjOqN
	SUWsu0TDS4aotOpGYtC2siYwHY1bUwaVTbNQPN5q1x4e4j2ntFeGi6n2uBzFHtnFsLzQ
	Nrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=CHoOoD1Nd/s3aHWtXWpICqnmELEL8Xz7tYi8DgIBivo=;
	b=ZAFsWmwB8Ifjjk/dGPKZNe1LcPE/vnUcu98rjjBfeHvomBPFaSCsNWRi8fAQ72uU2a
	sg7rjPRQKTHNhOdYrQXod67LAUCS1vfyZAj6s10GQw8prM8IPxY3/JCfrMusylSR5Y6S
	9pE+fiEXRivhzL73Htk7ahFBLd+ps55jSlc51JG9Bx0ju7ByGBrKE9M+KhiGaaTDyP3P
	yG+iSRFjzmleRe5hwopreJ6DGY4FMrUtyR/lVaJUUPx+/FnYNMa6bhexxMO5gjuRXfrI
	6wRaFOfNJ41hcf9KQHy0B9uLm5y9o63PG9pTe7mvXj0PLJtJVL6kmJ8mfVn7P/UF3yzh
	PIKA==
X-Gm-Message-State: AIkVDXIwPhOd5J2mOe+aqCgr/axVWxktRRUnClyYDpQTwIAayMVbPwNz/6TAbFRSX80nHw==
X-Received: by 10.107.34.8 with SMTP id i8mr7967194ioi.132.1481990691215;
	Sat, 17 Dec 2016 08:04:51 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:50 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:52 -0500
Message-Id: <1481990698-15962-5-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 04/10] samba: install manpages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2016 16:04:50 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 1d9d75b..27f605a 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -98,6 +98,15 @@ DISABLE_STATIC = ""
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
+    for section in 1 5 7; do
+        install -d ${D}${mandir}/man$section
+        install -m 0644 ctdb/doc/*.$section ${D}${mandir}/man$section
+    done
+    for section in 1 5 7 8; do
+        install -d ${D}${mandir}/man$section
+        install -m 0644 docs/manpages/*.$section ${D}${mandir}/man$section
+    done
+
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
     sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
-- 
1.9.1


