Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RFrCp-0005uj-GH
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 19:42:31 +0200
Received: by ggnq1 with SMTP id q1so3097820ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xFs2GnvN06EmYaCkHl6AezCgvibYto5PW9KNguPZClw=;
	b=h8ZZFXRL/IlN2RktqoguUkhkBHNHA1STZDGb75gBG3yHgWCODgWRgo3Zx9jbSMbZ7L
	mgFniUVtv1ZZnkpHmP7jpDHQJAo/97qWO+G/XHI3/qxmEE+pn988ZgGeMho1jqcIAXrm
	uXOVXzoCBYevMNafAjcznIQSRt9CA8CtARtgA=
Received: by 10.151.13.10 with SMTP id q10mr16847862ybi.86.1318873000066;
	Mon, 17 Oct 2011 10:36:40 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 16sm38609229ant.10.2011.10.17.10.36.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 10:36:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 17:36:30 +0000
Message-Id: <93df3fc261e0e07164a093b42abf63f1ba0cee48.1318872954.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318872954.git.otavio@ossystems.com.br>
References: <cover.1318872954.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] openssl: disable parallel install
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
X-List-Received-Date: Mon, 17 Oct 2011 17:42:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-connectivity/openssl/openssl.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl.inc b/meta-oe/recipes-connectivity/openssl/openssl.inc
index 86b29f0..7d5c0ec 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl.inc
+++ b/meta-oe/recipes-connectivity/openssl/openssl.inc
@@ -11,7 +11,7 @@ S = "${WORKDIR}/openssl-${PV}"
 
 inherit siteinfo
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 AR_append = " r"
 CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
@@ -21,6 +21,9 @@ CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_END
 CFLAG_mtx-1 := "${@'${CFLAG}'.replace('-O2', '')}"
 CFLAG_mtx-2 := "${@'${CFLAG}'.replace('-O2', '')}"
 
+# parallel install fail sometimes
+PARALLEL_MAKEINST = ""
+
 export DIRS = "crypto ssl apps"
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.2.5



