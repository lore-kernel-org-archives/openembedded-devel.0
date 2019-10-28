Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 244646007A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 14:53:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e11so10222620wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 07:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qLisvVcU5Ok6/2j/avNCVC7c2sSl/P7Ml7HL/e50QHc=;
	b=Kbuerj9abHC247Yyb1uj6nTXc2dabk3UWkOiTd78IOSWBHxl8921Oxvas57w5NlxpB
	UWJl9fbtnWxyK2WwWW/hngF0ofQhKcc/Bb7xysVaC8ZKGQHX8M6o/3DsT4N7CcYPUVDR
	2GoUM+cJy16E5MJOA8GdpyOFjgRyREiHPqJKo4cpRUMVQQnGsd0zS+VwGQ72uXmGliia
	AJk4tQuxfw4MtlQ/4Y6Ct66BoQYpzDmXteI2FYE5/IzeCJ44JQguy649OqzZDXYoBTAs
	t8L4MYjXrZzpot581SHhZz4/NHCLobuLC2pn8bzmIUM0Ul2ZVVDNfsZx3sXBrytIYgjm
	DRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qLisvVcU5Ok6/2j/avNCVC7c2sSl/P7Ml7HL/e50QHc=;
	b=eMme4bpDQE0EJBG2nv0+QOkEmmVWqcEfONE6UTlJC/5rCgzZRK1/e0EmcuEPHEEVGI
	aFqm7jLUF14jHvLMf13UrPChScMeHWcdN8LWylC+6eBwijBDqqD7KVqFCaRBii/jRB97
	HdoaKG4kYKH57D1HAUdC6Nb0XqA8TX9Waa7BHmx74ybs+tmjp53oQojQC+xZT8T+7LAv
	YButeuD8wulJR7x65DRLXBtFlRI0gc2BqMNbfAwFXhTmOPv8PjfrYf7nU8y8xd0cz9hp
	MKEW78JceYM7oh9WEEwd6SofhgQaZio6GM7p6lyX2euMd31Os6qLf/ifICE0fclyDO0k
	hYEA==
X-Gm-Message-State: APjAAAW76L7LviGJHrgYwVzN3w6tTUOrz6ggwPlw7AQ2y/Jc3pMhUVR3
	miebpLy4DbBQF4N416v1UoTRLRkD
X-Google-Smtp-Source: APXvYqwB/AP93GPgJpeTJNprVCHYiHBFU5+5QEBcA26l1CHsRDwMBMTXWV/x5gJ0+A6LVu/osh8jgA==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr14538465wrv.168.1572274433171; 
	Mon, 28 Oct 2019 07:53:53 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	j22sm15617619wrd.41.2019.10.28.07.53.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 07:53:52 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 14:53:47 +0000
Message-Id: <20191028145350.6606-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025191221.17914-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/4] dbus-broker: 19 -> 21
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
X-List-Received-Date: Mon, 28 Oct 2019 14:53:53 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Add /lib/systemd/catalog to the package, as snippets for the journal are
now shipped.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: add md5sum

 .../dbus/{dbus-broker_19.bb => dbus-broker_21.bb}             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} (74%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_19.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
similarity index 74%
rename from meta-oe/recipes-core/dbus/dbus-broker_19.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 82d8b8ba6..f22916aba 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_19.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -7,7 +7,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
+SRC_URI[md5sum] = "7d2e7e72b45c3cb7c25d21a53ce30c7d"
+SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
 inherit meson pkgconfig systemd distro_features_check
 
@@ -19,3 +20,4 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
+FILES_${PN} += "${libdir}/systemd/catalog"
-- 
2.20.1


