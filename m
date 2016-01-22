Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E981676A98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so479595wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ImV8awOwnB1NNStvxQ8l2bbEOHJol4eo8IQxMCUUl30=;
	b=zmX+Zob86gcZBrjr2/DNKXt9/C3dSbgMg3Nu1hFr2d/lDo1pgR8DCHhDT1G10XdJe2
	Ae5/jvUWoplGNVa5TKUrPiqTYuvGS5q5u6Ti+hyYMXSOX58+5riLaq6+siMe+NyRgsK2
	qA79BteVDsCpe40SwHkDDk8mp5oaB0p2sUmnD93oWEuYofeJFMv6q/Efc/kY0z7OZvIm
	sh0wnl6LA8yMXGUB+qluZaAHvpdoF115MOkkkygsKdpY/iJHdr3ocvUtG0goMRhR+uC3
	q/yexQ8TO1fKk6k/RoQ4t3tNaA0UpsQ7BPAxWoX59imEvLoHptsaYTFnQaYMQfR6eNcg
	HUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ImV8awOwnB1NNStvxQ8l2bbEOHJol4eo8IQxMCUUl30=;
	b=aC33fyVCzvUz4/2hK17Y1v6MJdZF2AgHW6A2//V5LSczjpdBe4bSNDhqYhotN8dvqi
	W7oHnckuXvZEHfud0ugHjluPhF698qwBj0llvv2S8MuFGMxCxKRZhFBDDFaV6QZ6Qfrs
	FhsXibLQ0NbHRERzr4LkJbflzSyKwYHyeghYf/WXN1G0wR+X7A/3WEslPJ5b+aR0d19Z
	+yi8HpNhFd29zC4z9wgfRf55UlmICfGaSLxrD+1A0/caEfYJ4sHpruyK9SladQojsXlR
	0MlLSe7ARzSJ/5/+6CkUnHt22tJNRGHId+TR6RlibNNzUkyUMcypdeFRbK9amSTKKVUs
	7dLw==
X-Gm-Message-State: AG10YORGDKgRaroiIcKILCffDHJNNSTRjC5M1lwx4UZ/ntxnRwF7ScrvqR4qxsOkol9keQ==
X-Received: by 10.28.50.193 with SMTP id y184mr6236640wmy.103.1453505448475;
	Fri, 22 Jan 2016 15:30:48 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:47 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:06 +0100
Message-Id: <7e63cbbbe1b360e30af54b31968a39ad7498cf2e.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 04/21] python-six: 1.9.0 -> 1.10.0 and add python3-recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:50 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../recipes-devtools/python/{python-six_1.9.0.bb => python-six.inc} | 6 ++----
 meta-python/recipes-devtools/python/python-six_1.10.0.bb            | 2 ++
 meta-python/recipes-devtools/python/python3-six_1.10.0.bb           | 2 ++
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-six_1.9.0.bb => python-six.inc} (69%)
 create mode 100644 meta-python/recipes-devtools/python/python-six_1.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-six_1.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-six_1.9.0.bb b/meta-python/recipes-devtools/python/python-six.inc
similarity index 69%
rename from meta-python/recipes-devtools/python/python-six_1.9.0.bb
rename to meta-python/recipes-devtools/python/python-six.inc
index c6575f3..450e05b 100644
--- a/meta-python/recipes-devtools/python/python-six_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -2,10 +2,8 @@ SUMMARY = "Python 2 and 3 compatibility library"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
 
-SRC_URI[md5sum] = "476881ef4012262dfc8adc645ee786c4"
-SRC_URI[sha256sum] = "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
-
-inherit pypi
+SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
+SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
 
 do_compile_append() {
     export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
diff --git a/meta-python/recipes-devtools/python/python-six_1.10.0.bb b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
new file mode 100644
index 0000000..839a0e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six_1.10.0.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-six.inc
diff --git a/meta-python/recipes-devtools/python/python3-six_1.10.0.bb b/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
new file mode 100644
index 0000000..2bc5bc5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-six.inc
-- 
1.9.1


