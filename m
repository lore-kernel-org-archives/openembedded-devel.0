Return-Path: <ricardo@foundries.io>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2C42E78C01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 03:06:19 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id 27-v6so11734730qkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 20:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VKJ1sAju9LahjpLppHMyw63t+Uz06Rx4/pPBde33Cms=;
	b=t5v+mtkLh5rZoSMq1BDh+DgbQriESExJoSMQPMEBUVw5YkuITZwlDruFv1meiWpKd4
	g8b0K8+4tzfjgiOFcQsX9hWJeMQhTLbJRe5PGD/xhAPUkZrj4O1PsqgxIhu0ZGn4zSZp
	gd+81YPRNknMoUKRl+1xH7txEd4YObAYd8nP9x0XOx1cxvYe4jDWqLJkrZnOljwWzm0g
	sUuBfzI/Q/ADjnPtfX9PCBJAwkUHK9k5+eY621vlNpbj2oncas8qagA8pQADJeVsx8vU
	ksxv7d6Brv0Jc4I33kWz1id5JD1BsN48HmtKsw7NWpE01gMEtp1Mpa84AlpAgpYCPsv7
	KCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VKJ1sAju9LahjpLppHMyw63t+Uz06Rx4/pPBde33Cms=;
	b=hO7GhkPsGrEmUyO31/hU+IW9BvzVt9+uRMHLOZIQtFf/oN6ddpFdCeyaWQLPF/kI8C
	c4xCUkVthSiuBzIGrGL7lo31E5oLhwbwSv7Jk44gHAZL/7e7Kg0fvxQS7m/quwT3q6k5
	r2Lek4TtiRuWEzPD9mRcMF3BC94QX7Qvb/ePU0Zahpjrv9I6OHKXT0LUlH5Qr5IJlfxv
	5alDU2xOmG4x0x/gBZPqqKprcMv/xTDfS2h3D3gd6GYIto0J0f4oQH8NaiY5fUtqQQAN
	DglRg/3cpkNsBFpyHG9j614cmjHkMA4ZGPounWkA+J8yopJ9COZ03hO3/qnCXynvKy/l
	xD9A==
X-Gm-Message-State: AOUpUlGxDZnZLtCoCDIi4yvt01EXLxlVWSVNYlFCBZ4d4Yy/jvUEV1Lc
	Ab6QISyx8bqGC7u1h7ExT0qh192Lig==
X-Google-Smtp-Source: AAOMgpdcZHa27GGopM917LdKPG5CjOzXKBxW4WCkObqF067KQwIfkqWTrEYHM3aUdJQ5r/DvNL0k3A==
X-Received: by 2002:a37:1adb:: with SMTP id
	l88-v6mr22105717qkh.413.1533092780372; 
	Tue, 31 Jul 2018 20:06:20 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.186])
	by smtp.gmail.com with ESMTPSA id
	e1-v6sm9581041qkd.15.2018.07.31.20.06.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 20:06:19 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Aug 2018 00:06:12 -0300
Message-Id: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] mozjs: set -fno-schedule-insns2 on both CFLAGS and CXXFLAGS
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
X-List-Received-Date: Wed, 01 Aug 2018 03:06:20 -0000

Mozjs fails to start on several architectures due broken build
optimizations when building with GCC >= 6.

Set -fno-schedule-insns2 as workaround (flag also used by Firefox and
Debian).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index da80b63..adc27ac 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -30,6 +30,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
 
 DEPENDS += "nspr zlib"
 
+# Avoid broken JIT on several architectures (from Firefox and Debian)
+# https://bugzilla.mozilla.org/show_bug.cgi?id=1245783
+CFLAGS += "-fno-schedule-insns2"
+CXXFLAGS += "-fno-schedule-insns2"
+
 # nspr's package-config is ignored so set libs manually
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
-- 
2.7.4


