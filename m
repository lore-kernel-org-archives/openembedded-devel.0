Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD2A37F316
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:48:48 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b3so37482640plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yTs2b9vV4R4rswWIbAvkR76E6nxWsy0sOCSiSHg5xts=;
	b=Nm35KZW0hJ4GLkdmw59mvKR8rhXQYVz49sRklKL8rfmR3EVFlOHmGsxWw4tSAnoIak
	NUdx0x6SWo1hfAzrKrP7xPyp+r+6rRB0GGRqEctIvL+xgb62mv2ODVNxafc4uF71YI+E
	2z5TB2HxqU+MYUewXtLsYeZmYun8EQzChH9I03L85QdwVOGnz48mbQuU7XjHCtRayTDs
	VchEbQRiluKWDV6Qnp0MZC3peqMBbCTobzEBGEjFsZoktqh0C+WN+41TMHlkuZisjQ6F
	v+Rz13E//Dh+I7TrqakrSZYg9i06DHolXUOM3pMQ3OzDFkh/IRM99V/eja/Yajf3U3qZ
	MRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yTs2b9vV4R4rswWIbAvkR76E6nxWsy0sOCSiSHg5xts=;
	b=lxK+gPlM5lJBHjAMT8zkGo1DcfN9iP+GitbrXLhLm+J/GptjqnPgsjei+fY/Tm5jG+
	b9HM8nAJYoicKib4543TOaN08SpFOIwGk7acxJgZiTsc4hyLOQSiYh2zZRxqhJANappD
	SYyasGxuLPnsLhAFZIhnISzhVjR5h96n5biAHsro1xlG/Fz7S04JPBYKCfVo+1GVe5xu
	dfoBguyBgj3mU80cYoRPMm577cuheF97dE0UwEQkQZcMNV9IJrl7ElC68HaqocsX6Tml
	6QzA4n8rtCfpWLYUwh+UgL6R51r4qs4zBQcDKH9qWpfFRbgKB/0rX4QzeIcM98m8WdUM
	hN6Q==
X-Gm-Message-State: APjAAAVpeTIc3Ev29XVkj8wuarFLq5folHTPaBpgzZMLtV8kd/vaUE94
	daOrI95mdPGfuLmKuqQzBG4Q+/6WE5I=
X-Google-Smtp-Source: APXvYqzgMyqJV2z1GODoFVG2u+r0nk3E8w50wKxjMqIxpoTYU3l/E0fBM7XRqcLcqV5sG38rKMa41g==
X-Received: by 2002:a17:902:4401:: with SMTP id
	k1mr1634598pld.193.1565074129563; 
	Mon, 05 Aug 2019 23:48:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u23sm89377775pfn.140.2019.08.05.23.48.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:48:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:48:35 -0700
Message-Id: <20190806064835.33856-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806064835.33856-1-raj.khem@gmail.com>
References: <20190806064835.33856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] kpatch: Pass ARCH from environment
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
X-List-Received-Date: Tue, 06 Aug 2019 06:48:49 -0000
Content-Transfer-Encoding: 8bit

If not passed then it computes arch from `uname`
and uname will be wrong on cross compiles when target != host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kpatch/kpatch.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kpatch/kpatch.inc b/meta-oe/recipes-kernel/kpatch/kpatch.inc
index cd819f31f8..e6c4f64ce1 100644
--- a/meta-oe/recipes-kernel/kpatch/kpatch.inc
+++ b/meta-oe/recipes-kernel/kpatch/kpatch.inc
@@ -16,6 +16,7 @@ EXTRA_OEMAKE = " \
 	MANDIR=${D}${mandir}/man1 \
 	SYSTEMDDIR=${D}${systemd_system_unitdir} \
 	DESTDIR=${D} \
+	ARCH=${TARGET_ARCH} \
 	BUILDMOD=no \
 	CC='${CC}' \
 	"
-- 
2.22.0


