Return-Path: <acfoltzer@galois.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 582E078062
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 17:23:27 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id a70so16079651pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=galois-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Yey9clQtbdgpJeGNTHynIou9JcOW3zP7tI48z6K74x0=;
	b=UE1cYJsS8puoV34/Y9rjIraSAmSdwjjWZxtdGqTxt+GW0A4AnD6JD8oW9dBdBcVRp/
	Ux8/simBFWuV74oHvS6DxNMy02xvUw/FTAf913afGro+mMKGHyCQV+gvOhlJn2lyI0Q/
	3VduH+GG7kMv7NCIRESdJFm25rui72hn9gt4dJoR3fUcUm1wM8/rAY4bUZtGey3RqCdu
	ulRKHQpclwVz7c/KWkYYdlZnoJ4RI8x0nyzOBpeSty8d3Xsj2TXNRVlVenwyMMZcUtFF
	30AN1bXcvEcFx30hYmi+dGpIwm6vYaUF6urDF0s0sAlGsfltA8YB999nm01y3DIbqOP0
	MFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Yey9clQtbdgpJeGNTHynIou9JcOW3zP7tI48z6K74x0=;
	b=h/i6LHtr2s65gm7yKwP6GXjpesM7ggLwX21BXclV3x3hx2ZzJYLVnE6ar3oS1qK6fZ
	NZw8Hw6KLS+ml2HRDJf37ls1KSdggXCunfAJQ0jWTSgDyKDB8DLOQJH9omAoED12jVWW
	l09CtuLpHY8emtq5PeptUdgwrhN5LhwqG0a/a1NTq7wmDm13vgjoMpP2dhrKcpodvuCJ
	NuwunKc1zBRHgTO7GaO1VtnQ7MP9n7iXDEq4SoxVO4aRWFC6yDbYOpVUVHBHQHEBGmkK
	Dy9Tv9u0QUiBHQOqVb50LrXctNUCeuGmZv1CunZobPFJE9FdQphnPmJSY2ZJC3pEogQS
	O3Tg==
X-Gm-Message-State: AODbwcCoOPzeNB3j63DWOTcuogpsWPnY9nGy9qNVYGixGEKl/8TZU4bu
	c9srBxsB+AZqsr9O2rdNuw==
X-Received: by 10.84.215.158 with SMTP id l30mr16166584pli.266.1496683409107; 
	Mon, 05 Jun 2017 10:23:29 -0700 (PDT)
Received: from svarog.galois.com ([2001:428:6002:405:8055:63c1:97d2:1da1])
	by smtp.gmail.com with ESMTPSA id
	71sm35220907pgd.57.2017.06.05.10.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 10:23:28 -0700 (PDT)
From: "Adam C. Foltzer" <acfoltzer@galois.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jun 2017 10:23:19 -0700
Message-Id: <20170605172321.12557-1-acfoltzer@galois.com>
X-Mailer: git-send-email 2.9.4
Subject: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1
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
X-List-Received-Date: Mon, 05 Jun 2017 17:23:28 -0000

Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
---
 meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/meson/{meson_0.37.1.bb => meson_0.40.1.bb} (88%)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
similarity index 88%
rename from meta-oe/recipes-devtools/meson/meson_0.37.1.bb
rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index dbbea64..fd96b42 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     file://native_bindir.patch \
 "
 
-SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
+SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
 
 S = "${WORKDIR}/git"
 
-- 
2.9.4


