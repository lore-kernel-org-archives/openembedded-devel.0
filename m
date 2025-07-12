Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A869C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 20:34:08 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.44263.1752352446947460653
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 13:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LV8iLPjJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b3220c39cffso3259045a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752352446; x=1752957246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D934xp6VPyBOfEMjZYO/tiVX0MaD9sZo2xmQe24kMo8=;
        b=LV8iLPjJaVTZu33KdXu6FAsV3so2dXEt6JOoBq61YVP1F8+M8eAEeeLUODBYCF0vba
         PwyoJ2Wx8lVgwqhlASeOkxayCCF4CBoMDxTkTs1ZHKLWeVUYUN12EU3luOwwGpkrChXz
         6rltvMD6v7zNW2JDfxxJsnDBeqn4gabZNVyA+QLuLhMGZp/Okqz966r1z/9w46HokY8u
         R7bPuCKSVmiBG3TRC0BjgnWIXQJLgF7I+wVxDE3GHZ96xOJPlSEvy5i/eHjv76tnkwh+
         j66oGpOyWOoTQ3GXlEDs86xCYRX4dz44XV0ohXS6l3F5hDgsTvwiumDnCbKtIURGQlQY
         2xAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752352446; x=1752957246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D934xp6VPyBOfEMjZYO/tiVX0MaD9sZo2xmQe24kMo8=;
        b=TIaHr72UFNNw1QInSH8XQsXUJokqv2JRIT4DR+ncewbLqAC+5L/aLAILlrjPubIYDy
         83ZYnNik6234P5Hnk7WA52XUc6fOEEQa7HZ1igfE8LlWtYmD8yB5ot+y0XXStar0AxuI
         uNA3WhT0lf4h7vjqu8wNO9Tqt7IDlH/Puu3afJkYwApDt7JiM+G1F4FVjtvUL4pH3HT7
         mumBRK7itIqj/8zy7Ro0iHrRq8ruB0yifCzif9yXG5b+9aJNKdN9V/iwO69aDg33whHY
         9UB8c+BrDEzEkqKUouIy83J0Hbp2ode6KMgkXgdbgO+DoG3167dnSg6Oeu3mBLGDuSAG
         sfjw==
X-Gm-Message-State: AOJu0Yzfoehq07Qdy/g7DqBtJOGJfcFimCgTiXoBWyXsqKdwp+/U1k0z
	cCmzUuqDSKMLtEoGYZDlThugiheUF1l5c0QNv3Af2TdbgXbDv3X0Le8O7NamXOB0
X-Gm-Gg: ASbGnct+Qf3Bk7b/vJSZNNlO0oTU8DP9k1FJbPsHh3EI0ZXvzFZZsQQTGxW7X92jTQC
	aPNBhp1N89WakjuOUPT5IoBdJc1MX+HrDI34zMRp/ycU5FwccJuRRBjFSc0xALyehXw2OYlFtuk
	Ul452a05gbSyW4YYsT/G0P7hAzEr6lVK82rez/EEKu+omYX7xLFmW4bn4K/AQc9l4OsmUNlJtO2
	sQpMvk0ayeg/ViM+vEgsw++cvZzLa5c34th6JKa+famNJ3I5ob5sXNHBz4BdVvOzKmenPymmLzy
	/AshlCshsgWhHeWWf2uHugkhJVI0tS0uaqOsFV8E7cjLEVVpFG3wf6UpJ4RhsyGOlrJzP2DKNgh
	e/gsVro4J+uxAeA==
X-Google-Smtp-Source: AGHT+IGeiGG7AElQBjj98iL/squpfI1Bi3ddmBUPyXzHEp9JTMR+mAlOFBoLlXDZuHjrZibjHKGIXQ==
X-Received: by 2002:a05:6a21:62c1:b0:1f5:7eee:bb10 with SMTP id adf61e73a8af0-23135d64191mr12745959637.8.1752352445950;
        Sat, 12 Jul 2025 13:34:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe577e15sm7546218a12.19.2025.07.12.13.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 13:34:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] proj: Upgrade to 9.6.2 release
Date: Sat, 12 Jul 2025 13:34:01 -0700
Message-ID: <20250712203402.145129-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712203402.145129-1-raj.khem@gmail.com>
References: <20250712203402.145129-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 20:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118489

Fixes build with cmake4+
Inherit bash-comoletion and pkgconfig to find sqlite3 deps correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proj/{proj_9.3.1.bb => proj_9.6.2.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.3.1.bb => proj_9.6.2.bb} (75%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.3.1.bb b/meta-oe/recipes-navigation/proj/proj_9.6.2.bb
similarity index 75%
rename from meta-oe/recipes-navigation/proj/proj_9.3.1.bb
rename to meta-oe/recipes-navigation/proj/proj_9.6.2.bb
index 78f4287d63..046950a1c0 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.3.1.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.6.2.bb
@@ -6,18 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "b0f919cb9e1f42f803a3e616c2b63a78e4d81ecfaed80978d570d3a5e29d10bc"
+SRC_URI[sha256sum] = "53d0cafaee3bb2390264a38668ed31d90787de05e71378ad7a8f35bb34c575d1"
 
-inherit cmake lib_package
+inherit bash-completion cmake lib_package pkgconfig
 
-EXTRA_OECMAKE = "-DBUILD_TESTING=OFF -DSQLITE3_LIBRARY:STRING=sqlite3"
+EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
 
 FILES:${PN} += "${datadir}/proj"
 
 BBCLASSEXTEND = "native"
 
 PACKAGECONFIG ?= "curl shared"
-PACKAGECONFIG:append:class-native = " apps"
+PACKAGECONFIG:class-native = "curl shared apps"
 
 PACKAGECONFIG[apps] = "-DBUILD_APPS=ON, -DBUILD_APPS=OFF"
 PACKAGECONFIG[curl] = "-DENABLE_CURL=ON,-DENABLE_CURL=OFF,curl"

