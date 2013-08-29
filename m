Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8FEA96BE69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:03 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so345608ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Uyv0Qm/tljRlzIMWHQ8PxGYqOJwMHsv5I1oODVHejEg=;
	b=NoYtfceiAwK4MTWfmuEyANtxZv12/yxkxMyqv8YEmcnTEVO58MugCN2q0NOngCjB/z
	C98hkeamlOCQpYzq1ZVEQKsSq9B6VVvheMjpxEP12q1fRXURNC7Bx/kOTGqD+hf01/7C
	o+YOE+HWeErmlNT5YtrVSxuenLMh92Jer1ZS4BBGbHGU4EeCec/YIJ7Fn1LhusevVwEE
	S0rHlBsZJ/Ak2eAoWrEEnavs+ctx/otX6UCfOlrgZVZ+mNl5/kg8hQKTFClU61VVqVSY
	iBEGB4RVegg1S2Qw6L1IygrRhD3A8ay11c7PJWy4QgK1Lb2uh52JXsNQYv+HoHL06Rka
	Ha8g==
X-Received: by 10.15.33.132 with SMTP id c4mr5445626eev.2.1377791524031;
	Thu, 29 Aug 2013 08:52:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47168706eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:49 +0200
Message-Id: <ab84ce0abc317b79eebc8a4e2b483a840acba721.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 56/66] thunar: Add PACKAGECONFIG for pcre
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
index fc80dc9..1a92a9c 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.6.3.bb
@@ -12,6 +12,9 @@ SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
+
 FILES_${PN} += "${libdir}/thunarx-2/* \
                 ${libdir}/xfce4/panel/plugins/* \
                 ${libdir}/Thunar/[Tt]hunar* \
-- 
1.8.3.2


