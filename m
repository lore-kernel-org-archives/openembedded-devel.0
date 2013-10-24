Return-Path: <kristofer.hansson-aspman@pelagicore.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7E20D612D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 15:01:17 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id eh20so1951496lab.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 08:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6I8DVHZ/h96Gv1EX0ZdTtApUtP+LIavaFG6qJ7EU4ps=;
	b=H78dOlU7cEk80S6istKlYzsyaE3t9Z8GuE14y/RMzmaKsG8UUk8u1EXQ2uX3ZJGaqU
	jeN8SlPb0jIcKGdaG8l89fuFzMPsMz01lMCoCemsw0Ki2VCWGPoYfu6X6gefJtXKLphw
	iJxjumHK0iyt2dEtMyuuQOtx9qcoIATAJEct4wvwTQ9t+klOlX+Yj4ncP4yl6GlR8zIZ
	Dl9byhEQhEZyoBuypHUa+6eYaqKwqMHvl56nCX4dtGFsREyMSSy5/7RggWIaF2VtzZ49
	wkdRrF4d0Ow8vN0QGu8ImkKx8+xUKMzrMppgX9WXw9xp3IsyMmNVa5iztIUV2eqrh2su
	3Q6A==
X-Gm-Message-State: ALoCoQlvfcFWEqp4Mtfvr6SDLmK5kC7jNTiuNvIhAGvmmn24mHpSi/1x04BjRAKSHFet8ZH84wmp
X-Received: by 10.112.64.36 with SMTP id l4mr2182553lbs.15.1382626878685;
	Thu, 24 Oct 2013 08:01:18 -0700 (PDT)
Received: from K-Ubuntu-13.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id sc4sm1954596lab.10.2013.10.24.08.01.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 08:01:17 -0700 (PDT)
From: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2013 17:01:07 +0200
Message-Id: <1382626867-8287-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCHv2] qtconnectivity: Added recipe.
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
X-List-Received-Date: Thu, 24 Oct 2013 15:01:18 -0000

Signed-off-by: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
---
 recipes-qt/qt5/qtconnectivity.inc    | 4 ++++
 recipes-qt/qt5/qtconnectivity_git.bb | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 recipes-qt/qt5/qtconnectivity.inc
 create mode 100644 recipes-qt/qt5/qtconnectivity_git.bb

diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
new file mode 100644
index 0000000..50efd46
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -0,0 +1,4 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
new file mode 100644
index 0000000..2bd016b
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "c21addb23f2eb67dc55853b115e5b735df065891"
-- 
1.8.1.2


