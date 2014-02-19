Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 319016E904
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 03:22:56 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so16296697yho.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 19:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=e6CQ0N4YIcp1w9YpzpEBZVW+mKklqpoq+Gfi9RafCpU=;
	b=AMR9S8mKYk6GaiFvJ5EEvhtGe+eB8EGL855AJ40OTkATGObFhwrs02IfnGR6N4gWyX
	J7jjcL8wooGsSP0FuZX8t3MzLZ5AwgtO9URQ4Oy4pDQHAnrXAtuuo2oIH96kJzw6lfXC
	HsUQG6SdDvL25Tgf5wai7CvorInAtJZDHFgLFr5ouy/jZwiOiUKMBmR+ViwpHBIzK5GO
	QzsvWCmpkMy405/888Ci2LZZlDhc+eoHk5i6qqKvXjEIJjCWS0FVGNZ2DcCPnEzl1mZh
	hnsiDbQ4YgCu5qRERsJjMw/MXa2wo6GSCwYWW6Z45bi8YdH5rT3UtcA68yCMlUd/dBUh
	/8tg==
X-Received: by 10.236.93.208 with SMTP id l56mr8320148yhf.112.1392780177018;
	Tue, 18 Feb 2014 19:22:57 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id m9sm65514381yha.2.2014.02.18.19.22.55
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 19:22:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 00:22:36 -0300
Message-Id: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Wed, 19 Feb 2014 03:22:57 -0000

When looking for Qt5 components and files we ought to use the Qt5
specific path. In case the distribution wants to have a flat tree it
can set QT_DIR_NAME and it will still works as expected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
I have built two image and the SDK from scratch using this with no
issues. Could someone also give this a try?

 classes/qmake5_base.bbclass |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 3861cd0..ec0267a 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -57,20 +57,20 @@ do_generate_qt_config_file() {
     cat > ${QT_CONF_PATH} <<EOF
 [Paths]
 Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
+Headers = ${OE_QMAKE_PATH_QT_HEADERS}
 Libraries = ${OE_QMAKE_PATH_LIBS}
-ArchData = ${OE_QMAKE_PATH_ARCHDATA}
-Data = ${OE_QMAKE_PATH_DATA}
+ArchData = ${OE_QMAKE_PATH_QT_ARCHDATA}
+Data = ${OE_QMAKE_PATH_QT_DATA}
 Binaries = ${OE_QMAKE_PATH_BINS}
 LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
 Plugins = ${OE_QMAKE_PATH_PLUGINS}
 Imports = ${OE_QMAKE_PATH_IMPORTS}
 Qml2Imports = ${OE_QMAKE_PATH_QML}
-Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
-Documentation = ${OE_QMAKE_PATH_DOCS}
-Settings = ${OE_QMAKE_PATH_SETTINGS}
-Examples = ${OE_QMAKE_PATH_EXAMPLES}
-Tests = ${OE_QMAKE_PATH_TESTS}
+Translations = ${OE_QMAKE_PATH_QT_TRANSLATIONS}
+Documentation = ${OE_QMAKE_PATH_QT_DOCS}
+Settings = ${OE_QMAKE_PATH_QT_SETTINGS}
+Examples = ${OE_QMAKE_PATH_QT_EXAMPLES}
+Tests = ${OE_QMAKE_PATH_QT_TESTS}
 HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
 HostData = ${OE_QMAKE_PATH_HOST_DATA}
 HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
-- 
1.7.10.4


