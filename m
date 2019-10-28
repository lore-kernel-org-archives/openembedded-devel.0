Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 417FA7FAA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:58:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v9so10236157wrq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n/uuFKRDdNKA/QeyAuxP8NnYTZTPBrXSfsWeeEA991c=;
	b=GnVDqSwrGP69Hn2/AYhWPA6DKgFxMB1Ag844j1ReW6XoGyskMASqF1jdJCjOfQZsBL
	hFgZLUSpVNCEq9rQKXn/Q3m3UJkmWVFlZFCusP+bqE2e+Qd5QiuLrCHfDVKCkxwsElzI
	77UmjEvVkGZvxUHp6Niv6KSaI2xn736ZzPE1H8tKW4IUVnufDiqceCFtHymoPAJmUdAo
	dGtZ+Q0LG3L/BpVdakcR6JtGz1vCDNYLc7RV/SOP2w9x55x+RdbWYpHU2RTIoUWnkMxH
	gGwTwmMqOyCW2JFoGnZNfHRJFOppPtkmOWbSauvOAZflnHBwuBj56CvBrVKx1iCywzVS
	yfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n/uuFKRDdNKA/QeyAuxP8NnYTZTPBrXSfsWeeEA991c=;
	b=sujjtLZ3EqVAnfvVBG0dXCLZs4iTg/JckPpv9cIC3SZAE9fD65dLw+HLMrRgdnXLTo
	0YbLykEoQoSnX4AjMlY0mEKHj2diCTFSQEqBGRbPmxLv/70oyM1nLmRMHuITrY0J4/YH
	yZOkz/9hW7CRVD5aFN1pvL94+FxNB6Y5BKB8/0pQMtFFIXNtFu6/kkoexiOSbl5Auu0t
	KMp5d1Jxs9Jnr6fsE3+y8G+vJ+dt2T7HyDKRT+uMbNK5AExM14+8PoPpBdE2HhKQ/2A6
	MAoooyyfqz/El9mqwC0WpWg9pOZbApLhmPMEZZjRh5tT/A0sGlvpFbwym5cO/h4DXfs+
	pQPA==
X-Gm-Message-State: APjAAAUWniXlpDsWsPCTpArOAN03J+q9ANp2uwutKIqkWMZiWHq97DX4
	bi2zOTOBgFyyGhEyOJjRe78V+WPF
X-Google-Smtp-Source: APXvYqz2zt25no8tX7IGlYfsNaytSSQ/roLr8sd0qNG6ZLwnHjIMQZUipvYkzg/F54q6rDlUtp0WJA==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr15474166wrp.123.1572274709591;
	Mon, 28 Oct 2019 07:58:29 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	s12sm4845513wme.20.2019.10.28.07.58.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:58:28 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:58:22 +0000
Message-Id: <20191028145823.7462-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028145823.7462-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<20191028145823.7462-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 3/4] dbus-broker: build with SELinux if it's enabled via DISTRO_FEATURES
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
X-List-Received-Date: Mon, 28 Oct 2019 14:58:29 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: no changes
v3: no changes

 meta-oe/recipes-core/dbus/dbus-broker_21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index b1633e16b..c509ff6f2 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f6
 inherit meson pkgconfig systemd distro_features_check
 
 DEPENDS = "expat systemd"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -24,3 +25,5 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
 FILES_${PN} += "${libdir}/systemd/catalog"
+
+EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-- 
2.20.1


