Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A19177002
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:23:01 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so44737864wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8IQqRAHxJaQEW+Xh85NDS7b2zCMPoYcRbEQrnnBJe2c=;
	b=J36NLEHPnthxoesTmBGqergwBUH1cchp3AzTiO9b2vyEv67PUcl0xehzHrYRTDl451
	3PhUS90VsLb2ox66GUN07Hv6VSojXltytZUJxYzgLZKyLDvlG4awa/6BDah2nNQb+jt1
	FifdO9yJIO50jOSRfiyIin09e6sU7BM0sxtRzpVsGpGi0jgPTGTVPIu2QOleDnv/xTIo
	cfhT9oQsJFXhUz/ps6kgZZiPOvqXdwqTXBVQb6KCHKxXn56GlUNtiMRkddaNdru8RBnD
	/cYnD2YvT4VSYi7ix4REsa0OnZNrIGDadHjvfteACOGoo5S/P6X4mRvQ+Yhqk3mBef8x
	ToYw==
X-Received: by 10.194.94.100 with SMTP id db4mr19121585wjb.110.1446898981510; 
	Sat, 07 Nov 2015 04:23:01 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.23.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:23:01 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:28 +0100
Message-Id: <1446898829-21243-5-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-browser][PATCH v2 4/5] cef3: fix build of x86-64
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
X-List-Received-Date: Sat, 07 Nov 2015 12:23:02 -0000

Use gypi file for i586 to create the configuration for the x86-64 architecture.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>

Upstream-Status: Inappropriate configuration
Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index c141b94..df4a80f 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -34,6 +34,11 @@ export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
+do_configure_prepend() {
+    # there is no rule for the x86-64 architecture, recycle the i586 one
+    cp  cef/i586_ozone.gypi  cef/x86_64_ozone.gypi
+}
+
 do_configure_append() {
     export PATH=${WORKDIR}/depot_tools:"$PATH"
     # End of LD Workaround
-- 
1.8.4.5


