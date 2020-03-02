Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id BA27161925
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 17:18:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id x7so774673wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2020 09:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7UrSLrqQaLWJ9BGc+OrlfV3EEAlUb0HDCNbHfkemH2o=;
	b=RKkbqxBjzhPa5tRXRPiKUb7I1nr4rN5bCriMuT4asMMLxj+CJBk2oP87uFY7XQeOQy
	h8KvPootVY5Lyl1XHLY0rNecE3uu6RjbqQWXJGznmbDwnYikFggAOmeRLfIdhMBvedzm
	w7aitx9DyhxXgO64yOcopL3gsUrC+Vo8I8vOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7UrSLrqQaLWJ9BGc+OrlfV3EEAlUb0HDCNbHfkemH2o=;
	b=Ae/f2yiH+PsLmdqDg04xIOnzdQcV64O5SA1KJ9jPn0Hbc4IWCaK1ME0s5qZS4ffglb
	7DrQMxqxGM0a23TMX9/+G6ZuyC+ghNfzWZIvXeth1K9aoQLyMYdq5BmMFoNueNnw85z/
	pAXXrgk0v1rfL1tExp/TqdhfmMayM2P57j/5HnINDspRRQm9VLcFfngKRJsJFyiI4sD7
	OUXP9LKiqRMLcLmHDflLr6zrpjz9y2Tu5cmFNmgeHqgrC+n0WwO0365GiBX4djqgSrmJ
	oFfzx08rSzBITeycRy9dsP1OvKeLAKuv3R1Hp9FXrObQOmntk8+E6UZ2NGfwj3dWZK+V
	TmTQ==
X-Gm-Message-State: ANhLgQ0qHm0+QSd+ysvzZ1VVXOoEUBpPamtTV/cKdCgpasZ++3cxN/MU
	MAVKd2vw63E2i1vUyR0sY8fjcDNwizuICQ==
X-Google-Smtp-Source: ADFU+vsGTdZhZ77mTD3JgYahyNBOV4i5v8SU585u80qr5RIx/M7nd480C90a41nnZ9I4RGGqGutv3Q==
X-Received: by 2002:adf:cc82:: with SMTP id p2mr579985wrj.11.1583169535060;
	Mon, 02 Mar 2020 09:18:55 -0800 (PST)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	i8sm23866259wrq.10.2020.03.02.09.18.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 09:18:54 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Mar 2020 17:18:34 +0000
Message-Id: <20200302171834.2606-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [zeus][PATCH] lmsensors: Fix sensord dependencies
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
X-List-Received-Date: Mon, 02 Mar 2020 17:18:55 -0000
Content-Transfer-Encoding: 8bit

If sensord is removed from PACKAGECONFIG, the recipe should not depend
on rrdtool and the lmsensors package should not depend on
lmsensors-sensord.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Backport of 5674b0a9e8778f7538419451e629ef0c13711123 from master branch.
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index ffafd17f8..316d066d5 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = " \
     bison-native \
     flex-native \
-    rrdtool \
     virtual/libiconv \
 "
 
@@ -93,7 +92,7 @@ ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} += " \
     ${PN}-libsensors \
     ${PN}-sensors \
-    ${PN}-sensord \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
     ${PN}-fancontrol \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
-- 
2.20.1


