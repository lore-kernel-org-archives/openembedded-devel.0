Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id D2ED8719CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 09:20:50 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b14so190695855lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WA3FmyX6Q0ymD2SuscjMa5FWxsSwVmD5wFWeYKxQZIA=;
	b=wc2Rqc+tKTbNEBLQ9DwvY3HG9KPuBOVHm5Cq7KdRtTnHZKWkXPZKAJ0scMsOiFA7um
	ZXmAZ7H/0VLRZQQYel0RGfx7lC4gtNWX9TOYdixGbeuqAWG4Zw7bznFrtDu1TRaZKpD8
	AY4rWvT6aYf+1BxbPHOFoE06QU0UsySUa+nUdFLY9mwNcPb1uQDd1nSJydE9YR6H8ijM
	Ke2L4M8/xDwhFG0HbTJmI6NrXK2BNNNkkZfwXkcfYlclZ3EYPDdyXTfACZni3NSaW8c+
	XpjLrv903bKJda8LbW6Qtn/cUwr4OVwLdQftS1waBeXCYhQTuVyExZ6kXWNs21XMwwr1
	NVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WA3FmyX6Q0ymD2SuscjMa5FWxsSwVmD5wFWeYKxQZIA=;
	b=EvPqYhNIU/cK+70JuQw2n/M2ySl1J/Rl0pdDEC19g5mapPLAMfN6VvP8QZNaU7QBcn
	Yq25UIHRnz/hv8J42aBC7/GJWfZkZFChZrzTMut+Mp4sUfXalUMrDfn3EivZpZONIITV
	SF/ToHvN6IJ0m/3IMmzXpI6Xo02WhnaPB5e66Emc1FFCnzYYTfgqAdnvKo6OGoKC93Je
	WrmVtyQc/WThURndFsgoZNEIf+Hvevto91VkUgUOGF+1Z+ZK1vXUa7bsSUZYS3xubDs5
	NEEwYRGxpgY8nLfUkaq9XJH9xK0m01t1xdgyDwsJ9JUs7Gx6/cWLxvGsBGvcpcvDoMb7
	pXjg==
X-Gm-Message-State: AKaTC00Q3ncRyX93a34eViK1x+x5CMQzpXDJzpy3LnoWwWfg5WAjKSHUlli5KCbv2IEVlFsJ
X-Received: by 10.46.9.21 with SMTP id 21mr22180907ljj.0.1480670451131;
	Fri, 02 Dec 2016 01:20:51 -0800 (PST)
Received: from gordanmarkus-XPS13.IHU.local
	(static-212-247-53-108.cust.tele2.se. [212.247.53.108])
	by smtp.gmail.com with ESMTPSA id y10sm636939lja.45.2016.12.02.01.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 01:20:50 -0800 (PST)
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 10:20:11 +0100
Message-Id: <20161202092012.12438-1-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 09:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: gdb: invalid PACKAGECONFIG: readline [invalid-packageconfig]

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 recipes-devtools/gdb/gdb_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-devtools/gdb/gdb_%.bbappend
index 3e663e7..41592c4 100644
--- a/recipes-devtools/gdb/gdb_%.bbappend
+++ b/recipes-devtools/gdb/gdb_%.bbappend
@@ -1 +1 @@
-PACKAGECONFIG ??= "readline python"
+PACKAGECONFIG ??= "python"
-- 
2.9.3


