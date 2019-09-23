Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8F27E6B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 10:01:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p7so9154438wmp.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SfBWdRvnSp+aOcld51A7uihB3tqeQTp1vLoh5sBzsrg=;
	b=DAco7pAFQgCa8RGXwp0hML7tFWBWY3gwBLhLw1cGMVUmnlzt9n35d6490UB0fZSNxG
	PkC1OuGSjrFfhQqNqCfd1rhQwzIUrJ7+Cug+3+45UQKa9i/2zOdudXwMnrHFuXR/YcZc
	bPx3cmYgynkQ2D8J39guaEeH+PKJL/qmZZYgMDXv1KsRyPr6cdujZ/C5ncvjptPIDspT
	LLIoT+tMAP7PPRMT4w6li9cEwBc0EznK/SrOVnxdPyoFGzVIAF6QPSJwEd4Kk0BuKTr1
	fgLgU760ifBdGHpSWoyqdkMmrcZdqTarEV0jp43veYpLzM++GFRVDWXiHgDX/P0IAkpX
	7R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SfBWdRvnSp+aOcld51A7uihB3tqeQTp1vLoh5sBzsrg=;
	b=HO8BKZEZF0DArNPA4uyLEy8t8umIPJqqkEEPhcvOuHpD1ksfJzZ5r/uFroePZD680R
	+MFmpp/Fo2EP3MAyOa6shwRM7J/bwUALglK6g4Y2t7paXeioxFStITrI1omtbOThdQLu
	kjQayHu3saGs8XHIIMhuirp3Yj0w7EjwrT5HDAwg3YtQNyKFyP2TNfkVj0gwx78JGjft
	aTJKyyFbL2FXcv19yJWPRpmBkouvwKCHLxx0/CFCBgFAM1AKsS8NupqetTK7bgjTOpWx
	UOESgP2SQJVpPSZrUU8MxpJidt+v1O13V97/xqWmWRa3gMj9Sj2+9d7WTD7uBZ4P8dY1
	mH8A==
X-Gm-Message-State: APjAAAVZZdVFaQ2f1VCLOklDjuHVHLAhYjTQVt5NjTLWiWp6Vjr9RZPn
	LTDfTJPU+Op8fx66TWFXDIJQ7W2bQys=
X-Google-Smtp-Source: APXvYqz5nIZeTB1FxNVSbLGGr56/uk1227PaAhJkeOYKf7nDhlVRPq/AkH1j4IgXttaaRtAJa6erFw==
X-Received: by 2002:a1c:7409:: with SMTP id p9mr12851972wmc.162.1569232865750; 
	Mon, 23 Sep 2019 03:01:05 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id t14sm9412032wrs.6.2019.09.23.03.01.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 03:01:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Mon, 23 Sep 2019 12:00:58 +0200
Message-Id: <20190923100058.30454-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923100058.30454-1-brgl@bgdev.pl>
References: <20190923100058.30454-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 10:01:05 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for dtschema package developed by Rob Herring for
easy validation of YAML device-tree files in the linux kernel.

The version is current git as the only release so far - v0.1 - is old
and doesn't work with kernel's dt_binding_check make target.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../python/python3-dt-schema_git.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
new file mode 100644
index 000000000..d2b4ae1f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
+AUTHOR = "Rob Herring"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/robherring/dt-schema.git"
+SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "python3-jsonschema python3-ruamel-yaml"
-- 
2.23.0


