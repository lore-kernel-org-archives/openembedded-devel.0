Return-Path: <erik.boto@pelagicore.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 61D2C60664
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:47:36 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id fn20so5422634lab.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 23:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=Zmf5Waus+SksceyvxmCb6ad78hy0IDGvjE6EWxmv2Do=;
	b=luW18rzimTYeahFqR7Qxzcq0FieOPLhkPo2dP9Yv4qy0bI+OhFFBohZumdxBQ8y/kI
	2lWsccK4/esvRLLmF1VoF5fyJRkO/9h3fshgCv5ia/GioXB833rRFdlWIRQtqlRNHHN2
	Uc2x9CmQrdIHHQk0fv0AV1AW3/XDVfKDPgkOeHfn2BQuZwKB6Q9EwZZpbBw50SZgyF7h
	uT708tIn0rtOfx3pUSI467EiHqmYR8XB2Aldb03zv052vu6It5NUlan4ANtUWitijfrG
	M7MK5aEWRtKtUFlxDShJlEjhIkRfA6zHDEac+4trMChvcsyMNR96rfGlUa6kl+CgZz3X
	MugQ==
X-Gm-Message-State: ALoCoQksfjKRkm/DS4QoNj/ogEX2lUJecHGyQ6dxEdMK6IkB3ZwNyHGrGl2UGfzZeyg62aN5b59q
X-Received: by 10.152.115.242 with SMTP id jr18mr157391lab.40.1376376455877;
	Mon, 12 Aug 2013 23:47:35 -0700 (PDT)
Received: from erik-mbook.office.pelagicore.net
	(194-237-7-146.customer.telia.com. [194.237.7.146])
	by mx.google.com with ESMTPSA id
	js17sm13340741lab.5.2013.08.12.23.47.34 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 23:47:34 -0700 (PDT)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2013 08:47:07 +0200
Message-Id: <1376376427-21427-1-git-send-email-erik.boto@pelagicore.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5-5.0.2.inc: update path to sources
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
X-List-Received-Date: Tue, 13 Aug 2013 06:47:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They moved the 5.0.2 sources into an archive dir upstream, this updates
the SRC_URI accordingly.

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 recipes-qt/qt5/qt5-5.0.2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5-5.0.2.inc b/recipes-qt/qt5/qt5-5.0.2.inc
index e2a56e5..0bf1404 100644
--- a/recipes-qt/qt5/qt5-5.0.2.inc
+++ b/recipes-qt/qt5/qt5-5.0.2.inc
@@ -7,7 +7,7 @@ QT_VERSION ?= "${PV}"
 QT_VERSION_DIR ?= "${QT_VERSION}"
 
 SRC_URI += " \
-    http://releases.qt-project.org/qt5/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
+    http://releases.qt-project.org/archive/qt/5.0/${QT_VERSION_DIR}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
 "
 
 S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
-- 
1.8.1.2


