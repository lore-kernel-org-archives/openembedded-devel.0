Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE7E6FE24
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 17:49:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105360.1766512170378373176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 09:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atPhGOKo;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso2249857f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766512168; x=1767116968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNkidus++LAg1kvUJlTxgC6TBNzSvDQAtuiTUVCbwJw=;
        b=atPhGOKogHvOl4s9HjmQlotUx5rX/S4qPhSN/RYfPLsG+IvyyDQMrx1/R1Of5XNJc2
         Zf+7iAEVz/w1V3mZ0ltchqR7w0wq+3xDlVbtgyboVOYsUc9SmviTGTHy8DUSNYO5CAYN
         EKV+bKaCg6w3uR7Y7lhINAip/472odsIWmeVScHEm95pGK4tPydolEQL05GV+rkTEBU0
         Dc49b+GJTPQsd8HdlmLNgMl2jIIsDWPDQyliO72hP6/ajL32iIT+0oKkgd5RG5ptDybn
         CnoC0D6fyTiIIy89OaafRdykIOR74TMleHj/nzbxKPmXdVOZi78y4TFBLcAOKvXqv5ww
         4Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512168; x=1767116968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qNkidus++LAg1kvUJlTxgC6TBNzSvDQAtuiTUVCbwJw=;
        b=ORSWzAstaGXBJX8NeFKOF6i9A8JjE2Fhukn9vGZU5TZBb8icXBF1n08Tr90NUxD+e+
         qotBQu+qQRikH6ThtdKuFKoOvq53kyK/WKglA3Cmc4G+6bG86AHnq9wyIHkzEWRT6AG0
         FJjXyQKRxMX952JdU+XioQxj2uLMxOuxd8GCO9n+kK4NoOS/6rm9ToBmYtLGrLvZ//Bx
         /cwJS2V0gxv0vzK4kXQLuu3R3dtDqJWH7serutL6g2YUCnXWzYSezRto2rCVC1fEv9aY
         TZX8aZYWI7R8lJu8RxxCNJ54wlI6PvzoV1rj9G7eBTGRFla9Kq/K3ZMIBcP9ctcgsnYP
         9lVg==
X-Gm-Message-State: AOJu0YzuxqD/vYd/Jxa9jfn15E7yZjk/WhWZloPNM8+B2lLa3Lsmrfy4
	UNc5S1LDWX2/BJxMX+dMvYw4DxRy1PXqG9W3jG+CfxaSYgkH+Gp37fAmy/uBRg==
X-Gm-Gg: AY/fxX6KYcGGeoljTYfKG2wYkVRBFJhlvbD28JhZEow4NSD5e8XZ3ZMYzNOspgc4nAK
	OKy5PnqMQ4VVBkvlSqHgz+IFOszUVPUcFIq2CUDW+V9BqDn0XMXmI54bfI1XaAv80zg+7hIiy6b
	cNroO6dBMjQZaX+/oIfB8DiF9vZRep/AIjrnrHETv19GlMUi03aosqHp9tZgfqGX78gXb+YiLF8
	wzidFTnPxYgT2fErWVmOPskb2vdVt1+tkHuTMBUb1gneGsBrswCj16yff1xdzSkbTHKpu1zOJrW
	XHfGauZA2m49VeikFfqqmwZZfliy7ByRrH+vu4CzxH4w5JMgcevIbGvaWCHHd3v/ampPSG75Pum
	tcGPpwXgxWPO8QluFdJHS/+BtAp/1NQCSbvN8Wnt4/pIbv8jsXlAuPDbtvP//mQuRq6TraWTQZ7
	K094GSqJ9DUa7Fe11oh5I=
X-Google-Smtp-Source: AGHT+IElE1omQgA7CXpVyDpYZ2fJ4veT+Uw5YfdsutXeNzKbv+5VwGOahGSc5Gq+X/lF3aIHiarU7g==
X-Received: by 2002:a05:6000:4202:b0:430:f5ab:dc83 with SMTP id ffacd0b85a97d-4324e4c70cfmr18715729f8f.11.1766512168373;
        Tue, 23 Dec 2025 09:49:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm28436823f8f.22.2025.12.23.09.49.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:49:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] tinyproxy: add ptest support
Date: Tue, 23 Dec 2025 18:49:26 +0100
Message-ID: <20251223174926.897953-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223174926.897953-1-skandigraun@gmail.com>
References: <20251223174926.897953-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 17:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122841

It takes <10s to execute.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-23T17:45
BEGIN: /usr/lib/tinyproxy/ptest
starting web server... done (listening on 127.0.0.3:32123)
starting tinyproxy... done (listening on 127.0.0.2:12321)
waiting for 1 seconds.. done
checking direct connection to web server... ok
testing connection through tinyproxy... ok
requesting statspage via stathost url... ok
signaling tinyproxy to reload config...ok
checking direct connection to web server... ok
testing connection through tinyproxy... ok
requesting statspage via stathost url... ok
checking bogus request... ok, got expected error code 400
testing connection to filtered domain... ok, got expected error code 403
requesting connect method to denied port... ok, got expected error code 403
testing unavailable backend... ok, got expected error code 502
0 errors
killing tinyproxy... ok
killing webserver... ok
done
PASS: run_tests.sh
DURATION: 1
END: /usr/lib/tinyproxy/ptest
2025-12-23T17:45
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-networking.inc    |  1 +
 .../tinyproxy/tinyproxy/run-ptest             | 10 +++++++
 .../tinyproxy/tinyproxy_1.11.2.bb             | 26 ++++++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/run-ptest

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 838aee94d3..0897024e3c 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_NETWORKING = "\
     python3-scapy \
     squid \
     tcpdump \
+    tinyproxy \
     wolfssl \
 "
 PTESTS_FAST_META_NETWORKING:remove:libc-musl = "\
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/run-ptest b/meta-networking/recipes-support/tinyproxy/tinyproxy/run-ptest
new file mode 100644
index 0000000000..267a975c24
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+RET=0
+cd tests/scripts
+if ./run_tests.sh; then
+    echo PASS: run_tests.sh
+else
+    echo FAIL: run_tests.sh
+    RET=1
+fi
+exit $RET
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
index e386d39cdc..222cc8d7c6 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://run-ptest \
            file://CVE-2025-63938.patch \
            "
 
@@ -22,7 +23,7 @@ EXTRA_OECONF += " \
 	--enable-xtinyproxy \
 	"
 
-inherit autotools systemd useradd
+inherit autotools systemd useradd ptest
 
 #User specific
 USERADD_PACKAGES = "${PN}"
@@ -40,3 +41,26 @@ do_install:append() {
 	fi
 	install -m 0644 ${UNPACKDIR}/tinyproxy.conf ${D}${sysconfdir}/tinyproxy.conf
 }
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests/scripts
+	install -d ${D}${PTEST_PATH}/data/templates
+	install ${S}/tests/scripts/*.sh ${D}${PTEST_PATH}/tests/scripts
+	install ${S}/tests/scripts/*.pl ${D}${PTEST_PATH}/tests/scripts
+	install -m 0644 ${S}/data/templates/*.html ${D}${PTEST_PATH}/data/templates/
+	# test the installed binary, not the one that was just compiled in the src folder
+	sed -i 's,TINYPROXY_BIN=.*,TINYPROXY_BIN=tinyproxy,' ${D}${PTEST_PATH}/tests/scripts/run_tests.sh
+}
+
+RDEPENDS:${PN}-ptest += "\
+    perl \
+    perl-module-cwd \
+    perl-module-encode-encoding \
+    perl-module-file-spec \
+    perl-module-getopt-long \
+    perl-module-io-socket \
+    perl-module-io-socket-inet \
+    perl-module-pod-text \
+    perl-module-posix \
+    procps \
+"

