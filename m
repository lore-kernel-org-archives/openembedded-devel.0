Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6DBE767B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:55:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H9t1wH000273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:55:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 02:55:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 17:51:17 +0800
Message-ID: <1439805078-23359-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439805078-23359-1-git-send-email-rongqing.li@windriver.com>
References: <1439805078-23359-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3][meta-oe] liblogging: add the recipe
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
X-List-Received-Date: Mon, 17 Aug 2015 09:55:04 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

rsyslog 7.6.1 needs it

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../liblogging/liblogging_1.0.5.bb                 | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb

diff --git a/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb b/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
new file mode 100644
index 0000000..3488b19
--- /dev/null
+++ b/meta-oe/recipes-extended/liblogging/liblogging_1.0.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "An easy to use logging library"
+DESCRIPTION = " \
+liblogging (the upstream project) is a collection of several components. \
+Namely: stdlog, journalemu, rfc3195. \
+The stdlog component of liblogging can be viewed as an enhanced version of \
+the syslog(3) API. It retains the easy semantics, but makes the API more \
+sophisticated "behind the scenes" with better support for multiple threads \
+and flexibility for different log destinations (e.g. syslog and systemd \
+journal)."
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=63fe03535d83726f5655072502bef1bc"
+SRC_URI = "http://download.rsyslog.com/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "44b8ce2daa1bfb84c9feaf42f9925fd7"
+SRC_URI[sha256sum] = "310dc1691279b7a669d383581fe4b0babdc7bf75c9b54a24e51e60428624890b"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-man-pages"
+
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)}"
+PACKAGECONFIG[systemd] = "--enable-journal, --disable-journal, systemd"
-- 
1.9.1


