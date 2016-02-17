Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id E304173163
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 19:14:21 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id yy13so15984825pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wwZdacx14i4birumOhKAjQW/3gOBFnuX0bWFK80C0Yg=;
	b=rc+P5YPmH3UxLDWz3mCORDfGENk3MCBRAU3iQ6A7hJ+1H4hPRqhVP27FZxbBWKGXQ+
	34mcc7rVBvZlFj5PIxz/BmMZy3eFL/WcjuHoVm/Sx3m5BSRpYN2L2q8a/5nWODDFCaAE
	4YnzeuMPgzGkQX2GaCe5niRA5q+bo0iH3+TuYnIFA4iHu8ZBGK8kFUg9q+cMetFE/rNq
	1NPdACpTOO1ksxrSjmqJl681TXtQKgJdBgEcuNQM8LQFYyiZiUq8RWXPEP8zrl8YiM8f
	+iuk0xpLOOpocQjxEmjM/B+XIDlorwURquP12Esf/Tdc8nORvUBj9TmTxEQPJTDWQINm
	XcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wwZdacx14i4birumOhKAjQW/3gOBFnuX0bWFK80C0Yg=;
	b=ioXXu8EFzq95V3plGZ9DMZOvKrGNPSGz9Fu5AA6Ae0peK9/fGqQqgNV74xMjlfvc0x
	bMMrTQF1qdFezeaiGVdAjlNy6100QcVyD0C1SUuBq5Kd4z61kKf9onsEPHsL9TUlxgdX
	ip8xVKIbnOIWVElWCteXD2XXReqD8g5knXCOzbyi5q5ubMPW3TUx2kwp0LRhER9BAqOW
	UOhvxJmI/guqCO1MlpNqThtet8KU8Yx2mCxbzV2v56BUaNadKmsnOKt6cgAUT4ekJzpJ
	2md4RtLZSFea2eSbzPKp1aZNWgY/XlcZBdwr7xb7lX+QEcfvWtElrSO2N5vr7Tu+gAeY
	FlKA==
X-Gm-Message-State: AG10YOS3rufE5pbDKu5eWFnGtWcdHdVa/ShiNRHbaFS21yRCZcRaP9lrjZCwk7LwGjCOvg==
X-Received: by 10.66.121.132 with SMTP id lk4mr4458851pab.33.1455736462286;
	Wed, 17 Feb 2016 11:14:22 -0800 (PST)
Received: from localhost.localdomain ([76.126.209.57])
	by smtp.gmail.com with ESMTPSA id
	q85sm4418049pfq.81.2016.02.17.11.14.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Feb 2016 11:14:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 11:16:15 -0800
Message-Id: <1455736575-2561-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [meta-oe][PATCH] hostapd: Upgrade to 2.5
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
X-List-Received-Date: Wed, 17 Feb 2016 19:14:24 -0000

Change-Id: I8e4a44297492b213dd1001d8b1499864e95b17c2
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/hostapd/{hostapd_2.4.bb => hostapd_2.5.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.4.bb => hostapd_2.5.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
index 901c7ea..e9158ca 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
@@ -17,6 +17,8 @@ SRC_URI = " \
     file://init \
     file://hostapd.service \
 "
+SRC_URI[md5sum] = "69f9cec3f76d74f402864a43e4f8624f"
+SRC_URI[sha256sum] = "8e272d954dc0d7026c264b79b15389ec2b2c555b32970de39f506b9f463ec74a"
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
 
@@ -41,6 +43,3 @@ do_install() {
 }
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
-
-SRC_URI[md5sum] = "04578f3f2c3eb1bec1adf30473813912"
-SRC_URI[sha256sum] = "6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda99794e79b9b9dbd657f"
-- 
2.7.1


