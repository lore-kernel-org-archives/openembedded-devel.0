Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A11816CDA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:22 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so3533008eaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=mmBG+Bm9Ec9/o3IUGe9akpvvOfO1vVRYWCSnhmA7Jz0=;
	b=K6QgkWsrx4SvEH3dNdW3g2a0pBb2gkB+/SCfds49HcmxbFtBR1obCGI02KAOkeUfzA
	c8pef4hL6nGGMcX4ICdi+J8abBGVbttKgePaAXFFqEgKapnvCLcFAcq+U4ETdNuM0uo2
	Jx0JN3ZbtFZMYhNzn8rYQ56LEtPvz81cWTxaTQW1HtIdV/XRZnLIPgqYzefH7DN5bL3O
	yZhtC9AHDggqeDcWjs4eOCwK5QM/bcy210XkrRfI8n6ynuRXtgilNuNnX6UQ9ugK5foj
	lxur/4oJlWrEEAWOuP0DTYoXXgwyPDUxJQEdpimYwul3T1twzTJGDQmy0u9e3Auoh3eR
	43XQ==
X-Received: by 10.14.198.197 with SMTP id v45mr19546een.52.1381187064067;
	Mon, 07 Oct 2013 16:04:24 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:51 +0200
Message-Id: <1381187036-3005-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 1/6] qt-creator: add qt4-plugin-sqldriver-sqlite to RRECOMMENDS_${PN}
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
X-List-Received-Date: Mon, 07 Oct 2013 23:04:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix runtime message 'QSqlDatabase: QSQLITE driver not loaded'

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index 3a29c3b..44eb672 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -29,4 +29,6 @@ FILES_${PN}-dbg += "${datadir}/qtcreator/*/*/*/*/.debug \
                     ${libdir}/qtcreator/.debug \
                     ${libdir}/qtcreator/*/*/.debug"
 RRECOMMENDS_${PN} += "packagegroup-core-buildessential \
-                      packagegroup-qt-toolchain-target"
+                      packagegroup-qt-toolchain-target \
+                      qt4-plugin-sqldriver-sqlite \
+"
-- 
1.8.3.1


