Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC38F70100
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:36:31 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id f188so142912223pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yxqwK92+YFRxjrgSVEIgs+g6HJN8I8jj+sB3k+/5T6k=;
	b=tqv//Z821lwdC+JTI+y549qHIUF4LDhG5C9Q+dtECFVGHiIDbb8OXAiJgCLkPh3WCC
	N6w8/CdQzUtRgxaL6Wz4Z8A9pwWn/0Wlj9wbhLt7X6nnF7FvE2Ooc1W6YMwPalZ8tv2t
	eVdwoeY9SZp7/d39AbHFB9A9w7lhJdKzCipofYI4mHC1zHEL1Lih1smaNygZajF11QFG
	2qpfjkudrlWhFhI1ObDB3w0EWVrQiST4T25RQu83m6b2VdKaG7YUI1zcnjYGrWXnLc1r
	cMYVYBTh+eXt8C/Kknw2dn4EyGv01Y9ksAXyZP1QJoLCsP3PRHaH+t2vSn3yMcdvxNfY
	OGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yxqwK92+YFRxjrgSVEIgs+g6HJN8I8jj+sB3k+/5T6k=;
	b=aFNTZFUeAux4yaOOxZVXOFGdq9ThbwyhY7CmMQJ/jI7uo/5I/0T77lcycJ0Ez+DNJ+
	jql8//uAFqTgcZwL1kFwynN+UfL20a8pa9Vr5F+8H2h6XODoZwso4megRipj9oNhY1tV
	IO9H4aEq4IoBg7NISMyEcCtF19jtVhIuO2tTXT1X4SDGwua7UH7ic8004MsY9/80pF7a
	bFf8xH5BdXCsxrQfSWyQIkeBtmeRnr/gQE1LwKP0QYn57STEMeUNdLjkm+XdjliPsaF9
	GHRCyBxNU7fjBeujvC4vPh+qTxMnisMFbUT5v1UWqM7e5tA5NmnADFETTk3avR6/UIoz
	jKdQ==
X-Gm-Message-State: AKaTC03jBOBAbCBiC44DUZcj/E3jWUJTXEAVxRFaylpDCwaEa59UnhKpdAyL77007smYAA==
X-Received: by 10.99.44.84 with SMTP id s81mr107817886pgs.153.1480991792767;
	Mon, 05 Dec 2016 18:36:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm30357837pfu.17.2016.12.05.18.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:36:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 18:36:23 -0800
Message-Id: <20161206023625.12901-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161206023625.12901-1-raj.khem@gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] liboop: Add recipe
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
X-List-Received-Date: Tue, 06 Dec 2016 02:36:31 -0000

liboop is needed by ruli

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liboop/liboop_1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboop/liboop_1.0.bb

diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.bb b/meta-oe/recipes-support/liboop/liboop_1.0.bb
new file mode 100644
index 0000000..1af228e
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Liboop is a low-level event loop management library for POSIX-based operating systems"
+HOMEPAGE = "http://liboop.org/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
+
+SRC_URI = "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_${PV}.orig.tar.gz"
+
+SRC_URI[md5sum] = "36cb971047d3af02369446f5e0b315a2"
+SRC_URI[sha256sum] = "34d83c6e0f09ee15cb2bc3131e219747c3b612bb57cf7d25318ab90da9a2d97c"
+
+inherit autotools pkgconfig
-- 
2.10.2


