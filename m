Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1AC173109
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b5so5269508pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u7s4pNhL89OY/+xQ0OY7SYU3FZ12RRJwScyQzhozp8Y=;
	b=MaZ3ptO6cKdg6oCuYJaQg+VJIdWzYlcyyV2cIhYKugq+dCgLC1Uv6xWOYe8kojhigX
	D+ko/W8TKLMQQSOPBmfA2Go+KB7/JGUNFe2jnTVbdQBDy14CQemUXSPXDEdKognrHgNg
	Ds9L5jM06wmyUO4bfCdiBpL8yZ8d6B/NRYohpUSqheodQMBOd4wrZCEOeWjf/PuzDef4
	LwtbC2xk24P9X622wVBAtPrMAFg2xH/1Ysc3XEiIdiBhUtsRj23wd1DjL/o4oyKVqMch
	bP9vgCU3OM4Dqzk9wZTCP3eLlsS5LmoNRsLuO/SdhZeNQk8u7K5Gh3/ig/OqyrtTt8IZ
	vDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u7s4pNhL89OY/+xQ0OY7SYU3FZ12RRJwScyQzhozp8Y=;
	b=bNlLwnqyb5W8I8n9lVZUwIbIW3xna9p4xso2RylRr+IWr1Zl7jHDXnbdCUfiS9RAit
	5w1YW5A0n/udHIz341FGwmhzm+FPG5AlSMkxnpN6hJ6Eg0Mqxaeri/z1B8P0DLo2x5E7
	xR1SKPnA8tgYG0YBo5ezsDIIr4mV7JDxa9TwSx+87sblWg9q24xhoRotwaH4ByS1OK0d
	rZqVxZ6KTGMFUJir+LvHZFWQ99ZxAj/CCjNv3rsunSd4gSQfMwO/HE9vu55C3kmFKWwX
	1veHF+FYa52zugaUeIgv5lt6KbLNHs9FdU0b6yPRuVrjj4AqJcImcPbywN1duEX/JYPj
	/Z6g==
X-Gm-Message-State: AMke39mVOKf2dV3McEZcSAU1LQBOHNL25ej1HffDlcmlEgIWJLGtoG7Dkf6JaHhRD66cxA==
X-Received: by 10.84.129.195 with SMTP id b61mr32779716plb.83.1488870846840;
	Mon, 06 Mar 2017 23:14:06 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:43 -0800
Message-Id: <20170307071349.16444-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/14] irssi: Upgrade to 1.0.1
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 22 ----------------------
 meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
 create mode 100644 meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
deleted file mode 100644
index 54d881d1c..000000000
--- a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "ncurses IRC client"
-DESCRIPTION = "Irssi is an ncurses IRC client"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
-
-DEPENDS = "glib-2.0 ncurses openssl"
-
-REALPV = "0.8.16-rc1"
-PV = "0.8.15+${REALPV}"
-
-SRC_URI = "http://irssi.org/files/irssi-${REALPV}.tar.gz"
-
-SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
-SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
-
-S = "${WORKDIR}/irssi-${REALPV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-ssl \
-    --with-ncurses=${STAGING_EXECPREFIXDIR} \
-"
diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb
new file mode 100644
index 000000000..041f5de6d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.0.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "ncurses IRC client"
+DESCRIPTION = "Irssi is an ncurses IRC client"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
+
+DEPENDS = "glib-2.0 ncurses openssl"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI[md5sum] = "f6bed196cef63ea089f5cce089784445"
+SRC_URI[sha256sum] = "9428c51a3f3598ffaef438c351a8d609cf10db34f2435bdcb84456226c383ccf"
+
+inherit autotools pkgconfig
-- 
2.12.0


