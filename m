Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id ED7F571A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:30:59 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id v7-v6so2604078pgs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9d6Wv2GJZkCSNDOhHaMZM/E+JoH60Wol/B2AO1hnJao=;
	b=fBRI4wRZfjYY7BEjV9PvCNoTi/kuYBdKZh/bVbrrbebVUb1sTHsQ4F1Yp/nOaenAKt
	FfehVSGeZ5uH6OgKLE1xz3EOSfvq5M8mJ55mP1vwB9Vx6nD5LlhA9cSAQNRTCYS++ARH
	rZe+Gk80CCbfYqn1VQ4RgcwotL8Ee4L+wk4pisFM08MwfuA8HPgRp8A0OypS1YKHD1Ky
	xg4Ojueu2xqFV6VQdkI7hyodHebKbe5nu4kwj3aCAkN0B3y5gBaSciYiwP72Bdrc33ax
	GUQHgP4A0zwLOLIqz1ym8XkB81tYZlF7pK1RA75rYdo8vsK8HVLnFP8T7mbyeIAW21YF
	jzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9d6Wv2GJZkCSNDOhHaMZM/E+JoH60Wol/B2AO1hnJao=;
	b=qX0K8oU4Q/m6rlWPfhXESdLdm3lqA+4rSax9n77iaYkrOJq0+GI5554sXadUGtPySR
	T4w1VoeAbO1/HyiKWJyxySZV0SQOnw1P2WyKCAkXobMNvrKowkmZzpHDZBcE3AzowGB1
	zV/BAfoVerlvJi6OlS+Vba2UGLgO3jPN1mhIcGfebqxpMWytKszM2mIdujKapL1bJUAK
	OTmWLMnIpUQvjiIAePezaGs36nHQkF2Y2LPbRTO0Y8W/NP8qIfvUtfx0NxZdWLjinqju
	/kAP6Dpxvx31DdPCQz32kgtwF007sRFrx5+vi2wS5exqi12lqqlPTJhAsEFnQCDdLOPR
	UJEg==
X-Gm-Message-State: ALKqPwc7mbXPLvJtMIH4Owz0qttQMFG87q0RVqJLxF0PEEgLsFBg6LSj
	DE8txUJ2ZKID8TFTSb7ynV2WQA==
X-Google-Smtp-Source: AB8JxZp0V2n7FTSLuHY5IHjdyL3/5CGeDQrBs9gIXCQQsl25VMkpbnaPMT1jdWgwHa1K8suJY/4jlg==
X-Received: by 2002:a63:6443:: with SMTP id
	y64-v6mr5825622pgb.68.1526607060694; 
	Thu, 17 May 2018 18:31:00 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:30 -0700
Message-Id: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:00 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
index 9354799..6b9c545 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
@@ -24,5 +24,4 @@ PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
 
 PACKAGES =+ "${PN}-testapps"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
-- 
1.9.1


