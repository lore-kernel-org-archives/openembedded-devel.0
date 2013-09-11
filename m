Return-Path: <erik.boto@pelagicore.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1821F6BB02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:20:10 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so7328464lab.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 04:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=bIB9xl53UoLnjmhPPZGwthUhC/g0g+uHJ1Z9Xr8wXtY=;
	b=PBUszk3IPIN6g3RIyf8dDnJ7wCU1oovMSm9WW6UdrmRsEv19ueFCPDR2AoCJmfNHCO
	WToZfcgNWSl2tjoBlfOypu6okh6s3kJJB0dmh8l+cnCpV3zZtnovCgulrojs/e8DeFvd
	04fhA6flk8BYCde/1azN5Mw4ldOeKwK/msMD7eHUisLyNUscRe0aYr1I0pgPtYXYSAd9
	M+jqM0djamUVK5HKhAFjH+sRmBIc2tINoABju+XKDw4xzho94pDt9xii01+olDktpRFW
	rZHbp9xG67ojXVbH0T3C1XSuHFS3Twk5HBYlZ3jx2lcQKkNkTCynrNNIF/4JXyGgeWjl
	vjOw==
X-Gm-Message-State: ALoCoQm2VYsxWk7ZeoA0A8sT03QPc2LUbhaomCXT+L2nfdTUPl2at8vgBOpWHCy12ji0znJHqW7b
X-Received: by 10.112.52.161 with SMTP id u1mr739831lbo.49.1378898411833;
	Wed, 11 Sep 2013 04:20:11 -0700 (PDT)
Received: from erik-mbook.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id yl7sm1010929lbb.0.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 04:20:11 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2013 13:19:47 +0200
Message-Id: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] Added module qtquickcontrols
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 11:20:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
 recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
 2 files changed, 8 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
 create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb

diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
new file mode 100644
index 0000000..63e884e
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols.inc
@@ -0,0 +1,3 @@
+require qt5.inc
+
+DEPENDS += "qtdeclarative"
diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
new file mode 100644
index 0000000..fc880d7
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "b3825124a173a36f63c2f8380dc61e81"
+SRC_URI[sha256sum] = "88d39421d78464c3900c37616e8369fc8d998c1b0f611980e6e082f46569646b"
-- 
1.8.1.2


