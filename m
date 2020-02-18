Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1588E615B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:47 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m7so361354pjs.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WTM8nSEie/0iq8bdoD82O3U8VKoiBBlL4Z3ogmt4QXA=;
	b=mysn4f74otCtUjVGh0gnsDDoO6Y43o57gj2JVrFNj8wU45dHmLMehCSxfDspUbFsmX
	dwb0ZKlftdAVR9w8F7aY0lnKP/PEmbpZrwcIf3mGOh2nfKhPQMGoEjaFW/YgnPaFzLby
	QWbVy/JW9EVPSSKMAsonWsm7hsNaoH8my2VtOjCdCw3BVDbLuhK9bEOr5D1CMMgROs2G
	/sWojrGkW0XU+XvAUPbuawyAxm7uHhPsDWGccJJ51l1pTTinhR/HjOF2SZJ8DDqeQWNI
	lUovrrWpgjLWkgsYOx3rP10XkH9m4RJk1PPo7ggKof5KlRAkoBVMx/MV1IBSB5xzfj7A
	/vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WTM8nSEie/0iq8bdoD82O3U8VKoiBBlL4Z3ogmt4QXA=;
	b=N17fsfBZefHE+dMQfau/0Q181vkiH/8Qw2P1EsqGD6RkXBpWGUeCbkQg6TqAjo4ujl
	S3b9dYNK57OMaTo8vjVD3GiPnJ8hyF3ZMyQtWJU+JnymgSuTvvyo6V5npE0LBZV0QEA1
	Mfqb6d3ncCHCFvdEvVKXFTM3BdE2bVnrmvholmglderZ3S/Q79sSju/F3Or/fRxGbbVU
	4PnlWzqO3WMe+l+9M0pupIrTMiRt3SNsiHmIVzwEOgrSOCFlDHdSEWofhv15LVY/CmUb
	jmOjADKVx7VIY2NfrbDMpj40pKBpwYvcCFy3j0UDogTkg6J8TlBPgonIWB+fM2WN/Vpo
	K8VQ==
X-Gm-Message-State: APjAAAXsEplQU5hxpJz5Eh9DwkmpmVMMuxOEWaQ/zqkoJlWkEGVNWZze
	76gtcL0AU04+g1b8hi43NekZStUSXGk=
X-Google-Smtp-Source: APXvYqwSarY2zoLmFY0k9i4BYUPHHpjnnzmAmXiVCOzELUqz4ZlIxlEQ9QSz/5M/YhjIjmQidkGOiw==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
	i7mr18954107plt.66.1582007028802; 
	Mon, 17 Feb 2020 22:23:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:46 -0800
Message-Id: <20200218062348.3742529-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 6/8] gupnp-tools: Upgrade to 0.10.0
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing dep on glib-2.0-native
inherit gtk-icon-cache
Convert to use meson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gupnp/gupnp-tools_0.10.0.bb                     | 13 +++++++++++++
 .../gupnp/gupnp-tools_0.8.13.bb                     | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.0.bb
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.0.bb
new file mode 100644
index 0000000000..bf84e7b73c
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Tools for GUPnP"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://src/network-light/main.c;beginline=1;endline=21;md5=2c39b3a000495dabd4932f231c7efed8"
+DEPENDS = "gupnp gupnp-av gtk+3 glib-2.0-native intltool-native"
+RRECOMMENDS_${PN} = "adwaita-icon-theme"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "8c66d4aca756478615761a26ed7c8dba"
+SRC_URI[sha256sum] = "41da7ff5ba8e2425adcb64ca5e04c81f57ca20ec6fdb84923939fdad42c6a18d"
+inherit features_check meson pkgconfig gettext gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
deleted file mode 100644
index 7a6b872f11..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Tools for GUPnP"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/network-light/main.c;beginline=1;endline=21;md5=2c39b3a000495dabd4932f231c7efed8"
-DEPENDS = "gupnp gupnp-av gtk+3 intltool-native"
-RRECOMMENDS_${PN} = "adwaita-icon-theme"
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "212d85ebce89b32468b59e1164050d40"
-SRC_URI[sha256sum] = "aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed"
-inherit features_check autotools pkgconfig gettext
-
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1


