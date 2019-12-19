Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1F27FD87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so3451451pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LUxwA3rmYu5XyC3LIQfAVm3OgcDyik1YXds856/eFuE=;
	b=GjwWMvXXlalI5kfNu0L7ewU1m0LM1GLzXgW4L9yD6QxXawpskkHOFnpUSO37/+XYpT
	rBQyPTumAHQWrJ1J6Ay+Dk/GfxazbkHZLagvqp5vS5F1EgCk7Aw+Fx5PfnYKUYeXsjkl
	KSX9MM6rZLACAkVCtCvJ10TdKhRMD4f+tEslP5jZcNjkZuROO9ewe5+OmHAKtKHiQe88
	tb0J77+eoAWQ2EDbTDyyl+fCsJp7suYg1Ec4cfh/5TDRE+wrKduFMzEkTriUmivJ7dIJ
	X5KxTQTah+sVuCeuzyt1ixePzIj/QocXJV5cFJljBiayRm1ZjkYv0HN0bO6OMSs7YJpx
	STcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LUxwA3rmYu5XyC3LIQfAVm3OgcDyik1YXds856/eFuE=;
	b=j+mpge8m0/1tOgFvsKecYXTqgHdetEXxjcfmqtOpttrbMypju6U1jfh89obvd+Pa/v
	2AOlvxWRUjQN8J1nwxg9cPbtuHbfpmYrUIyCgP/vh6gvk7IMqNXwh08N48TOx6OwdJTo
	XnGpUcRnQEWl1QYkJloLAsrq/+enD8E4iRyokCDRT7BbH33QuEc6Ao/MFnFaGUibWpnm
	9b3cuICDgSkcIQMFeEfJTcOnsfYNN1Rt4xH42EaytrSvF/FYHdLsAdUm8euWqsvyhSgG
	12p8Z4dLB+XF68ZnlWaOtPCNXlyoqksv2hQMXMh3j7e84tsAs5szmzX7Xn5V3C3AU6dc
	h9ZQ==
X-Gm-Message-State: APjAAAVRozSanlXATb/0xg9AYlPSn4HyqqCf6dNi69kBm6LgSE/fnG7A
	/0AqSvE+abPsEPgj6IKNcDe5vspQOms=
X-Google-Smtp-Source: APXvYqysbBa3zviV7FSNwGU6eTFkhzprapx3lIkGEN6Fp59wfQzMh7/hAsWAiwjwdZcBnwN4PJ80Uw==
X-Received: by 2002:aa7:855a:: with SMTP id y26mr6965200pfn.175.1576769139631; 
	Thu, 19 Dec 2019 07:25:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:24 -0800
Message-Id: <20191219152529.725879-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219152529.725879-1-raj.khem@gmail.com>
References: <20191219152529.725879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/8] hiredis: Upgrade to 0.14.0
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
X-List-Received-Date: Thu, 19 Dec 2019 15:25:39 -0000
Content-Transfer-Encoding: 8bit

* Define LIBRARY_PATH so multilibbed version can install correctly
* Forward port patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-remove-hardcoding-of-CC.patch  | 16 ++++++----------
 .../{hiredis_0.13.1.bb => hiredis_0.14.0.bb}     |  5 +++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-extended/hiredis/{hiredis_0.13.1.bb => hiredis_0.14.0.bb} (77%)

diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
index fef2bc7541..1af5d26ac0 100644
--- a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
+++ b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
@@ -11,22 +11,18 @@ Signed-off-by: Andrea Galbusera <gizero@gmail.com>
  Makefile | 5 -----
  1 file changed, 5 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 8b0f0c2..66a4317 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -34,11 +34,6 @@ define REDIS_TEST_CONFIG
+@@ -35,12 +35,6 @@ define REDIS_TEST_CONFIG
  endef
  export REDIS_TEST_CONFIG
  
 -# Fallback to gcc when $CC is not in $PATH.
--CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
 -OPTIMIZATION?=-O3
 -WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
--DEBUG?= -g -ggdb
- REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
- REAL_LDFLAGS=$(LDFLAGS) $(ARCH)
+-DEBUG_FLAGS?= -g -ggdb
+ REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG_FLAGS)
+ REAL_LDFLAGS=$(LDFLAGS)
  
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
similarity index 77%
rename from meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
rename to meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
index fae30d771d..29f8de8d2f 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
@@ -5,14 +5,15 @@ SECTION = "libs"
 DEPENDS = "redis"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
-SRC_URI = "git://github.com/redis/hiredis;protocol=git;rev=f58dd249d6ed47a7e835463c3b04722972281dbb \
+SRCREV = "685030652cd98c5414ce554ff5b356dfe8437870"
+SRC_URI = "git://github.com/redis/hiredis;protocol=git \
            file://0001-Makefile-remove-hardcoding-of-CC.patch"
 
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-EXTRA_OEMAKE = "PREFIX=${prefix}"
+EXTRA_OEMAKE = "PREFIX=${prefix} LIBRARY_PATH=${baselib}"
 
 # By default INSTALL variable in Makefile is equal to 'cp -a', which preserves
 # ownership and causes host-user-contamination QA issue.
-- 
2.24.1


