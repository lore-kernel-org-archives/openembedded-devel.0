Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 09C0865CB5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 14:34:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id c206so34219702wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2017 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iC1jJX+e2SMZb4vVTwg0vUTTnJ8LD49CpdBuYwyBwSQ=;
	b=ZtKjrFDsRlnQnKOUtwWagFQSi/oBV6UgFhV1wSZO7Ac6PHvqY4MiG/jBv0KauF3mcN
	kFxce/2zT9arx3imHLtQZ/6rcj84/FrIwRqc4DmnDtkrEr88n+Rs7SUxqe/VMw5n8cKt
	jHfvnxjdCbpDQXT1Sc4df0wRa8Ezum4NWALXrGXiv63eaWBUC06BLwEqEacmshosC5um
	plz35J+S+T17jIBHjN7Ved4U7Q9dKb0OwI7r0xU7Qef7+NL+8fy73OJly6hDQfDi5Hhh
	WDoZtYGCxSTBXA2khXYwunr0YTb4giy0CKDdHkfkvhLHAA0KF5p7PnxUU++3WPb9XzX1
	pm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iC1jJX+e2SMZb4vVTwg0vUTTnJ8LD49CpdBuYwyBwSQ=;
	b=N3nTeI9BvcpI/xhWgTwBZYh7zNjqKXQkETWDKw8YKoI0vZFBDkmk01GkS+HGcSPqIa
	9i9AocX3gGQ3Xa5XEam/0RciLxMFWADjHFmH6Idvio99zk1shW577r/2QeXqYVPkibrC
	/l8EHJYgQ5tFMNJ29rbNJjVPnhSgeTVZX+BkDHVcOFFTLgxYgy0JZK4yZxNHKJYD/nIQ
	vadJQj4LoShRfYfuXlvlPxvK6+qDwVIDX2t6uHrdMu52ZCyTJHsbmqAub1csDm/Tpe//
	XduGksVq2/yqnhSmL3HliAFlRapZZ88O7StlwAhNcOdLA99DVb22cyuFrWibwu4SFd2k
	mU3w==
X-Gm-Message-State: AIkVDXJVPluvevbDseNO8iXnVGKavbr7QDIoXi63LL9fPe9srO8/laKxgGB9bXd/hzG0Euic
X-Received: by 10.223.164.130 with SMTP id g2mr18187wrb.84.1483972470263;
	Mon, 09 Jan 2017 06:34:30 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id 6sm123978489wjt.5.2017.01.09.06.34.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 06:34:29 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2017 15:34:07 +0100
Message-Id: <1483972447-22251-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v2] lftp: update to 4.7.5 and change SRC_URI source
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
X-List-Received-Date: Mon, 09 Jan 2017 14:34:31 -0000

Updated lftp to version 4.7.5 and changed SRC_URI source to official
web-site, which keeps tarballs with old releases.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../recipes-connectivity/lftp/{lftp_4.7.3.bb => lftp_4.7.5.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.3.bb => lftp_4.7.5.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb
index 2878211..8f88f9b 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.5.bb
@@ -6,11 +6,11 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
-SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-SRC_URI[sha256sum] = "ce6519831603c19c2cf2e3c10b41d6ddc87a16049b99383e7b9b77fbc7707214"
+SRC_URI[md5sum] = "868d621838d471ba681ca6004c1f9305"
+SRC_URI[sha256sum] = "90f3cbc827534c3b3a391a2dd8b39cc981ac4991fa24b6f90e2008ccc0a5207d"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4


