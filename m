Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4854B7FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:27 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x185so2851085pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NFl+xPhOwaetOFOrqwM98PYDRliPbA1JkX+sn9WMH2M=;
	b=AkJKDOy767GE01lMCktmMSy1yXp58rBMCfZoh1dag+F56pF8MyIgPlxTZBjwqRG5jX
	29JupBx+tgH1Rz/DQRLP/EREivl6545lKD0miguOezTl1qRDOsXA9wQ22tgXv+U/MR8J
	+ateEgap4fnp4p6L0MAOU5BZzwI7vu52gTdZOgFrzVeZ5XDHa9DfY45yedE4nzi2VRC5
	H1zlIZTrcuh2t6oCOlpzWgUys9kb1+FA2UIYF2ZRRwvgfEliKDki26ecOSiBjMqm/f7k
	IxiN78jaKSez+pQaf4ay1zz1Pc9L+aL/+KilvQfSiVeODnfDgyfMFaIArOOMUiSKn5zC
	OBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NFl+xPhOwaetOFOrqwM98PYDRliPbA1JkX+sn9WMH2M=;
	b=mXS+HaeiTPppxthCXpMVSDDZih+OxDem57qLJnbRQ0YlRHcmEAebyyw0IYDRMeLWRk
	zF1Ibpgb97DYezMnsJ2CkDjGJjU7PjbLd7f4oWm50cNZsH2giZdSFxu5IGHJ203sYJ5g
	VhEntr/RCO/hEhBvu+2co6LhIUq8wSwz42MKZbD+kJrhmsceG8jhM360y2FrUVrDB1AU
	RFHvUSDdVc/j8ON0A4eWmWN+Mwio7GyEG24R2+GUoLnvWoMhFg25F6b+xnKI60kLlG7c
	P/HlUMwPBDGzFYzHpI62khzFucuHTwcAol6hBkJpc1ZQqqMFw59ddNXMcy7YoC/OQwxB
	tXOw==
X-Gm-Message-State: APjAAAUZzNPwbPr2qEWAeCtWlCOx9jBdMYEOZ0Qz3vmF/BrmtV6AuBH5
	hnP6DJ9xI/abP/AQcKUxAzp5FrBrg9s=
X-Google-Smtp-Source: APXvYqysYsTbtUpJVYYwIfJo+mqfWtZIBJWRbxr7Qmg9Vm6tXL0wJk4fs/k1OrSehPgClt1OLp/e6A==
X-Received: by 2002:a63:496:: with SMTP id 144mr9852004pge.207.1579675107985; 
	Tue, 21 Jan 2020 22:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:17 -0800
Message-Id: <20200122063823.242098-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 06/12] telepathy-idle: Disable when meta-py2 is not present
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb | 7 ++++++-
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
index 5eb00aefbe..42ce3301f5 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
@@ -11,7 +11,12 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
 SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
 
-inherit autotools pkgconfig python3native
+inherit autotools pkgconfig pythonnative
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index baf1fa1d61..f045167e8e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -65,11 +65,12 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     libuv libwebsockets linuxptp lirc loudmouth \
     modemmanager mosh  \
     paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
-    ser2net smstools3 telepathy-glib telepathy-idle thrift \
+    ser2net smstools3 telepathy-glib thrift \
     usbmuxd zabbix zeromq \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
     libmikmod \
     obexftp openobex libnet \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "telepathy-idle", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-connectivity_append_libc-glibc = " wvstreams wvdial"
 
-- 
2.25.0


