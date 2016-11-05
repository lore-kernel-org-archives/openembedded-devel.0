Return-Path: <00moses.alexander00@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 966FB71A35
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Nov 2016 23:27:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 68so9817486wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Nov 2016 16:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rDZdeWFLp3C7ckuCxvg9LwE8I8PKOa69P4rUe4pyPtc=;
	b=PQwzd+E9BrVeuAoVGrypI8hqG4pTFXv5ejvAqzASvaE25GW4iKTXY+QVKCGUK+k45R
	yJ8gHQUxSHb557BUsBwaeiK8hwJ8BUNDlkDWXOVUEOPB+0+dSzEX2SGjmau0Ebf9HLHA
	FKuaD/8pZaykvrQGZ9caoypbRtiTPuPTw7+Ht/DdNMQrTlHA6zZ0GeY143/apVps8/Bi
	2vJNyEb6zHmnJ/hEcFIMiuJPTXwTpxA32so7v67oq3yoHhJR3hUF+b5MWXY59mSVoWX8
	Bc67Uq7a9g4DFbKg0FJ6TGdpcPkCnFhqDtAT1h89zxpqpc31mX8JfMVSypduH21xdDHD
	qiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rDZdeWFLp3C7ckuCxvg9LwE8I8PKOa69P4rUe4pyPtc=;
	b=Ga6R+hYItVaEid8Dd7r0cOsv2gvRPcvA+O3MQW9HQeXSlVvrInLouAVRWCep8lKC7N
	Ibs26EdopwOJXx5n/10XpASNEqht5A7nrWggwk5UJtpY9ngyDm3Qn+Dv49j/VBdBk1/V
	hwOpvv8svVMTADemC4eS5HvyFF9ICgqJsOsRJKnOHVgNKQ5PjFvhqVt/scWyx0OBWduX
	wXh2tg2KjhVqNSgVlmea0QL2SNUZ/fW1hvZahpPijSU4QyVYlJHtWWzqr2/ugL6xu+mp
	MdxvemkHtfqdgs6eYt38+ELHomCysbWFalfmSys44KXLQX30rHL9lSgJWpohNjROGAVk
	ISYA==
X-Gm-Message-State: ABUngvc8rXaLiEU38pCMC27tGWH1/8XFusI2xzzASBUj3G1qiHzQjXekilmSkeXU+Xef0Q==
X-Received: by 10.28.8.202 with SMTP id 193mr630554wmi.101.1478388468129;
	Sat, 05 Nov 2016 16:27:48 -0700 (PDT)
Received: from localhost.localdomain ([188.24.218.70])
	by smtp.gmail.com with ESMTPSA id f3sm4571211wmf.10.2016.11.05.16.27.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Nov 2016 16:27:47 -0700 (PDT)
From: Alexandru Moise <00moses.alexander00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 01:27:35 +0200
Message-Id: <20161105232735.12691-1-00moses.alexander00@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-networking][PATCH] fwknop: Initial add 2.6.9
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
X-List-Received-Date: Sat, 05 Nov 2016 23:27:49 -0000

fwknop is a SPA (Single Packet Authorization) scheme for strong
service concealment. Modern alternative to port knocking using
a single encrypted packet for authentification with a firewall.

Signed-off-by: Alexandru Moise <00moses.alexander00@gmail.com>
---
 .../recipes-support/fwknop/fwknop_2.6.9.bb         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb

diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
new file mode 100644
index 0000000..49b11ad
--- /dev/null
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
@@ -0,0 +1,34 @@
+SUMMARY = "fwknop - Single Packet Authorization"
+HOMEPAGE = "http://www.cipherdyne.org/fwknop/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    "
+inherit autotools-brokensep
+
+SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "e2c49e9674888a028bd443a55c3aaa22"
+SRC_URI[sha256sum] = "5bf47fe1fd30e862d29464f762c0b8bf89b5e298665c37624d6707826da956d4"
+
+DEPENDS = "libpcap gpgme"
+
+EXTRA_OECONF = " --with-iptables=/usr/sbin/iptables \
+               "
+
+do_configure () {
+	aclocal
+	libtoolize --automake --copy --force
+	autoconf
+	autoheader
+	automake -a
+	oe_runconf
+}
+
+PACKAGES =+ "${PN}-client ${PN}-daemon"
+
+FILES_${PN}-client = "${bindir}/fwknop"
+FILES_${PN}-daemon = "${sbindir}/fwknopd \
+                      ${sysconfdir}/fwknop/access.conf \
+                      ${sysconfdir}/fwknop/fwknopd.conf"
+
-- 
2.10.2


