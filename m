Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A29347F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a15so8009094wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WPhF4Uz1GMKJUQPbSMAlNnIAO6qJWyrGI5FXexHShv8=;
	b=FDhdLrwzo6GGFi53kNLWlwMshHPJnNTxVlGiXajWROyFGd874dWUryF6b4rcyDbb1f
	9vsqdCM9DMeSX3HQ6/NtYEOvjX7KMH6VXMkfc7zF9jXQNm+jeI5aOxWRvuaxy7IJYmlU
	QgWv/0CiUL/YdwqtKCxCaamMxoMIkFbg0CkUCxSA5VG1hcgYmF3jfbSOFKubhk2vPB8f
	ZbyK8GqvxKoQPcy9qA5gPFWE1Q11D8N9gPhZg57CeRumOvfHVio1as5nbMNwriSTzqRd
	fCmdKcrQ29Nfe3M5fdF7p3iYv2KN5HquY0OWGNAw+j2QsEDXTuwTbYEMLkOzl4z3Evls
	VlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WPhF4Uz1GMKJUQPbSMAlNnIAO6qJWyrGI5FXexHShv8=;
	b=E+Z7vCvWA+1lmVNn4TZAAab9UQIF/rodUq2PBh4O8Hy3BCUgjN1Q52uAwMxXkVNRJa
	GLna47agxTTUo3jHdb7A6nB82bqsGRs/DcJ4D2yTk7s6m/3IJIAgLy/jFsMKAaBS3eCR
	7AurQhsDmDHrbuNnzpuKrljo/tFI3eEVD0T7urZww+2b1ft3e9KLRBCCDXI5VLYweVr6
	E6DnPCTkEcJttuJezsZQWrA8yj7ee95LdmkV/68sCDUMheqA8954ozGBRuL0RoOvWEQn
	iTC6E7+lGD9b51feVzActoWw3HnnOgCF7SzigVeVIYVJcz7widXJ2qr9fjtpVsvGOU4T
	fsjg==
X-Gm-Message-State: APjAAAXsROvyc118AgKbctJl1dIKwyZR+i59b9HvcVLh43/KxMh7lsyw
	0OJZ3e3LOf5LWWaQuSngN1JBGzCs
X-Google-Smtp-Source: APXvYqxE+wijJV1CUXLn31lngXu9qjDbNEUbzi81yb0ShRiKJ6hh1Qh17GmTFAPeiKE2aOjVyMpLAg==
X-Received: by 2002:adf:df09:: with SMTP id y9mr10622653wrl.25.1573760985032; 
	Thu, 14 Nov 2019 11:49:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:20 +0100
Message-Id: <20191114194930.2786-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/16] gnome-font-viewer: initial add 3.34.0
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-font-viewer_3.34.0.bb               | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
new file mode 100644
index 000000000..95140ff88
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_3.34.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "GNOME bluetooth manager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SECTION = "x11/gnome"
+
+DEPENDS = " \
+    gtk+3 \
+    gnome-desktop3 \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-icon-cache gettext distro_features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "76004a8986ea622b09c408b01a6f42e5"
+SRC_URI[archive.sha256sum] = "aa6f0583e5f93aec095e537f0638b29de3d02491f0131ef584a7c55d39d6b98b"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${datadir}/thumbnailers \
+"
-- 
2.21.0


