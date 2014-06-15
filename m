Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id D9BBF6FC48
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 01:25:53 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id 10so1194446lbg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 18:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E7h3s4ckNKZs6UUDNATYzdQaoajgRd4W44vyJXP75YA=;
	b=1IKbsB2c7aHGVM9V9OqqM8SzgbSi9DjuXJ9QAy45yxrR4wAzuOL/LCXT/W5tnihG1o
	jOLYUs3/E7OE7mlzsFryMoG+J73aAlIMLeBFdopdQM8qk9pHyaUzVAQbynpiHJxtZ3jU
	4DcuOMo3o9GgZQZivvh/y20T7SdM9yEclv3BsLY4jKeWosNFTYENiEFNAAq1mqSV9Oue
	j0tiAx7UgYJvfEfxL9yoKI6L23/bqKUmY2n2b2QCYayrMfSZBal2LjUJoX6LglKFFHUZ
	DAnxIoKunti7TQ13DPu+7MtTTelI2GRS89rnYOQBm/iixHQjB7xm7fDgAFH4IarBI/yo
	R7eA==
X-Received: by 10.152.36.134 with SMTP id q6mr7973087laj.29.1402795553530;
	Sat, 14 Jun 2014 18:25:53 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id xk1sm2666249lac.38.2014.06.14.18.25.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Jun 2014 18:25:52 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.82_1-5b7a7c0-XX)
	(envelope-from <cazfi74@gmail.com>)
	id 1WvzCg-0007tb-Sq; Sun, 15 Jun 2014 04:25:50 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jun 2014 04:25:20 +0300
Message-Id: <1402795520-30201-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1402795520-30201-1-git-send-email-cazfi74@gmail.com>
References: <1402795520-30201-1-git-send-email-cazfi74@gmail.com>
Subject: [meta-oe][PATCH 2/2] libsdl-ttf: Fix build with separate builddir
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
X-List-Received-Date: Sun, 15 Jun 2014 01:26:02 -0000

Do not assume that sources are in the current directory in
do_configure_prepend() but refer to them with path to source directory.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
index c6e5a15..0127b31 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb
@@ -4,7 +4,7 @@ DEPENDS = "virtual/libsdl freetype"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${PV}.tar.gz \
            file://configure.patch \
@@ -18,11 +18,12 @@ inherit autotools
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_configure_prepend() {
-  
+
+    # Removing these files fixes a libtool version mismatch.
     MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
- 
+
     for i in ${MACROS}; do
-     rm acinclude/$i
+      rm ${S}/acinclude/$i
     done
 
 }
-- 
2.0.0


