Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm399-0002K7-C5
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:20 +0100
Received: from mail-we0-f198.google.com ([74.125.82.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:45:31 -0800
Received: by mail-we0-f198.google.com with SMTP id r1so2459145wey.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=qpkgLgggFdAT+TlsSDvsvrZ/82Jfkgm06eRbr1xqfvA=;
	b=QlLttqDacGhiqqSJTGWNokAr83zXeS3Hd5IxY2rbXk+/E/2dAo72cSYpBIyo7erGfF
	9GidIpjNfCZla0lEbq9zO6bLaK6gw3WWM8jWUM8l9rF6+mjJZ2U93GUWtSJ3hAF2a7KS
	A+0zQRmGwbBIYffpVzNdWjn2XnmwpvK4XSgOt49YtSXEpdGlckHsBaP8Z1UAOI0f7Nis
	H9pV0fzmPt/FGduxRcK+KCB8PlAgAOaRP42vJlODJFywwRhm9UihHYGKWCeTHhHIuNXU
	EdvBI9GqPZDooPQjpCjZN4R6zg187qeiRN4JowN6MkNZ+vnWTx9Tif6jABjBz9eiBi+x
	82mw==
X-Received: by 10.180.100.163 with SMTP id ez3mr15739565wib.24.1356097529965; 
	Fri, 21 Dec 2012 05:45:29 -0800 (PST)
X-Received: by 10.180.100.163 with SMTP id ez3mr15739557wib.24.1356097529858; 
	Fri, 21 Dec 2012 05:45:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:39 +0000
Message-Id: <1356097422-11920-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQleRLQBe3QavXP0w7obXZSSVYv9iTU74zkotyzAn8pgXUwZHfvGKAZhWmhnSG95FWJCsvKd/OV21ZqwUsEZBKi0wXZ0SWe6ECDBfFJl0b1RI3uDcD8thsvm9TBKkI3YFGMNs41XgeFYiKt8iIPWx1kmPwo4JSr4E81V9ilSmGQaQqskx3rFQTNAr6acDtW6t6uFB1b1
Subject: [meta-multimedia PATCH V2 3/6] gupnp-av: add 0.10.3 and 0.11.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 14:00:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc      |    8 ++++++++
 .../recipes-connectivity/gupnp/gupnp-av_0.10.3.bb            |    8 ++++++++
 .../recipes-connectivity/gupnp/gupnp-av_0.11.6.bb            |   10 ++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
new file mode 100644
index 0000000..b076155
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Helpers for AV applications using UPnP"
+DESCRIPTION = "GUPnP-AV is a collection of helpers for building AV (audio/video) applications using GUPnP."
+LICENSE = "LGPLv2"
+DEPENDS = "gupnp"
+
+inherit autotools pkgconfig
+
+require no-vala.inc
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
new file mode 100644
index 0000000..5f8e73a
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
@@ -0,0 +1,8 @@
+require gupnp-av.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2c57e56b201765b2297946d8d99bd01c"
+SRC_URI[sha256sum] = "d0dbb727d87bc9f2dc834455d14a30700b16b41a57e9dcde2e822b378ca8f1e2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=d344132a8766641fcb11213ff5982086"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb
new file mode 100644
index 0000000..b402dd8
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb
@@ -0,0 +1,10 @@
+require gupnp-av.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.11/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "ee200393207323f0b594f11d6184556c"
+SRC_URI[sha256sum] = "401991336babb18c4ebed16e75e0b4d3e5848cff7bb878bbfd54a5d15203c4cc"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=2b47b7b5f799d2ebabe62b895e848820"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.10



