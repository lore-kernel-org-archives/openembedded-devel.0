Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm398-0002Jx-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:19 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:44:40 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so4075503fav.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=CnXE6vCIywt0tZE2me+9uQR+eZqOXxfTAUJ0wPgYExg=;
	b=Y1nFkj8MK+ZVG3LHT/a/7iCJ3g6nkG2NEeRQZ3IOx+4qg2YrqQ8uZUD+n+3skbIDOz
	aoZFGCIU8J+xecAxI6yexyjw+JdS8tZlwlB811yuKacphxTMwyLZ/vdtjPsadeBvmbhT
	ZrriEMWFFebG++KvB5DPMmqPNLZZLEtdzYFe6LQu1rDc56N85umGcIE3+EgZhdIqUdI2
	CnwpHwQuOPCJgrf7HMAtKohqWExcmw7Bq/SlDCsZvlkntx4ZrGymnscJLqSxniJTvbcD
	27hLKMewa3oGVViCL3iCfjch8CkdxdaPYU1h6Yp7qob5nT5/FzZGFxzluyQaJt0Aeg4C
	B/4A==
X-Received: by 10.194.19.170 with SMTP id g10mr23779113wje.56.1356097532465;
	Fri, 21 Dec 2012 05:45:32 -0800 (PST)
X-Received: by 10.194.19.170 with SMTP id g10mr23779105wje.56.1356097532386;
	Fri, 21 Dec 2012 05:45:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:41 +0000
Message-Id: <1356097422-11920-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn9BgSVtxEudaHKRT2zA0MoVQdq9rXoEvaofiRC7m76ZrFxYelnjHgEDT+RHZbfcZ1MNyw7LlgOWn4gNFR6KJudbsTT8xezfznpyFEHppAXQPT9yWHOxX9OmPjyxygXjU5GQ0CsEf6ulp3e3/eShFCnWz+N7Ca8B5o92QfmFUvyloVTLf7GsDSVldlvTd1MjSDJrtXO
Subject: [meta-multimedia PATCH V2 5/6] gupnp-igd: add 0.2.2
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
X-List-Received-Date: Fri, 21 Dec 2012 14:00:19 -0000

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



