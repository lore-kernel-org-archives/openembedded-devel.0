Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8F56378378
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:21:55 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id s66so35716816pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QFuVbrC/gINlsxhDHLwAy8SF9qbyu2zuLVaOGNj7yJM=;
	b=A2z0hgUzCy6inkaUPnr5V+ognvhzFJPYPICg2dNxBC17ewzqecQ5OebkYKkE7NowJH
	pe4ANQTgcFAYKkNlF7J0ky/xACSysmjaNWMt34Scbnd5/Sgte7FPuL6NNHTzNnak4tbH
	moTAhY2juwInQdcONargxegg0BAJ3OZ4vIr28dFwfO8Hg69ErDdPIyYYbsG+2jaYZ6Jq
	HMFmPsumf4FqS3qFCXwbNxlVf/1HmWe5z49Vsv3BvQa52suIRsUNH+qpHyHo4EISRhqY
	Q3BVLRVVUzYUpv0KrhympzNwKqPVELhcGRbbfjmNj58zqxobHK0ENUxr4kVgdKeuHxZH
	XEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QFuVbrC/gINlsxhDHLwAy8SF9qbyu2zuLVaOGNj7yJM=;
	b=ZAuvk5a/NkTY8vMZtDAQtJN/rI10ztdIdkHRfbkYyv4/Ae3x60wq+WtZ1+Toz41Sxc
	oV7MLy8oOaNHe6DxIUQAaOH1Lk/mORrwWl3sC5DERmU5/L/qKQD3wa/q5u8dulY5uYLU
	R/q3BtcEuVGzIBtTeQyq6oNuiU4jdzi2mqx1KdJlz6CuTHr1J427bVU10DzUYDfiu1ox
	kjA76CrOM9k4B7EERk1x3YSyBCbzwonH4OBNLAgQc8EBBpeS8tJWMbP9UlAaDiPAb5rE
	lqXkHdzcqsjLEIS0nixcgCdonEGn1Ibzi2srBvd6lSkxgdkQbR5osdX/Ow67qHIag34e
	UDrA==
X-Gm-Message-State: AKS2vOwXBNgsxz9hqFjOVc0IWgQuzmHjybyp3F3tbn+RZqpjMcosS4Gb
	UYYrpWgTZ960OP/I
X-Received: by 10.98.214.146 with SMTP id a18mr17177510pfl.40.1497720116523;
	Sat, 17 Jun 2017 10:21:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:21:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:37 -0700
Message-Id: <20170617172142.1311-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/9] vlan: Fix build with security flags turned on
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
X-List-Received-Date: Sat, 17 Jun 2017 17:21:55 -0000

Limit the license checksum to the file header

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...format-and-silence-format-security-warnin.patch | 34 ++++++++++++++++++++++
 .../recipes-connectivity/vlan/vlan_1.9.bb          |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/vlan/vlan-1.9/0001-Add-printf-format-and-silence-format-security-warnin.patch

diff --git a/meta-networking/recipes-connectivity/vlan/vlan-1.9/0001-Add-printf-format-and-silence-format-security-warnin.patch b/meta-networking/recipes-connectivity/vlan/vlan-1.9/0001-Add-printf-format-and-silence-format-security-warnin.patch
new file mode 100644
index 000000000..ebcfc7c2f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vlan/vlan-1.9/0001-Add-printf-format-and-silence-format-security-warnin.patch
@@ -0,0 +1,34 @@
+From 400b8f235377f677a7a760f1e3a1cd26d95140bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Jun 2017 22:58:18 -0700
+Subject: [PATCH] Add printf format and silence format-security warnings
+
+Fix
+
+vconfig.c:66:4: error: format not a string literal and no format arguments [-Werror=format-security]
+    fprintf(stdout,usage);
+    ^~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vconfig.c b/vconfig.c
+index 5057cfd..83137ba 100644
+--- a/vconfig.c
++++ b/vconfig.c
+@@ -63,7 +63,7 @@ static char* usage =
+ "            is OFF.\n";
+ 
+ void show_usage() {
+-   fprintf(stdout,usage);
++   fprintf(stdout, "%s", usage);
+ }
+ 
+ int hex_to_bytes(char* bytes, int bytes_length, char* hex_str) {
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 09c4007ef..3f688b360 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -1,10 +1,12 @@
 SUMMARY = "VLAN provides vconfig utility"
 SECTION = "misc"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://vconfig.c;md5=293ef69c4e88434d37a5ee577a5288cb"
+LIC_FILES_CHKSUM = "file://vconfig.c;beginline=1;endline=19;md5=094ca47de36c20c598b15b32c270ce0a"
 
 SRC_URI = "http://${BPN}.sourcearchive.com/downloads/${PV}-3ubuntu9/${BPN}_${PV}.orig.tar.gz \
-           file://no-HOME-includes.patch"
+           file://no-HOME-includes.patch \
+           file://0001-Add-printf-format-and-silence-format-security-warnin.patch \
+"
 
 SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
 SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
-- 
2.13.1


