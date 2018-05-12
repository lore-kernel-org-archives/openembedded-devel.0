Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53A9A788AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:05 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi12-v6so4262523plb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PGgANP0QCY2EFQRAxXL7Z5mHn2UjeqZa51Cr6RXJlCg=;
	b=sJeSwaYAunq7/Ahtfz29CocaphoTzzmHqmm/OS4n9NZieNfnTj50pLZUw87NswMp23
	Qeyg3Iy0AQjc8ERU50p8RnBkub6hfcPUv4qbnHHN05aZpfeyqTP0KUylCEWlowDumVas
	l4ZO41nNzoKpmMCfMUJLLNOOF9aDlqtx3HHJAIdDqXfjTCrvH37dHpKX+YuOY9z+7+Rg
	olC4egmKAa9InIqIlX0oPiuLDO+dQgRQlJac/ywz8+gqk/Cjntb5IwUeKpg0uVB0LiD/
	9u2kAFPBJzEFMKpiZ/+O4XgWlJnkbGV05DN89FDyrxwmlOCT9Ie8P8Jc/D1q4H7rKMLE
	O0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PGgANP0QCY2EFQRAxXL7Z5mHn2UjeqZa51Cr6RXJlCg=;
	b=dMJqxrmA2RuKllpXx7YNSQKjHUoXXT4V/PX+/n/WtlvkCjR8ykWm5PoNAk1zK6ncIX
	7v1YE1150bjBKEr3RSbh9hLJfkrJY1iC0NKKRn32sDR2yWx/RLDOWyqUlPA6y8A578Fm
	YO5BkHWh7FlSzLmJkyb6hTB2B4nnEQeYPF0JA96YLpX0glBzuozitL/oCp2/k0a4pEgc
	gARFefRUSILE64Z9Y9zH4Ml0J5YGo8G6B9X8i7eYtRpuR7AecADAiZZImDvD0Vsfy2kq
	IF9KHrAnadvzD5OBWNo8zxirFUYPTPNYr50UzxNwz9XntS2VpeTtOo0eydFnEKH1tPaA
	Un2Q==
X-Gm-Message-State: ALKqPwdRN3UH01pcUlGYjq9WW72M4rMNpRUfBHLP71KlmDPxV9n1k9A/
	QUtYUnvuFcCL8iH6YdStUr5y4g==
X-Google-Smtp-Source: AB8JxZoZ2a8/IEbpLidjbZQuTou4+bO8YaB/G7be5CSFY7Ex/EZ/n3gv4lD0iR8G6nYluZZQ6RvOqA==
X-Received: by 2002:a17:902:164:: with SMTP id
	91-v6mr738173plb.134.1526094486926; 
	Fri, 11 May 2018 20:08:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:56 -0700
Message-Id: <20180512030758.31409-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/8] modemmanager: upgrade to 1.7.991
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
X-List-Received-Date: Sat, 12 May 2018 03:08:06 -0000

From: Martin Kelly <mkelly@xevo.com>

This version has a ublox plugin for expanded modem support. The underlying issue
that enum-conversion.patch fixes appears to already have been fixed upstream, so
we can drop the patch.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../modemmanager/enum-conversion.patch        | 21 -------------------
 ...nager_1.6.4.bb => modemmanager_1.7.991.bb} |  9 ++++----
 2 files changed, 4 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.4.bb => modemmanager_1.7.991.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
deleted file mode 100644
index a3fb0f3eb8..0000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes errors found bt Clang
-
-| ../../ModemManager-1.6.4/src/mm-bearer-qmi.c:774:50: error: implicit conversion from enumeration type 'MMBearerStatus' to different enumeration type 'MMBearerConnectionStatus' [-Werror,-Wenum-conversion]
-|         MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-|                                  ~~~~~~~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| 1 error generated.
-
-
-Index: ModemManager-1.6.4/src/mm-bearer-qmi.c
-===================================================================
---- ModemManager-1.6.4.orig/src/mm-bearer-qmi.c
-+++ ModemManager-1.6.4/src/mm-bearer-qmi.c
-@@ -771,7 +771,7 @@ packet_service_status_indication_cb (Qmi
-             &connection_status,
-             NULL,
-             NULL)) {
--        MMBearerConnectionStatus bearer_status = mm_base_bearer_get_status (MM_BASE_BEARER (self));
-+        MMBearerConnectionStatus bearer_status = (MMBearerConnectionStatus)mm_base_bearer_get_status (MM_BASE_BEARER (self));
- 
-         if (connection_status == QMI_WDS_CONNECTION_STATUS_DISCONNECTED &&
-             bearer_status != MM_BEARER_CONNECTION_STATUS_DISCONNECTED &&
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index e60cd4b741..4f94001690 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -11,11 +11,10 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev dbus-glib intltool-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           file://enum-conversion.patch \
-"
-SRC_URI[md5sum] = "06488186c7dd53f8104183b86f7a1568"
-SRC_URI[sha256sum] = "cdd5b4cb1e4d7643643a28ccbfc4bb354bfa9cb89a77ea160ebdf7926171c668"
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "4efe6a240cef212bf8855c95424e7c7f"
+SRC_URI[sha256sum] = "4e366243bd4983f2e6efe35cb901cf5da51939307b5d6299fe622a9fcf411745"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.0


