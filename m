Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D470171BB7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:24:42 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 3so7337019pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YnueuDefm7eQSKnVtYjzcZrj5kFB6qlD79rAi4c6L9s=;
	b=qrdxgmIqOcRDi5nQDyvYdGlx3kvlcHaT0dpxoduoZyYzTknf09LfX+P3weLpCTk6M0
	YiEWbJ5MAuD8xiibhYywF+9BmNKxNSMbCYRkEbdQ1DqnF04uywJJ+wFby0NMbPvAsS2Y
	47I0e/3Ypfxjxt4zHRxkPQo+kGT4m5qw38Gjz5zDcbk6PyGDmY0oLxR+noZ6m4E1cuo/
	OHDj3nzxmwRCiBJItBrCDhzKGzRkOtI+bXLWxl+pij2V6xxm0DtXpfPOLPMOT41dBGj3
	PJc/Nl62t42PlB97r9PcyvODyXkf/PPm5SMJD2Xlwn0HzEs9K2UEkZLHO8Ew9cGoMGXN
	iTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YnueuDefm7eQSKnVtYjzcZrj5kFB6qlD79rAi4c6L9s=;
	b=RhPW6+W01qQjCedsJEQOCOIc/2pZwHUtlnWFc6O+Jrdb8hP/gajs9K9HiPaiQPzIiF
	Ohm9DW+CXbkkbYZW+hDfE6hWy9krv91VcFEjExOkxaiKWBdnAGhg5gGMJRmhtGHO1a63
	ja4E/D7H8rcOK1xpg0ZteGYM13nevdxAmR+jkxtp90S0suGFecMY0+rtoBBPznthB/UN
	avdueMp2GgEhH93zskhBgmiXRnX9vwEF4hcRuaFG/rqoJKDPvzg95yFb7rrFD4wOBdzj
	JUlfFFrQpBUYibWXpik9fUZbDSI7DVco5Pvj3cysTkqmFtBBXqQjfoE2vCe2GyNnyp92
	rN5w==
X-Gm-Message-State: AKaTC02+hhMfe9Fu8habmBjWrZB+boXT8fzdHtaMyMRVelypqF8/JdEAjHvE3DYGfm7wfA==
X-Received: by 10.98.0.143 with SMTP id 137mr11654708pfa.183.1480141484390;
	Fri, 25 Nov 2016 22:24:44 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53946299pgp.10.2016.11.25.22.24.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:24:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 22:24:34 -0800
Message-Id: <20161126062435.27569-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161126062435.27569-1-raj.khem@gmail.com>
References: <20161126062435.27569-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V3 3/4] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Sat, 26 Nov 2016 06:24:43 -0000

* Add packageconfig for krb5
* Require pam in distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/dante/dante_1.4.1.bb         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/dante/dante_1.4.1.bb

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
new file mode 100644
index 0000000..0fb0f67
--- /dev/null
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
@@ -0,0 +1,49 @@
+SECTION = "console/utils"
+SUMMARY = "A free SOCKS server"
+DESCRIPTION = "Dante consists of a SOCKS server and a SOCKS client,\
+implementing RFC 1928 and related standards. It is a flexible product\
+that can be used to provide convenient and secure network\
+connectivity. Once installed, Dante can in most cases be made\
+transparent to clients, providing functionality somewhat similar to\
+what could be described as a non-transparent Layer 4 router."
+HOMEPAGE = "http://www.inet.no/dante/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed973467249"
+
+SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
+SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
+
+# without --without-gssapi, config.log will contain reference to /usr/lib
+# as a consequence of GSSAPI path being set to /usr by default.
+# --with-gssapi-path=PATH specify gssapi path
+# --without-gssapi        disable gssapi support
+# --enable-release        build prerelease as full release
+EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
+
+DEPENDS += "flex-native bison-native libpam"
+
+inherit autotools-brokensep
+
+REQUIRED_DISTRO_FEATURES = "pam"
+
+EXTRA_AUTORECONF = "-I ${S}"
+
+PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
+PACKAGECONFIG[krb5] = ",--disable-krb5,krb5"
+
+PACKAGECONFIG ??= ""
+
+do_install_append() {
+    install -d ${D}${sysconfdir}
+    cp ${S}/example/sock[sd].conf ${D}${sysconfdir}
+}
+
+PACKAGES =+ "${PN}-sockd ${PN}-libdsocks "
+
+FILES_${PN}-libdsocks = "${libdir}/libdsocks.so"
+FILES_${PN}-sockd = "${bindir}/sockd ${sysconfdir}/sockd.conf"
+
+INSANE_SKIP_${PN}-libdsocks = "dev-elf"
-- 
2.10.2


