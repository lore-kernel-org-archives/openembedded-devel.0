Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB5D731D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:15:57 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q21so199536463iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V/1PbW2aBYOodWsynI9irfncwhow8SXDK/IIEdxPa+Q=;
	b=hgfN8vplaJHwvjy2yV6zaZyxBnZyOyJVCUH5gCn6FjTOpDzEE8luSNHBb9Wk8EFMSX
	jeL/YMDd6vgdEyqRDEhCsPY1bOgsmsOUC+M9uDYO/VZWhiHlx4fR9yBUXjeUo0cJC8Qy
	g7fnAunJe+ytvZCmMSCfLVRwjKvBoRrn55yK1V79va/ph7NXcl0M+Fz9zFZRsD4G4WI2
	VPavEvdWKxCmBujkrxhMyxECgQPJ585fCLIeOC3BSoeE62WV+TW8kH4K9DXnK8Cx2vRY
	FDfksliKq15sDbHcEsPzJ1NWpYngDL9F5g8wu/uMGQhA7+1MCNUwpDfmeavDApoSMT+W
	18qA==
X-Received: by 10.107.13.65 with SMTP id 62mr36966674ion.186.1452028558316;
	Tue, 05 Jan 2016 13:15:58 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g67sm26731272ioe.34.2016.01.05.13.15.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 13:15:57 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:15:41 -0500
Message-Id: <1452028543-30812-2-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
References: <1452028543-30812-1-git-send-email-twoerner@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH 2/3] chromium: update run script for early run
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 21:15:59 -0000

If the chromium run-helper script (google-chrome) is run as part of a
(sysvinit) init script, shell variables $USER and $HOME will not be set
(leading to unwanted behaviour).

Replace the use of $USER with `whoami` and replace the use of $HOME with the
OE bitbake variable ROOT_HOME.

In this way the chromium run-helper script will work as expected in both
instances (as part of an init script and from the cmdline).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium/google-chrome   | 4 ++--
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
index b1ec288..b5c2541 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -4,8 +4,8 @@ export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
 export LD_LIBRARY_PATH=/usr/lib/chromium
 
 CHROME_EXTRA_ARGS=""
-if [ "${USER}" = "root" ] ; then
-	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=${HOME}/.chromium/"
+if [ "`whoami`" = "root" ] ; then
+	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=ROOT_HOME/.chromium/"
 fi
 
 /usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 6fddcc7..e138628 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -221,6 +221,9 @@ do_install_append() {
         # the dummy "CHROME_EXTRA_ARGS" line
         sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome
 
+        # update ROOT_HOME with the root user's $HOME
+        sed -i "s#ROOT_HOME#${ROOT_HOME}#" ${D}${bindir}/google-chrome
+
 	# Always adding this libdir (not just with component builds), because the
         # LD_LIBRARY_PATH line in the google-chromium script refers to it
         install -d ${D}${libdir}/${BPN}/
-- 
2.7.0.rc3


