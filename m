Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id F3514606D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 09:14:18 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so1361450wev.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 02:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OUmj2TLZ+PwzYOlwhw7X79BaAnkM287KXpYgkXKckbY=;
	b=SIeUhADLYQVI1PMW/d78Ap6VCmZDOXaEj8aVkZzrEVD1E88LRi7EZxWPbksO7Dch4G
	dGlYXZ+YHUei4jib77BrfUMoTReqdF2n+tqPkNWfs0BBD/LQ4mjCtciF2Zpb394NUEur
	yXu86eSqZeRWOlBplQZOYG89nYLXpCSgXddgbbfs0UpK2ivlvraqZG5q9t4uE+LdtDFP
	X6Cjw6mhGECY+ba2xpFbdgZUOgd8k6jeFsNXSORkbzZWRFKM2u0+ObpP0ncE2TTP3fR+
	965RHZlJ7h58hxFQI38+vEpszLndEiQwnMUGk4wnUl5q3X0q9Id8/VwD2KhCTtt91Nsr
	7UNA==
X-Gm-Message-State: ALoCoQlQ/4aMpJKNk8aILigGqakevpC9eMwvJjW7LL7nyOF04pTPojy/ZxXgDQjJa1dkaVEe1Sc0
X-Received: by 10.194.19.161 with SMTP id g1mr2853696wje.20.1398849258895;
	Wed, 30 Apr 2014 02:14:18 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id j3sm35218324wjw.38.2014.04.30.02.14.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 02:14:18 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 11:11:16 +0200
Message-Id: <1398849076-9866-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] fwts: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 30 Apr 2014 09:14:19 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/fwts/fwts_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/fwts/fwts_git.bb b/meta-oe/recipes-extended/fwts/fwts_git.bb
index 6f6df0b..d704d84 100644
--- a/meta-oe/recipes-extended/fwts/fwts_git.bb
+++ b/meta-oe/recipes-extended/fwts/fwts_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libpcre json-c"
 
-inherit autotools
+inherit autotools-brokensep
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
-- 
1.9.0


