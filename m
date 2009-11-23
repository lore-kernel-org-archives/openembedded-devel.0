Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCcet-00011X-Tz
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:25:07 +0100
Received: by mail-yx0-f175.google.com with SMTP id 5so2509593yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 09:23:37 -0800 (PST)
Received: by 10.100.24.20 with SMTP id 20mr502760anx.15.1258997017872;
	Mon, 23 Nov 2009 09:23:37 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1537045ywf.50.2009.11.23.09.23.35
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 09:23:37 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 14:17:14 -0300
Message-Id: <1258996635-20162-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] rpm-native-4.4.2.3: removing invalid layout var
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
X-List-Received-Date: Mon, 23 Nov 2009 17:25:07 -0000

rpm-native will break with old layout definition at an invalid recursion.

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 recipes/rpm/rpm-native_4.4.2.3.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/rpm/rpm-native_4.4.2.3.bb b/recipes/rpm/rpm-native_4.4.2.3.bb
index 62cef86..3cfb43e 100644
--- a/recipes/rpm/rpm-native_4.4.2.3.bb
+++ b/recipes/rpm/rpm-native_4.4.2.3.bb
@@ -5,5 +5,4 @@ require rpm-${PV}.inc
 DEPENDS = "beecrypt-native gettext-native zlib-native file-native popt-native python-native"
 PACKAGES = ""
 
-export localstatedir = "${layout_localstatedir}"
-export varprefix = "${layout_localstatedir}"
+export varprefix = "${localstatedir}"
-- 
1.6.5



