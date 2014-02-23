Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9FF6E901
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 13:50:33 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id t59so4215752yho.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 05:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mfXbke1Obyxum2cuvTBgB2ALEzBhUQjn4zvzm/GYOgY=;
	b=RUyZNRWv5jZZLoOwWwXaJmC9rPbMKdV1E5qXY12odFzVXOP+n7bGoGGxIu6pt/ovGx
	0vEs8lo7DCaZ2RTQBR+oSAj8YSAjSdduVwexHW86oLANTvDjXe1iJO6ntupUtlYmlMXK
	yMTVCBEt851yVmpmA8K2KOWWavIORzgOoi7ljY6i4uUL/w4ixvVkx8Y7lLIYZ/Z0e9EA
	DARDoahDpLZIXxYokkJaai0JXT07JuOcRE8K4rHpw/oJ7v8qSEBJE1imoFDmTA8D4uYm
	XsBeiib9GJfzjrZR2kms8KJKZRNgyW1T6Q05yaq8JQFQsuGZlz19Kc1+E0VaLHjrY+MI
	++Zg==
X-Received: by 10.236.160.9 with SMTP id t9mr23527109yhk.10.1393163434304;
	Sun, 23 Feb 2014 05:50:34 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id p63sm4246689yhl.15.2014.02.23.05.50.32
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 05:50:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 10:50:11 -0300
Message-Id: <1393163414-9494-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Sun, 23 Feb 2014 13:50:34 -0000

When looking for Qt5 headers we ought to use the Qt5 specific path. In
case the distribution wants to have a flat tree it can set QT_DIR_NAME
and it will still works as expected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/qmake5_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..db6834f 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -57,7 +57,7 @@ do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
 [Paths]
 Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
+Headers = ${OE_QMAKE_PATH_HEADERS}/${QT_DIR_NAME}
 Libraries = ${OE_QMAKE_PATH_LIBS}
 ArchData = ${OE_QMAKE_PATH_ARCHDATA}
 Data = ${OE_QMAKE_PATH_DATA}
-- 
1.7.10.4


