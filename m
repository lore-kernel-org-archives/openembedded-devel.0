Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsG-0004Rt-2C
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:20 +0100
Received: from mail-fa0-f70.google.com ([209.85.161.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:33 -0800
Received: by mail-fa0-f70.google.com with SMTP id t1so2769467fae.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=3Q/SFwBQM+Cm5gk+8NlF06KVc82MBf3NF3IHv70llBM=;
	b=HYt7Pde28UhfrZj/TjzCYi0o+eeEI0lwMcXmXPDqAjS4tv3kICAWH5YdPvg2UZja70
	+UJNofOScUz+i42PXrT+DfCpmHHiHG8+7xTXoE5JAqsLPMHnzUhl1l1Ly02fJPxCyi7K
	TxH3cBD6zVcNd8I8iYvjMQACOmGvx/gp5+t+96o0S4KCNKkMcBk7DsiTAgufhZ920N7o
	iMFm3pOwjw0ATJpFRHE2PxVL4ewHsQRRMkDKAlHpUMZv4lKVZNdSD/fKpScfm9sQsneF
	//DFolX0LvESaz9E2CjPYcX1xt2z7ZHGjZTEBTeWW+tNxWoySHHiUFaQp+PgVd3YyxkL
	lN8Q==
X-Received: by 10.194.57.206 with SMTP id k14mr17395663wjq.26.1356008071812;
	Thu, 20 Dec 2012 04:54:31 -0800 (PST)
X-Received: by 10.194.57.206 with SMTP id k14mr17395656wjq.26.1356008071747;
	Thu, 20 Dec 2012 04:54:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:39 +0000
Message-Id: <1356007963-12208-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlw19hv/vZiBPpbG06UepVZlhQEHXzaZatsYhvaz+AkTEVtYVFogrsXlxWCPFXNVicsc2A1gpbm9DgKdsPVOwY5UwikGV1Xmtk3ht+dZxSA0WPI0eG+flEwn6KQyTpeZMJkLQKBMpMl2L9xJfAie+FSZpVwfUn61W+0BKkUSlFUuKEDpo6VkeDyDXiM/lobZamZ/KdQ
Subject: [meta-multimedia PATCH 2/6] gupnp: add 0.18.4 and 0.19.3
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
X-List-Received-Date: Thu, 20 Dec 2012 13:09:22 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/gupnp/gupnp.inc            |   19 +++++++++++++++++++
 .../recipes-connectivity/gupnp/gupnp_0.18.4.bb      |    8 ++++++++
 .../recipes-connectivity/gupnp/gupnp_0.19.3.bb      |   10 ++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
new file mode 100644
index 0000000..91eae15
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -0,0 +1,19 @@
+SUMMARY = "UPnP framework"
+DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
+LICENSE = "LGPLv2+"
+
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
+
+EXTRA_OECONF = "--disable-introspection"
+
+inherit autotools pkgconfig
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
+
+SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
+
+gupnp_sysroot_preprocess () {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 755 ${D}${bindir}/gupnp-binding-tool ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+}
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
new file mode 100644
index 0000000..4fb1d05
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.18/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "0e15fa26be7b1a0255e6dec07c285527"
+SRC_URI[sha256sum] = "6b437d5711b212292c6080626b97480268310da636a6cf937ad6119291af78a1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
new file mode 100644
index 0000000..bab74b8
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
@@ -0,0 +1,10 @@
+require gupnp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.19/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "8165c3ad3d16576a0a99250b75df23f8"
+SRC_URI[sha256sum] = "0d3097c419e1f8af0ff8ee91318d75e8896b3b92924cb1a5cf93010795a7118b"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.10



