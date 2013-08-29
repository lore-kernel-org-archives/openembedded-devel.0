Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 81A606BD6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:11 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so341384eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ShAB/n0XxigsPtgbN5Zw6+oUO9bcDoqwspRcu7W9s48=;
	b=zA2ATa3IwUxfpe4BDlCqxFBeC2X/447KBFyqiHVuC1fXoOHxQ9KmgBgRx9S+/hl/os
	26JoX+ocSmTOHmhaIMXKJbopkBBO2e8z2Sd6oBFRvXHyiD84WD6xmjin1iy5ziMQKH4M
	bMkaecaCtOrpVw2cz3/43IBRIorFm+LFfHfTNc1tcmdWVB66qglH3Dm/OWX5TnVDVM7G
	ws5nFrQHUie5SitWb/lmrKS/cgm0Fw0TuqkfeiLc6NFLMoYvQlC25kwyFjcWm0AvI7Mx
	8sZARAjZBk1smg44fu9cHOstUmoZTrltFXt+KbTKuyGiLFGIL6wmzzU4tNCDC7tkUn6O
	fWoQ==
X-Received: by 10.14.183.2 with SMTP id p2mr5369804eem.44.1377791471913;
	Thu, 29 Aug 2013 08:51:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm47157122eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:10 +0200
Message-Id: <31d7786f5b0cdcb8386cf4fadf1b975502362bcd.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 17/66] wv: Add PACKAGECONFIG for png
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index 3ac40aa..453513e 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -15,4 +15,7 @@ inherit autotools pkgconfig
 
 S = "${WORKDIR}/${PN}-${PV}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
+
 EXTRA_OECONF = ""
-- 
1.8.3.2


