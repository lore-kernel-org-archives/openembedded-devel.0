Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 574B571CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i5so130341pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u4M/6hBl8yG4WgYIpd6f633ip8+xCOcbofCtRH+G1LA=;
	b=SscvF6sqp4BAOxncxeEKd0lHQolErfbxgM63pjgJ9umWT7lH2eV0QCbyoYEfIMpcoI
	qK4NDMzKUEtwW8D4hqsNwrT/ZX/UE8gHe274IY/rjl0mRmOPk7rg83EJOsevXWzSXsQM
	ZG2rY3i3javo1Szeq/e4WnSVyGBKwLH9RjIbN86lJfmn6NKxsNObY7ewzo94LMTRjJ6c
	z39cpo/J8xy1wVH/EdkD5EvqoXl4P8xIDhVzuA6nB1FCpvtZzl7+OuUVbgR1CbGyNuD5
	auYmxBzkCiKCfTad1Y9US3hMM2fg8ATE97uV0nQfW6dOYY9xSceKt+685u447QMJWjJP
	5hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u4M/6hBl8yG4WgYIpd6f633ip8+xCOcbofCtRH+G1LA=;
	b=DoobnMmzlho2V7zL344egL0U+iadqu1zMH5pDbnfGsW1UK5yccHYW+1HaVZN3ncd5+
	woMQ9libn4OXc136GYBaocvSO/VaCop9dbkSzn7k9xJws9M7IMhAhYjiljqXs6dvkq1T
	Jwrbz1/vh8tIvOnP8hjgWK+J7dv/Dox/r1+65HixTUlmauwjoUCIMhbQ6tNjKuONJCX6
	Fd9OOA6p2ofV4hLZSIfN5JTjZ3tI0SOSbr31qcf7oLPQCIsDBV81fCBoi33/0/YBmWDS
	rwfTUuoOONuTOHFNHy7Lso4QAdxl7H0ZdaHPZQDQUhnd2htlnHfGAfR5pt1ZOGC78gDC
	K8mA==
X-Gm-Message-State: AN3rC/46UC1q309uXiMepnGPmC2ensISGQsyZpruSvPXYeTDggUzaPJ9
	zl2hzVxSKDZ5OWN4
X-Received: by 10.98.87.203 with SMTP id i72mr9019790pfj.151.1492539755343;
	Tue, 18 Apr 2017 11:22:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:37 -0700
Message-Id: <20170418182142.27253-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 27/32] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
index e4d5b69bc..9fc8435ee 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
@@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
 SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
-SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
+SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
+SRC_URI[sha256sum] = "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
 
 inherit autotools pkgconfig
 
-- 
2.12.2


