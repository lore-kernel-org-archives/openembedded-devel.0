Return-Path: <tom.rini@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id CA06860CF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 20:08:35 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id u19so7876091qku.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 12:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vq7uo6T322CjM5H4nYvQY3G7tER4vUtcYiZdWuU9pzQ=;
	b=SbHMx0x4nlhE/lKpO+Y8H2GSQ6NBw6iTG8VWtdztcjyPAAviKFXlzSDmH+QKU+Urx2
	j2U9Fyajcp8HMhI9oUoWftAS1T/3rEeP8MmS04zi6LQcKKTNjDqKGoTXQNoRHDunddOw
	M0ArEK0zOR/0UIdGUTfCOq/hdF/TPCKkxhiCjQ9lTXNmVytgUqRxxn0Sxfr9a6mAubwV
	MUXUBp8Meq79hYST0xesi+HXLg0KWtBRjxg/YAK53nvpJvCMP5TU1HfnWWuSXnWSLLLh
	Dlva7vo6EeeYZH1mevaQcddxGSRqmCOaH1kv+BYUueAZ/kT13Sb9i3yxtp7HW2ypCVm7
	GcYw==
X-Gm-Message-State: APjAAAWWcrFYeN0ytrXRQpybAYFavaAp3h0zXMivm8BoAuw30rwoQr7S
	J4cDE6TVl7lkvDNMtBO9cP98KyvQsw==
X-Google-Smtp-Source: APXvYqzshaJ5ZMjq3xwiICZBlqAjXc/GV7IfZmhDGGCB9rSc7C13gpfRLRht5tZbiRjSAHSj32lPug==
X-Received: by 2002:ae9:f714:: with SMTP id s20mr24866012qkg.236.1580760516289;
	Mon, 03 Feb 2020 12:08:36 -0800 (PST)
Received: from bill-the-cat.local
	(2606-a000-1401-86dd-e4ac-64fa-4c27-a5bf.inf6.spectrum.com.
	[2606:a000:1401:86dd:e4ac:64fa:4c27:a5bf])
	by smtp.gmail.com with ESMTPSA id
	h34sm10853018qtc.62.2020.02.03.12.08.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 12:08:35 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Feb 2020 15:08:32 -0500
Message-Id: <20200203200832.23030-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] nng: Add recipe
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
X-List-Received-Date: Mon, 03 Feb 2020 20:08:36 -0000

nng is the nanomsg project's rewrite of their libnanomsg library.  Just
like nanomsg it is a socket library that provides several common
communication patterns.

Unlike nanomsg it does not normally provide a number of tools and we do
not attempt to add them here.  We allow for optional mbedtls support.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Notes:
- nng is not a 1-to-1 replacement for nanomsg and does provide different
  runtime files, so we do not conflict/etc with them.
- nng does support cross-compilation of tools but I'm leaving this out
  as I can't test that currently and it is non-default.
- As it's part of the nanomsg project I am putting this under the
  nanomsg folder, but I don't have strong preferences here.
---
 .../recipes-connectivity/nanomsg/nng_1.2.5.bb | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nng_1.2.5.bb

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.2.5.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.2.5.bb
new file mode 100644
index 000000000000..77be27ffaa5b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.2.5.bb
@@ -0,0 +1,21 @@
+SUMMARY = "nanomsg-next-generation -- light-weight brokerless messaging"
+DESCRIPTION = "NNG, like its predecessors nanomsg (and to some extent ZeroMQ), is a lightweight, broker-less library, offering a simple API to solve common recurring messaging problems, such as publish/subscribe, RPC-style request/reply, or service discovery."
+HOMEPAGE = "https://github.com/nanomsg/nng"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a19b15be6e844b39a54de2ef665bd6de"
+
+SECTION = "libs/networking"
+
+SRCREV = "53ae1a5ab37fdfc9ad5c236df3eaf4dd63f0fee9"
+
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=v1.2.x"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[mbedtls] = "-DNNG_ENABLE_TLS=ON,-DNNG_ENABLE_TLS=OFF,mbedtls"
-- 
2.17.1


