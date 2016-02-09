Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D767273196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 01:54:22 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id b67so44227745qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2016 17:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7tRZXEqZ9EgoY1rA0AmWngggg2n0srGJtu/4AgrzKFQ=;
	b=B4+8MaSfPseo8xUYysxbwqr+ggs5Fwv53nMJJhji1AHDSZxoHc0PIKjvOBfn/o50l+
	pKnNWsoG6MK5uMy6DUoF+hlZdD4qa+S2uQWq7hQsQqjohy0njkKr5FL8KygEOeF1zVO1
	qp+kQP5GDfGZ/INEMvYDuXywFiVnpE1DCk9P3gRowGBWFU4z1XsweHhMhv+3fWYkppj5
	XrGY+RFALgIv+KIpHdFmX72VFd1b97w7f4/db38i2Unms2n7jfS3tvYTxr4hO36JniCg
	w4hk1YhEVVT05KhCcdCVcTXIPW7UUS9LabNUjgFg651FJRrDreq9WBsS/W2vgY8DRvgB
	6JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7tRZXEqZ9EgoY1rA0AmWngggg2n0srGJtu/4AgrzKFQ=;
	b=CQpL9IEyMfRMCjfs7Fdu8WzWgFT/sOmGXnFphFGCj908aBOPxrpYJV8y4CWn/Dcven
	5ks6i1evZedmyo6UanTY0irRM7p8j+nE+cbV/jmv7s3uUGy6hZwKRC7yfN5gnvwxv7CP
	7ZBYFbx9rIRUNi9nw5AJNTlcmaKSr3gX7aU0JPEXe0ux7FzbsF3Rat+UJ6dqc9Dg9QtC
	sJ78ozxrm+6Kr5X27yZWooyaURZiIgBDn8w2sdMqCDC5tIaOL7/EEiRtpaySoMKZ8hP7
	qAjxIhTAW2HOd5E0AKQ73TwjBAeZwftwUsGqaZogO0AMzIvsUE6rKbkt1lDrUQKu7wGn
	kM0A==
X-Gm-Message-State: AG10YOQsHthT6IiT5t9QnD75z/zoYfFBMhFJdnYsB16GV/VFccU5mzkO5KTVMuRVNAzgKA==
X-Received: by 10.140.228.69 with SMTP id y66mr40604107qhb.78.1454982863063;
	Mon, 08 Feb 2016 17:54:23 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59]) by smtp.gmail.com with ESMTPSA id
	l31sm14537942qge.20.2016.02.08.17.54.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 17:54:22 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 20:54:18 -0500
Message-Id: <1454982858-8458-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] libsodium: Update to version 1.0.8.
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
X-List-Received-Date: Tue, 09 Feb 2016 01:54:23 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../libsodium/{libsodium_1.0.3.bb => libsodium_1.0.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libsodium/{libsodium_1.0.3.bb => libsodium_1.0.8.bb} (65%)

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
similarity index 65%
rename from meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb
rename to meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
index d02bb9b..a2eef4b 100644
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.3.bb
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=092a09b78c3be486fac807435bf17b7a"
 
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b3bcc98e34d3250f55ae196822307fab"
-SRC_URI[sha256sum] = "cbcfc63cc90c05d18a20f229a62c7e7054a73731d0aa858c0517152c549b1288"
+SRC_URI[md5sum] = "0a66b86fd3aab3fe4c858edcd2772760"
+SRC_URI[sha256sum] = "c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926"
 
 inherit autotools
-- 
2.5.0


