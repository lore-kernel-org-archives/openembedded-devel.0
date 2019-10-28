Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C93B7FA90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:53:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e11so10222820wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dP2dbtZez5nqPpDcxUQiB2XhFIN+WyfgeSla1xSbWuU=;
	b=s24GgsDDRDv4YKWoHy3fJrvlFDm8wT5txiLxqHpC8OtR0n0w52f4rCFXI+ckxswIMH
	Z7CbV7c1lhNqTkiVEMNWtJ53eLmjHl6qI7rQeqElbJpBrfOZ56Yd4Mg/3XHH9kO9YcJW
	P9eSiXWMcniwjvPvrbjYHAR4p5nrPkBwd1jUVtn9+r2q/ODy8hRPsyUEA8D2hxqlTrXU
	9asHdjkDujq2f/gq+KhgldFeP0t0T6MKBNFnfw8NZYPRRvF4JmcdzoRgimH617Oj8Bma
	VhtVczXqLEm6T4YufBOH0vqprxiPo0qblfF40EXIb8C/J5WXhPX82U/odj7kjW2ZwL7O
	6gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dP2dbtZez5nqPpDcxUQiB2XhFIN+WyfgeSla1xSbWuU=;
	b=YO//Xen+9kTaHAfRQBZIJAN5J34YhksICFEZbsFcWw0EvQCWkcc48fmLrpqSMOWRnf
	a7QLFy/gQ1IDLUOSRcoA6e+GljY4Y0Sb+0Sibhsj/aFCJDxbag6LpP6dFw9g+T33t3Nq
	IweyN7tptmJI4lUFSbaFzX/jITK3IcNdVLSbS/KRihbc8KnD8GbKdmdx8BLUG8wyla8i
	HTvO4czNtTJp1WHpkNatg9rzMR1EH2YtYWCQW0b83xHVTZ26buPqb5uhFlN36GYIxg+s
	DqCWjwBjqlaAUF8TpybqylTW02UMZ60zQ9/UTy9k58LWsAwvMNxTDSbLOWgLkODgx+UW
	y4/Q==
X-Gm-Message-State: APjAAAX/AUbrlzDX0OMRV1AOFofjX4CJxdb2/KP2Kz0J1a3WCNPYjGB+
	AYm//2/VuQ3LTtiMCY3cfyWOSzw2
X-Google-Smtp-Source: APXvYqwiaoJC+mXYlZ7GR0fU++Uvftr1W+9sKltx+JvNE1RLvjxwGKh7CHvzO6TuROtryLwDcORZQQ==
X-Received: by 2002:adf:d183:: with SMTP id v3mr10817668wrc.316.1572274436743; 
	Mon, 28 Oct 2019 07:53:56 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	o22sm2427655wmc.41.2019.10.28.07.53.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:53:55 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:53:49 +0000
Message-Id: <20191028145350.6606-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028145350.6606-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
	<20191028145350.6606-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/4] dbus-broker: build with SELinux if it's enabled via DISTRO_FEATURES
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
X-List-Received-Date: Mon, 28 Oct 2019 14:53:56 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: no changes

 meta-oe/recipes-core/dbus/dbus-broker_21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 425485a8b..a2cb85f8b 100644
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


