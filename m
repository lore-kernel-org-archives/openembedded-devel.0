Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CA0DB78398
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id a7so973491pgn.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XVDPp4DiDFU80YkMUFh0bOzJCYRyGHAkHEFyKnE1rxk=;
	b=mgGxrfSaO38CfRS7gnUgPA+8hphi4PUmoS6JfYmFInB4bUKCKZRjTZ1XA4L65Mjnhx
	73+3J0+/Iqs76ARHIwv7Z2U6mbDpevlA27sTOlMi8LAF9VpGV9pe/zGomu5HwippOw6R
	DkAgcuBvNabJublycdRuBafyA2E4Nlr945/0sQ3/5atXupyqSE+G7RrhMFwdFhuZFrsk
	vj/PGC38X7sEAey+9C5FCFgSOhRcZOWcY7vKoHEc9VvvgPWWUZePm9/7jUO5k2OI6CP9
	yBEB+IsFYYhbkAqKctpx/W/bIP44ZfF80e7tj6OcFm6uGJ8LJh2zaOZvyoObniAkp2aX
	XJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XVDPp4DiDFU80YkMUFh0bOzJCYRyGHAkHEFyKnE1rxk=;
	b=kgfvlpZy68vlhvgqLiQnhn+zRu2Y7XYuBBJfEAXSXjnrNaC9LH957niKMcmff4Oe49
	WWr2bP3Ryk929syBxmGAL5FvG9QN5n5Mvy/FqWo4CAzH566tZaedqN1gGxbm2FfQf7ly
	g64Ay5cbV029fwB+PwrAM8EYQ2j0ZD0ue6LkINo2M2ARHs6KEUZvnheU3WR7ZWjpDO9q
	uhs18nfE9P3S4AGuB3W92ZNKVJ4Tbfgvm3I3zJFLLMb9S16GoOUBo2H51L98J4XUFZOh
	FqUflpn3ZxCPh6gxvwQanY6xe6Pk9zGw8VdAe5mNUi83N+8fk/DjtobcgccdRR0CU68k
	u//A==
X-Gm-Message-State: AHYfb5g+qpyzG6ZoTvWtUPBdt8ZPwGBngH3gwGgTAMyCStm5H4qd5KkZ
	Gm/3Fr2Slvf/l3n6
X-Received: by 10.98.37.199 with SMTP id l190mr7815830pfl.332.1503610722200;
	Thu, 24 Aug 2017 14:38:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:27 -0700
Message-Id: <20170824213829.41431-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824213829.41431-1-raj.khem@gmail.com>
References: <20170824213829.41431-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 4/6] udevil: Add missing rdep on bash
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
index c432e8546..60f84f8f9 100644
--- a/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
+++ b/meta-filesystems/recipes-utils/udevil/udevil_0.4.4.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 \
     intltool-native \
     udev \
 "
-RDEPENDS_${PN} = "udev"
+RDEPENDS_${PN} = "udev bash"
 
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
2.14.1


