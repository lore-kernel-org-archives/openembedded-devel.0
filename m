Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 87BD175049
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 20:05:56 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id u6-v6so5179830pls.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xp7nIUmF1j+Y8oEeGMllvloJsTZgvQB8HWhotUxVHuQ=;
	b=r1gvUPoXfnXSItKn//v+W7fN+PZB9Bs2Z22eDVukgGrKNsl1suzRQpTke5u+bgHQq/
	dZwr7jlHk2zwF/mqKyBMtr9rc7RlvMxzDjmPE1+IxI3qf/TVy3J5azriId87R7Rpl0dA
	HXk2k7rOzwNfzCuQuBqHIAaPH9ApqNns9VjWcdmfFdCcsKPz7U7btiVI3W7GwkHsb1IU
	R+Zr1vi6mvHRKun0fpxP3DUySytOqjhvbbsJS/r4NExUGHyXHOx+fpACzZGs6m+LiXF6
	zYtFWUOcDdoGTWdMlq4hRCr6zkB7cVSThxRZ85UmaMnnQW0Gc0oMCbCDbdruZ9P8f+NC
	0xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xp7nIUmF1j+Y8oEeGMllvloJsTZgvQB8HWhotUxVHuQ=;
	b=Hkar/6eNMg8wHps6B+FenM561AO7uUH96GGr6VRSV/c2keAyg6O0XAbYCE0IccjHnw
	eddzTwvDvdzanL0ZkmXRtF3n/DgkMB9iYTV7TUqQitAp7T9JffEzHvA0vCXzeQ2Cd20w
	+YYyAR2uL8Nie4gDZGWzUYaZHDF/a7X14j4mmlgZozC+unip2qn4VwXzXwZKGnOLs4p7
	n9rH5xg6Xpa0qe+Yj4tOLa8yig4eZSgDTDDikXs/hK8+So75iAyb9hOTzbVG1HGZBSwz
	S9+eeazsy0YZxHUD7wOFCW1On3hN1I0SNPoKoV026vtOtuvH5bSaBP/+Dp19jV60juSf
	pR0Q==
X-Gm-Message-State: ALKqPwfuTEUhcNGYtsmLL0ZPweBSYFrfwOg7bJ6s9UU+q4Q+U1zA+Jo2
	NtnyAOYeterNsHtnzOWpL+W2oQ==
X-Google-Smtp-Source: AB8JxZopFNBV+YE63DEfWOS0hvM1lJeDyPoUuS/t9HQ7eROz/jskbc5eeDjDv2fefxl+fFiH2/6e2Q==
X-Received: by 2002:a17:902:bb92:: with SMTP id
	m18-v6mr10926168pls.46.1526673957358; 
	Fri, 18 May 2018 13:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q19-v6sm77888pgv.78.2018.05.18.13.05.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 13:05:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2018 13:05:54 -0700
Message-Id: <20180518200554.30205-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518200554.30205-1-raj.khem@gmail.com>
References: <20180518200554.30205-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH] stm32flash: Fix packaging errors
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
X-List-Received-Date: Fri, 18 May 2018 20:05:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
index d401981ff9..59bd1b60e1 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
@@ -1,16 +1,16 @@
 SUMMARY = "Open source flash program for STM32 using the ST serial bootloader"
 HOMEPAGE = "https://sourceforge.net/projects/stm32flash/"
 BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit autotools-brokensep
-
 S = "${WORKDIR}/${PN}"
 
-SRC_URI = "https://prdownloads.sourceforge.net/stm32flash/stm32flash-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+
+do_install() {
+	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+}
 
 SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
 SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
-
-FILES_${PN} = "/usr/local/bin/stm32flash"
-- 
2.17.0


