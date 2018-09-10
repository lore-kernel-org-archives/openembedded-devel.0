Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1D63C60053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 15:54:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b19-v6so22124552wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aiyHACZAmKZlu961ToD2f2E2HtMl6SVhvFr0AEM0WxQ=;
	b=XJiZV3Bt3oPrF53+tHUfEUylropnThTP8CaLWQMBrA56nrtogVZLTaCvsyvcuXmwQX
	uOMG7sqBcgYJY2TzVDYx+XzoFk5V5wBbAyASZLskQ/eRCwf2uz3BWIXl0js5SxejTW/L
	IdGLbyXp3cvEAbb+gfsBL0dsyBPM6mrtsqcCQgJ7kTIGJJlEWyXeC8/4Dm7HjPgQ6iug
	HDtJU4cmJK2TJVYdRzQTuVM/5eLTGnJ9FAEeir+knT+7cZc9KQKg0VaGv0vyF312Zk8g
	efBz97y3TpU3Eu6pedSlqqaIKNKTgbCBkbAZ0FxlNVTBEUUpSDPFH7d2YfTQiZ1/fAmf
	5wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aiyHACZAmKZlu961ToD2f2E2HtMl6SVhvFr0AEM0WxQ=;
	b=h+4BqxgTcg3b7Hjvm3MtPXAleGbOzXX76V/NEQJzPXSOGPF4/U6uAC0ZGEEwywDEXI
	MbULeLKEOGrphJermBmtMO3IOyEfE67BJJu5PjYYeZgbJgfB5tvVM9EQTcb/qkfl/1hf
	Ufv9zWNHcQ4QootTFev95HkkVFYwLJ9PRJwDWhuWLAJkHVFGm4knGGWoEz7MS+tZ/pZI
	2rYIjTxForuYno9yKCTaBLaURwVTQ2A3DbDhqttIL2eY7/0apk8rOTZI8ZsYu98d5uoH
	lQd3W3PCc1VS87w2oUkhReDvkC5jmN3llWCtG27QwxSKIPTKUuyQosjGYT7LLOfM6BTX
	zwgQ==
X-Gm-Message-State: APzg51BQ2s2Dhmh3WcMCfUcKf7N8q7VBUV4BbpIiwbo8lOxECmDpov+O
	k2hKQJMhMZIuCCBTLkvGRvyL9Bb0
X-Google-Smtp-Source: ANB0VdZBP3w4eqjBp4BaphO9ITnTPe1eNmQ5DLRGwzWNps3K5Bd22hOga0TgOkExziCeH8nJ6196Lw==
X-Received: by 2002:a1c:a8d0:: with SMTP id
	r199-v6mr1133617wme.97.1536594861341; 
	Mon, 10 Sep 2018 08:54:21 -0700 (PDT)
Received: from localhost.localdomain ([2.43.222.254])
	by smtp.gmail.com with ESMTPSA id
	c3-v6sm21297570wrm.56.2018.09.10.08.54.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 08:54:20 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 17:54:17 +0200
Message-Id: <20180910155417.29999-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: bump version to 2.10.6, drop clang 747 patch: upstream
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
X-List-Received-Date: Mon, 10 Sep 2018 15:54:21 -0000

---
 .../cpprest/cpprest-2.10.5/747.patch                | 13 -------------
 .../cpprest/{cpprest-2.10.5 => cpprest}/845.patch   |  0
 .../disable-float-tests.patch                       |  0
 .../disable-outside-tests.patch                     |  0
 .../disable-test-timeouts.patch                     |  0
 .../{cpprest_2.10.5.bb => cpprest_2.10.6.bb}        |  5 ++---
 6 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.5 => cpprest}/845.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.5 => cpprest}/disable-float-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.5 => cpprest}/disable-outside-tests.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest-2.10.5 => cpprest}/disable-test-timeouts.patch (100%)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.5.bb => cpprest_2.10.6.bb} (87%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
deleted file mode 100644
index 81a76ea9f..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/747.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Description: fix for upstream issue 747, clang 6 build error
-Forwarded: https://github.com/Microsoft/cpprestsdk/pull/844
-From: rozhuk-im
---- a/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:39.927675000 +0300
-+++ b/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:57.809537000 +0300
-@@ -240,6 +240,7 @@
-     {
-     public:
-         _PPLXIMP virtual void schedule( TaskProc_t proc, _In_ void* param);
-+    virtual ~linux_scheduler() {}
-     };
- 
- } // namespace details
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch b/meta-oe/recipes-support/cpprest/cpprest/845.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.5/845.patch
rename to meta-oe/recipes-support/cpprest/cpprest/845.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-float-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-outside-tests.patch
rename to meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
similarity index 100%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.5/disable-test-timeouts.patch
rename to meta-oe/recipes-support/cpprest/cpprest/disable-test-timeouts.patch
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb
similarity index 87%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb
index 040c43ff0..a3162bb43 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.5.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.6.bb
@@ -9,12 +9,11 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-outside-tests.patch \
            file://disable-test-timeouts.patch \
            file://disable-float-tests.patch \
-           file://747.patch \
            file://845.patch \
            "
 
-# tag 2.10.5
-SRCREV= "25d6b26f7038eeec3b51e2e0a70960a8e34fcd68"
+# tag 2.10.6
+SRCREV= "66e50f02dde92f802bbd3a8d79c6352954665b9b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


