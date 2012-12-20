Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsH-0004S2-UV
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:22 +0100
Received: from mail-bk0-f70.google.com ([209.85.214.70])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:36 -0800
Received: by mail-bk0-f70.google.com with SMTP id jc3so2560305bkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=WHFnbmNQJgAh1Ha78HI+qpjOwQZi5cpuHQ7RuIRZSnw=;
	b=og7Xj98nLXfIpAFWhb3NaAvjXGF3YIU7cJY7pkfqf3qXFNr1yAU6V1hYPbStMLtzSI
	IhpE0dXFCYwuS1HoS5WVGzquJoCxp5lQ22GSUrbZWW0QZayUPQwlzjHZeqXy+qnjE5KE
	7XPZI+maM/SYWohLj7STQW8E76TPnu//JIvnB9lLeQuT7ftyy9/GeuyZPIsUFsDEw3G4
	BtKXim2Fy7vHmdA0D46/WAp7v4WU2UK98feUVD6FuKi/pJe67nWTiL0yCSeZQdu6SgnT
	+CGogQUE9IJxuX2ePaLBFF0zu4A/qwV6O2L41/tvmTK+NfeC5t6kkUqnHG4jFSLHUyF0
	Q5Xg==
X-Received: by 10.180.24.9 with SMTP id q9mr17177252wif.14.1356008074552;
	Thu, 20 Dec 2012 04:54:34 -0800 (PST)
X-Received: by 10.180.24.9 with SMTP id q9mr17177242wif.14.1356008074477;
	Thu, 20 Dec 2012 04:54:34 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:41 +0000
Message-Id: <1356007963-12208-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnasN9ZdUVqBxDHs8HtMKdcfsCSJMfxpimt0gulj2UIO5rB7UiPiLTGhDo2VY376yZ/oh+6GddfhUj1kwseTfZHscR4/nRx5i2leK6fYU27W4DW8jQXtaYDU8YrMqvN0dau+5qQF/wNinHU2qYMvM2QLua9GlCUzf8QUrOxw2tKRBTEAUA8y19Xtw0XpNUiAoAQCOUC
Subject: [meta-multimedia PATCH 4/6] gupnp-dlna: add 0.9.2
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
X-List-Received-Date: Thu, 20 Dec 2012 13:09:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb   |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
new file mode 100644
index 0000000..1748e35
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
@@ -0,0 +1,18 @@
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
+# The GStreamer metadata backend requires GStreamer 1.0, so skip this until we
+# have that packaged.
+EXTRA_OECONF = "--disable-gstreamer-metadata-backend"
+
+FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
-- 
1.7.10



