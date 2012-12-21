Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm39A-0002K9-6v
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:20 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:45:32 -0800
Received: by mail-ee0-f69.google.com with SMTP id d41so3997596eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=W3LgE8v84e6KfAr5gT9HPC5he3klPU3/YnaaUkETjGE=;
	b=aKfmSV6aAB/gs5CPhrXSi9l8D+O+wGj2KVdjh8IH5zim1zDYyhqvhVoe65RkzOwqjM
	/9LplbmUITiGAdZUjepWhkAt9QUzLlJXmlXdf4KU9qzy+AtGGS/INGaYZA0fUF76tzma
	amMSCxpBrDSM12AFg2d/f/F5ekiczEc0IZAteAl1pMMgT+2nEdM21WEzebU8nn4HRuoe
	E5e/GrohZi50xf1Hj0YTmRTqoDImTMyolKpCa7EuAulvgxKf1Wtu2ogF5fGawpyVjR5b
	AUDNnymOIY8dV6OpoNqYdqQzaTDeD/i1nYtOmKIyhqEUW3w2J6uO1RZn/a4QcrqmJAVM
	4v+w==
X-Received: by 10.194.236.166 with SMTP id uv6mr23769266wjc.34.1356097531154; 
	Fri, 21 Dec 2012 05:45:31 -0800 (PST)
X-Received: by 10.194.236.166 with SMTP id uv6mr23769257wjc.34.1356097531076; 
	Fri, 21 Dec 2012 05:45:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:40 +0000
Message-Id: <1356097422-11920-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmd/jkceFchdwFlbaubgyaj2LHnL89JhvLIx024645fjbDK2BehaJl7MRaKEw68rQZmArGHhytdD5MNcvndjQgMbHq0tdlp8Jw4z4JbWqphysTlngmhLXgSs3SzG9cMLv40+uiKj8pGDM8p6avdjJyG49wfFin7WnOImKRFAK2SfnbAHa1fJOOODYi5LYm7n6xpsrLx
Subject: [meta-multimedia PATCH V2 4/6] gupnp-dlna: add 0.9.2
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
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
new file mode 100644
index 0000000..b7e71cf
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Helpers for AV applications using DLNA"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
+
+DEPENDS = "libxml2 glib-2.0"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "d972f9b03f0f3793cb895eb034ea314f"
+SRC_URI[sha256sum] = "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768d55b5cb898a9fc53"
+
+inherit autotools pkgconfig
+
+require no-vala.inc
+
+# The GStreamer metadata backend requires GStreamer 1.0, so skip this until we
+# have that packaged.
+EXTRA_OECONF = "--disable-gstreamer-metadata-backend"
+
+FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
-- 
1.7.10



