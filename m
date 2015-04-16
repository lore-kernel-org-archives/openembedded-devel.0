Return-Path: <joe@deserted.net>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD0373D17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 04:13:01 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so42150236igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 21:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=gUbJENllTXYm5R+ULjXIynjF2thjG64rjLJL59yiktE=;
	b=KBKFHoaK5Ht980TFL+JZcHv5X0nwWioteF+CQZxItBmJwAhaz568H9m2ntRWJK9exb
	maHFU1JjqhIGwR+CZNFSTA+ybwOfESefQ2aKtIsMKqL/n4Bs1BJwuqSv9l+tXskbyXdU
	erdSKChBa4mDguDKhwkJ1kv+q82oWR28jVfWmlbdOtzg9L864UBxuyIOel3VXsUnq8SI
	svMFE1V98TS+Y77124s91WW9cT8SzrjVfxLRqkWIgwJ77aDoTEPGbSOJreDkWK3XZ+Q9
	JJ7XACPQ8iqPkuhVABKhKnLR5FM9qO0xBg6iSmHV4ZzeErbGvrunu6urCgAu102zofIn
	jmaA==
X-Gm-Message-State: ALoCoQnYymRzHYmloNlTVqzNfV9okzymM/GWJIlXMwOaFzn32+lg/tNF99uu7and0jiKVqsodUEM
X-Received: by 10.43.66.131 with SMTP id xq3mr36063478icb.9.1429157583255;
	Wed, 15 Apr 2015 21:13:03 -0700 (PDT)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id w33sm3777380ioi.17.2015.04.15.21.13.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 21:13:02 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 00:14:28 -0400
Message-Id: <1429157668-4952-4-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
References: <1429157668-4952-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking, for-fido][PATCH 4/4] wolfssl: change name from cyassl to wolfssl, update to version 3.4.0
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
X-List-Received-Date: Thu, 16 Apr 2015 04:13:02 -0000

From: lchristina26 <lchristina26@hotmail.com>

CyaSSL is now called wolfSSL. Recipe updates included RPROVIDE and
PROVIDE lines, with updates to sha/md5 sums.

Signed-off-by: lchristina26 <leah@wolfssl.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/cyassl/cyassl_3.3.0.bb     | 18 ------------------
 .../recipes-connectivity/wolfssl/wolfssl_3.4.0.bb   | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 18 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb

diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
deleted file mode 100644
index b6f852d..0000000
--- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "CyaSSL Lightweight, Embedded SSL Library"
-DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
-               optimized for embedded and RTOS environments. It can be \
-               Up to 20 times smaller than OpenSSL while still supporting \
-               a full TLS 1.2 client and server."
-HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
-BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
-SECTION = "libs/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://www.yassl.com/${BP}.zip"
-
-SRC_URI[md5sum] = "0303eb0f2f9065a1207d9104ab0eba7c"
-SRC_URI[sha256sum] = "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
-
-inherit autotools
-
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
new file mode 100644
index 0000000..2366fb1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "wolfSSL Lightweight, Embedded SSL Library"
+DESCRIPTION = "wolfSSL, formerly CyaSSL, is a lightweight SSL library written in C and \
+               optimized for embedded and RTOS environments. It can be \
+               Up to 20 times smaller than OpenSSL while still supporting \
+               a full TLS 1.2 client and server."
+HOMEPAGE = "http://www.wolfssl.com/yaSSL/Products-wolfssl.html"
+BUGTRACKER = "http://github.com/wolfssl/wolfssl/issues"
+SECTION = "libs/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PROVIDES += "cyassl"
+RPROVIDES_${PN} = "cyassl"
+
+SRC_URI = "http://www.wolfssl.com/${BP}.zip"
+
+SRC_URI[md5sum] = "ec6ed4c5847454ac928215a46b3e0c33"
+SRC_URI[sha256sum] = "bc49a142c17b1e52a126417e5d7cbadcb7f18f5c81e446c12e214483395159ea"
+
+inherit autotools
+
-- 
1.9.1


