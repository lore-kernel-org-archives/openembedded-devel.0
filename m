Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1Pe4cA-0001a5-3X
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 12:48:14 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 573B195443B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jan 2011 12:47:41 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id x9y2473lcOCn; Sat, 15 Jan 2011 12:47:40 +0100 (CET)
Received: from localhost.localdomain (e181145082.adsl.alicedsl.de
	[85.181.145.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 438EA9544383;
	Sat, 15 Jan 2011 12:47:40 +0100 (CET)
From: Lars Michelsen <lm@larsmichelsen.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jan 2011 12:45:11 +0100
Message-Id: <1295091911-3873-2-git-send-email-lm@larsmichelsen.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20110115045639.GD21179@jama>
References: <20110115045639.GD21179@jama>
Subject: [PATCH] Fix building of package live555
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Jan 2011 11:48:14 -0000

The file http://www.live555.com/liveMedia/public/live.2010.10.15.tar.gz
did not exist anymore on the server.

So bumped version to the current file: live.2011.01.10.tar.gz

Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
---
 recipes/live555/live555_20101015.bb |    7 -------
 recipes/live555/live555_20110110.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 recipes/live555/live555_20101015.bb
 create mode 100644 recipes/live555/live555_20110110.bb

diff --git a/recipes/live555/live555_20101015.bb b/recipes/live555/live555_20101015.bb
deleted file mode 100644
index eb6dfe3..0000000
--- a/recipes/live555/live555_20101015.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require live555.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "29734ddc6fddbb1a3a8f51a6de7a21c5"
-SRC_URI[sha256sum] = "278d99c0880f324769164d6872fea88f8d82ec5b87bb66c92035f46ee2f10adc"
-
diff --git a/recipes/live555/live555_20110110.bb b/recipes/live555/live555_20110110.bb
new file mode 100644
index 0000000..cf64b83
--- /dev/null
+++ b/recipes/live555/live555_20110110.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "978cd8443735d47b53ee624a985a047e"
+SRC_URI[sha256sum] = "39f23d4c140f9a0bfd6fa11f38c75ae8c3b4fab1930ca1acb8ad66e70947dbc1"
+
-- 
1.7.1



