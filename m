Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 02BE56E666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:39:42 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 6so503271751qgy.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=z8aPI3T5B7daOS+G2w7/QO6jD2X4NppKARRcPq/xuXY=;
	b=c65SHFamx8G2EM1lGn5gfAKBune8qz/YvV/n8RSYaMO9HdiC4EiNTBhSKbez8rqDCW
	csTX3onl8hH/+ISKIgDjvTIqWrHhlrIxNueceVx2VgkhNOA5Ru/0UtZYBG0XA/oI3Krs
	tsV68rPoWyIio/KwXPPo1OizhEnmvFylvykiIr3mWf+4GUJA4TrxdCDtCu6WQrKtS3qq
	CEh5ZtaSxiqrEZfdrJWEBWCfQPPDG+PigobT9csdP5qYpvyFAgJS40gi+svLpfnCwdOF
	UZtkJcHXP6mY9x2wTZS8odLN0mD444boNbX93MzN4G+SG6SnzG6EX6h8uOeI1hk1rgOJ
	xGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=z8aPI3T5B7daOS+G2w7/QO6jD2X4NppKARRcPq/xuXY=;
	b=D6dR322y1Q7ipusFUeVlmTwUbdCcLi3Uj79kuI9YO05i1aaSISxdiCy8Xm+Ed3Wlgb
	1kytEzB/+fmRSX5CusngRFCF/eSmrj3MmYsgbJVz1Nmmf0Qv/uDLL32DzJXh5jIm5gHJ
	vL09FH/P7h7DB5ezHmVttxvmqpyGKHdtUKlOu3++jwPDmm6wu4V18DGVoTK1L3f9UWaL
	MQN8cngKPb9bHCaV3J+wiKR7/6h6V6dRxPMwLtI+i3pF6V8ZSZ10hGOTBR71uP4lm/WE
	Amr172M8lb/CGZPJ+pFrrN6Whs2LrvZ35ZvX3ghqHOXWjo26QDym5+Vb8jgyhBKRpeUH
	6UbQ==
X-Gm-Message-State: ALoCoQnATQEphwtzt3JUlqhjaS3ZyTn3k25KnHYhWKT90montNgSrW99BPsaLuUn8HKlMi4Wjr4Xq86vlNnRDgMtw8zHO8/WTw==
X-Received: by 10.140.227.199 with SMTP id x190mr41085043qhb.46.1453217982916; 
	Tue, 19 Jan 2016 07:39:42 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	a66sm12426276qkb.20.2016.01.19.07.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 07:39:42 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2016 10:39:36 -0500
Message-Id: <1453217976-27313-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCHv3] thrift: Add recipe for Apache Thrift.
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
X-List-Received-Date: Tue, 19 Jan 2016 15:39:46 -0000

 * Run tested cpp bindings with GNU Radio Control Port.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/thrift/thrift_0.9.3.bb    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
new file mode 100644
index 0000000..7c8f407
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Apache Thrift"
+DESCRIPTION =  "A software framework, for scalable cross-language services development"
+HOMEPAGE = "https://thrift.apache.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4ed21f679b2aafef26eac82ab0c2cbf"
+
+DEPENDS = "thrift-native boost python libevent flex-native bison-native \
+           glib-2.0 openssl"
+
+SRC_URI = "git://git-wip-us.apache.org/repos/asf/thrift.git;protocol=https \
+"
+SRCREV = "61b8a29b0704ccd81b520f2300f5d1bb261fea3e"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit pkgconfig cmake pythonnative
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
+EXTRA_OECMAKE = "-DWITH_QT4=OFF -DWITH_QT5=OFF"
+EXTRA_OECMAKE_class-native = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
+EXTRA_OECMAKE_class-nativesdk = "-DWITH_QT4=OFF -DWITH_QT5=OFF \
+             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
+
+do_install_append () {
+	ln -sf thrift ${D}/${bindir}/thrift-compiler
+}
+
-- 
2.5.0


