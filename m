Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsI-0004Rt-Cm
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:22 +0100
Received: from mail-wi0-f200.google.com ([209.85.212.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:37 -0800
Received: by mail-wi0-f200.google.com with SMTP id hn14so2768736wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=CnXE6vCIywt0tZE2me+9uQR+eZqOXxfTAUJ0wPgYExg=;
	b=Rm3i0rLcGk+A4zsNN90TWp3PDWHRmf7c0C7iWjJd2P5O4c5KAi+WanDXJa+SuxIHwD
	7waGlIsXp1yrl7yf8Zdahepo/+WAsPS2OaWYBBOc2RM3aByGzOP2AJNwju6MlcWweiJM
	RqxdYsacdszlFhe8KBMiJ9BhlmLcrOb7PocGKxYy96N9SCEMISHwoMTKO5kmkZddNl00
	PvJfZm9+K5yOknCfuG+U18p9UByHOvKxl4ljo4xlemWaoVzQVBDnEMMi8PzUohIUNV6S
	Udt5tdIBdNQ2R1mF8UFw2KpwUNp9Hkd7kw9Y57Mdcgh2ITEGn0bgw+8w4/OfTUDL5sKU
	zJdw==
X-Received: by 10.180.14.2 with SMTP id l2mr17370488wic.2.1356008076212;
	Thu, 20 Dec 2012 04:54:36 -0800 (PST)
X-Received: by 10.180.14.2 with SMTP id l2mr17370481wic.2.1356008076139;
	Thu, 20 Dec 2012 04:54:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:42 +0000
Message-Id: <1356007963-12208-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkQsCS0iC+F7BQYWnCJlzKaYL+LwbH3c58zRJ+AOqnON6c1gn3+JnZer0fdNOVl1mAV887BoRGFo8tBT4ee3vDsYzYvWKEBKn4jmHsTjzWB4BCzyS7OtPUX/O+wLMnoQa0aPKI56krRHyygVcyhx72r728SiLzIAyP4s3rMIemeLggboZka0MR2FgvMMGqfQ40sUCj3
Subject: [meta-multimedia PATCH 5/6] gupnp-igd: add 0.2.2
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
 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb        |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
new file mode 100644
index 0000000..112bc4b
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Helpers for interacting with Internet Gateway Devices over UPnP"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://libgupnp-igd/gupnp-simple-igd.c;beginline=1;endline=21;md5=aa292c0d9390463a6e1055dc5fc68e80"
+
+DEPENDS = "glib-2.0 gupnp"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.2/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "f881323304185c02634034e3bda714ba"
+SRC_URI[sha256sum] = "73b6a98a0f13b29b34c3bfc07f99f78b1319211cb95a8585752873af2b9067d3"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-introspection --disable-python"
-- 
1.7.10



