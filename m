Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B36C7F9B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:12:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v9so3564569wrq.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zom1hsDMPwWDwYwlqARDIEXQo4oO0OZjYxOabHsQlUI=;
	b=auVwIljztjN4Fu/2TMb9qaTTfta8c1gcwkY/coz/7SZjAAQTXVv/g+ei+zo4/b2Mp3
	8zSH3n5qXwXFCs4/3jFrrUs8b+H8UPM2bXkCA/Nu9Ze4JKGtmxX0nnVIo5RvievIoSV8
	s1IW/rxQc4vVDQ6zvctUkw72e2XdOiKETsikp+TZkIdoswYQZovUyHqwYNvSM6GMqH3l
	WfXg76sLtc563/HjeVU81BSpeM3xv73eiG/6+IunPLPNnU9EU+SUECXG3o2Zs0Sl3kpM
	LYu9JmKJAJE5N9AVaNur9dLZ5vc3tgLEADOiFocMXeCZL5DgBon0kYw+DKkWX/zHpX0N
	qZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zom1hsDMPwWDwYwlqARDIEXQo4oO0OZjYxOabHsQlUI=;
	b=W+T7tzC2gYXZ4RAD1T+BlXJe3y6AQJc2xZkgRuUMiNw8/t1patF8P4yNwKFP2C4bgt
	R9cpmjZ/RJTv2MxAaewWWJrqCIZxZuaYRUCMNDo74/WgvcxhXLtoBQuJRRMkQ9Nr4iQT
	DOoq47iIJ9SRDNZJjmbM49Rdk7RTnjPrDf17jnhoKCqjpaeriSq9lZNZsIRyAXXuDLL7
	nyMtfitOsuHvkHpx3JNeMXvnRRoAWoGzizrZ8XSvEmxPAgU/TDcxx6GQBqs0990AXqmA
	XUB5xGbynoUnXl/IpUe+FnB175wQuu1mtZd4SggvSINYVqzoFRTVCe/5QdVlmT3rMFdk
	VUKw==
X-Gm-Message-State: APjAAAXDt0vkVKdBEG0MgumQ0ANjJz7JadkwFTEG8VeJzwA27LQZNgz0
	WoTM9987ZaskUWbtncoYedScLMFc
X-Google-Smtp-Source: APXvYqyiwRwtnKDsmLrUJFYq/RybFkxMZ0WDBuNJ8wJRoCU6HsSFQIuRG0PNH7qOQ13uao9MQAUhNg==
X-Received: by 2002:adf:e886:: with SMTP id d6mr4574785wrm.188.1572030764770; 
	Fri, 25 Oct 2019 12:12:44 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	b62sm3560756wmc.13.2019.10.25.12.12.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 12:12:44 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 20:12:21 +0100
Message-Id: <20191025191221.17914-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025191221.17914-1-luca.boccassi@gmail.com>
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] dbus-broker: build with SELinux if it's enabled via DISTRO_FEATURES
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
X-List-Received-Date: Fri, 25 Oct 2019 19:12:44 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index fd77afc60..c353fcad6 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -15,6 +15,7 @@ SRC_URI_append += "file://0003-dbus-socket-treat-MSG_CTRUNC-gracefully.patch"
 inherit meson pkgconfig systemd distro_features_check
 
 DEPENDS = "expat systemd"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -23,3 +24,5 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
 FILES_${PN} += "${libdir}/systemd/catalog"
+
+EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-- 
2.20.1


