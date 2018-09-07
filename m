Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 81E767981F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 17:25:08 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c29-v6so12683995lfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5ceCmMUjAJlm8Eeyglnj6Vo67UrRrfEiOML/daak2Mc=;
	b=IvVHAeb6AH4yxkx4ptPHZADCfFG1sPUISyRpiktg50GvFUVlQOnsfPkdpQMmDiPL16
	WE1rePBNOa0dgUblbNUqsFB4LDkBN6RTC4Mg12HXItiD7NBgZHDYHLFRQUytCo+aovUB
	mSE2qMziMzasARNG0jfaRXOxTgn6+ttx8HBrHIXZLQv5H5mH+bSdX7lrUkQXhxYMWCqa
	O8MGv9xjIaIkl/7lfLhA/qnwhl+iohBXJTsl4eMe4ZBx8gkQZm7/M9ubJ4Kk4QF6PRD5
	/6QddEXWuuF/WOWlTxIWkLcLbx2Vp+v7IlUTPqzHh8fPxKPCKpistaiJ7Bt5jPK9PG6e
	xqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5ceCmMUjAJlm8Eeyglnj6Vo67UrRrfEiOML/daak2Mc=;
	b=OAyzEZ13fsf8Zny+sT01DyjuRjEBQCugKYYCNG8P+gC1VPIUKFwcXw8R778Uvdkfyw
	NkYdLMBUIHfRQd8welggfUjpoYXbSIelzuu1qluF7SsGXgu1O6PsVc/Jl0+6LsBbUW0w
	CNvUH7HUYTKSgXRTrjOaVnN87rOXDhlrZBAdxRSX9kI/S0q4i5NoTBpVmBa3o3DeYSq+
	8NJWaq1yo1sMmHMWrUxoHl6swHe3NV5WEXTcUoxYEHK4L+44MexDds58/KL7exBAz7Gx
	40IuGcN0JywSXTJPtKW98zb53XmuT9sAHwFLGhayRar2UuMQ7BfgqYGig/K4UleKeItN
	dC/A==
X-Gm-Message-State: APzg51AEWuPIppZw7mbKOrFXsd7k3RBSnuyKZov8NXBkAkqttsbh5Xnu
	TiI2qMdNO5k/5TAE95m4U9QMVdqt2UI=
X-Google-Smtp-Source: ANB0Vdb3W1safUxbms+cOddRt7BhMda3JVacUGqUAObk0b8Wgo+WVqgG3tlti9fXx3p1KunpjYzEtQ==
X-Received: by 2002:a19:6619:: with SMTP id
	a25-v6mr6052607lfc.62.1536341108653; 
	Fri, 07 Sep 2018 10:25:08 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	m20-v6sm1378096lfb.27.2018.09.07.10.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 10:25:07 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 20:25:02 +0300
Message-Id: <1536341102-83842-1-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH] cacao: class-native: RPROVIDE virtual/java-native
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
X-List-Received-Date: Fri, 07 Sep 2018 17:25:09 -0000

This will allow other native recipes RDEPEND on virtual/java-native.

Change-Id: I85fcd012d09441867fa5f359463cbe8fff702fbe
Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 recipes-core/cacao/cacao_1.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 1074ff5..ead0e2f 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -6,6 +6,7 @@ SECTION  = "interpreters"
 
 DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-initial-native classpath-native bdwgc-native virtual/java-initial-native"
 PROVIDES_class-native = "virtual/java-native"
+RPROVIDES_${PN}_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
-- 
2.7.4


