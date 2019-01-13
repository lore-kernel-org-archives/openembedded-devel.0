Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id A042C6BA9C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 15:53:03 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id b5so8998651plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 07:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FwVJQjwvUvWuFa1goCu2SC1N+crNRRMd8bmRHzdGHNo=;
	b=ArU1FAK0urHLSHBxyt28FrUdXACAsh/Y/zY6J73u+bukRUhcnS73RCdcAZLBYLOD9E
	Kqu2oWROef09Oh6B375taf0/TDhiLvxmyjz3mAjGuJIyhA80H0r+26/a/dRp/lnVNN/5
	vK+wjklSgsCgA/dxjdb+Ws6fcYGQKYMIYsl4WUg32MGGi4Vdk2JdoZl6uZXMl8TRD1Dg
	L5W/n30FBbqBkZ4qjTFZpGWxqliZjTa0n8p/WgHrM7DrOCusmDXp99SYRHBwQAa0OxjH
	a/5egwXrq9YXmpWTVRVgYJClnp6QJfz7BXQCP0FscjbpyAGNpGR+Vlfa+aWot345sKQ6
	rxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FwVJQjwvUvWuFa1goCu2SC1N+crNRRMd8bmRHzdGHNo=;
	b=SNU0tFO9qdjtPgYu75BwvQZeuXrfvAjRYzUcLl2YFBn7H+DlR6QFqIkfWvdFJeJc/3
	nk0gfO2PrfLNUtZi9r63GhBNMNf2513PajFjBzRhmI0CrQGhZSGiRTRUqKFG8T9Je1CC
	l3+NFSh7hFuJ+6UjOcnvjc4Lr8fGuT7/3LL5ueXQZMN1QyJjAyLO+N3HRnit7GEDNFii
	B+InWqeY3iRrsi63qySjNC0uqhpEP2rDEAM7gaQUJoLONLDt+iWzPQV+wF9Ey43FealQ
	EPAZYu4V/HfSYELN4fg0VXq3OUWthWgmvvYLt2p3RcrrKTcKNradxIUlmu4pFYeP8wAl
	cEXA==
X-Gm-Message-State: AJcUukeVRU0IFk0ZqDzAIFUKJrN37pifvBASRpnIyqn/YMMDUjg8OQ3Y
	N/rFp9ciJsTaCcgLBjFzJ2358rjgjSE=
X-Google-Smtp-Source: ALg8bN5Zmwp0lJ0kjdfLcFcVkBkIwejtd7n1EoBFW0BH09re2N4TvkmapxIaQSN2lWxafP1xP0JuEw==
X-Received: by 2002:a17:902:29ab:: with SMTP id
	h40mr22030066plb.238.1547394784092; 
	Sun, 13 Jan 2019 07:53:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	h185sm107010965pfg.143.2019.01.13.07.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 07:53:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 07:52:49 -0800
Message-Id: <20190113155249.30258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python-pbr_4.2.0.bb: Define src uri checksums in recipe
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
X-List-Received-Date: Sun, 13 Jan 2019 15:53:03 -0000
Content-Transfer-Encoding: 8bit

There moved out from inc file in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
index a4b56cdbdf..3a12204224 100644
--- a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
@@ -1,3 +1,7 @@
 inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
+
+SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
+SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
+
-- 
2.20.1


