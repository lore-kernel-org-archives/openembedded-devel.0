Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlfsH-0004Rx-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:09:22 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:54:35 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so2768439fav.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=aG4gRqYzTJt324cI91hotpqvyy6S75UuWSJzYKSKusg=;
	b=GIsUYHTPjemEy3kMnjkXhbtwN7lJYMQg7liUPOabPMCSZnbbJFTSE7WExWzEE49yOq
	RDsQLrM01x0uaqrd3UlJRq5PoQg3Ae6wtXepNaf3ZqbX7csEZYorF9FKLmN0ZWLiG8Uv
	GYcimCQR8YkwVev9APcW6mfhSZUkkSRFRKh/z7RcM1IoKQQB0Aa30tzi+GAB5G7CpPlu
	8HUruZ+gASib+dGkQuOuOLTN9GG6EQnudF6UiGLE40ussbrUINBoLBjYKEYHVEjKhfKf
	7o9C/l9utcit6usFG6OHGDNzh0NLPT7Z4uDRM3EeEAb1mC6zQ0Jv+pcHJO5gH7VjByiq
	6RDg==
X-Received: by 10.194.177.199 with SMTP id cs7mr17399268wjc.41.1356008073202; 
	Thu, 20 Dec 2012 04:54:33 -0800 (PST)
X-Received: by 10.194.177.199 with SMTP id cs7mr17399239wjc.41.1356008072976; 
	Thu, 20 Dec 2012 04:54:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm12973656wib.8.2012.12.20.04.54.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 04:54:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Dec 2012 12:52:40 +0000
Message-Id: <1356007963-12208-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
References: <1356007963-12208-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkWwCi4ULeZkAXnVBQ/gbpiH+drCT2/bsxQIeIuloRjIOSRG1ihr07Rsw1ERfMniauql+RodPwBsuZInlyxNYdwzGTcXyps9SjJCyd7a9UkTAKK+pr7LOtX4cBicwV0VA/Q1l2C512X+VWLBRla1HwiwgSdmzZM17niNdEkvfrWhLInQzlJmTmwAIfDPx1Ly07t/9FO
Subject: [meta-multimedia PATCH 3/6] gupnp-av: add 0.10.3 and 0.11.6
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
X-List-Received-Date: Thu, 20 Dec 2012 13:09:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc      |    6 ++++++
 .../recipes-connectivity/gupnp/gupnp-av_0.10.3.bb            |    8 ++++++++
 .../recipes-connectivity/gupnp/gupnp-av_0.11.6.bb            |   10 ++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.10.3.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.11.6.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
new file mode 100644
index 0000000..32cef94
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av.inc
@@ -0,0 +1,6 @@
+SUMMARY = "Helpers for AV applications using UPnP"
+DESCRIPTION = "GUPnP-AV is a collection of helpers for building AV (audio/video) applications using GUPnP."
+LICENSE = "LGPLv2"
+DEPENDS = "gupnp"
+
+inherit autotools pkgconfig
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



