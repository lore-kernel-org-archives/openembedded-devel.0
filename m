Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsE-0004Rt-66
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:18 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:32 -0800
Received: by mail-we0-f197.google.com with SMTP id t11so2548810wey.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=v1odLp+xK8IoWNn2aQuBjVQwHiUfDRIaYrMf9FwPUuE=;
	b=oCWvIcsmAaB2cTTIGUTZpYdjnslh7chAbjKARZzeSoI3E5aM1GiLELOZNfb4q8sVDy
	+MvNKde9KRg7b1tbpX8jbfoixAQ46Df4jAZaP2TpHBKnY3rTsfAvx36DlwXKTXqeE3vy
	joPvqRAbNcsq8qxaG1Sy7T8rNSj7FWyxnGcTvUQU9h85F2E/HQJ7RSwsWwBr/oZp7CyR
	dSXD3hkFZA7oLlO5XxiZ41NCp4ZDnns4B7w+JLGNSC/vn/MQsJbzQuStWn4NqzRaYOGi
	fhTniBiv/8aZLBgg44VFQpAMgxQseNCYvvFZvTgWDDmEg2EzVlclfU+m8DcnECRt4j4h
	GuGA==
X-Received: by 10.180.93.3 with SMTP id cq3mr17370531wib.1.1356008070578;
	Thu, 20 Dec 2012 04:54:30 -0800 (PST)
X-Received: by 10.180.93.3 with SMTP id cq3mr17370527wib.1.1356008070512;
	Thu, 20 Dec 2012 04:54:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:38 +0000
Message-Id: <1356007963-12208-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnW76/gitPs8TcZwyJX7iWMJPihVj6Wx6V6fs8VLTO2BxcVT//FvrvDCWTZYmYWO9DBkbbPQ/ncLlOzlSGX6IbBMgZv4P+osRXgUJIbupAW0AaDe6pqCTiJgJ/dl+S9h6K6GCXxMtISXMuNBquBSETc/MeOQbkbLscIs4KFnEr+VbIG+voaoWONPGgeF/9vSivKVm4Z
Subject: [meta-multimedia PATCH 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Thu, 20 Dec 2012 13:09:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc   |   16 ++++++++++++++++
 .../recipes-connectivity/gupnp/gssdp_0.12.2.1.bb       |    5 +++++
 .../recipes-connectivity/gupnp/gssdp_0.13.2.bb         |    8 ++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
new file mode 100644
index 0000000..51befd9
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Resource discovery and announcement over SSDP"
+DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub vala-stub-native"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "gssdp-tools"
+
+FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
+
+EXTRA_OECONF = "--disable-introspection"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
new file mode 100644
index 0000000..29cc721
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.12.2.1.bb
@@ -0,0 +1,5 @@
+require gssdp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.12/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "8ac3a544ef0dcf8caaf7c249d2a50dc2"
+SRC_URI[sha256sum] = "928aa257815d044fdbfc740f5799530d41897947b5d7854173f636b36d728414"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
new file mode 100644
index 0000000..c308fa0
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_0.13.2.bb
@@ -0,0 +1,8 @@
+require gssdp.inc
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.13/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "758ed423cdd258a9a22d59c321b535ed"
+SRC_URI[sha256sum] = "8f663f8a72b66254f5c20a3610ff853ac8d00bf6f253828e37e51579caa34dce"
+
+# This is a development release so don't prefer it
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.10



