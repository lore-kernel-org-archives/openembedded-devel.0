Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id C1D1F65ED7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 12:34:59 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hy4so1835316vcb.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2014 05:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=CFrbsQXtfkst0zvSYOytchK6Sp8ZwEhlOaqMy2WHJjY=;
	b=LtkrUrU7QD0HoF457yuBIrIQhMI79IMRRM9BMquJOSxAIxHiXGwG9cdk8/TCaaztlT
	9Prhi4RnS6InY+f8BKpj/8Vek8GKkiJd3jGuvV0RsNXYRszNjwHhH3qJ+Si6RYR9sCtR
	9VE0ssez5oZfoqaqm+2NixqrAbK7OiZYAPZWimSFS9PSiRfF3Z1Tazn7Oa4UeGvWOmkX
	O20yjb8vxhWo4eQlHU8BMfIkMQ1QsfIZLAydBLtwI3js8OdHgaA1mvkDdJHJE1TkW8LH
	SO1gQ7EpXW2Ctct8QQFA2PJimqnCN9WE1znfnmDwWJapHqhCSpb63Ik8DJMlLMzjzh7L
	osEg==
X-Received: by 10.221.64.20 with SMTP id xg20mr25303137vcb.3.1402317300309;
	Mon, 09 Jun 2014 05:35:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id im7sm797843vec.14.2014.06.09.05.34.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 05:34:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 306A81B95540F; Mon,  9 Jun 2014 09:34:56 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  9 Jun 2014 09:34:54 -0300
Message-Id: <1402317295-5120-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc4
In-Reply-To: <1402317295-5120-1-git-send-email-otavio@ossystems.com.br>
References: <1402317295-5120-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/3] cmake_qt5.bbclass: Use qmake_qt5_base.bbclass
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
X-List-Received-Date: Mon, 09 Jun 2014 12:35:02 -0000

The CMake uses QMake internally to query system settings so we ought
to have it using the same variable contents and settings.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/cmake_qt5.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
index 94a60dc..aaead5d 100644
--- a/classes/cmake_qt5.bbclass
+++ b/classes/cmake_qt5.bbclass
@@ -1,5 +1,12 @@
+#
+# QMake variables for Qt
+#
+inherit qmake5_base
+
+QT5TOOLSDEPENDS ?= "qtbase-native"
+DEPENDS_prepend = "${QT5TOOLSDEPENDS} "
+
 inherit cmake
-inherit qmake5_paths
 
 EXTRA_OECMAKE += " \
     -DOE_QMAKE_PATH_PREFIX=${OE_QMAKE_PATH_PREFIX} \
-- 
2.0.0.rc4


