Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B51907FA10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w9so8057070wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BUDU3IxOJbkhCNJoPSMm2YmOxcNP/bY/sb+6/JS42Gg=;
	b=GgzutxUoVb+zF7TPqgsw5Dky7WFx82huf6hK6CcP8n75fbXA2f6HHEGUJgu2+NMR6s
	ZTnk9HHIHU2dtxtDXwCGF0juPXDue2uBo7M7YZcb/OxdI9vS5L3WEZPVQnfmL61FulqV
	+1X7NgG5UxghQCSHDmR9VjSvcojyd5NeaYCDdqDtu/Cd8TCQ2SlYiAXeHGpC47wpK+UN
	LM9IgjuIiqmfmAKF2zW177anpLL1KIPSGtf08Oyv8MnuYlljy7TvOJ2ELSwbT/IUN75E
	oEaiwmUZKJrU6Ms5R1ZuTPAdmd24VDl9s5zZppGiqvlGeDSdHZeJJdBgXn5PcSpKlPY+
	M4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BUDU3IxOJbkhCNJoPSMm2YmOxcNP/bY/sb+6/JS42Gg=;
	b=c/kOhD4pTbb0imWUaRfr03dcy2M/MfeIiQiP9jOqEe6CmleOjd9oOli9SPGHlNOp1W
	4KtPRgdAu97ACfYATjaeR1y4pFThj+WKOX+hqx8zlpfJ0ep6t02Vws9MP/ImnK6tZyDI
	vc3OXpjqyWz5rUjjCacGNdc2H8p3nxgRUeQBeqdzdb7nw17A6LGsO+M5238l78QJWTSL
	2vGlov0LhEPalroZYjfUfvIu1IctBEeGESiOcjjJKhOR7GP2z6u7GwGd1z82JThgvIHs
	UzTaJqR+C/HJvkaD/Ije8mLRx0AYsP2XETiWzSA+kZctsZDNwv/eIqlYd5xA+XfDEVYF
	wyWQ==
X-Gm-Message-State: APjAAAUeR9FYtRjZlYQJV2YR3H43iIOLE/m6KAhz0idbc9z+Fhsb7/fi
	WzPGazuBSy+jEHErkJrwr8m6O6Qg
X-Google-Smtp-Source: APXvYqwSAZ7SgjD8+2/Wb0Dv1ARTVTd3j8P0n0qf0ZMxA8xI4HsQYnhOJ/R/YWkUju5m9AE0in/weQ==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr10614807wrr.50.1573760984178; 
	Thu, 14 Nov 2019 11:49:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:19 +0100
Message-Id: <20191114194930.2786-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/16] gnome-terminal: re-add 3.34.2
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-terminal/gnome-terminal_3.34.2.bb   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
new file mode 100644
index 000000000..d688176d5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.34.2.bb
@@ -0,0 +1,36 @@
+SUMMARY = "GNOME terminal"
+LICENSE = "GPLv3 & GFDL-1.3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+    file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 \
+"
+
+inherit gnomebase gnome-help gettext itstool upstream-version-is-even
+
+DEPENDS = " \
+    glib-2.0-native \
+    intltool-native \
+    yelp-tools-native \
+    desktop-file-utils-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    vte \
+    dconf \
+    libpcre2 \
+"
+
+SRC_URI[archive.md5sum] = "13fa9f5f459481c7f05b6964c470ef16"
+SRC_URI[archive.sha256sum] = "3bd723f4058ec014da4715db4181b7d73eccc797b85ad5e6236996951c01803d"
+
+EXTRA_OECONF += " \
+    --disable-search-provider \
+    --without-nautilus-extension \
+"
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${datadir}/dbus-1 \
+    ${systemd_user_unitdir} \
+"
+
+RRECOMMENDS_${PN} += "vte-prompt gsettings-desktop-schemas"
-- 
2.21.0


