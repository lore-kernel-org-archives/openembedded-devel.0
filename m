Return-Path: <joe.macdonald@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 74303709D7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 14:42:37 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so2944135ier.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0OTdq06wTqh51/Y4nB695Oqiq+1ZmebGchpOrjhPzFY=;
	b=gBr40hERZ+XCrVzMc1MD0f+cRtRPSY72gZ2Mi7MwZTMyyR27S91AnnmU2elUbvn1de
	Snk90ikcw6TLldjNee+Yqgbx6NBSsVXGrLaV5URfiJsn2MjFZFx+8f3jEMgfnyGWqPdF
	trOKOn/Ra1V7RflipHZQnc2chNM8WAqP+N6FUd05zPSvMSoYHwmS67HvM1SCbgZ0Ne/P
	Nrqg7aT/qPMLRKo63D3AHkZ6dJiSGU7Tv9lGUWeEIOzMYwsye2TuOtxqjWZZg71SokDN
	7C66iK9EpM28dfnyd+tMH1u5s2PaLQ5AW9VMcHJeSdtU7fHdMSU+567kecbdyuA7S/4C
	j7HA==
X-Received: by 10.50.35.133 with SMTP id h5mr19350699igj.26.1407336158032;
	Wed, 06 Aug 2014 07:42:38 -0700 (PDT)
Received: from skynet.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id l6sm22969002igv.4.2014.08.06.07.42.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 07:42:36 -0700 (PDT)
Sender: Joe MacDonald <joe.macdonald@gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 10:42:33 -0400
Message-Id: <1407336153-2226-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.0.0.257.g75cc6c6
Subject: [meta-networking][PATCH] wireshark: update README instructions
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
X-List-Received-Date: Wed, 06 Aug 2014 14:42:38 -0000

Minor tweaks to the README to make the email suggestion follow the format
used in other meta-openembedded README files and adding clarification on
building wireshark in a GUI environment.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/wireshark/README | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/README b/meta-networking/recipes-support/wireshark/README
index 0e0c526..63b5b72 100644
--- a/meta-networking/recipes-support/wireshark/README
+++ b/meta-networking/recipes-support/wireshark/README
@@ -19,6 +19,10 @@ IMAGE_INSTALL_append = " wireshark"
 Adding the wireshark to your graphical build
 ========================================
 via local.conf
+IMAGE_INSTALL_append = " wireshark"
+
+and one of:
+
 EXTRA_IMAGE_FEATURES += "x11-base"
 
 or use the "core-image-x11"
@@ -29,8 +33,12 @@ Maintenance
 
 Send patches, comments or questions to openembedded-devel@lists.openembedded.org
 
-When sending single patches, please using something like:
-'git send-email -1 --to  openembedded-devel@lists.openembedded.org --cc akuster@mvista.com --subject-prefix=meta-security][PATCH'
+When sending single patches, please use something like:
+
+   git send-email -1 -M \
+       --to openembedded-devel@lists.openembedded.org \
+       --cc akuster@mvista.com \
+       --subject-prefix=meta-networking][PATCH
 
 Maintainer:    Armin Kuster <akuster@mvista.com>
 
-- 
2.0.0.257.g75cc6c6


