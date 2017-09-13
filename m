Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0536E668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:21:29 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g206so8163373wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Oqdsfrmt7eiGRT2QNlTeJW6CsvLunS0ZthLq8Y2eGiY=;
	b=JYklFpF6uW7s/t/aGMo/wv1i5npe5pcZpCBf83IJnUvZ4NMthF7Mjb+q5rgASlTjZ/
	4bAsLox/g78MK0oHSovpnFqDVnUnuWKVH42HA17wwJrocbTcwGdH+gfhHqdyN1/AJ4D3
	LY7yBM56SOsQu1/t3oVk5QiEG2FIuI3n3PVztDEJjMf6GnUiDtzscV/QhCqNooflNB/R
	4zDnb2uq/I87firYTL5g+Ij4nhDOGLd8N5gnCau7oNr01sU+6t+Nb6dJH/2WZBX2jyf5
	B9nIpWxziAJh9N96uThSKlmlR/5AAUtXp2gbZmbiHYDqLB3vCWSdHSWtQaWu/7bB0Qyp
	GjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Oqdsfrmt7eiGRT2QNlTeJW6CsvLunS0ZthLq8Y2eGiY=;
	b=PY/ZEqo4bitnBp1SGx9Uyq9wCvWOXNxxr9NOCfJSJdti/U62plL2NF5n2+4tOwbizk
	11WapCleLpAXp2WgMTutLtOK4A1Nub7X5z/JhFc929DLw0UsGqVPGwLhQqYfUqaY2V+r
	JQihncBu7d5ugtmPp3QXNszZKy5UH2rc+xp7aERSZafq7Mr7R+kXRLdPEy+gi8LnLiNc
	w6bLYPQ4yQWgeFwqWJ3aqYgAgX0qMTviWLFQVNQGsyhGo7IYaixn5CRzcDpcn1hk6Sda
	nIoaLsdHFZ+WmsA4wiTIUiAMk6hiDsuVSwkZnCw34J6fUfL+0ZQKddo9a6/zLIkmusRx
	DNSw==
X-Gm-Message-State: AHPjjUhQmHymjLdFBvZMoqiMFtDOZAZTSYVjV92cokMEGrhWqfFG/xNb
	NIGZBsShKRmLkDvv
X-Google-Smtp-Source: AOwi7QBjAMQfTlGv63bg3FcpXb4SsI9lGETFFi+p/6HzQdRlPnLy4syVSH64Kob+qfhDzKJdZtn6Vw==
X-Received: by 10.28.127.4 with SMTP id a4mr2958188wmd.12.1505312490731;
	Wed, 13 Sep 2017 07:21:30 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id p15sm1603618wmi.2.2017.09.13.07.21.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 07:21:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 16:23:47 +0200
Message-Id: <20170913142347.23495-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <CA+chaQdHXzf+u5dAjWXsUU_wBf+hG6hi+VsOKosF+AEHb1kXMg@mail.gmail.com>
References: <CA+chaQdHXzf+u5dAjWXsUU_wBf+hG6hi+VsOKosF+AEHb1kXMg@mail.gmail.com>
Subject: [meta-multimedia][PATCH] Revert "gerbera: Add recipe"
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
X-List-Received-Date: Wed, 13 Sep 2017 14:21:30 -0000

* depends on newer libupnp which wasn't merged yet, because it breaks
  mpd

This reverts commit e890ecb1d2bb4f2d23f4d5cc7e40e0b1806da984.
---
 .../gerbera/files/gerbera.service                  | 13 ---------
 .../recipes-multimedia/gerbera/gerbera_git.bb      | 34 ----------------------
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
 delete mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb

diff --git a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
deleted file mode 100644
index 1b5a3ad3e..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Start Gerbera, an UPnP media server
-After=multi-user.target network-online.target
-Wants=network-online.target
-
-[Service]
-ExecStart=/usr/bin/gerbera
-Environment='HOME=/root'
-Type=simple
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
deleted file mode 100644
index 2bbedc0d1..000000000
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-Description = "Gerbera - An UPnP media server"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
-
-SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
-	   file://gerbera.service "
-
-
-# Modify these as desired
-PV = "1.0+git${SRCPV}"
-SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 taglib "
-RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs taglib "
-
-SYSTEMD_SERVICE_${PN} = "gerbera.service"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-inherit cmake systemd
-
-EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_TAGLIB=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${WORKDIR}/recipe-sysroot/usr/include -DLIBUUID_LIBRARIES=-luuid"
-
-do_install_append() {
-	install -d ${D}/root/.config/
-	install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/gerbera.service ${D}${systemd_system_unitdir}/
-}
-
-FILES_${PN} += " /root/.config/ \
-	         ${systemd_system_unitdir}/* \
-"
\ No newline at end of file
-- 
2.14.1


