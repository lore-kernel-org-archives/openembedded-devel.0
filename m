Return-Path: <steven.vanderschoot@solarteameindhoven.nl>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E035A71A40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 13:45:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r144so21040331wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 05:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=solarteameindhoven-nl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=odFrxJFcCxl8zW63g3NTcqYCGbwyDcqyTab28o/IBDk=;
	b=hQ4hY5A6sWLOXqNofS4ZuWf8dvRU9lHg/0Hm471wfEbAfzwn9k/tK3nW44EjlUbrp0
	Lgha3qDxgCFY1p1+xX7S9FkpqpExl/GyGZ9dBkZ8+/z0oa8VslwHAfDT2se0cchWViiu
	zoeaBinq7ZIo1DPjqHqqBm7AjaK2EfDPLPFJhf+x1lWFCDax3WHi4wa0/k9TeGkJ39eF
	JmKmI2WtP4m99LSQ2QMfQ7xDYIsSwey0xcvhDRYrifwHv7m8veljqzs6Zk8bpi6Urzoq
	pWMeE31sEmAE/Hrd4LBlEvjFnoki9eSam/h0rgOBuA+9qlsfCE8rWwj5J3hHHWKZO/n5
	Bgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=odFrxJFcCxl8zW63g3NTcqYCGbwyDcqyTab28o/IBDk=;
	b=MBg8OxjQj/yYg7rf3TNVMOJABCIj5oiRzv7nWjObEWGdTIkVdwGVE0YhLvC/jdEts2
	ddvWFUU5XwCo22LVym9jei3fLzp7lgTkxkyrdX9W7m6dKCEc97XojCe7TtGsK5pzzAOW
	9vj6qC4QOweo9wHMvjE6LVVdqKRLQ/9QrNnnJJiMYyMvuI287l8LRlmTR7kwEa/AKywt
	Wk+VUzoai8qkmACaUQK7fpAaX2i5wabcE0KoLos0wqVTVWvWd8P++hbnx5pXMN8ejjN3
	LsYRzdMFOIj/DpslJ8A9ajFONiGrE0PH9iy+8bRI4O5fgqBBrnNLTOtWa/N99QMu6cY0
	Ujzw==
X-Gm-Message-State: AIkVDXKZCpArW5v/yaFXPbBXk9y76QFdnuuJbvkATwJMVCTj7izup0/bMnKHm+TtwkDG8g==
X-Received: by 10.28.203.6 with SMTP id b6mr37186wmg.2.1484055906929;
	Tue, 10 Jan 2017 05:45:06 -0800 (PST)
Received: from Byteservers-Customer.byteservers.nl
	(customer-5-196-140-39.byteservers.eu. [5.196.140.39])
	by smtp.gmail.com with ESMTPSA id
	gj6sm3364202wjb.29.2017.01.10.05.45.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 05:45:06 -0800 (PST)
From: Steven van der Schoot <steven.vanderschoot@solarteameindhoven.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 14:44:56 +0100
Message-Id: <1484055896-8677-1-git-send-email-steven.vanderschoot@solarteameindhoven.nl>
X-Mailer: git-send-email 2.5.5
Subject: [meta-oe][PATCH] libiio: Update to 0.8
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
X-List-Received-Date: Tue, 10 Jan 2017 13:45:08 -0000

Signed-off-by: Steven van der Schoot <steven.vanderschoot@solarteameindhoven.nl>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 28a1073..d66ac58 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "e0fc3845506ccb19ab02e4b1d81cddeeee0805ab"
-PV = "0.7+git${SRCPV}"
+SRCREV = "08f947d5e40600259bb698c3b95538e9f2bfecc2"
+PV = "0.8+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git"
 
-- 
2.5.5


