Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 058377F9B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:12:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n15so3523193wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/xMQBkMiXacNgd0OWDuMuEf+y9jqUNinGdjlyRVgkdI=;
	b=phjwDimL9Z3X6DeuUw7Jib4KMfdNTZi+56rDXzR8HOUjUpE9v6usJq3QbfW8yetkn8
	nB/x03CaESGjSVGFeK9Ab2mf2f7xJg1ogR7vse+VsS3Lx1XR8Un/laUZYC+fzOoLINpR
	BPFS43DJ5dMBWJXJOr+eg1C9wn9onxEGZfYGgV1FPDZPQE7U3kYHOv+6dCriyJgEsobd
	C+oVgfgbWLZoXv+H8Jko/2mej5ZC1/QxX9UjjDX8LvanLW/uR8h8bbFHU1sYKzBm1nP8
	aHJBrL7l2PT4a8g+1Ku/fsmSYKrUKVvk6Vslvuy87tfnoSoa5yeSBs9XLfAwfrOgeMEZ
	9dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/xMQBkMiXacNgd0OWDuMuEf+y9jqUNinGdjlyRVgkdI=;
	b=F0LYG1IxiqlIZVaiap7aUC0j3npplFQkb93V7PO0ezORFZvMCcZ6D5CtHGcVqNpmzd
	mXye95dV7qJ4fqCEa7UCkIopSiU/mtTcEDJvNwiqJLZIPWYC3RzEB+9H+wVutpBaBrRt
	QM3wQQyKNhbtOkHbizROl2RM8FyLlCn4vJL8n7v5YRNpklifnBV8TbQAbaWFzO+dk9bV
	JMVTjrcv7zwLJRBDJUGJKx1m105dIU1K0DfXcDs1oYJ2V0DgTK3kneJO6gF81t+7mUsp
	ZV7k7+M+BzyZOvr1a2b5r1KW4UqewKyHCtx9erOB0pms2BEKkEqHzuXTjMA5J6qpVK6i
	IlCQ==
X-Gm-Message-State: APjAAAUWET9CdKMsBk6NJ+6i3R21R2YhPPJXWHBXhCC7sVn+va+dtxXo
	xuiBv8hzhFheMksmcbfKaCgOwMTv
X-Google-Smtp-Source: APXvYqy79d6cVkuOH4Z35s72Q5ghBtDz+wjmSmip2llHAuDStd3FHowQuj1ljhE4gdLJut1svvk4zA==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr2085320wrw.318.1572030761139; 
	Fri, 25 Oct 2019 12:12:41 -0700 (PDT)
Received: from localhost ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id g5sm3254900wma.43.2019.10.25.12.12.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 12:12:40 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 20:12:19 +0100
Message-Id: <20191025191221.17914-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] dbus-broker: 19 -> 21
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
X-List-Received-Date: Fri, 25 Oct 2019 19:12:41 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Add /lib/systemd/catalog to the package, as snippets for the journal are
now shipped.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} (80%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_19.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
similarity index 80%
rename from meta-oe/recipes-core/dbus/dbus-broker_19.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 82d8b8ba6..0b0301fe0 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_19.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
+SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
 
 inherit meson pkgconfig systemd distro_features_check
 
@@ -19,3 +19,4 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
+FILES_${PN} += "${libdir}/systemd/catalog"
-- 
2.20.1


