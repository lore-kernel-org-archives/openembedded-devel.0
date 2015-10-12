Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id EE43C766DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:40:02 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so46808287wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MiVLPG8tvJfS1HJwk6mNzwaaf77HZI1oPyZn/L4co/4=;
	b=khE2+h4erp2gcsmagaPpbUzDbByvGkgVSAyvNXg6XMWqmh40Kl7yH5oWEeSN++R6mh
	iO2fXCw3nOax6tqAQBQ1PngOxpxjbf/2ZZCAs/1Tws1j9CXcCChhURJ1TzBUq3E3gDSs
	+C2Eql83rqLj7YHEynyVLtkOT7f8GQ/D/ldqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=MiVLPG8tvJfS1HJwk6mNzwaaf77HZI1oPyZn/L4co/4=;
	b=cWUVwmPdhG5soeCUbhi4Tp+fai3jJmaCEk/vazR6xzeZq1Bgp6M2xSJyaE8C4zUdbr
	YLvngUVNoyFZC0Tg8VgTg29UX7JxCrZChR46SZ9mJUnscQnv/dHRPPCP8hYeAw71HvTF
	wT9nntbZ2iBNNGhAs2Yq2uIan+Ky0GOkPJ3W2e1sjTAgmMST7AADT3wPwzk84KWPSD7b
	qET3Io7ljLM9qoSjN8lskOlSE1G1lv/N5sr1+WAsmOos6VZ9WM2p2BGElNBL7JQzx1aM
	/AvRV9opNQoQDBMaIiAlBSNxiLQmvUi9eKFm6kCCADkN2H7IQ8DOCnAuQIA1rtiVVweU
	aaTg==
X-Gm-Message-State: ALoCoQkSFpfuovKKixXKEykrsCOqbxRX0pn+SMD2kjGCbNyUug5fg562U6Ca6rEZOSrBtSJFn9WO
X-Received: by 10.194.22.69 with SMTP id b5mr28737619wjf.157.1444650002777;
	Mon, 12 Oct 2015 04:40:02 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	uq5sm19376917wjc.3.2015.10.12.04.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 04:40:02 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:39:31 +0200
Message-Id: <1444649971-15031-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 3/4][meta-multimedia] media-service-upnp: Update to 0.5.0
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
X-List-Received-Date: Mon, 12 Oct 2015 11:40:03 -0000

Update to latest version (requires gupnp-dlna 0.9.4).

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../dleyna/media-service-upnp_0.4.0.bb             | 24 ----------------------
 .../dleyna/media-service-upnp_0.5.0.bb             | 24 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
deleted file mode 100644
index 871eb6a..0000000
--- a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.4.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "discover, browse and search UPNP/DLNA media servers"
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/media-service-upnp.c;beginline=1;endline=21;md5=584eb103b4f6f3432c43d169b6a123a1"
-
-DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
-
-SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "1996ecbe4a06c95d22f7d958e32e3d28f7a4a2e9"
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    install -d ${D}${bindir}
-    install -m 0755 dms-info ${D}${bindir}
-}
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-FILES_${PN}-tests = "${bindir}/dms-info"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb
new file mode 100644
index 0000000..baaf42b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/media-service-upnp_0.5.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "discover, browse and search UPNP/DLNA media servers"
+HOMEPAGE = "https://01.org/dleyna/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/media-service-upnp.c;beginline=1;endline=21;md5=584eb103b4f6f3432c43d169b6a123a1"
+
+DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
+
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "0dbc74a79aa07a8f8c7d32e1d2de6c4d3a0f95bc"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 0755 dms-info ${D}${bindir}
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service"
+FILES_${PN}-tests = "${bindir}/dms-info"
-- 
1.8.3.1


