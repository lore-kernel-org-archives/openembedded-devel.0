Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f52.google.com (unknown [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 320F266046
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:48:37 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so4407713eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uOoFvVuBACD185dehWRAFg0U9RauW/nTrK8JGOl8DgI=;
	b=q7+rsNxKWQHwRv60Zs8MRsn/PWZDtT4S++JU2R5jmW/jj8CriCb6aynLCFwjJtkqOy
	xRib/1h0iEiGBDwIbarQDqenlA0zQ3n7RWCK9rr7tmhRk4Ld77Ge2oGDzMnCosGrvcN+
	j6gDjCJ7EPECZYlnf6kD6aVHIpRdQDmXtOkfGm2doAoj+DVa14ltntYZ4ykKLA5CmAbZ
	7lIwWsHcD4muOHDqkwY6GvCXMMhf4P58QH2grJzN0xhb02HevbQpIXrvRtP9yUrX2G+5
	qvz0Rmug2b8kVA/LdetlNtiVmuUK0Dl4cN+6y5PBS8q22GndRyojgG92QV9VR3WfEiwf
	VvUg==
X-Received: by 10.14.32.7 with SMTP id n7mr3101475eea.107.1399887708731;
	Mon, 12 May 2014 02:41:48 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	x45sm31617322eeu.23.2014.05.12.02.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 02:41:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 11:41:37 +0200
Message-Id: <1399887698-19336-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC][meta-qt5 2/3] qtwayland-native: make qtwayland find qtwaylandscanner
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
X-List-Received-Date: Mon, 12 May 2014 09:48:38 -0000
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

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland-native_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 988aa98..966ae55 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -5,3 +5,8 @@ require ${PN}.inc
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
 SRCREV = "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
+
+# wayland-scanner and qtwaylandscanner must be in same path to work properly
+do_install_append() {
+	ln -sf ${D}${OE_QMAKE_PATH_QT_BINS}/qtwaylandscanner ${D}${bindir}/qtwaylandscanner
+}
-- 
1.8.3.1


