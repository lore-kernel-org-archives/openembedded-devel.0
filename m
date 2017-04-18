Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 389E471C72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:08 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i5so128623pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oo3LztmdZe7Sbc+1HWfmGR/acih40awghtipmOYB7Zg=;
	b=UxrWFicxZAWkO1wpGOyZCTflp78GtHdyjd5Wwnx5k2f7rvEYwTzqt3cU1AtGeLKHLN
	ucWjuaWmaDb6S43DCahOAANFxVgW1A2ZZOkFZvHyLsrlcyYZPOTUQf1HkiuK8NjJ7BbC
	dPBw5eM8lqjQkd7ZbgMAp8hoMURfvI8GHHIOFjeRuuO0btQNztUaQoV+/F3+vXve7rVn
	AYGj72O44iYZvIM3JOqdRfS0w5EXNj8AabSDD8H7w725vOgj6zghxjzrsNWQDExvTwMA
	ay7HuwpO/ZN5h8uVpM99LT9kLo5WL90Cm9YFasLJ8s2Ti8sWCHazoQ+3FbSF0Gb6QNQS
	kbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oo3LztmdZe7Sbc+1HWfmGR/acih40awghtipmOYB7Zg=;
	b=oXNwAu96tleYp4bf7BYLJswnZNvXzZtLpsB/2xyx9tSrNPmwmULNBM9WNrAZw9pFu6
	IVUPBgedQLrj+W2PwWU2xZ9MgJYAsR3pc5OtzN2PlYdRfz2Jbf0/cIH+bA6yJCSmLSAY
	Vmz20YYGOGTxQk91nvGIEhYVSgEDSs8oW+uolTBohjBtg7eRMwodnvI985hJ1ZniIwZJ
	ZhtkvHjtv4Mv7+f7YSC/hYF4YYv3oJdrUuVOwBnT3SGZk0knBoOQQBM2BVT9qjWgIbkA
	UiRB8JDB8vjq63gvvrHQtrg6TptQWybzKHWlU9oxGHi33LNCdxU3wG+IldBchCD5VcDx
	6AdQ==
X-Gm-Message-State: AN3rC/47yfpQu7uc6JRCV345RGz3HDucASJZL66tuH0hBZtiz4OyPZnn
	rrEgairYCkQaZg==
X-Received: by 10.84.238.195 with SMTP id l3mr25261201pln.101.1492539729889;
	Tue, 18 Apr 2017 11:22:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:22 -0700
Message-Id: <20170418182142.27253-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 12/32] ckermit: Fix build with musl
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:08 -0000

arrow keys piece is a bit unportable, disable it for now
for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index 187a57e6f..61c08ee27 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -24,6 +24,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 # trying to look inside the stdio headers.
 CKERMIT_ADDITIONAL = ""
 CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
+CKERMIT_ADDITIONAL_libc-musl = "-DNOARROWKEYS"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.12.2


