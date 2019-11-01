Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id D002A7FCCE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 21:22:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c8so7250442pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NJ1YL+qvPRCvvWQrZUwDyjjy7lp7hoBDouSVx8yMYWQ=;
	b=CJNiDsWwbuytHaF69WFdkGlA1Yp95NSBbQKB69P8tnWzt5oCVfJZS/4XoybUpQI0ws
	cUa+kYnz0Uq1dkiK34/HvgsURmH6RvFG3D/Wot6Ka4jbEbxPtOOERKhoeImDX7jIyU63
	SCuSnt68FSRWjyb1klXl/lffj2dGZgD/ewwW1sQKFC1P2C39khO5xYWuTws3WqQiww2Y
	XQy6QRzBrcLDo1Y9uhxLW/r/OwWpxDgciP7qMb98T2QwWe420Ayw4Qw+4IwYYXFJd/vq
	qNXZChIh2dlyPXl3r78tatUe2MBSuKDuAQj8CkX740Jc0ftp/tM0mMnxdahXoYX5Ja4P
	nWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NJ1YL+qvPRCvvWQrZUwDyjjy7lp7hoBDouSVx8yMYWQ=;
	b=nOjLE+J6dQBjB36MNUmTBBuGaOa1BGzW0YynHIDMr2DLoVTFGZbLPdhqAGDMzmFDT0
	MONedWvttdBQnscjU+ZANW8LhlFLupvE56EfFJhpZdUyD8UuU27+7IOQyaBjQbnWZKA7
	rI9/wQ+rOCod8LZ+RkYLAwaakRxh8CDop74DaalVHrob0/Svewg3ORLu4YKV0PVc0wys
	ZMhZ3h7goBXytx2raGb2eEtFmJ4R9q1bUOoiK6/ZDy3wnNtJeQEmrBOfN0QnJjINTYJA
	BznZJbmzlt0v9wqxVdCUBzPv4jyRevj3GOP2wFkJsqxKTf8vXR5FpKvfyMuDm7vfhXUI
	QE4Q==
X-Gm-Message-State: APjAAAU4xeTWp/5mePIpGnkYaO65I/ceTrW6/N6trF/ILls546HZnGBs
	G9rYYsHniJUlHo6tZrqIwhfDh+JvPqc=
X-Google-Smtp-Source: APXvYqz3EpdcI0U3r7sOe/IaZOegsworubiQmr6Her90FCKb7Iv1jzprvlearK+atWwxmST4TqusoA==
X-Received: by 2002:a63:ff1e:: with SMTP id k30mr15371701pgi.273.1572643341127;
	Fri, 01 Nov 2019 14:22:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::f974])
	by smtp.gmail.com with ESMTPSA id
	s198sm3307530pgs.81.2019.11.01.14.22.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 14:22:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2019 14:22:08 -0700
Message-Id: <20191101212208.2299017-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] miniupnpd: Build config.h before full build
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
X-List-Received-Date: Fri, 01 Nov 2019 21:22:20 -0000
Content-Transfer-Encoding: 8bit

This fixes a race condition e.g.

testminissdp.c:15:10: fatal error: config.h: No such file or directory
   15 | #include "config.h"
      |          ^~~~~~~~~~
compilation terminated.
<builtin>: recipe for target 'testminissdp.o' failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
index 595e211ea5..81bfe66a9e 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb
@@ -26,6 +26,7 @@ do_configure_prepend() {
 
 do_compile() {
     cd ${S}
+    CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux config.h
     CONFIG_OPTIONS="${IPV6} --leasefile --vendorcfg" oe_runmake -f Makefile.linux
 }
 
-- 
2.23.0


