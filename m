Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 301E773219
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:06:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so12986506wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2EyOWBWN+nwlIrsjI0vIxKu6ocWvv2NCVwpkicaQP/4=;
	b=Bgsz7i3Puo9s22/q/6nGyUzxwqG/Z+KU7s9guJNrWqY3yH0C0y39NmaPsypN+9lLQH
	76YxmHsXut19d7VMHatmQYsxP+wQhX1Mk2zmTJFC8f7BsGl0SKfM5S72t32nnS2yv4RC
	oElEa+frO0bs9PCRGpbNzwCYWiCJP9oPmKU8BU2xoQ/Nl51JMUbYt8rS+8rQhHIhHHzD
	nptMNucHv415gnhf38NmupfQRe/1dy+S3Dr98K0zGHjaybHiE4x+313HM576fQDKqyr5
	XFE0ufHUU9hTkArYPHUlhPc5OEIz0dBZXabm+Z7fUZ+47c508x/TEF/OXJlnDIT8Qd0c
	R/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2EyOWBWN+nwlIrsjI0vIxKu6ocWvv2NCVwpkicaQP/4=;
	b=c5kCzT/hi1BVgbvnUL0NuMA4B0LjHFDTDmCabtt6ON9hyvCltwM57X/pjhb7FiNNFc
	bACrb6Zwa3bNewyKg7XI5/aI/XOunggVdNO9zlVvHqO5VJAPRlu/Vx4VDjCH4znB/cUI
	i71gDjfGgoiAS8+Ww9Jz3u6l/39Rafgly26LfYKUD9ctwyfx1kR9vHpecriK08dzRmgF
	ea2RUGzVwKPUEZeVhxKEkAmuoDdXN85Rtd91fw3SENRVHG0rSYimBoFvMI+zH3HcTvaY
	uhAIBr2r48/McrJf8mvKRbLe1b8YqHC3V6ufHUm1/nsunSQwEppckQBH/gGOAUYcji2y
	qKSw==
X-Gm-Message-State: AE9vXwOMzoAhNbXiTNOKpZW4y2PiBCgDvZDGev1tKmWHvQBuiRYH+CwEJzwn7CbACaAVjg==
X-Received: by 10.28.0.132 with SMTP id 126mr771978wma.88.1473199591216;
	Tue, 06 Sep 2016 15:06:31 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A5F.dip0.t-ipconnect.de.
	[91.10.42.95]) by smtp.googlemail.com with ESMTPSA id
	vh6sm35439126wjb.0.2016.09.06.15.06.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 15:06:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 00:06:11 +0200
Message-Id: <1473199571-5379-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] glade: fix typo introduced in last patch
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
X-List-Received-Date: Tue, 06 Sep 2016 22:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch b/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
index 5880ea5..f735ff8 100644
--- a/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
+++ b/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status; Pending
+Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-- 
2.5.5


