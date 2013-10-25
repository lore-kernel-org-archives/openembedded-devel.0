Return-Path: <kristofer.hansson-aspman@pelagicore.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id C2BAB6D145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 15:26:36 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z5so861474lbh.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 08:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z/j0MJNY3z14rfKbAhKrX8P75BSGXqFYHoph+wYj5xQ=;
	b=N0/xaPqVulHUZxkdLU/RZzMpDjRrzwlWzNP0ePeoPDk2XKzms2iK4YoBl7dKmgHbqv
	fiKVUwLgGiyxOFy5aq1PauuQq2dnnoZIEmcD6+jnnC6dd2N10DSkcgJCJce1CUPXYayT
	h9ldV4FYNalRNPib5FSccy0ZfhE7qsLCCJsZ/Truawg/JJ7nmcv8+VWUtav9J9lsKCDH
	t8uHjzTcPSFAp9hm0UdIEtvivJsf/YFGT3WB7NjJJVocnLOWgeeRqGDgfamXaMBDg+Ob
	8eRjkbqFsnvNhcN6pazReQ2OsW6zVOb3DqECXlRlQqE7kVzhMQkHAcOEQxEamMu7aJFf
	cJsg==
X-Gm-Message-State: ALoCoQkyDrG/m7pMiUQ9c8oM83VVNKAk2AtcUoo9AH8wwRTXdli/DxQzWmZTx/K7+Lka4pKTf7dW
X-Received: by 10.112.9.195 with SMTP id c3mr2580225lbb.33.1382714797811;
	Fri, 25 Oct 2013 08:26:37 -0700 (PDT)
Received: from K-Ubuntu-13.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id u18sm2893019lbp.4.2013.10.25.08.26.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 08:26:37 -0700 (PDT)
From: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2013 17:26:27 +0200
Message-Id: <1382714787-8813-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCHv4] qtconnectivity: Added recipe.
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
X-List-Received-Date: Fri, 25 Oct 2013 15:26:37 -0000

Signed-off-by: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
---
 recipes-qt/qt5/qtconnectivity.inc    | 13 +++++++++++++
 recipes-qt/qt5/qtconnectivity_git.bb |  4 ++++
 2 files changed, 17 insertions(+)
 create mode 100644 recipes-qt/qt5/qtconnectivity.inc
 create mode 100644 recipes-qt/qt5/qtconnectivity_git.bb

diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
new file mode 100644
index 0000000..c0a5147
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity.inc
@@ -0,0 +1,13 @@
+require qt5.inc
+
+DEPENDS += "qtbase qtdeclarative"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bluez4] = ",,bluez4"
+
+do_configure_prepend() {
+    # disable bluez test if it isn't enabled by PACKAGECONFIG
+    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'bluez4', 'CONFIG+=OE_BLUEZ_ENABLED', '', d)}"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
new file mode 100644
index 0000000..334ae35
--- /dev/null
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -0,0 +1,4 @@
+require qt5-git.inc
+require ${BPN}.inc
+
+SRCREV = "c21addb23f2eb67dc55853b115e5b735df065891"
-- 
1.8.1.2


