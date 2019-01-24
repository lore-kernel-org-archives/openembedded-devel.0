Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF27C2EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:14:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z5so7510537wrt.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KK6IWunDFq8WsGUVZ05kHxO3WDo7F5AoV/ucQ5IOMqs=;
	b=mUj3YK8uGqnKLv3rDJcCe+zyoOWJpxpf2yA8qBB9QEulDgX9aHxGHYnztRAvXXvETx
	c8hWMjw+jH6Mn/heqMqpKlhTwleie2bLmlcpkIws3YsBdzEEgXPtQv1P8TPVgTzG06ZS
	1VtMqT1pqy6VJRl7wrPc1q+4DIvfKqRNQnmo44l0/J6G7pwn8DRiONzfJ0KHq6vGCYAA
	oFz1Q9tKt/O6Yu8y4USNDfbWcfgIgwASkuIgIZCZAcOr8NlJEQI9sRb/MQIGpwtQLZe9
	WPWCzj6bcpdy2Dc3GYmfDR51nu6Tb2HDsc1i8/EO2OCgjUCUSqrDvPVioHKjLeyp0lSF
	6ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KK6IWunDFq8WsGUVZ05kHxO3WDo7F5AoV/ucQ5IOMqs=;
	b=o+/8kE12kYsKF2wT5b99+Wf3om9xWcdJJJuy0oeI1BDfrB4ho7FCjsP+6hxTkFGWf3
	Qlxk0oJOV2H/kHeNA4X0PHQyZ/92rzCQeeYmYPZrLf5gUeZQ2FeH3oF0CAc7O62UReOV
	7BNUURxzGMAKLm2UQDxm3Jo9n5x66p1naagxPPki9g2M0A6CoE1nWeHDaZkbGvWjhbBn
	WjygOqegeFdsK0sa0I5agUfkgGlv2HzDUrzu0gjHKZy6MimbOthL/TOco2Hpnc7WxAwk
	p6xhzT+9TPo+e9+tqeAgP1O+56evbH9gV3krsa2ZkuJ5V37WwtOwhricRndN6rz1BLUw
	Hq6Q==
X-Gm-Message-State: AJcUukfyB+8cYWYsMncH63ifGroxvc0a6/F+5pVxxxAGR1u0LGmKjhZX
	yP1wKpj1L5Abb/et9LZzrWW/yHOf
X-Google-Smtp-Source: ALg8bN4wf5Emp9KEQaavIRK/zdAqNHqx6VeAcNZb8VtKCh5IxeLIciTCIXcP4JSQwEgpSTTtLveoWw==
X-Received: by 2002:adf:a58a:: with SMTP id g10mr8198642wrc.3.1548353649447;
	Thu, 24 Jan 2019 10:14:09 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	c10sm100318274wrw.49.2019.01.24.10.14.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 10:14:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jan 2019 19:13:51 +0100
Message-Id: <20190124181355.4609-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] python-isodate: fix SUMMARY
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
X-List-Received-Date: Thu, 24 Jan 2019 18:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-python/recipes-devtools/python/python-isodate.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-isodate.inc b/meta-python/recipes-devtools/python/python-isodate.inc
index f5b605eef..3cb6bb816 100644
--- a/meta-python/recipes-devtools/python/python-isodate.inc
+++ b/meta-python/recipes-devtools/python/python-isodate.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Character encoding aliases for legacy web content"
+SUMMARY = "ISO 8601 date/time parser"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-- 
2.20.1


