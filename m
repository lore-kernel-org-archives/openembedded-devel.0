Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 27A1960030
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 23:31:37 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so14473848pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Dec 2014 15:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jcRH5hxgt22YdTDIghl0OBT88svY3oyBJLa0bb80X80=;
	b=hIaVqCIWrhHL53RFAka+W86VaInsBnfiIb2i0tpRTaANK2VAI0amWfhS8MihJp0D9z
	8Z9UC4+/mP8mGp06EVHleEQGYSB8IDv1b135CZJBC/uhXrhUYXnbw0TKxuC5+Pl5TRWi
	1/AHjqm2Dm0X4BO2RVzsW6oGqqAoctjrieOOyJAi69J7QYO1m3jX2G+e7eMZn5KXyIQW
	C7JTmrbftSWmb3XUaMngFsLWehoxGPeiQgViyIwqQWe7GXZtf81PYjjGhMybVFrt8xdH
	G7aJDv45veRBhu9bmUTV8x6sTm69MMcTbZigyBktrrrAECcB+L0r1mtWscf6dwx51sIE
	GhJA==
X-Gm-Message-State: ALoCoQk3Ix/Xvr0pL9sF8+j2Ob/YXzf7Fdusue3rQkgQgGhPFUF1W2ktMqpwZ0SI8cNaJV5HG2bf
X-Received: by 10.66.166.141 with SMTP id zg13mr3195963pab.9.1417563098536;
	Tue, 02 Dec 2014 15:31:38 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	sd4sm21172967pbc.83.2014.12.02.15.31.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Dec 2014 15:31:37 -0800 (PST)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:31:34 -0800
Message-Id: <1417563094-28889-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] strongswan: update package to 5.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 23:31:40 -0000

see https://wiki.strongswan.org/projects/strongswan/wiki/Changelog52

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../strongswan/{strongswan_5.2.0.bb => strongswan_5.2.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.2.0.bb => strongswan_5.2.1.bb} (92%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
similarity index 92%
rename from meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
index 0997fd0..6b91319 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.2.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "5cee4ee1a6ccb74400758b3ace54d46e"
-SRC_URI[sha256sum] = "b00c30bd2e60ff2e5fc85f54bbad54fe246585812fdf212dbe777a5258da26ce"
+SRC_URI[md5sum] = "dd3717c0aa59ab4591ca1812941ebb82"
+SRC_URI[sha256sum] = "ea51ab33b5bb39fecaf10668833a9936583b42145948ae9da1ab98f74e939215"
 
 EXTRA_OECONF = "--enable-gmp \
         --enable-openssl \
-- 
1.9.1


