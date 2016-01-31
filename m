Return-Path: <brunovern.a@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3427B601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 17:19:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p63so5602373wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 09:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=inonztMXzDscHPng5Zs+V9FPi8uZv9qWWhmZJfkWk/8=;
	b=yV3FqTOZcno62ZqWb4WoZvccZYvF73M8lzaPieL1U60IjMg7R/iuh40QLcoP6qbwYe
	MMkJum7OIYvfIlNT2OGiAW8isPdFowuKJqMZlNgRcbv9few3R5Rk733dXm6S+aGeNTuZ
	JMwTOSXUkT/QdnoTYizewmPmt4G3OJy+Q+Zxq5aE2jSMworrTdTzHmHAQHJcaaCDtBt2
	4jZJkCwzmHfUWLEh6nDJbJjx77fAjRCF5fM1tFvVpBwpDeOuTw7684HhJyHW49S1TUoM
	LgdIFKp8ipT9UFCDCHuMBRMuGvqUEcNBoJKJuaGovZ2pnxR+o6s8YNBISXEt/sJa5S7j
	zxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=inonztMXzDscHPng5Zs+V9FPi8uZv9qWWhmZJfkWk/8=;
	b=S6wV3fLScVpG0I9PjAKSCf8cCihdmx27LWP512QwNjBzqdbPaZwvaeWGdq1r2qbnJ3
	JZlcOHQ1VnP4OVToObqcRAcmczpSgG8DgCXJzL/AktMh4XfHNaan1wcgcVU77sR3keDt
	V0o3M8eVNVphJ5xZr1uMLegD0YZtk83fnsMxolV3nV6/5xKQt5UTEHhWtShlopehVIok
	clm6gyr7WYjkIWRjCcnxZV0wmT3Wsj3RZW/fnBjXmlx+SzdNHF/KIkI9jWvOC69EIhQs
	TrLu5I6mQlU1plS5P5Mq5UnXWmTw3j4lJLkd5VH6lks60SAQ5NNUAIqHo+cMoi+tRegF
	VmEg==
X-Gm-Message-State: AG10YOTTxdm8WgkRLaUdtfnWECuxCcjQzjSPRdVQ5n/I2I7DGd/31hUnD9dUI+4mq5cqrw==
X-Received: by 10.28.212.85 with SMTP id l82mr7097851wmg.11.1454260766279;
	Sun, 31 Jan 2016 09:19:26 -0800 (PST)
Received: from f21frk1432l.eur.gad.schneider-electric.com
	(89-92-135-108.hfc.dyn.abo.bbox.fr. [89.92.135.108])
	by smtp.gmail.com with ESMTPSA id
	x2sm25206348wjf.13.2016.01.31.09.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 09:19:25 -0800 (PST)
From: BrunoVernay <brunovern.a@gmail.com>
X-Google-Original-From: BrunoVernay <BrunoVern.a@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2016 18:19:01 +0100
Message-Id: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 1/3] Fixes runtime error when loading modules
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
X-List-Received-Date: Sun, 31 Jan 2016 17:19:26 -0000

Signed-off-by: BrunoVernay <BrunoVern.a@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index 49fcb56..caca16b 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -148,6 +148,8 @@ PACKAGES += "${PN}-overlay-proxycache"
 # it was disabled for cross-compiling.
 CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
 
+LDFLAGS += "-pthread"
+
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
-- 
2.5.0


