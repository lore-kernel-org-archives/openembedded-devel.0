Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BAA6577183
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:38 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b205so154815335wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5m6LNuUvaVkoWrSP3hS+1P69A/QDLme+a4kAUdwmih4=;
	b=YeZqKCWKHtdfWzCBo22mhQiKIl8i8GbtyNFeDHVjYsPJlRrcQxEw7lINFbyWe/BVb1
	r58TS7QXiR/IdnzY8FVS92f7DisM/vDl0GdMyX38bFTN60otD7RO4NKJpmFASQVPUQVB
	+YEaaU90onyhRWAzjUi9CqoNcnkRjTbiVRws0KergdPHQRekpCaMY+ULhUWNDPpKkYr0
	+pNacGaNcn5nOzGVdB9+99QCqHsINEfgzUNwVIWmE+svf1uliD6u1F4EupRDGbnZ+wcM
	VFQIEM/ucSfHwEF3kBv/l7Tc+Vuq06sK3FdlkznbyBHz4qhe3UXVXoM4ztgUwQxoM/hE
	pnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5m6LNuUvaVkoWrSP3hS+1P69A/QDLme+a4kAUdwmih4=;
	b=fUGqRBDqiM/tc0gUHiJ2aNxmiyWnWatOH+PLC7PJiV5ZBWJJM9UziXAf3gSkrYVKDn
	I0hf/ie/Oacxr3tf37h8eU3Hnk/vZ9odRBImWELmfat2U2NHRszObCaM8c0uJgeokZxy
	+krN6gMQJdf4FTGQFxv3QguaGR5nl0jJiM+bxJK++oe/Y1aYNwHuBQUS/xou+GbaifK1
	Bad4bTP+lBoFRsPT091fUiFeb+CqFsEtrfGN1u1ap+FKqf2TWovupOMTU8pupPhs1EqT
	VXpNPpTAKBVtJBt/4zUYZ9GSWfowqyVohPy3DuVjqqzDsFG3bbrG0df9zmK9uJdSCfx+
	kZOw==
X-Gm-Message-State: AG10YOSG4XH0KpsDApWkCPqOzauJisESCgPlbDGuVJfZelxkQFJiyIgT5XhV9VgPj4re9A==
X-Received: by 10.28.63.85 with SMTP id m82mr13253832wma.55.1456146579035;
	Mon, 22 Feb 2016 05:09:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g1sm22580135wmc.0.2016.02.22.05.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:10:24 +0100
Message-Id: <1456146625-10100-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-networking 4/5] curlpp: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index db4c9cd..b3231fb 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -86,3 +86,6 @@ FILES_lib${BPN}-dev = "${includedir} \
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# http://errors.yoctoproject.org/Errors/Details/35129/
+PNBLACKLIST[curlpp] ?= "BROKEN: QA Issue: curlpp.pc failed sanity test (tmpdir)"
-- 
2.7.1


