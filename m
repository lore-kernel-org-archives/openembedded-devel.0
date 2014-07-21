Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id CA2CC7051A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:29:33 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so7278505wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6teEcJ3D2hdphFrq5qoRw+Yv9XaiVNy8NKvFro415Ak=;
	b=rOkOeJ2suhOy7mHJtku3304EN981+7Z5aeG89bSBik0UPVq2H5xe0kY3QM+2DKVVtg
	zDssDzgo6ZhFZSVgSw2l1txmdJecvaCrfUR/Gvwah+ZvmQO8MO5n4O8HwKEV1WLKD+7a
	Kpuld72lSCmzzkG5p8Nt3Rgv5QzhMj79Dv30tTZfnqgBCZWIxftzLqwQFAUXszrHTSZM
	FERzRRd/W4SoQhwAKbEoynH8ZZGnmatVAmDEoYkkTD8C615PWXxS1FxpNPPnfhBeoD7t
	O9kWjPnDC9by3/WDMkZQWewl4ZkqBXucDpvfxebSs0J4th20qmeh8SC/BPRbXn2RR4bu
	oGtg==
X-Received: by 10.180.75.230 with SMTP id f6mr8825019wiw.5.1405981774116;
	Mon, 21 Jul 2014 15:29:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm40771488wjc.23.2014.07.21.15.29.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 15:29:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 00:29:46 +0200
Message-Id: <1405981786-9404-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405981786-9404-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lksctp-tools: blacklist because it fails to link against sctp_connectx symbol
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
X-List-Received-Date: Mon, 21 Jul 2014 22:29:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index 102c2bb..e2551e1 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -12,6 +12,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/${BP}.tar.gz"
 SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
 SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
 
+#| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -shared  -fPIC -DPIC  .libs/bindx.o .libs/connectx.o .libs/peeloff.o .libs/opt_info.o .libs/addrs.o .libs/sendmsg.o .libs/recvmsg.o    -march=armv5te -marm -mthumb-interwork --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -O2 -Wl,--version-script=/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/lksctp-tools/1.0.16-r0/lksctp-tools-1.0.16/src/lib/Versions.map -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsctp.so.1 -o .libs/libsctp.so.1.0.16
+#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
+#| collect2: error: ld returned 1 exit status
+#| make[4]: *** [libsctp.la] Error 1
+PNBLACKLIST[lksctp-tools] = "BROKEN: fails to link against sctp_connectx symbol"
+
 S = "${WORKDIR}/${BP}"
 
 BBCLASSEXTEND = "native"
-- 
2.0.2


