Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id F34F4605FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 19:38:05 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b67so119694880qgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8IXRJlKWWjD0DhwwIJsehTgNR3QTru0rXUWmHI4w+LA=;
	b=bPUw+zNhzqtGNM2C+c50zdrydydDGe0fUnENpz6JbbOCIA+cyjqrgiZM4t+kAFT2Xz
	ETOhbxi5jqHyizI4FGUxGn6oDQrnKZEkLWOZn2TfXFqbdLIrExZkxJwC30vsCYwfeScp
	L+ih92gLZ+l85+GV5MFPy1y91XAtnvPeZhJAIbZ0OZ6pUl2lvFHgZRdW1EQe2enne0xi
	l7oIIVTdodVUUBgA1ir6HRlZHQuaoJJlGc08maYnGKp3OEifi8IB0Jo3stQNAcCsbsq9
	Roq5VUKHClbl4lhsf93CNTYJ0mRhui4rkQKwTcHQ5OQH8vcEfd/n03StGs4BfLd4ZWER
	hfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8IXRJlKWWjD0DhwwIJsehTgNR3QTru0rXUWmHI4w+LA=;
	b=RkAdxigiVK/xXP/dC59unvlIrlVt1OTm/0FO5rHvHfDvzZmd2UHy2rv3CLXn8+/7nP
	KbvrlouPWHvG70U15pI1FV3B/7VwP0Wwx+ew4KOP9OEToXql2dPv/VNbUau/xFC6y0IB
	eS0DL/1gZpuGbjyHo1zQB4vXDbPBe6wZSQYu+x0NatEntmPpgTFLE7R23euJfRrNsS+B
	EwzApRKyYct6tVq57P9Vvt9pbW4p4sbHNg4+h+/JfW/7dnDkqAFP0/mHPgbbl4czHU4j
	VibVQLN7FP51/HWqQp+l6UBpWsnSx3rBSH/6fcG/QWoi0QjcBXTD5T0CY3D6O6gD2Ecs
	OlXA==
X-Gm-Message-State: AG10YOSi+D21zpMYZ4BmnfF/j4HXfNWNtQb5QwhEw6HCPYwKNNuJmnUm31ILRFlU8DiaoA==
X-Received: by 10.140.143.134 with SMTP id 128mr4496710qhp.25.1456169886445;
	Mon, 22 Feb 2016 11:38:06 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-13-83.nwrknj.east.verizon.net.
	[71.171.13.83]) by smtp.gmail.com with ESMTPSA id
	h11sm10788812qhd.31.2016.02.22.11.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 11:38:05 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:38:01 -0500
Message-Id: <1456169882-7168-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH 1/2] zeromq: Update to 4.1.4.
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
X-List-Received-Date: Mon, 22 Feb 2016 19:38:06 -0000

 * This resolves a build error due to libsodium update.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-connectivity/zeromq/{zeromq_4.1.3.bb => zeromq_4.1.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.3.bb => zeromq_4.1.4.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb
index 5d0e2d5..2090152 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.4.bb
@@ -7,8 +7,8 @@ DEPENDS = "libsodium"
 SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[md5sum] = "d0824317348cfb44b8692e19cc73dc3a"
-SRC_URI[sha256sum] = "61b31c830db377777e417235a24d3660a4bcc3f40d303ee58df082fcd68bf411"
+SRC_URI[md5sum] = "a611ecc93fffeb6d058c0e6edf4ad4fb"
+SRC_URI[sha256sum] = "e99f44fde25c2e4cb84ce440f87ca7d3fe3271c2b8cfbc67d55e4de25e6fe378"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.5.0


