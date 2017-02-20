Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 23A0573173
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so15744634wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=t+flACL49inw7cdXUo+z2Jyj1OXtTZUL7VYh9R4OKXw=;
	b=EL6GAuodCH/aq19Y0rqTkB2PPeTrVl9LAbK4VMC5fmMLEJMAU+PUEg2s0OoRAWl8bT
	vEZfnbyLQ1ABwTefmcXVNPr1H7mfT1Oee559VW4QlcsYlkHquClvTU8kF7GpaODLnBgJ
	RHqmXc0rM8lNudxl1Kbi2LbHa+GFQHqp5DVsQ/drm1LLM18ueUbDNaG+E1D4ZOHWAvBc
	lgIN34XRRwKjBrIPEJdrBEovAo4C+OeL7Z2bS82yyA5tXbU6dTqubgGRtWe5MEy1Wb9J
	2XHZ+QcNfrsmrndvmVYlHEjs0b86Gzd/uut72d4jwXBcSluvwXsDPcLK3B85hUpHBOPG
	zpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t+flACL49inw7cdXUo+z2Jyj1OXtTZUL7VYh9R4OKXw=;
	b=MTqHK9mq8K8Tuk0fkmhw5sf/EiLvPoLyu0nz9mO+fhjwiyynx/Qt0zhLwiY6BS6loV
	cMg/q/slvyXhSleP4qMP+f/Ibc6NpQMR33PaS32w95MpWGvD89tav2v2xQKOJpy6vYfI
	7CukB/ru2oixd7N0BVDXT4tpuGoIFZx/RsW2/R4bmczGbX1bBg5yFUNZSgT84ItYzpfT
	t6ZefNnpp6zV37bgSv3M2Hd6rls0Cnq1j46kCYheLhRcbgXpM+ItySo6cSGr65hHGdKE
	ZtnS5xXHAWOASFWbhBf1bB1kbV+tU1VUWdJR3kSLeUMHnnitYF+cU8dHDb7Si3zK3NK4
	2d+A==
X-Gm-Message-State: AMke39kTjIjjrl3YKVyl7FwO/DJxPOAeOyK75atXxWc8DHwGksZwW3RCZRaGvcpRWJnItg==
X-Received: by 10.28.163.194 with SMTP id m185mr11695211wme.122.1487614059236; 
	Mon, 20 Feb 2017 10:07:39 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:39 +0100
Message-Id: <20170220180700.29836-24-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 23/44] lmsensors: fix fetch and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Error was not caused by RSS but upstream package path renaming without version
bump - tse tse...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 166f3a4..dbc05a8 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
            file://sensord.init \
            file://0001-lmsensors-sensors-detect-print-a-special-message-whe.patch \
 "
-SRC_URI[md5sum] = "c03675ae9d43d60322110c679416901a"
-SRC_URI[sha256sum] = "e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f"
+SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
+SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
 
 inherit update-rc.d systemd
 
@@ -29,7 +29,7 @@ SYSTEMD_PACKAGES = "${PN}-sensord"
 SYSTEMD_SERVICE_${PN}-sensord = "sensord.service lm_sensors.service fancontrol.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-S = "${WORKDIR}/lm_sensors-${PV}"
+S = "${WORKDIR}/lm-sensors-3-4-0"
 
 EXTRA_OEMAKE = 'EXLDFLAGS="${LDFLAGS}" \
         MACHINE=${TARGET_ARCH} PREFIX=${prefix} MANDIR=${mandir} \
@@ -132,5 +132,3 @@ RDEPENDS_${PN}-pwmconfig = "${PN}-fancontrol"
 FILES_${PN}-isatools = "${sbindir}/isa*"
 FILES_${PN}-isatools-dbg = "${sbindir}/.debug/isa*"
 FILES_${PN}-isatools-doc = "${mandir}/man8/isa*"
-
-PNBLACKLIST[lmsensors] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131629/"
-- 
2.9.3


