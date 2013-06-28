Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2676D6AF0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:37:18 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so2650048pab.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mtmNMKOa4r4/1ADyvaUxyziWLKDCd0UKTMkg5JYPh/g=;
	b=WKgTQ2OH13ufFAArQ/F2U1Sw/yNCcPlJDZFg08aEigs/mWx5KkGrLu4m1b0aomqxOW
	6XY0UKL+1hm13x5iN0APrfle2gCIvTR/TR/aDHI+KKcjeRdEBIiTASeR2bmolU/xgELt
	HzzwgO44ZhRHfWaJdD7DWZjeLqTqfJKwQvDLj5S7ps+eBlt1qGIu6zdMSGlyKqpb1BN3
	EON9p5Oc55jB0i65LGp934ygosVd/Ol1EeQSJYIoUDc8os46/Tbve0j6XInd3O3iVb9h
	S8OpVhre4RKlRKkFoA+bGQIQ+5uRACjLvEzCDBAGpvibc6Au3IoLm7138RhrtCH1+0DL
	SW2w==
X-Received: by 10.66.219.38 with SMTP id pl6mr12410667pac.59.1372437439536;
	Fri, 28 Jun 2013 09:37:19 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xz1sm9736917pab.5.2013.06.28.09.37.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 09:37:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2013 09:36:58 -0700
Message-Id: <1372437419-31205-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-browser][PATCH V2 3/3] nspr: Match the bbappend to OE-Core
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
X-List-Received-Date: Fri, 28 Jun 2013 16:37:18 -0000

Remove PRINC not needed with PR server

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-support/nspr/nspr_4.10.bbappend  |   17 +++++++++++++++++
 recipes-support/nspr/nspr_4.9.6.bbappend |   19 -------------------
 2 files changed, 17 insertions(+), 19 deletions(-)
 create mode 100644 recipes-support/nspr/nspr_4.10.bbappend
 delete mode 100644 recipes-support/nspr/nspr_4.9.6.bbappend

diff --git a/recipes-support/nspr/nspr_4.10.bbappend b/recipes-support/nspr/nspr_4.10.bbappend
new file mode 100644
index 0000000..3296e91
--- /dev/null
+++ b/recipes-support/nspr/nspr_4.10.bbappend
@@ -0,0 +1,17 @@
+# nspr-native is needed by nss
+BBCLASSEXTEND = "native"
+
+# don't build tests : this ICE on armv7
+do_configure_append() {
+	sed -i "s:CSRCS =:CSRCS = \nDONTBUILD =:g" ${S}/pr/tests/Makefile
+}
+
+# HACK : to get do_install working when tests are not built
+do_install_prepend () {
+	for i in ${TESTS}; do
+		touch ${S}/pr/tests/$i
+	done
+}
+
+# FIXME : wtihout this nss will depend on nspr-dev
+FILES_${PN} = "${bindir}/* ${libdir}/*.so"
diff --git a/recipes-support/nspr/nspr_4.9.6.bbappend b/recipes-support/nspr/nspr_4.9.6.bbappend
deleted file mode 100644
index 3153bf3..0000000
--- a/recipes-support/nspr/nspr_4.9.6.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-# nspr-native is needed by nss
-BBCLASSEXTEND = "native"
-
-# don't build tests : this ICE on armv7
-do_configure_append() {
-	sed -i "s:CSRCS =:CSRCS = \nDONTBUILD =:g" ${S}/pr/tests/Makefile
-}
-
-# HACK : to get do_install working when tests are not built
-do_install_prepend () {
-	for i in ${TESTS}; do
-		touch ${S}/pr/tests/$i
-	done
-}
-
-# FIXME : wtihout this nss will depend on nspr-dev
-FILES_${PN} = "${bindir}/* ${libdir}/*.so"
-- 
1.7.9.5


