Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 30FD77E9FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:48:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id x15so1134969wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ipXjhSOAIMeNxv0AwvBV8H6OypRMrZkUIHkBqyqh3NI=;
	b=fRIZO+KyDUCWRSU+cmYH1LN0aFjDml9MQh7PYyJ5auxlr7UAd/Znwj+bVTNOiZkIK6
	XLyXoWzdGVTk60RMCmvgaZXgiBDgSKtvoB2du3+pEXCkfBBPHY5GSvM9FYITAomfP73f
	liFqZxpMsX/DhgfQIrUiBt7NJ5/9/d8YOCeWGaAhZ5PAKE+uRzP9S2MhkF+XQcLiXy8E
	agPQM09VzVzeCP+zAn1PSwX4Ol7Unb53EDgEkT4zCowA3SiwR+RyPmV+a6wojnNThMGw
	6mMW5hiOC9rzR2vnjHk5GnvcWu7ndHHjBSFfA4pBfqQpLv3cvd3pqsZuFZ6kn00zT0D/
	TKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ipXjhSOAIMeNxv0AwvBV8H6OypRMrZkUIHkBqyqh3NI=;
	b=AKmTF5AsbTkOMVACM7mCtcypqZJh0qbZadA3egGuw6IjbyANDsbCMChV5rYZf1ULE9
	Ihlx7VjrslLffnuiPbMLqyRVA4TYu2sEgBh6pEgGI9G/17dUw1U5a1L7+QjXrk7XJrvU
	NMLLca2/uNfYGNQ6nsPFXHGLrRq1m4KSfHXHj4M0J8Y/6twxKNVYCflLuqrkfAeF8wq+
	9mvDq3phaRoAgE9kVLdpd+HeqMXnC/BeasLfieGJkn6xzqVDOY1NA9OYd/s9OSMJbjbV
	OCKZ1zYQd8FHm5re8XWgjcPO1iHnozeGKcYzK/UGET04iWi4YvXBBs6Xgp91tIHg3pcI
	6G+w==
X-Gm-Message-State: APjAAAWnCtReO041lLML29IG06Fslmmli60mIRVP03rDGmFOvlpVVNbe
	RG37A7PifH6t4Bg9RmDEcOStGbqk
X-Google-Smtp-Source: APXvYqySR96wBj/S5uc++2xPlx7VtK33WsEnxi8LNNB5XjOJaBRM4tMgDBGt1zLuWKouoaeY/8TKqA==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr3644071wmc.16.1562078900635; 
	Tue, 02 Jul 2019 07:48:20 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l124sm3425336wmf.36.2019.07.02.07.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jul 2019 07:48:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:48:16 +0000
Message-Id: <20190702144816.7520-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702144816.7520-1-Martin.Jansa@gmail.com>
References: <20190702144816.7520-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb and util-linux for phoronix-test-suite
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
X-List-Received-Date: Tue, 02 Jul 2019 14:48:20 -0000

* phoronix-test-suite is allarch, but util-linux and lsb aren't
   === Comparing signatures for task do_package_write_ipk.sigdata between qemux86 and qemux86copy ===
  ERROR: phoronix-test-suite different signature for task do_package_write_ipk.sigdata between qemux86 and qemux86copy
  Hash for dependent task lsb/lsb_5.0.bb.do_packagedata changed from 7baca400e354b600fe967ea615032052 to 67888a6c7511339a873b547745287ef2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 31f2f17fc8..4ddef29a3d 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -49,6 +49,9 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->bash \
   phoronix-test-suite->python \
   phoronix-test-suite->php \
+  phoronix-test-suite->lsb \
+  phoronix-test-suite->util-linux \
+  phoronix-test-suite->busybox \
 "
 
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
-- 
2.17.1


