Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 900AD7ED4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 11:19:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w20so7953276edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2019 04:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3/k4FOTMEhJmVTmsYOoWhndH2wuJagxfvR62aoozJYg=;
	b=VylsRGXPKH+IwI1IcWLlw9V06cgdZ/aibdpNt90L3bsP6k2b0rFyTHvbaj8QDwt23b
	NollXxFLOkkum6Ls/5Q6tiZBynXV/uwzo42kwkrhyrKMfiZUY+fvR8VBRq2V6ShTbV3N
	hWVT+v6Sfye9Fc6lZvM6mKKKwGspRL3o/HCCl6R4LBL3MiHyrt8D+7Y/pk6BV2JCIoMW
	xwiqImyK4WyY0m5Gt3kwH5U0cgtsYQW/fuylWsrq/6+PMtgQglyYboHRuTiGT/JpXZ3R
	hOlAC0pQvlJSWqE128ZrCGynUstg7omDJNrTChutkKbjNBFRs2rJWhmxLCM2eRkm7Nti
	aAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3/k4FOTMEhJmVTmsYOoWhndH2wuJagxfvR62aoozJYg=;
	b=OlhqZf8C9WSq9MD2xJpMcV9otm404cN1ak9g64u1Kj55B6lJ25GsY12ZYBlHPC34rW
	EA8YMI1uUvyjggQBIFI9klkJ7WW1kTCw2wUJAMgBVXe8nuk2TQVgzh3L6Zztvz0yMegr
	KkmVyYc1hvecfatc5s1+WDVVCFltbSTvNJ0Jf/FgXDE3lV9XNOYOQr2l7uji8hLkddAO
	2xYLRDiI75UzNOAhNqCx5V9M7W6+ylCcrQmMuXUX1qhxGaXhsUML8+RfKEJsyXszqh8q
	n2BoHg1ngkXVFjK2TRqeNJ4WWpWBkTDpAPCj8UOZlcdlFUqW335cML1NMj1q7zaUT0c0
	YBPw==
X-Gm-Message-State: APjAAAUo7rONdA2+sJtagv4lng+7gMJVp5z9+3XHc/EGxGtrCKSpCJPR
	XzdN5ZCKcZ5rs/VSa1bmybSSiXbVg9o=
X-Google-Smtp-Source: APXvYqyXKUg+GDKT4fc1sj9Vgf2SZqtw/AamlHKCeKErdGst3/F8L0aT6Ar5aM6qDoqLjKPot9Wk7A==
X-Received: by 2002:a50:ba1b:: with SMTP id g27mr3825164edc.18.1562325547073; 
	Fri, 05 Jul 2019 04:19:07 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id h10sm136604edh.64.2019.07.05.04.19.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 05 Jul 2019 04:19:06 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2019 13:18:18 +0200
Message-Id: <20190705111824.22255-18-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705111824.22255-1-ricardo@ribalda.com>
References: <20190705111824.22255-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH v4 17/23] jaxen: Do not build an all PACKAGE_ARCH
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
X-List-Received-Date: Fri, 05 Jul 2019 11:19:07 -0000
Content-Transfer-Encoding: 8bit

jaxen depends on non -native recipes and breaks multiconfig.

Fixes:

| 138 problems (138 warnings)rm: cannot remove 'build/org/jdom/input': Directory not empty
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/all-poky-linux/jaxen/1.1.6-r0/temp/log.do_compile.21778)
NOTE: recipe jaxen-1.1.6-r0: task do_compile: Failed
ERROR: Task (multiconfig:inteli7:/workdir/repo/poky/../meta-java/recipes-core/xml-commons/jaxen_1.1.6.bb:do_compile) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jaxen_1.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jaxen_1.1.6.bb b/recipes-core/xml-commons/jaxen_1.1.6.bb
index d75ce75..2741f2c 100644
--- a/recipes-core/xml-commons/jaxen_1.1.6.bb
+++ b/recipes-core/xml-commons/jaxen_1.1.6.bb
@@ -23,6 +23,8 @@ SRC_URI[jdom.sha256sum] = "a13549087141be24ad176b659afdc2c675f1ffa5288ff999a193d
 
 S = "${WORKDIR}/git/jaxen"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit java-library
 
 do_compile() {
-- 
2.20.1


