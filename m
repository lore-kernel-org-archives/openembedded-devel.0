Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC1ED792B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:23 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n11-v6so5469999wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6MXohkNisngCslWzj9VfLcntZWrdRjkOVe4swC0Qfhg=;
	b=ZcunwJktUJWttRhV+YrBpt/H08P4rso1O16yHRCjY8mdi/UBVFPgBG3oqUmidnHpt7
	w4bfUPoo4TW5tl+0heXHBvlLBpvC+JisU/NCXK8yBNCPHK0gk7qD+UaM8z/cHuFuydi3
	5q4XwGb7SXH8Ok0/o9oIbAzVU3++GuQyOjm+kWS87CqM4PqY0hTHsDpM46a7D4accNyh
	hBDOJexvLD7J6jNDPH3cOx53fv2BtDWagzDh7BnAhmvX55VYts6kVzEjnU31+wwZEqBc
	t/BSxMGoTNsM+7+hflzgjst/CRki0XbYNjPjqX994X4r3N3lNCdMaUWGclx/Iq5IkeAA
	qsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6MXohkNisngCslWzj9VfLcntZWrdRjkOVe4swC0Qfhg=;
	b=QF330TEiT4Jq+k2kSqEWcbrKpCeeYdxLUvOWis0aGzOCW8ILL77jeQQBG27r+kaMJG
	RKBwEsiB/7OVlbl0+cQ+Jui4nOSHDdu22gt1EyFg5hcVYHsbTdQgUJVikUI9y7rtVboH
	RlYkwLOCurlZu3Pi0ZTRSgydBnaAcW8aEIL/O+IxTVh9I9WoV0S5FmgQ1EQQp+IZClgH
	ed0Fi/7cZMqN/6CRF/cLmfXOKnJWMeWqUZqALOEV3pY1aMrxjp1CLrHwxuDbPUNL6aIH
	vns0woGkDUTJ8EzClIBR5rdpGHmvYWSh8YmzV8XMN/PpYNF2JPUCCEBS2lqDgFvgLUTN
	76MQ==
X-Gm-Message-State: AOUpUlE24+VxI2yLXHL2owx89qSh6fSo8cShMUoUGqQ3xYTE5h6vyS5l
	nYqWApIabitzotOUSvIA9nEk5DB1
X-Google-Smtp-Source: AA+uWPya9tl0Lv269TpDLU0gQvg3JGo8QEyl2WOxYpn+GDd8Gn8wf7aQtk2Y1N/+HYs990j/wKB3/w==
X-Received: by 2002:a1c:1584:: with SMTP id
	126-v6mr17172613wmv.24.1534451964416; 
	Thu, 16 Aug 2018 13:39:24 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m2-v6sm192457wrw.76.2018.08.16.13.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:19 +0000
Message-Id: <20180816203920.464-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816203920.464-1-Martin.Jansa@gmail.com>
References: <20180816203920.464-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 5/6] cfengine: remove cf-consumer.service cf-redis-server.service
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:24 -0000

* they were removed from 3.12.0 release, see:
  https://github.com/cfengine/core/commit/8001b89c098c723f0b93b311da443e2197026d88
  https://github.com/cfengine/core/commit/d8426c42c02edcfddcf785e34ac452a785b9ad3d
* fixes:
  ERROR: SYSTEMD_SERVICE_cfengine value cf-consumer.service does not exist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
index aa33a97a4d..9d0123d8bd 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.12.0.bb
@@ -27,8 +27,8 @@ inherit autotools systemd
 export EXPLICIT_VERSION="${PV}"
 
 SYSTEMD_SERVICE_${PN} = "cfengine3.service cf-apache.service cf-hub.service cf-postgres.service \
-                         cf-runalerts.service cf-consumer.service cf-execd.service \
-                         cf-monitord.service  cf-redis-server.service  cf-serverd.service \
+                         cf-runalerts.service cf-execd.service \
+                         cf-monitord.service  cf-serverd.service \
 "
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
-- 
2.17.1


