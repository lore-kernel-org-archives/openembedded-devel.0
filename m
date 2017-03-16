Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 54F6E65D35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:25:53 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u48so6150774wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Jjf54igsUdUrMZ+1VfxcIrMFqnjS9JMPC8Z1qlU4Kgk=;
	b=SqaHk8aa6VO2UGGjt8wYT/hqmCwK4AWWfnE4ZRx5CjAOgNDxIKskwJcyMuEdgLoxCZ
	tee68F5CVJCsDvwgsXyanaBwvKUbCvSC8UtIJCuxPh1Tz74cC8SKBVgulH/i5eMR79LE
	EQO1fkkiWpM2u6V6QFrQCNJd3nwl9AeCO5RJMWQepHQItlVmVac5BNmwf/vJXvGNdUCL
	K1teQi2BzNsQOZCJzavCrwxio7zE7E9QRTOLsFsgt3Lm9HCeUFhcIsI09lrXfBK/AdE3
	rUVXGTKQZGgaFp6KDZTm8JYAbuEN2MPO9lVihLJU6V7z/D74zA1b0OyZym/0deORCyZ0
	Qetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jjf54igsUdUrMZ+1VfxcIrMFqnjS9JMPC8Z1qlU4Kgk=;
	b=JKukhbHE0/9lx/Bkpsv/x7MZ+DMbUdgqnj4bksjj9HPATL7PQk6yRsyBbWyLpQEjM/
	ZVlhJAKl9VJBFaayOj8xuJl2IpQzg0vrfMFDkET3Z/veYHA5YQLFKcvIueRlLxXgHsMh
	uE279fAdHGbemttmH25VG8wFZcRkZpzEbw/ZeJhlgSqiviHW8Hz5Ehm3b8Hz1uz5KCPX
	Ci2jyLEwB0cD4OW9O4XNh86vsU/QXMN9XC2ucY7S8h9KHmqwHkoF5ywzfwGqIdQlJ8Hl
	oI2COVW37ZkmU1rXKlk4pa11PKrWjaJEndgJMeqhpRLVYqUtUDRkINSlpgXhguc2Qnjm
	LlBg==
X-Gm-Message-State: AFeK/H2OMcVzBGjei5QpINkUuGP4FfJIZ5ZNn0nloJP9cvD34WfN8yLZlKbR7qGmdvoFOA==
X-Received: by 10.223.180.68 with SMTP id v4mr7992040wrd.37.1489674353993;
	Thu, 16 Mar 2017 07:25:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s18sm4513081wmb.18.2017.03.16.07.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 07:25:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Mar 2017 15:25:53 +0100
Message-Id: <20170316142553.29630-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH][morty][meta-oe] lftp: change SRC_URI source
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
X-List-Received-Date: Thu, 16 Mar 2017 14:25:53 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Changed SRC_URI source to official web-site, which keeps tarballs with
old releases.

Cherry-picked from master, but without the upgrade to 4.7.5.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index 287821194..d62453745 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-- 
2.12.0


