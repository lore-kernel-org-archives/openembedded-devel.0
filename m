Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 084197F8AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v9so1050079wrq.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7cpaV3lPtmk97+BL9AMYzvT4+/I6h39Fdscupb0iAZU=;
	b=fqLDh9zFM04YJ6lp6pg/67sxsGg9AtZbGYuuzoN4RL9SHhrF9foLMS5H/+Gwm5h914
	YaS1POV7myzKOwsOt14uyfIN1/KY8Jb3pl6o9JJjh+rlO2qGqMUCkxu62YLsy/+oLSFj
	Pc3mqNZ6t34d/7G3wXQ+5B5jPZoCJ7FaQbTOqjCHULECiLVO/O5e/YNC+cN/CmC2a4fZ
	9hNuppW2BIITui9sWOxywvQJL2zF8s/B1u0BOUIBOR/dTk3eZAMGW4F2nABoEvDu9NgC
	LqCD3ywste3sefVRZbO054uCgdqzUAmWiVvWA0eVtSPW2b8VP7cD1VCbK4iZHfGdqQkW
	PIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7cpaV3lPtmk97+BL9AMYzvT4+/I6h39Fdscupb0iAZU=;
	b=AUnvt/MetHVfeuzmVf/lV/dW8IgSAQQ07C76gQJJyFZ4chLVkmMopmc+hK8AzfXmFe
	tyg09Ts2K6ik7op71a40Y80QMX/UypuskwzWIDEVhhCyEUr3VTx7aB3rgpa0rerJ7LlE
	ffliMZLnuRsLepb6cALjRpS4p0tiNNYvNvl4LE1J4PbiKv44wX3hhU1YPYeJ9ay63rjt
	qTrT6qseh55d7fjJ+Abh6o4xKNGEls9iTKWhYxdudCbR6EtrdU1XJgmH7FGZxKHTj+wx
	igsa/eNcGGBGximuT4+qDbTEYSFoZijSrwgJSF1JUDhPM35QOAaiK+SCYM48romX1oFV
	47Hg==
X-Gm-Message-State: APjAAAV6IzkqfkrhpoHm6KHAdqvUpjixPCLDNdbPlliFV2A5n/e++Wm8
	ldy3fqx8oEdNvZzPIcr7y/BtScr5
X-Google-Smtp-Source: APXvYqyOZXCTp5tzpQteQKq0kdDC7yoMziPiTM1CMc+gg6sNKSnOZ46lquXRpx//ftRIQ2qBJZUVuQ==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr1391318wrq.208.1571988093476; 
	Fri, 25 Oct 2019 00:21:33 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:06 +0200
Message-Id: <20191025072113.11172-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] yelp: initial add 3.34.0
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
new file mode 100644
index 000000000..13c4e52bf
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Help browser for the GNOME desktop"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
+"
+
+inherit gnomebase autotools-brokensep gsettings gettext gtk-doc
+
+SRC_URI[archive.md5sum] = "776e29bd16424c8712cbf340cfe6429b"
+SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513bd0be77a7bd045"
+
+DEPENDS += " \
+    libxml2-native \
+    glib-2.0-native \
+    itstool-native \
+    gtk+3 \
+    appstream-glib \
+    libxslt \
+    sqlite3 \
+    webkitgtk \
+    yelp-xsl \
+"
+
+do_configure_prepend() {
+    export ITSTOOL=${STAGING_BINDIR_NATIVE}/itstool
+}
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${datadir}/yelp-xsl \
+"
+
+RDEPENDS_${PN} += "yelp-xsl"
-- 
2.21.0


