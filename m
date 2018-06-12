Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1072F6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:19:49 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id d8-v6so25147771wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=r1JS/De7UcH6LOY5VUS9Xqx+qad8AEZxQiEwzHW8u/w=;
	b=14hqSlOVE/T1+BoJP/1YyreYhiLeLTHIYj9/50jIi0haaeAT31p4TwZokuFa9hitAa
	sR3HH5zHukt7FW4cBTLUiT9HX/ulIrhPCIqxDP9oeMbNxtG8OgaHZcfufAXSDk18SEzS
	fds/bvE5/jrYkODIXnaN3A8vglORyPGzeBEX7k3uT5x0ufcaXaljoo4TgsY63enfCW2d
	GW451YvJtQxrelViskkr55C1S85Tz4jFazeerEZG1WyyCXxBeWOo1mEkcoiM7c2NP4gr
	knteGCjAUlZP69EUndPGCMbPFiv3nnppv13aPkq+YuykMaj+q/mMJn6CEtMR5HfMlCAG
	lRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r1JS/De7UcH6LOY5VUS9Xqx+qad8AEZxQiEwzHW8u/w=;
	b=Bi9PBWJHii4LIJHd/Krh6YW8jiNMKZSSPziObZyAIucrc3Ur2z1JwFXfXsPsqEfkQK
	gpt7KaB5xjDLB8K56VP9Zy4hrkymm/x1dMxRylV7L8sUAV/ufrG0LCmAH97yfF1cJ0Zc
	/Nd3M1HfBZAWx/Y7a7IKlndjdUYU+MGj5cTjEJzNShTZmL3IterpeT10h7Hc4AP7ZauP
	5Z2DzifFI/c8eB5B10bXGj99z6Q1ycKb1FV1DDdqjxfO/UKr/oEM+FKl9gu2mHsIrtUK
	n2PGNP/1KcC1QDEHFz8wf0oQe0d13DJiqmjcOmizhPMmM9XjtvC+VzuJsrjqU1gyCRxt
	nb4Q==
X-Gm-Message-State: APt69E0zHPoE6xp82FNYc5UpGYRrV8V494reaLGqHfTIqW4lNPzNXssJ
	7Y0bjiV4dIwvjVWnH1qu6oldbZg/
X-Google-Smtp-Source: ADUXVKJDQoOA+1f6gYEPqX9anttJUomBWZXBhwDOv03OIFmEXW9np5X6HGmsC+zSZVSZj8wHiUk2CA==
X-Received: by 2002:adf:ac69:: with SMTP id v96-v6mr1250692wrc.5.1528827590319;
	Tue, 12 Jun 2018 11:19:50 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:ddc6:6bd0:776b:2bb8])
	by smtp.gmail.com with ESMTPSA id
	f17-v6sm452252edm.97.2018.06.12.11.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 11:19:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 20:19:42 +0200
Message-Id: <20180612181942.30736-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] libsodium: update to 1.0.16
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
X-List-Received-Date: Tue, 12 Jun 2018 18:19:50 -0000

Added link to bug tracker and updated md5sum of LICENSE, which has been
updated with the copyright year.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../recipes-crypto/libsodium/libsodium_1.0.11.bb    | 12 ------------
 .../recipes-crypto/libsodium/libsodium_1.0.16.bb    | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
deleted file mode 100644
index cbcbe96cd..000000000
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e866"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
-SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
new file mode 100644
index 000000000..57f38fec2
--- /dev/null
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a37b"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
+SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


