Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2F776609A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:58:30 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id o6so4715775oag.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3zQYK4eJaPb5HFqkKvqPk7Z5pc05x0wsW2ZYpt8cWwg=;
	b=IohA0SgO7goJNWEVq3QpNDxtbCcZciiGKtI69buBSPCMQwgKSS99yMNppcS2ar2iFj
	YyoNLHOWRVMh0hniYiHuxcjfwMNQcYYb++/SVgYOmSNlEtv0j9Fp/BzdtqJHJcXlJxVL
	4SVr5V7jUJvXeQbbS/Hri09IzcaI86Niv9snisD/NGR7DmWmr00XfTUdF4nbWVjxMPAh
	njtwF+NLuuGtaJAl1b7KyT6Z6ku5d7Qb8+nr1Y7k+jzE/9gFdDVg1ICchkJlBmgwo8Nb
	aKwkj/RCaaE8XpdK8Nx/dN5Y3CyKnxNgRHwKqnjntzX6OM1m1DHlkA2wUzWI7MOkiaUe
	DwCg==
X-Gm-Message-State: ALoCoQk6FUgOl1GymFCC88sXU9nZ057jwdT9x7NA3xFM0wXkivryp13p4WG87ru9wBNmFn9Poo7Z
X-Received: by 10.182.28.195 with SMTP id d3mr15072296obh.19.1397149111856;
	Thu, 10 Apr 2014 09:58:31 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	oz15sm19863136oeb.13.2014.04.10.09.58.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 09:58:31 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 12:58:18 -0400
Message-Id: <1397149098-1303-3-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
References: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 2/2] terminus-font: update DEPENDS
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
X-List-Received-Date: Thu, 10 Apr 2014 16:58:34 -0000

This recipe requires the native tool bdftopcf to be available.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index a6bef10..ac5f8cb 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -8,7 +8,7 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
 
-DEPENDS = "perl-native-runtime gzip-native"
+DEPENDS = "bdftopcf-native perl-native-runtime gzip-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
-- 
1.9.0


