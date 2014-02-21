Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9AEE6028A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 20:41:28 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so2941985yho.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 12:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=d6rPjtSQTeXfUVcx+iOdBIvLakJXTCB9x9vmNE0eyRo=;
	b=AGYnKRN0UZp9SFc1DopBM4qIXmqKCSveGHUyIP4D0Vtoz8j7F7GKvnZqnoH45UUMyJ
	Ztoe7SNBljFSnNVVWoagqvspgLCrDAX6/ucpW5qwdycO+bEsIknOal9s2PEWccUQcubO
	V3d1ggMA/APoRygZJLLhs9MBGurDT094TW10bNH22UYPu397HRdbWCH2qWqmxRzfd933
	L/W4IiL97iVyTE+osYxWd6mHvjsWMA7v+sAW0+8ZGHF395AIY/zz0VSlEhaJRIox1yqJ
	Vbua+24Leitp0VGpaSXdDt7vv2+ZMePU4t3TBc85CXcpFY+VJa9qXluS3/D4NLHn7y8k
	g+iQ==
X-Received: by 10.236.17.34 with SMTP id i22mr13342521yhi.110.1393015289156;
	Fri, 21 Feb 2014 12:41:29 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm22057317yhc.13.2014.02.21.12.41.24
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 12:41:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 17:41:01 -0300
Message-Id: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Fri, 21 Feb 2014 20:41:29 -0000

When looking for Qt5 headers we ought to use the Qt5 specific path. In
case the distribution wants to have a flat tree it can set QT_DIR_NAME
and it will still works as expected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake5_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..0cfb5a4 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -57,7 +57,7 @@ do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
 [Paths]
 Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
+Headers = ${OE_QMAKE_PATH_QT_HEADERS}
 Libraries = ${OE_QMAKE_PATH_LIBS}
 ArchData = ${OE_QMAKE_PATH_ARCHDATA}
 Data = ${OE_QMAKE_PATH_DATA}
-- 
1.7.10.4


