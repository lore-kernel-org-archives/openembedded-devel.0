Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 365AD784D7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 19:22:53 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id v26so1166390pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=km18Dl93P8iz+mYBcy/hBLxPGdnmWi4cXL51fgFgjh0=;
	b=Ust/TvmRGIYRLDIEtd615IvyY8LmNvry7AgEM2OtpUE0MD0Vipmmhv9kLDNNZ9gsvR
	E3aIW6PMiDB7PZxuFdq8J292NHAgMRRcr5COwYWNcuDdXb0FZ6b3TqwT0ATq4+JawSVj
	BYKPmL65mk1lG6gxXBMQPuOmnqpJNCZ8xsRtGrDi30YU+6M6kD+fT8wvR7ct6t0APOE8
	HTDBxwDYTFXrr9yucc3p9K+iGtr1G2ki+JT3f1Dh5oWbgFzoPdVnSbe8F77K6wRkkAjA
	+Pfg2IeLpy6SLaDerYEa1DKrF+mZJ6Yw87cIR45noVKUyYagzUzC2yf4TOuHassxJ3NS
	fRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=km18Dl93P8iz+mYBcy/hBLxPGdnmWi4cXL51fgFgjh0=;
	b=UX7Vpv8AEa86ntAs7+/r3NPMNPRaKIVQxE2BpWnmODb0ECew1fT4MfjuenyyVUsPho
	QPQszJRXZcOSs/yYuOtwNyRiln9Rjddm5UiQ/3QIKjW1APZ2m+Z6PRDz902bSXot1fve
	YWFk0JmqsRTBw4S4ufwjNOAOy5l2Dwov3cCXbVI0j1MusAqxm+Ey22b04Fw2sjrck1Ta
	//841t4DmSV0xXPQhIk/7VT171YWsk2aCbRns1wET7h+n1+3PTmGNu10loIANZTm8M6X
	O3JA01rpCIsFQaMhjV6fPIDEusr4hTIL7egARA//n5qSkSuhL1/3kqxCYHYmG7Dh1OaL
	wNsw==
X-Gm-Message-State: AKGB3mLuWMKO1iVYMT1MrtSX4QMRxEIuJJRGsvpO8WxYSn06tCS7T6ir
	pbBPht3rh1k5hwoa/ix7pms=
X-Google-Smtp-Source: ACJfBotBDQYhqqb3cPdXuEyRJjkmGnCyJ4/P41QFxot8f5q6LhIOIq7lNQaNKmomdTXxelUjusti9g==
X-Received: by 10.99.122.29 with SMTP id v29mr447481pgc.243.1515093775422;
	Thu, 04 Jan 2018 11:22:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	t28sm9286417pfk.154.2018.01.04.11.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 11:22:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 11:22:53 -0800
Message-Id: <1515093773-24352-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tinyproxy: fix build ERROR
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
X-List-Received-Date: Thu, 04 Jan 2018 19:22:55 -0000

ERROR: tinyproxy-1.8.4-r0 do_prepare_recipe_sysroot: tinyproxy: useradd command did not succeed.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
index efc0acf..98192dc 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -23,8 +23,8 @@ inherit autotools systemd useradd
 
 #User specific
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "nobody -g nogroup"
-GROUPADD_PARAM_${PN} = "--system tinyproxy"
+USERADD_PARAM_${PN} = "--system --home /dev/null \
+                       --no-user-group --gid nogroup tinypoxy"
 
 SYSTEMD_PACKAGES += "${BPN}"
 SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
-- 
2.7.4


