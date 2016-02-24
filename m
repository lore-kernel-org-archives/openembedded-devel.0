Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 436AE7723C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:59:17 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c200so268260988wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3zVr2HT9H1+rgefXQ/CkT+Vyd3PqE1bx09rd3ptAEHw=;
	b=cZLFqO2wNwKP0uHkYCoo45ikc4pSc4pdOJ3G5QgHbDoXKCU9em7237i3HzmtYRrVE9
	W7gCgAFhT3/B2fur4QPWd4hbMeRdyEQ9yS3eDsGAxXXlSvc1Dz1VxVi/OOYIkuuD6j9k
	ojp4TIGhC9UafJHYJoKD1PeM1HmpEdvx8ipXMczJLk5RAM+GrXAa6NJs/98VvMU7ZOzi
	jbROjFlhu3pxlCzndRKjGi9erRirBVT+lLfZFJ0R4GMCZwQ19GfTVJJHAfNmgjpO7sy/
	B5pSsyEc1nGuBnLzBjC+0StYu+j6/P31xMuM4APic8N8iRCJyP9D74cnE48CEG7OHStJ
	UHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3zVr2HT9H1+rgefXQ/CkT+Vyd3PqE1bx09rd3ptAEHw=;
	b=jRDTFAkPLuGKnt7zR2WTvlOjpmQkOAFpdaP41StYjCgl1HPMYUeoFK8Z0UwfkwXJ3H
	wFQfwhUvE8BcK1a4IhSv8Hb1KqBykcXkH3EPaak8xgWIFHo3DK3+1o+aRwlGjZ+xcOwM
	+4D6rvuiVo2MvGepmBxEuNs1+/7OmxqvLVKXbx+zUA801IJhlfG1XawnEXmlb5dAutMD
	9x42CILyyQrQjvlLBv1koySSPcTIEWh4gXhAEYSFP2ohGhdeJfkyPpdO8xVHPMDCIbvI
	0pW5qPXjcVwChctAphlCvPQKADdO7x62kdGU50Z63FhBz1F0zDn9EvHDIEqVmim0dKni
	DbXg==
X-Gm-Message-State: AG10YOQDQrPOHpvQ4tLQUfgs/LHdIDByEYxwyYhI4nsxKjIUJX31r7tgIzDpTna0m9vBKQ==
X-Received: by 10.28.107.140 with SMTP id a12mr25508437wmi.77.1456318757795;
	Wed, 24 Feb 2016 04:59:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm2969177wjz.4.2016.02.24.04.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 04:59:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:00:21 +0100
Message-Id: <1456318821-12386-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-qt5] libconnman-qt5: Blacklist because of connman-qt5.pc
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
X-List-Received-Date: Wed, 24 Feb 2016 12:59:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
index 0fc4bc0..71c04df 100644
--- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
+++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
@@ -15,3 +15,5 @@ S = "${WORKDIR}/git"
 inherit pkgconfig
 
 RDEPENDS_${PN} += "connman"
+
+PNBLACKLIST[libconnman-qt5] ?= "BROKEN: QA Issue: connman-qt5.pc failed sanity test (tmpdir)"
-- 
2.7.1


