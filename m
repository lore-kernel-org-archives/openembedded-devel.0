Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0C771CA7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 23:07:53 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so46993573wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 15:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PRR9d7lFeCzAjIPbGKT5Z/CRdpZRybKQg31vnGNdPjc=;
	b=ZJpU+KJR89WhTvjcGpuWvByj6mfckXwpw0yxaCK0nbZd+5hJHD+ir0PSBmIjeYik4H
	CmfAfsIslTNOBYnJs5G+rnF1hvbto+HjU7TTEP7WoQWKw37D+zh1TXJaZGtv3JpZXsit
	7WLRZ2XYaZipoewzPfFcWansZJ07VlN9AzOn2vyNYyZ9J9icxD9PocCXKMJmD80wQORq
	P/e7Nz4D1AJt7nR5+T6MS33PLd0CfOseVBesOqpAriRdjAfyjQ97s0L7XCmMUtKhKa4h
	wQPznnoDiKqeoJ4S1+je3mFsoNkGl8yUKD0OgQqlIs8Lf8JSaNsPQqsRdsO13GSqhkt5
	GuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PRR9d7lFeCzAjIPbGKT5Z/CRdpZRybKQg31vnGNdPjc=;
	b=LwO50nzn1BfJLHvLECek0vSlIghI6vZMI0srDNdVVzsvDUTUUXM4Wgy62iDGOCXx8P
	QewSCLkFKnmz0FyxjKF1i3JLwSxcB9QGN3UPMzmnH8uApo4srL/Vd9sCc9ltc3HnvF+Q
	+Vs8LDZB5M0w4NBFz0ZW9Ba2ieqwfXCxA5xv1ZyrSAzN8gkm2D9QcIBc/ua0SJAZpZPM
	YXV1JBOAfMy+NcLla1qQukULRPd07pfjHqAVH71CPwLMCZ7LE7nXm8KOew86de/7ZOru
	c7mN/CQnTaeQISPY2/y2hqiQc4p5qWURV5KMoTGiwENqGdHMeHZ3hXyfEJVz4+kFlJZA
	74Mg==
X-Gm-Message-State: AIkVDXJ/6ZxsUwPIGGcYrIgpxUyADd3C6pyhVI3uIethRm3wn0CXbj0NnkzQOHsyhYIG5g==
X-Received: by 10.194.109.168 with SMTP id ht8mr21611728wjb.36.1482707274578; 
	Sun, 25 Dec 2016 15:07:54 -0800 (PST)
Received: from localhost.localdomain (p579F74DF.dip0.t-ipconnect.de.
	[87.159.116.223]) by smtp.googlemail.com with ESMTPSA id
	k11sm48659848wmb.18.2016.12.25.15.07.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Dec 2016 15:07:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Dec 2016 00:07:38 +0100
Message-Id: <1482707259-26271-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] fftw: update 3.3.4 -> 3.3.5
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
X-List-Received-Date: Sun, 25 Dec 2016 23:07:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.4.bb => fftw_3.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.4.bb => fftw_3.3.5.bb} (92%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
similarity index 92%
rename from meta-oe/recipes-support/fftw/fftw_3.3.4.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.5.bb
index e753743..7bce6f4 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "http://www.fftw.org/fftw-${PV}.tar.gz"
-SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
-SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
+SRC_URI[md5sum] = "6cc08a3b9c7ee06fdd5b9eb02e06f569"
+SRC_URI[sha256sum] = "8ecfe1b04732ec3f5b7d279fdb8efcad536d555f9d1e8fabd027037d45ea8bcf"
 
 inherit autotools pkgconfig
 
-- 
2.5.5


