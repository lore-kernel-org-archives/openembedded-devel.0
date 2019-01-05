Return-Path: <athoik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE9867BF88
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Jan 2019 07:50:00 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id o10so33533451edt.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 23:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q65CBVvV5Se/dR91dyoK2alP3DJxxUD3Wb2ElUpPnp4=;
	b=MyzynNgRv6h+LA+fObkKCgz+x/gR8nkehcmK1nTfqJToxmTcZVd52LVcnfuGqc2meH
	bE5dvVlWWUZAAkHyyBTCHOMTEqvr9P2jaxyH+JKYj3AAnEOUpSy08uDKYqo36np0ztBy
	AIaaq+H/3VYU69bzqDEFUPdzhAG0eO3oA7c5yvFzF2dQM8c8BmcQLrefwkLLMyJuQ+76
	yse2eCWihlcyR7J1IPl0+mQMlt2P4effAGefDfbvhabSyRAgxx4GTAYkx2OQIg4OYEJp
	q4oViq1qGofXI0K0Yp2aDEe1mN3CWcKlvKtqUnrPTye6ZuG+bvi8R9o0Vi6ZcRjDCKm6
	ZDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q65CBVvV5Se/dR91dyoK2alP3DJxxUD3Wb2ElUpPnp4=;
	b=czB75OzEUbddH0qdd10vZcVVdaG/C3O7m1rguvRfdNjBSqcu5D6Bv7HmTgldRpOXzC
	4stWVwLTkt9dB0Kt/6UNSyQ7yNc2+sJiTl4Q6pWvP9/siYW0+8p4s3Iu8e69dkwpz4P3
	jFshOXStXn8WizPBXRLGXQZS6WLLYdtZH2eRmW5lS4I8X8AEDyubyunjNYefb+BM9ilN
	2J7U9GOuT/2HqjNuudhzrBYz9bmTlhIgkKg4DPMQ1v0L2/TPjyGQxxqbQZleBAGqbaWK
	oLdTvLUMKH9kYZnD4fyRixVBL98OAIEip998VYFg9/YcifIaiQcenZ2h5sEbT7VWkvBz
	tOXA==
X-Gm-Message-State: AA+aEWZKv5HNHqzW9G5+M8Yz0iHaAE14iukBaNBU9h/DK5npMZI8gqm3
	hG9KgOVnifzWGGbKxG1ZIyTCpI0Gcw==
X-Google-Smtp-Source: AFSGD/XkQvsVtDXBql9xmihbrasN8CAe+wH54eCdOxhKq5afjdBbl5Z7KGRHFABt0gep3uJEEGJ81w==
X-Received: by 2002:a50:ee1a:: with SMTP id g26mr47862524eds.266.1546674600838;
	Fri, 04 Jan 2019 23:50:00 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	x30sm23700017edd.30.2019.01.04.23.49.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Jan 2019 23:50:00 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Jan 2019 09:46:45 +0200
Message-Id: <1546674405-10061-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-filesystems][PATCH v3] fuse-exfat: fix multilib build
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
X-List-Received-Date: Sat, 05 Jan 2019 07:50:00 -0000

The PN in S causes issues when expanded in multilib build.
Using the default "S = "${WORKDIR}/${BP}" fixes the problem.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 99bf2be..18fc9cd 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -17,5 +17,4 @@ inherit autotools pkgconfig
 SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
-S = "${WORKDIR}/${PN}-${PV}"
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.1.4


