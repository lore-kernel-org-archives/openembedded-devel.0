Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P6qxf-0005Et-KL
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:33:08 +0200
Received: by gya1 with SMTP id 1so536035gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=oblImkP+1Vw1m5q1BYd3tdMOWIU0z7gGdovzVV3Vo/U=;
	b=ZWl9EV5bbEeGUIXnM3+kr50Uo8ozqDQZsEpwOxv5FHWOtFxJ1SO32EHfwkr55qJB6z
	VQ+hcoHMnClBIFrWEFF4X1Axobo43muFtc6F04tXv0Ubk8JKuIVvTlzlwDQcM06Gr0ua
	wdqxxKh1sbRtaVAYkPG3M2cIxDI1Hb3sGiu7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KL0bsuR90lz/JY11zCnO6Gg7SpfSAKIotAz4kQkCUNhfzGmj15hthHoUC5fserCAm8
	s2DnfnJV/Ab18Kp/XHl/nSwme2RvPLjF5wk2Sw95GuCpdtGpQ2mChYeO3cYZH3h4EhCS
	nObRev1bv9aadG5cxtfVRcLkxb0fSgybaws2c=
Received: by 10.150.205.4 with SMTP id c4mr2403621ybg.26.1287174755356;
	Fri, 15 Oct 2010 13:32:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f43sm10295602yhc.26.2010.10.15.13.32.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Oct 2010 13:32:34 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 15:32:28 -0500
Message-Id: <1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/2] Fix class OVERRIDES order
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
X-List-Received-Date: Fri, 15 Oct 2010 20:33:08 -0000

* Changed the OVERRIDES settings in the classes to use the new
  ordering.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 classes/native.bbclass    |    2 +-
 classes/nativesdk.bbclass |    2 +-
 classes/sdk.bbclass       |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index dcedff2..2e52bfc 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -94,7 +94,7 @@ DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
 
 def native_virtclass_add_override(d):
     if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
-        bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", d, False) + ":virtclass-native", d)
+        bb.data.setVar("OVERRIDES", "virtclass-native:" + bb.data.getVar("OVERRIDES", d, False), d)
 
 OVERRIDES .= "${@native_virtclass_add_override(d)}"
 
diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
index f3f9930..6f21534 100644
--- a/classes/nativesdk.bbclass
+++ b/classes/nativesdk.bbclass
@@ -52,7 +52,7 @@ export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 ORIG_DEPENDS := "${DEPENDS}"
 DEPENDS_virtclass-nativesdk ?= "${ORIG_DEPENDS}"
 
-OVERRIDES .= ":virtclass-nativesdk"
+OVERRIDES =. "virtclass-nativesdk:"
 
 python __anonymous () {
     pn = bb.data.getVar("PN", d, True)
diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index c8fa076..1ad8951 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -67,4 +67,4 @@ FILES_${PN}-dbg += "${prefix}/.debug \
 
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
-OVERRIDES .= ":virtclass-sdk"
+OVERRIDES =. "virtclass-sdk:"
-- 
1.7.0.4



