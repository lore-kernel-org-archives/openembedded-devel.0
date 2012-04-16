Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SJcmh-00033n-N1
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 05:39:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3G2KuBs001772
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Apr 2012 19:20:56 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Sun, 15 Apr 2012 19:20:56 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:20:31 +0800
Message-ID: <1334542833-27552-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
References: <1334542833-27552-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.202]
Subject: [PATCH 1/3] qt4-native: enable features to build kdelib4-native
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
X-List-Received-Date: Mon, 16 Apr 2012 03:39:24 -0000
Content-Type: text/plain

add a bbappend file to enable qt4-native 4.7.4 to enable openssl and
phonon support. Add flags '-no-pch -no-sm' to make qt4-native itself
compiled successfully.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 recipes-misc-support/qt4-native_4.7.4.bbappend |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 recipes-misc-support/qt4-native_4.7.4.bbappend

diff --git a/recipes-misc-support/qt4-native_4.7.4.bbappend b/recipes-misc-support/qt4-native_4.7.4.bbappend
new file mode 100644
index 0000000..a11a23f
--- /dev/null
+++ b/recipes-misc-support/qt4-native_4.7.4.bbappend
@@ -0,0 +1,4 @@
+# Needed by kdelibs4-native
+EXTRA_OECONF += "-no-pch -no-sm -openssl"
+
+TOBUILD += "src/phonon"
-- 
1.7.5.4



