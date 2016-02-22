Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 71F69731A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:08 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so171775940wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W5XL1knpg8hvR6IshgE1WNFMHCJLYgo2uG14sp+9px8=;
	b=neHCPdUpdjMew4pem5Waic0kFI1jQXa+LUuScQahMruKxEAEnUeXGiwCnnssXf6zM1
	dvzNuE2F0sfZrIUnJA83ETZnh5GZ483twib0TT0ZohjT4mKEgh/EmrZ1sUT969XX5F7t
	HmwL5ppnmgyn0Vx5e3TeduJQv2ZgwN0slCwtVDe9sN0JvJa/aForzqoKDXfPNTo7ekV1
	6xLCCzFcrfh6nTYMKUFHljXMj1JXTkpITDiUcfVgOhaFfkL6WVtpa1NmrJK0jjb5i+cp
	gttY9Uyyt4/0T+aniRaZ2vLg5a1pnvrwRfyQbkoLQBhYPESl17+8TNUF9qJNSdfW91dF
	Co8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W5XL1knpg8hvR6IshgE1WNFMHCJLYgo2uG14sp+9px8=;
	b=nKNuMWctqeYCd8TTXIIVAMoegsp/3ZFOt2FRNvx+fbwfbbXXh/f7Ii5fi3SvfgkCBg
	Imoq0uUcWvf3uYLU17cOXOiGKQg3G3B/VuEVNyanbuI8O0mL7tanK4Z4BwmjMy2kC1AD
	11Qi1ghwQT2+i9AjpGXp58sjaYcghO0GeQBr1/2dGzVpy3cIOdn7fnOEbmdm5oh9yxhW
	fQb5sXLjR26iN9fryMD7Cpfsi2VkU3mhxMtt6FALhTW4W0BMo2vZcksEaVGqy21YJ0CA
	KYjoz9zcddO5rHwlLjMQt0feoJ3cpnvPCSUmKqP3L9z2ltMJddIfOP7v2nKUTZx1yq4x
	evTg==
X-Gm-Message-State: AG10YOSAby7NNrAFm0saKp9GJ84RlI0pX3+Gr8ATvAosuFsi4JU0nT4XOLzKnOqB817Hgg==
X-Received: by 10.194.189.143 with SMTP id gi15mr27132180wjc.54.1456146548701; 
	Mon, 22 Feb 2016 05:09:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lz5sm24561852wjb.5.2016.02.22.05.09.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:49 +0100
Message-Id: <1456146596-6976-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 03/10] cunit: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
index 085f4be..ab8cf76 100644
--- a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -17,3 +17,6 @@ EXTRA_OECONF = "--enable-memtrace --enable-automated --enable-basic --enable-con
 
 FILES_${PN}-dev += "${datadir}/CUnit"
 FILES_${PN}-doc += "${docdir}"
+
+# http://errors.yoctoproject.org/Errors/Details/35136/
+PNBLACKLIST[cunit] ?= "BROKEN: QA Issue: libcunit.la failed sanity test (workdir)"
-- 
2.7.1


