Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1343D71B27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m1so4862226pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=q58/KRGi3T1q2aeLJZ1z4p1ixSYNAtpRbzL53OKFX1M=;
	b=tq7PukxDgcXtrZgzkm1d5VVdw0XDYV5honwyAJS3I5x+uC7DS5OX3cAmTWTNegwJ0B
	Uyyrk80jJWaUaBE1QvScD0WZvLr/HS2sR7pTakzlDTFrkhr6+wC8mAOAqEwlcvOkmRql
	N3ZBStJJ0qtU4cCQVTKKDQdkqx5Ye5lVrKwb6Wsl1Ahpb2aMGi9paNbp9IxPQChaWyxa
	9rfcNeop1e+uCMhC+APwSYBlSTa2JMqvr1FhaCDFrElomPGI49cthqurZuADq1DyO8W8
	dQGTIKbjKbOh5ai5vMW7ni6TjY9FxVpg6/rCl4uiA1xdSyMrSDVxjRo7cL1Ft2wBOJCD
	Exqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q58/KRGi3T1q2aeLJZ1z4p1ixSYNAtpRbzL53OKFX1M=;
	b=QJW8EBhpchELFyVz3hZBu+cXgVDATkgF5Oz9ZjIDAA0vNEqa9ReVGOqeaEf0irOFYZ
	LIOGr+A9MCOZJncSg/EeaM0RRvgKatLPh215oh+KgxFo3U+wzDo65BoSCQXyyHVXlK5H
	FDxwUu/JjZTGPk+clZ6XUFr+OaMzUgKiwtp4yWVXg2agvadJRJh8HIko2U+4MgdBWUZZ
	xUQ7pZCne3t309jt3T6FI1bJKlJEyYXh4oeVOt85UFviAKTNG4yc/bFYaWJdAUqxLYN6
	4+P3nTJLqrcpkWoUQ1ywIJIwmuLBftaIX7dhNaMbjqHmJfXr0w+AA3r1VlU57L9ayFQK
	OpOw==
X-Gm-Message-State: AJcUukfCS8mVGRScpYDb+v1jxN5GiNYtq4FHyxjek2A/JobRxFqa/pxa
	jW9w8djtOQ9jrrIhSDGtol+m/B/Lgao=
X-Google-Smtp-Source: ALg8bN7TH9WLpVBGjdDtC+KZ8B0+FMfzmuD0ZhaR36XLsDITcEgYfuYZCcNchm0cBPhEa6juao6OMw==
X-Received: by 2002:a63:f94c:: with SMTP id q12mr10166207pgk.91.1545600985784; 
	Sun, 23 Dec 2018 13:36:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:56 -0800
Message-Id: <20181223213557.7834-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 17/18] redis: Update to 4.0.12
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:25 -0000
Content-Transfer-Encoding: 8bit

Exclude atomics on ppc as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../redis/{redis_4.0.8.bb => redis_4.0.12.bb}                | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_4.0.8.bb => redis_4.0.12.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis/redis_4.0.8.bb b/meta-oe/recipes-extended/redis/redis_4.0.12.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis/redis_4.0.8.bb
rename to meta-oe/recipes-extended/redis/redis_4.0.12.bb
index 80d36d2ba1..af99537f52 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.12.bb
@@ -17,9 +17,10 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 
 SRC_URI_append_mips = " file://remove-atomics.patch"
 SRC_URI_append_arm = " file://remove-atomics.patch"
+SRC_URI_append_powerpc = " file://remove-atomics.patch"
 
-SRC_URI[md5sum] = "c75b11e4177e153e4dc1d8dd3a6174e4"
-SRC_URI[sha256sum] = "ff0c38b8c156319249fec61e5018cf5b5fe63a65b61690bec798f4c998c232ad"
+SRC_URI[md5sum] = "48f240fd2d96b1b579300b866398edbc"
+SRC_URI[sha256sum] = "6447259d2eed426a949c9c13f8fdb2d91fb66d9dc915dd50db13b87f46d93162"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.20.1


