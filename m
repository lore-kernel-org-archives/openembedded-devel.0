Return-Path: <mryndzionek@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id AADF76AE73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 08:58:28 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so8854986obc.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 00:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RAygA7YaC1ro9PgXmssvbkOQ7nUSPVW7GRHoI16m+sQ=;
	b=ejHDMGdrMryuwWVTHXSjXu6RKfDw4XZ6sxEGIYmD7W5l86uHcn9f4lOVnKMI3y0Ewt
	n2OxOB9yeS5nOcunr1i5Wvl/SGV8sYb4cBkkNeXGMYrPl/hzRKyr0ui+Mrai/f/4idOX
	HPFXiLmIHImaan/GcgAadvNdM7RH3qDw7anKSeM5YEZk7Wv0YX6ZqkOuOmUOQyNZ56yD
	HsEu0ixMxmPcKW8Q7bVMBEyqOMvAiJB27JAU6hu4rW03QckoCSWn8D7/UFOPZv84nFhW
	TNP7ZL2j5QuI5PrQ19Vp4LB497dRowNGYLBlApIN9SJUElljVkk0xqwC37XcXPO7+F6A
	YHDg==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr191919obb.17.1389689909552;
	Tue, 14 Jan 2014 00:58:29 -0800 (PST)
Received: by 10.76.130.204 with HTTP; Tue, 14 Jan 2014 00:58:29 -0800 (PST)
Date: Tue, 14 Jan 2014 09:58:29 +0100
Message-ID: <CADxgXkV-YtMG-GLbScW3We-GOekxE6=7cBENaoy2gxv8Lp2tMA@mail.gmail.com>
From: Mariusz Ryndzionek <mryndzionek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java][PATCH] openjdk: make the pkg_postinst work on busybox based systems
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
X-List-Received-Date: Tue, 14 Jan 2014 08:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

From cb6ebd77ca41e024f7168a1208523a81f158ed93 Mon Sep 17 00:00:00 2001
From: Mariusz Ryndzionek <mryndzionek@gmail.com>
Date: Tue, 14 Jan 2014 09:45:03 +0100
Subject: [PATCH] openjdk: make the pkg_postinst work on busybox based
systems

The 'head -1' option is not available on some busybox systems.
Change the command to 'head -n 1'.
---
 recipes-core/openjdk/openjdk-postinst.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-postinst.inc
b/recipes-core/openjdk/openjdk-postinst.inc
index e63a451..ad275d7 100644
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ b/recipes-core/openjdk/openjdk-postinst.inc
@@ -11,7 +11,7 @@ pkg_postinst_${JDKPN}-vm-shark () {
 pkg_prerm_${JDKPN}-vm-shark () {
  sed -i -e "/^\-shark.*/d" -e "/^$/d"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep
-q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
           sed -i -e "/${FIRST_KNOWN}/d" -e
 "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi

@@ -29,7 +29,7 @@ pkg_postinst_${JDKPN}-vm-cacao () {
 pkg_prerm_${JDKPN}-vm-cacao () {
  sed -i -e "/^\-cacao.*/d" -e "/^$/d"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep
-q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
           sed -i -e "/${FIRST_KNOWN}/d" -e
 "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi

@@ -47,7 +47,7 @@ pkg_postinst_${JDKPN}-vm-jamvm () {
 pkg_prerm_${JDKPN}-vm-jamvm () {
  sed -i -e "/^\-jamvm.*/d" -e "/^$/d"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep
-q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
           sed -i -e "/${FIRST_KNOWN}/d" -e
 "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi

@@ -56,7 +56,7 @@ pkg_prerm_${JDKPN}-vm-jamvm () {

 pkg_postinst_${JDKPN}-vm-zero () {
         if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg &&
grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-           FIRST_KNOWN=`grep "KNOWN"
$D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+           FIRST_KNOWN=`grep "KNOWN"
$D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
            sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d"
$D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
            echo ${FIRST_KNOWN} >>
$D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi
@@ -67,7 +67,7 @@ pkg_postinst_${JDKPN}-vm-zero () {
 pkg_prerm_${JDKPN}-vm-zero () {
  sed -i -e "/^\-server.*/\-server ERROR"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
-          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -1`
+          FIRST_KNOWN=`grep "KNOWN"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
           sed -i -e "/${FIRST_KNOWN}/d" -e
 "s|\(^\-server*\)|${FIRST_KNOWN}\n\1|"
${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
         fi
 }
-- 
1.7.9.5

