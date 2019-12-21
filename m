Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6E37FCB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:53 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x6so4996654pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e8iAxZZK0NOUmbqoG7JD9t8BI+yLXM6+3+UgUuQQtJk=;
	b=YsMwXGyMDSj2HksFM7pHljMVZtBqaNsJNDEX1yI/B30m9DD/VI1B5PjJwySMXjUwzR
	X2+cfE2l4G0RA6eii2vOvZriZm4EpPnjfqOT9/min22wwBCcXyRwsujka+qk1ngnsu6M
	XOzul5A6O/kLrN5HEBG7oTsMiXIrth4I0I8/ITE+Ucf2SR3IP23gWxuiQP1SBJIqWd6e
	KXIAt4pwX44eam4LmQeJP+2DuA1ajCletZGeeGdxJAmt5ymX4T+z4Vap2oamE/PHC32m
	EtG43+oNYR9HxZ/Dilb95LHGs2S6KrhMoCOCrREXNrc0reYMzw94QaYSEqpOPcH3sUPD
	opLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e8iAxZZK0NOUmbqoG7JD9t8BI+yLXM6+3+UgUuQQtJk=;
	b=Q8APw4ugFLjjzTZJheJuUUn4cqxsChSmctcXbLTe8ovWZccOOIGuG6JmSUTVryjZNv
	oVwY5YctLdHpIR0h1G8TnnqoI7LOkzMmPfMvKceu3sdPT58HqlNHCDxAHiF3AlAPfAx8
	vdO+eG6SvrcyqzSNDsFD8LPOPVLeEgvN/BYDuqoTv2pOETNLdTudAWV2WilWiqEjrcLZ
	cRCpzdEdPjWExlqais/ySPNtGZ3eUP4R707o2CPD0SoykCGoTbzt0UVkltLHc6VZUNt9
	xXklOI9tPkI7kbAl3ijFcdPvXersv1Ej2nYtZC21MefSfDzmEhEdT0vdI/Rmv8Qip4gi
	UXMw==
X-Gm-Message-State: APjAAAW7nxzNxhOxcVHaFIr+xkal45dGOb6TTB8TykF1LGHoO1fBamt9
	5yD2GfhcO1eqzCQLlzST7eQUVUGcCKk=
X-Google-Smtp-Source: APXvYqz9H2b7AQpwNoXcJnt7Q1BPtSHVLhmFRZQ8ysditFX3/mY6q7BpzgZgOxssKmesUH0kWx2c2Q==
X-Received: by 2002:a63:d802:: with SMTP id b2mr17706439pgh.414.1576886814251; 
	Fri, 20 Dec 2019 16:06:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:22 -0800
Message-Id: <20191221000635.1573390-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 10/23] dbus-broker: Use nonarch_libdir for systemd catalog files
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:53 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: dbus-broker-21-r0 do_package: QA Issue: dbus-broker: Files/directories were installed but not shipped in any package:
/usr/lib/systemd/catalog
/usr/lib/systemd/catalog/dbus-broker.catalog
/usr/lib/systemd/catalog/dbus-broker-launch.catalog

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index 98c50c4b21..8b4101aaf3 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -26,7 +26,8 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 
 FILES_${PN} += "${systemd_system_unitdir}"
 FILES_${PN} += "${systemd_user_unitdir}"
-FILES_${PN} += "${libdir}/systemd/catalog"
+FILES_${PN} += "${nonarch_libdir}/systemd/catalog"
 
 EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
 EXTRA_OEMESON += " -Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
+
-- 
2.24.1


