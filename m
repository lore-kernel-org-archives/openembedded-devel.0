Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBB471A5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 10:59:26 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c17so15746248wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2016 02:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vemwV2TEtwYkwzylRoDhBH0I5StkZyKWeWA5Ro7buuU=;
	b=GmrNnfJBTPkK6CSoOlhjNhK+IvyCLn6WHvMz7EsX/lGDuiM3K8b3dxjLEHpy8hNjC3
	EDOBJv4asyukiywQaiq8i/ompZv4ufBULr8HW2y1hs0TuskhxLBaXjrZtx0gMKXReUWH
	5kVbuKpbESwjRNXXT8QV4KUAl2evLmV6kSXAqMh2KaaK0YZxulTcM5WLYHKPYBNwooSc
	U0ht4Jg/t9c5qUwWfDS6u4w6azeFZQP4E6US/lxKPZYZEpW9v9UOwgi+rbRRJjk0HvsS
	R0Cj8ZG1Np4eDOiyqBdLsyRfPUFBqtzXRJhm6lhx8lOvZqZH17ZA81OrQUkvgsS7315k
	aRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vemwV2TEtwYkwzylRoDhBH0I5StkZyKWeWA5Ro7buuU=;
	b=O1v1R0YXWmOxGqZ2Cdq+Obnj5hy3HjgmFF6jNJXe2LB2WyZUNQmACxhwKjqgyGZrit
	95JLfe493bg8L25EaYQ2MbwXhtorr4cXmAGxP5EYTJkym00F864o8W2ZJsIz51tILXMp
	n5uLh/ngwISEbOmMiVbc3+yNj68fAyQQePsITj/sW3niHp6clv9BvRFoUPqvkWZBbYE9
	Bu92k+dAcuqQkCyGuU9ujLZh55662I6HRhqS3CHykm4spZwcXAWwWZd+ojBMPFSCzTu3
	j77khdx99gevfmZZMsZRL6EbPPOzwxRnsUDc/OILP03qikos9bxhUJOcz+wl4ORAbBgx
	PB9A==
X-Gm-Message-State: ABUngvfmyYgcuOlPcIytneP79ctLQr0p1FiZYw3zQh4Dwxo0JEVPXq4T3Y3Mfl2TGCvz2Q==
X-Received: by 10.28.211.71 with SMTP id k68mr8182696wmg.21.1478516367250;
	Mon, 07 Nov 2016 02:59:27 -0800 (PST)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id d64sm6792209wmh.3.2016.11.07.02.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Nov 2016 02:59:26 -0800 (PST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Nov 2016 11:59:10 +0100
Message-Id: <1478516350-31751-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ref-manual: fix typo
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
X-List-Received-Date: Mon, 07 Nov 2016 10:59:26 -0000

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 documentation/kernel-dev/kernel-dev-advanced.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/kernel-dev-advanced.xml b/documentation/kernel-dev/kernel-dev-advanced.xml
index 9e15f17..ed982fb 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.xml
+++ b/documentation/kernel-dev/kernel-dev-advanced.xml
@@ -256,7 +256,7 @@
             When stored outside of the recipe-space, the kernel Metadata
             files reside in a separate repository.
             The OpenEmbedded build system adds the Metadata to the build as
-            a "ktype=meta" repository through the
+            a "type=kmeta" repository through the
             <ulink url='&YOCTO_DOCS_REF_URL;#var-SRC_URI'><filename>SRC_URI</filename></ulink>
             variable.
             As an example, consider the following <filename>SRC_URI</filename>
-- 
1.9.1


