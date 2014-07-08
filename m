Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 060C2609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 12:32:44 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so5929560wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jul 2014 05:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xo8wV57Bd6xx9lEndXsdkYJUcXwdObndf12ATdf+27w=;
	b=KftUt068TiaYDPDQsM8n4WOhR/c1oOtMnKq3QEMD1a4d0kmDyO2LbvhHDpEBVV5gjl
	aa2XW1G6VND/5tfdMQz4BmmvSBFGY0CDsmDTOGvvPIXmp0hSuFYuP6zileYPqGo0cIy0
	yZ0FeyKdLF5YclwUdMprbpR9CwqFXOeClvuavKGOTvHAlRAo7+KO/oX7Fkv2v8LobCQz
	osqBKkgvnYBw61M0KR5RGFzASKG0dr+PAchTBxRhwDLCLM7THMSSV4NRZyC+Z0KcMDDB
	56/Am7uwr6cm6F5f6qov8qRgivmXBvYNQh5EgHZnsLcRVozV2Qo+fevhGvxczR/neVH3
	MDfQ==
X-Gm-Message-State: ALoCoQnCy0uD4nUVwZA/N5evOO487lha67f8tcUu77PG/ZjVmHq1Nn3XBUqneRE1WA8tBzGPwL8N
X-Received: by 10.194.76.99 with SMTP id j3mr40565010wjw.85.1404822764842;
	Tue, 08 Jul 2014 05:32:44 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id r9sm6576323wia.17.2014.07.08.05.32.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jul 2014 05:32:44 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jul 2014 14:32:39 +0200
Message-Id: <1404822759-25699-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-browser][PATCH] firefox: workaround for freetype-config breakage
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
X-List-Received-Date: Tue, 08 Jul 2014 12:32:55 -0000

All binconfig scripts in OE-core have been disabled, leading to -I/usr/include/freetype2 disappearing from C(PP)FLAGS. Add it in manually as a workaround, mozilla autotools are a maze and not easily fixed.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 1a1178c..98da1a4 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -85,6 +85,7 @@ inherit mozilla
 EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
 
 ARM_INSTRUCTION_SET = "arm"
+TARGET_CC_ARCH += " -I${STAGING_INCDIR}/freetype2"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" destdir="${D}" install
-- 
1.9.3


