Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEAA6EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:11:51 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so7355596ykb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qCXckYFYKN+VddcrY60hB3hAw9qVbJbcValPCxXS7rA=;
	b=gq9ZopqQXxbclRGZOxQ6T50fWSWyTd4xHogG+7w19QqC/FIuyQj9SDNccjD+n3rAfj
	wHv53jenXgr8yY53NPZbrir1nRvFF6oKzKhtWL9vSVVENptW1gjXswcon6/Gd7FSJ59+
	1gkK5gtKLxaVoyxAIy9haDbzhsdtP6imZr1Y5THJwlFgkPeYbPvLunDY/x9vgqaJYtBX
	1tkPRA0ndH6INfMO6ioQzd0I1g0r8sePf1s14ituRd36pVW1zlFzPqOYZbcBi1ySIyNv
	XPQe9FKg5CmAnha8/3xzILqyM/FoQNxQUJER8EgNnKu3yaLERL+xwOqDi8/qDgEaLHg9
	MRRg==
X-Received: by 10.236.32.36 with SMTP id n24mr1767514yha.116.1393521112901;
	Thu, 27 Feb 2014 09:11:52 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h66sm15484529yhb.7.2014.02.27.09.11.51
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:11:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 14:11:30 -0300
Message-Id: <1393521090-20876-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 2/2] populate_sdk_qt5.bbclass: Add support for qtcreator-debug
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
X-List-Received-Date: Thu, 27 Feb 2014 17:11:52 -0000

This adds a new image feature for easier remote debugging with
QtCreator.

The qtcreator-debug needs to be added as a valid item for image
features and having it inside the populate_sdk_qt5 is too late. User
will see a parser error as OE-Core images does not inherit the classs.
The possible workaround for it is to include it inside layer.conf file
until a kind of "bbclassappend" support is in place.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Giulian Vivan <giulian@ossystems.com.br>
---
 classes/populate_sdk_qt5.bbclass |    2 ++
 conf/layer.conf                  |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 635dd6d..c921983 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -52,3 +52,5 @@ toolchain_create_sdk_env_script_append () {
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
 }
+
+PACKAGE_GROUP_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
diff --git a/conf/layer.conf b/conf/layer.conf
index 3b47b7f..75d13a4 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -22,3 +22,5 @@ BBFILE_PATTERN_qt5-layer := "^${LAYERDIR}/"
 # other layers.
 
 BBFILE_PRIORITY_qt5-layer = "7"
+
+IMAGE_FEATURES[validitems] += "qtcreator-debug"
-- 
1.7.10.4


