Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0DF60107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 00:15:12 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r14so20521821qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TsZ3hGdyzkGefwjjtfNadUYCM/hmAHZJUVt9EYF2/1g=;
	b=MwuK+512Ep9Ff7VemN8G4T3mSuyO55yzByBG7/fxRy507bUdWBZAoOET3lY0gNumHG
	QNNXE3OcqXQND9Nhxtsbre+nWcD8MtzJAU1YivxfZLFMnYAglvaRuNyHITaxS7renPTm
	CIwoFb8WYuxHzoXtDSpZl5G2fjTsi82ydkatGebPqQA5wuCCTD9wgsMeZKJtaytpbKuH
	X33cVAgGgmxZYbLJTXUpY9FPuP8mZlbb/5UQjFgT6DOX3Jhqlhyq2TTQ+LWKpWwAeCjt
	byN9kRa381c9NW4IGhesv7nAvKvJUUOHVoxZXlh07kMg7G54qvx8T+g7heUQ2Mxy52zv
	xWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TsZ3hGdyzkGefwjjtfNadUYCM/hmAHZJUVt9EYF2/1g=;
	b=GUI/WXTU0jY2x7xRNHKmibMJ/iuBXT4BwFGg9dJo2RBsWy46fo5Vh1aasJP1Wqci6U
	n0agHDXoVvDklCbicGqsv2qQFY4S1+X7sn6FH/7RU3A1rZy5k70KQGHywk5k/JjHGDlG
	Bf+wd6W0YiBb8FVWB279Z543sxvK8wpPgHEfdV9pqUhhaQ0HHBYAy3dg5rwHyHZoxQVu
	BiUTD29RvwktUD9u2XUi3XDc0hadjODU40Yy2UQmN3o+NJlxMOq1Z9BFInK0blGoH642
	ISCOfIbOR8ur7BNc2CfSJErWvaMtVvW89pehCK9BGzZOSZ/y8NC6KPZ7pvr2Yd+h8O2F
	SoNg==
X-Gm-Message-State: AJcUukdzjrsepVFoWJ4yDFHZ2FD6H/B5sCJsyHB8VKHci0/KH9X1CK5w
	M+Y6RMOZ/kMQcO28+ASEaluY32Ek
X-Google-Smtp-Source: ALg8bN6xQZSK7DRv01eTGp60Af3Jgb6WEAY5ft3ka9edHsjuzlTC5n8HJhlLQji/Ipszhq6YJhwHrQ==
X-Received: by 2002:ac8:7308:: with SMTP id x8mr23960581qto.284.1548720912810; 
	Mon, 28 Jan 2019 16:15:12 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	e49sm79870797qta.0.2019.01.28.16.15.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 16:15:11 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2019 19:13:28 -0500
Message-Id: <20190129001328.15320-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: update from 3.3.5 -> 3.3.7
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
X-List-Received-Date: Tue, 29 Jan 2019 00:15:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../libeigen/{libeigen_3.3.5.bb => libeigen_3.3.7.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.5.bb => libeigen_3.3.7.bb} (79%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
similarity index 79%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index 7078e50bb0..3be04478b0 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -5,10 +5,10 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "e83549a79d1b721da0f8899ab34edf95"
-SRC_URI[sha256sum] = "7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a12fbaa26379f603e2"
+SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
+SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
 
-S = "${WORKDIR}/eigen-eigen-b3f3d4950030"
+S = "${WORKDIR}/eigen-eigen-323c052e1731"
 
 inherit cmake
 
-- 
2.20.1


