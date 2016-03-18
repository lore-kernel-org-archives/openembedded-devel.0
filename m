Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5D20660767
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 21:18:59 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l124so44954048wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cFyF+qy8mM6M1c8BnJlYWxiHQAxb84ksYJpjxjXmypY=;
	b=V+KFNlirShOxJ4Id+/upMRjU04MDf2v+vnzByqUa4M1rFwIPD9p2lpl8T53UjjCsyN
	E8Inrw/hhIggldSUIpR4dWAZlykQ7ObjMEeGQX9HFKqD/PV2+MqtqRPaCIF3wdUdojIz
	/ot7+18UNpNHVXSGxV8HOjwToYJ3iMBtguXgdQt5mJwegDb+DjgujUXKhEROY7zS89lr
	Fl1fGbLeywX80JOibnO2aS/Vhws0pfKeBLEd3tss3HDHwgMVZqWEVRWS5iZZtssT6ZBT
	SayMgxTRZSNBvPNEqwfC7vQR0/MDpOzOyp6O+r6O/uC41y8UXkei/c1xgphIDwzNo9KS
	uRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cFyF+qy8mM6M1c8BnJlYWxiHQAxb84ksYJpjxjXmypY=;
	b=GMdxwiqveluA4Wd7v1MjzxRqGpwHBqH4VBkkFHFyhvYWiXnbFwwKLSxHFHYee0Qgk6
	uhg4j42/TZoelYTRZM0jkrACluRkHn+anyffSLJVnAVePAD1/nGaJ/Xj52lKxexD3m/D
	Edt6kHhT2zKjJ2v11XjWll0sUil+zQ9uc3ZbSniUhlpc01ebsQpMmv+RTAaUjHTDiPej
	5x55LnXllOrcaVvdFR7bPPXTzJbyB5aQOZ+WdiMHtga2KBYB4H3f6wdF0cxxmRM4w2of
	V+9daq3ZI+1dnjxtr4Ned2inwNMbjUMPK1A+fziquqIvf6YXyDoy9vkWPTzyo5fNuk08
	nDlA==
X-Gm-Message-State: AD7BkJJbN4Lrc6jGg4Qq4xQdsXTiLqFkw5rk+gfinN9Ph7CR42OAH7orIPZyDlWZE814bQ==
X-Received: by 10.194.22.97 with SMTP id c1mr18109280wjf.19.1458335939667;
	Fri, 18 Mar 2016 14:18:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm957486wmg.20.2016.03.18.14.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 14:18:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 22:22:54 +0100
Message-Id: <1458336174-9801-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-efl] packagegroup-x11-illume: lower ETHEME dependency to RRECOMMENDS because default e-wm-theme-default could be empty
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
X-List-Received-Date: Fri, 18 Mar 2016 21:19:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 63ef0f6..9997828 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -11,11 +11,14 @@ inherit packagegroup allarch
 ETHEME ?= "e-wm-theme-default"
 ECONFIG ?= "e-wm-config-mobile"
 
+RRECOMMENDS_${PN} = "\
+    ${ETHEME} \
+"
+
 RDEPENDS_${PN} = "\
     packagegroup-core-x11-xserver \
     packagegroup-core-x11-utils \
     \
     e-wm \
     ${ECONFIG} \
-    ${ETHEME} \
 "
-- 
2.7.3


