Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id D81F9719BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:19:58 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id y21so29954211lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 05:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=echaqsCswH8mv3U8bjsrUWEhB3scicVscowkU+KhDi4=;
	b=AKdfD5jYEjpbaoYLT2weFjH/iSJs2k53evocAXessGa++dGdV+YCKOYJ7Tsr+3qYGb
	JSgQtzHAnyT0+nUF0mgy+SikVvDJqr0nBiH/n+d2Gd9mRONda29y4EXIwKDlj10kBCGP
	Q8Lu81d4ecUgEIuGJ0pFc7/1Xc/0iMEyrSEWGfg0TEGzSsfSuF6ljXAndjHxw9fPb6cy
	0eXayt2uyXHpiyKR99oBk+3b2mSmvXFaE6mxZHbKLVHERsxJdPsV907aOYGZLxLKDFSu
	dtYL3LQSCEgZ4ASjZnQ9TqJaT3eZl6qH8oWAe4Mm7sXrsWqmzkYoURBsv9yxn7cXRr2Y
	v/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=echaqsCswH8mv3U8bjsrUWEhB3scicVscowkU+KhDi4=;
	b=WBjYp8LTuh9fBQ9KvuSZb1QU0GVqdn9w67mkPgGHeC5EHsWgTj7cZdd3VYFmEjVxbL
	9xQiwpH1BlTpsmAhJzoHe39cv4KWFVTgnbxKnS1ERN9/4g6VfH2ZjfBUx7Ac1aZ5okB0
	38Ah+apvxx+maFUu6a0AHyOviticY4Ht7ih+PNKlKZK4lsJVmhIhTgLXdaADj2GON238
	GelvQCTXPIUle1DoysYBe++7TQX1FzQSYnKsJqhynNgcV73cV3YHlvbuLSIIBG2gwUMd
	Ru/d8fB/Bfb5FCfHZuoZMEwx93Z90x9MZGNsD7AKJI0sqNjW0UOXxq2xqTi/TyT0xusX
	mSVQ==
X-Gm-Message-State: AIkVDXIHO4zChTFHijliQR/830JEc8hLsV7fJkZRzpB8CVlntzX8i081Ym1OJ2GYO4oEuQ==
X-Received: by 10.25.193.194 with SMTP id r185mr8727581lff.103.1482931199085; 
	Wed, 28 Dec 2016 05:19:59 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	137sm11902825lfz.2.2016.12.28.05.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 05:19:57 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: martin.jansa@gmail.com, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 14:19:53 +0100
Message-Id: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/4] gflags: Fix fetch URL
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
X-List-Received-Date: Wed, 28 Dec 2016 13:19:59 -0000

Fixes:
ARNING: gflags-2.1.2-r0 do_fetch: Failed to fetch URL
git://github.com/gflags/gflags.git;branch=master, attempting MIRRORS if
available
ERROR: gflags-2.1.2-r0 do_fetch: Fetcher failure: Unable to find
revision 1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c in branch master even
from upstream
ERROR: gflags-2.1.2-r0 do_fetch: Fetcher failure for URL:
'git://github.com/gflags/gflags.git;branch=master'. Unable to fetch URL
from any source

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
index b5e0597989b5..da82599c7f1c 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
@@ -5,9 +5,10 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "git://github.com/gflags/gflags.git;branch=release"
-SRCREV = "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
-S = "${WORKDIR}/git/"
+SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "ac432de923f9de1e9780b5254884599f"
+SRC_URI[sha256sum] = "d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662"
+S = "${WORKDIR}/${PN}-${PV}/"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 
-- 
2.11.0


