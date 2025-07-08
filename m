Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10552C83F16
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:49 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.5755.1752004667241757317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDKgStLY;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32f1df58f21so33613201fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004665; x=1752609465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6ToFsDP44hhdOjTGlszsrQ4mB6bI7fqrIcxq1fW6k=;
        b=EDKgStLYCUR/YgTVQv/pbb4I/13W4JXzy2S/0w+JZqdcYwPhFopirvZsZfzIhkSoG+
         g8xUtcDyRiFRPyymMb65ZTM742gnNra+CmFGMqYVPgi4xqelDu+llldkKVPEMvmokRqi
         DoJ1yZnqU+dWlEVNbgvn+C/de+ZiFnPoiS/O3KvR8SxxUOtilF3VoQdnaIXQFCYju7pR
         36DvMIVYNniRwHQfH1Pesstw7jffxZNfyTQbnj4dUli8tbk87Jeb9qPm9Ov4XlMSAtm6
         oG4uN0Z6cc47aahn/+X+FumVoS/7qRtvkWMzvcR0EjIGmVZL/kMj4bi8hhDZyS8wXBr6
         u8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004665; x=1752609465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6ToFsDP44hhdOjTGlszsrQ4mB6bI7fqrIcxq1fW6k=;
        b=Y+0zMjsVHwUAb5mHLRL8gMbGHx5sLSuxhLYHnHSVF58C8zCgsixMSh7ljMxS8/oxua
         ihYsd+ELLt4i9SkxiDCXj0iHxHbCc7kfmypRz7BOM+inyZRdnK+BI33Y3qWDBh0doGmE
         OljgoSmxwJBza1Rkq0Sni/LOTtkl/hfRO3h91McKBVzxqu3Gvt1ZwPzLrtuZryMEzSkn
         trJnXRX3+Ucs6mhSkgQKGXMSeSUGUUXp4ZEGuSjq11tx03L9AgW+QsDQsS9iQALqX0kT
         zam3iXTDNT/PvkNt/AcD928TEOzx9dPrp9vXq4tUN4vcjtFqJZqmoiWvI1FstoCiT1dq
         Iylg==
X-Gm-Message-State: AOJu0YyFyWaxDxj51dYiLIG8b+t7RgTptvmhRbRyRRSnHrYVpsUpEH44
	6ypDfZPYc1sYKI4qR+MDNTcvQArr6FRA6NbV/BLNlZpKVSEjf9QwnIVZA9+y6Q==
X-Gm-Gg: ASbGncvZ33ZTjMV0vJRK7fHajG1nq3Mcr+sm/Xuk46cMZlPWzBDGddFQxv+MitWhUwB
	BQZHBQ9lQzjryBTjsqnbaYkqBz9RMftSrlp1zPWjvhw2bbLqgqb28YhUwfTSKXuXFx7jyRl2yFq
	xiWbL3ZtdZbAn4UfL3WiMGapmBG0TjRPP7QC/TyAisPr9lFE9emNrpO0tZhVT2ZtUkHiUcS2gbo
	D8VvUuZXzQZJj7hmqIR+u07aX1FCCvdmvO122VzudqYSQBI6jQbKeHne1OdXPE6PvA/vioFPyPx
	BCsux+zC0u/fqy2KHC2k2MrGqM0lpo/mF0GqhLblg2daJ5qFQ3hD2sFe7JLL7PqWZKX/mz5tMQN
	pons=
X-Google-Smtp-Source: AGHT+IEN9BrROiTeEdK8cY0oqzGuzzrTR1hZaMGG0ofr/lxQpKqlC/QyEtub4swh8aSJ8z3BWAx70g==
X-Received: by 2002:a05:651c:111b:b0:32a:739d:fac with SMTP id 38308e7fff4ca-32e6761c4famr54937811fa.36.1752004664830;
        Tue, 08 Jul 2025 12:57:44 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:44 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 14/20] cmpi-bindings: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:30 +0300
Message-ID: <20250708195636.1678606-14-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118336

Fix:

| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
 .../cmpi-bindings/cmpi-bindings_1.0.5.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0002-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0002-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..f2fdb1fb10
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 1b92ac43bab03a77cb497cd59f9c84d5650a4a68 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 20:09:41 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/kkaempf/cmpi-bindings/pull/20]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4ea24ce..7d54f9a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ #
+ # CMakeLists.txt for cmpi-bindings
+ #
+-cmake_minimum_required(VERSION 2.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ PROJECT(cmpi-bindings)
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
index da710eaedb..e0d995226e 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=main
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://0001-Fix-error.patch \
+           file://0002-allow-build-with-cmake-4.patch \
            "
 
 SRCREV = "49d6dcfc71ca421100fcf325e31625817c469fc9"
-- 
2.43.0


