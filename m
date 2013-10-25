Return-Path: <kristofer.hansson-aspman@pelagicore.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 57D336D13A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 15:14:39 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id o14so871097lbi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 08:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cw7v/rtRWY9y67ky4cQ+TOhc5n7EDtYdgW+QdBSKdAQ=;
	b=l6UYfRnrxq05iuyWoWKZx1mOI+5jzmniVTwD6yjUiT481ezqwJmquw1dQy9HvtkY8p
	7oJeGPn63Mkc8T8oyEM3vVl2x5ya2kcfTy6mcnzpKBZoT3LdZZRM9IhheDYaEDt11z2Z
	gVAKCl0key3mFbl8YcCKjV4jzspPh/+LingrWLZu2bMGEgOEDYUKTMqCERhMRMDwGJgO
	9oNpV2z1drfH3qjkACyaKDMys+PzAD09we3pyLv3Zd70zLiCVLApH1SaOnjqmcMFI7Wa
	9lnrSVzPmDLmTHnxDq5T0/l4RksS9AjVuwMy4vtQSljGGHlZt6StwYqfDhHQfxx3qtio
	rszg==
X-Gm-Message-State: ALoCoQm/rm2/dqSn1te71VRlD6SADwf8eUHNc8d4z3jZTqk1jKy+H/4KHzVJYMcHtZY2/9f7p9uE
X-Received: by 10.152.3.165 with SMTP id d5mr620921lad.53.1382714080644;
	Fri, 25 Oct 2013 08:14:40 -0700 (PDT)
Received: from K-Ubuntu-13.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id o1sm6972059lah.8.2013.10.25.08.14.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 08:14:39 -0700 (PDT)
From: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2013 17:14:29 +0200
Message-Id: <1382714069-7371-1-git-send-email-kristofer.hansson-aspman@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCHv3] qtconnectivity: Added recipe.
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
X-List-Received-Date: Fri, 25 Oct 2013 15:14:41 -0000

Signed-off-by: Kristofer Hansson Aspman <kristofer.hansson-aspman@pelagicore.com>
---
 recipes-qt/qt5/qtconnectivity.inc    | 13 +++++++++++++
 recipes-qt/qt5/qtconnectivity_git.bb |  4 ++++
 2 files changed, 17 insertions(+)
 create mode 100644 recipes-qt/qt5/qtconnectivity.inc
 create mode 100644 recipes-qt/qt5/qtconnectivity_git.bb

diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
new file mode 100644
index 0000000..32a1039
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
+    # disable openal test if it isn't enabled by PACKAGECONFIG
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


