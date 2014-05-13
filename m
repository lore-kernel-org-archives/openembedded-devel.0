Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f45.google.com (unknown [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4B42660167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 14:48:59 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d49so504411eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 07:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=VbU8GN8CNT3GzcAsjFHWY+rLCyr+0Gi5518dveN3UQ4=;
	b=H82dLscqK+wKoerIQTDLSQXNalsssyd/Zvp5nPrXE1X9VsvDClQqc4AXVMHPxXcgT/
	SHog8qOhB41X3oPT0Ku8uZgEe1DlDyo0TffBH9PWT9VckoZy+CuRxh7tGNmsaEUGyle+
	qtQPoZeo3A7y4HjRIM8cGHaDSVrwvINvM6k5g9Z0xJM0HOxe9JelaeutGlXHF1q+24Ok
	Co27cM+NJMbkCH9jo4w3oxbTMzIz2b86jjgW2OIT5otOe7iXfK5R7uUSMuiAtvrvJf8K
	1ZtKDXAO+jCRhvKKE4Z6IiBcg6XbwLvyHXOrao+H23hpaT1biJaJdZFWX4XEm+OPlhcE
	3rIA==
X-Received: by 10.14.10.5 with SMTP id 5mr4406915eeu.78.1399992540461;
	Tue, 13 May 2014 07:49:00 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	m44sm40701315eeh.14.2014.05.13.07.48.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 07:48:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 16:48:47 +0200
Message-Id: <1399992528-10108-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH, V2][meta-qt5 2/3] qtwayland-native: make qtwayland find qtwaylandscanner
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
X-List-Received-Date: Tue, 13 May 2014 14:49:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bindir/qt5 causes not building QtWaylandClient files.
See [1] for further explanation. This error was discoverd by building
hawaii-shell failing with:

| /home/superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qwlinputdevice_p.h:56:58: fatal error: QtCompositor/private/qwayland
|  #include <QtCompositor/private/qwayland-server-wayland.h>
|                                                           ^
| compilation terminated.

[1] https://qt.gitorious.org/qt/qtbase/commit/0e1ce36ae67de940b2d499ec7f23e520dce0f112

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 988aa98..b820665 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -5,3 +5,8 @@ require ${PN}.inc
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
 SRCREV = "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
+
+# wayland-scanner and qtwaylandscanner must be in same path to work properly
+do_install_append() {
+    ln -sf ${D}${OE_QMAKE_PATH_QT_BINS}/qtwaylandscanner ${D}${bindir}/qtwaylandscanner
+}
-- 
1.8.3.1


