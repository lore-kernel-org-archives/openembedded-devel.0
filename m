Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 25FFE786D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:10 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 143so327141wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mo4M/KxhYR3+27Tw9LGKQUFynenAdgX6BD7gGHPHGsA=;
	b=FUoZC0i70eshsrq3eKYspGkRvYdMDV1N5+F+Ck+fRz9my62LlYy+Bc+7jvpUhK3Fns
	Sh/lTQyyVWe9jFEfMAXnUyxsnDZoeG8qHgWI1ujevztV/wzxXWJLat37uz78qdqrlUcq
	UKVjQiPO5zauY9mjmLTH7tt0VF6MEa0O1x9peKEsiCh51qA7IeVr1F50WBfgLQOF0hOE
	qwdiAnGmmxgO77apqsUE77gVFe4IEoGO7sAaOvc08kUcofRuQOMzioUOu0cmF+Wu31V3
	dIB0xvRcIlRcOxTx4hVUCdqaKetbkz3wq1xU5JyeNhZRF36jxvQ5mWXi5B9ICgr2MEik
	sf6Q==
X-Gm-Message-State: AKwxytdnF77A5mVnjc7qGrWiW6egi6m5cqLHgJdsB9nuybQv4ASU+nwI
	trr6UhCEz//sWSt7HWsPLd8EOFCO
X-Google-Smtp-Source: ACJfBouYw1AWmnxgbpUANeO/UHO56aWMPnK7k4Hj021lJDA5+Ox98r/oqvkbEPLnDYxOYpPe3nRaVg==
X-Received: by 10.80.227.203 with SMTP id c11mr8679165edm.195.1516007831418;
	Mon, 15 Jan 2018 01:17:11 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:10 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:05 +0000
Message-Id: <20180115091707.1539-4-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091707.1539-1-git@andred.net>
References: <20180115091707.1539-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/6] python-twofish: add initial recipe for version 0.3.0
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-twofish.inc      | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-twofish_0.3.0.bb |  2 ++
 .../recipes-devtools/python/python3-twofish_0.3.0.bb        |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-twofish.inc
 create mode 100644 meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-twofish.inc b/meta-python/recipes-devtools/python/python-twofish.inc
new file mode 100644
index 000000000..79ab285e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twofish.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
+DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
+ libtwofish-dev."
+HOMEPAGE = "http://github.com/keybase/python-twofish"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
+
+SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
+SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
new file mode 100644
index 000000000..85b021594
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-twofish_0.3.0.bb
@@ -0,0 +1,2 @@
+require python-twofish.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
new file mode 100644
index 000000000..e593f6f21
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -0,0 +1,2 @@
+require python-twofish.inc
+inherit setuptools3
-- 
2.15.1


