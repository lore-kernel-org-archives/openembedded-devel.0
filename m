Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1269A60586
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:21:41 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id r67so4477498pjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=113ppS9gKG3COFVz1lB9Dr5BeLc0pZnLTNb9WlcJdOM=;
	b=o97i1VcPvGLOlwAAE9C+uQ72yBUICnpoolAz94rcuC21CC0CaqrtAKhPvf50jOPuPa
	qUjLUrXYBnS13hj86MECOnnHnzQHMd9wQTQ+flk/I8U5VDp13XKo7ZhvkfVD5tRcY1/g
	b+AEFcYJYR6oIWHgAyPcwHB0P0H72qcc9t2pC8D1La9Gx8wNopDdgM8I6klXKidhitN5
	FF9c5Kb2kXB7nriLGxy//yP/CPKo8WFSfxYnkhhdROB8eVZWPyf76ol1azUVEG7t4o+1
	5riX9TB5FbocPjj+f/PcrB+TzSxt4/JFqJZqLk4N2XR2WxcxYYwpJfKIi89MH2c7Iirq
	f1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=113ppS9gKG3COFVz1lB9Dr5BeLc0pZnLTNb9WlcJdOM=;
	b=rDrD7WXsIAWwKi5GqWxjjD9y/GvEEzgy9v/ytK+NAqxl79WoJ3ljRG7foyR6O97V7S
	X6TrStqiKCTyK26skFbGDAu01wqu7AjnLEKUR6wS4mLaBHj12Yw8YFHzxAUHvqo3+8+p
	dVY/O860rTLJQCNoHdXglWL17Pp6ybRS9xje/LVUxNo/nxU4liokyETmnYO3gWT9Bkdh
	JMgfVjoLlpbqEbjJOa89L5TIHsiLcJNTn+1/AL0y0rpRVaDTjajuRIZSh/F5yIpzau29
	wBxB7PsjlYzMwmvpMT3lZPbya1r5b6Wq8WHn77D4pNdJT1SkFuVM82Sgarb/TBnV9zTL
	qDxA==
X-Gm-Message-State: APjAAAWkKf7WTN2qyrnbX6bRtbHHewqSMItDGv4ZBR5d6r1Iyefvc9P6
	ocWkCrT3aNny+HO3pgLzexR3Kiw2EJo=
X-Google-Smtp-Source: APXvYqwINbdbtF8b1NELi/NKTBOhJ4xEWF2pl5WKbAcOPWRnjhpZO5Z8Oi5MEtvby0wy6C/GDgIKlg==
X-Received: by 2002:a17:902:8bc9:: with SMTP id
	r9mr5475287plo.48.1581722502659; 
	Fri, 14 Feb 2020 15:21:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id k70sm173585pga.75.2020.02.14.15.21.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 15:21:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 15:21:38 -0800
Message-Id: <20200214232138.3340484-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] image.bbclass, package-index.bb: Delete do_populate_lic task
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
X-List-Received-Date: Fri, 14 Feb 2020 23:21:42 -0000
Content-Transfer-Encoding: 8bit

These are meta packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass              | 1 +
 meta/recipes-core/meta/package-index.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c2824395c9..07aa1f1fa5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -609,6 +609,7 @@ do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
+deltask do_populate_lic
 deltask do_populate_sysroot
 do_package[noexec] = "1"
 deltask do_package_qa
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index a4123b7622..98c5bcb372 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -12,6 +12,7 @@ deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install
+deltask do_populate_lic
 deltask do_populate_sysroot
 
 do_package_index[nostamp] = "1"
-- 
2.25.0


