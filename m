Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2CE78F60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:20:53 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id t25-v6so2219898wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=32UyquyU7woRr3+dH8BU5jtLAnq+L4XonDDTFn2X1xk=;
	b=e9HT0DN645+NQ3dZMemWM690ArJbyfJutHIKSF++9wtglVvtXtj8+yxfqGwA9Rg5aS
	3omYVH6rDxat4qBKpHKrgvGUISVRrivAAdR8Ax4GOKUXqZ9Cdhj8x8mTfe2gtNoCbLUy
	K8TAfHgTajrOC7K9pdshiBTOhAUhUdq39UlcitJGOi05Pol8nmvBIVTLFWbUY9GqO/iT
	OnBx0/P1Meob2ig6Fk4GdV6lrUA4ZbhAgRNpIl1akdlQ/glj9UPKqC88DlL5GlTwVjmn
	cJCRRv3EmG7gMc6Q0eAvVt6C5XeAUx2awl+2Gel+W2ALCOyFDsmQ+Sv1Nht11fWhWVja
	Dtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=32UyquyU7woRr3+dH8BU5jtLAnq+L4XonDDTFn2X1xk=;
	b=OmIfl/r8D4bFaaoyg8eGHSQumABgankUIucBTj6komzDnrdecDQ+PC4dk/nIXgKzVr
	v8VHtgf0DtSqpbvbBvN9t3y4NUa3AQ7NIcAiHDSShbUU3H0DSCukJgdCeRP+HDrpYRis
	IsKw4pqNv2t6RqBo9KhtE2F95Z7dhiFtENsNPaalesoVQG1Zp8CdKI5AqwIB5xXB84F7
	HFsiVMCwOX7U46lOC/iedrG/iqYZrfhi/y4BNtw32ShgLGA4QGkNXYNnmAQzVuHp3Fs3
	u8sT4hUR3uDR1qnxltZ/a98ipULr0KElPB35EIS85RI/q5qQMbMuh9bWC+eSEv28/Ov1
	TKow==
X-Gm-Message-State: APzg51C+/aIkjkZsZ/WCfBw9LXsSQEJAev4BKKMJf19vdbhvdiMz+XW6
	N34jvrlWbWDUd7fox8a59ppN8aag
X-Google-Smtp-Source: ANB0VdZS4ulkcXJ4L6I0aNgFoRaj3yNgnFKN5DxGmLwoUc1CqEY1iz0RL+5bpeQmWvkH4gX3We66yA==
X-Received: by 2002:a1c:dc8b:: with SMTP id
	t133-v6mr1498385wmg.108.1535466053729; 
	Tue, 28 Aug 2018 07:20:53 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	l24-v6sm2479988wrb.65.2018.08.28.07.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 07:20:52 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 16:20:41 +0200
Message-Id: <20180828142041.10189-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH] python{, 3}-protobuf: Update 3.6.0 -> 3.6.1
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
X-List-Received-Date: Tue, 28 Aug 2018 14:20:53 -0000

Update recipe for python protobuf to 3.6.1 to align with
protobuf.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-python/recipes-devtools/python/python-protobuf.inc       | 4 ++--
 .../{python-protobuf_3.6.0.bb => python-protobuf_3.6.1.bb}    | 0
 .../{python3-protobuf_3.6.0.bb => python3-protobuf_3.6.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.6.0.bb => python-protobuf_3.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.6.0.bb => python3-protobuf_3.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index a1866b351..b617904d2 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "074abcceee0d795ba34ad6430f71d0e8"
-SRC_URI[sha256sum] = "a37836aa47d1b81c2db1a6b7a5e79926062b5d76bd962115a0e615551be2b48d"
+SRC_URI[md5sum] = "e2daef80e70249aa1f05363670c6b3f8"
+SRC_URI[sha256sum] = "1489b376b0f364bcc6f89519718c057eb191d7ad6f1b395ffd93d1aa45587811"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.6.1.bb
-- 
2.17.1


