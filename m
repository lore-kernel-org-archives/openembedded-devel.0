Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D34137723B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r18so613819wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NBqr228KO/MVkE0Xw5kO8Tsv33nCzwOppfeC6Sxd1eI=;
	b=E0owZsiQ5XedlyPRMmnN47n65Elru0s6/HYACnJKhf7suf70D9FxS0E4kWuJpAZQ0R
	cIEqdCJvTyHEgbDqL3pIl4uZTPnjjWex6fEwVGzfmZEDhMWeQlple37c09oSZDYWymJP
	O6WhJHP4kBA6HH3fTjTLLSQSMvfu/Yo2VDSSrBpDwkfs+pOJ4E2QNz39vWZB5sJ2z+5z
	OnsoDqyxmenFhORHdhxOdNMiu3VkOQKPJlLrBc0/sZ1+ujjoGMfHgk3gJxjav5z2mAO6
	N5Ec/MDODkkJDNrvSvJOMajGtYZUhZ3QmAEq+uwBCfTCHwbq6SRdEhVvsVFpERKQk+fU
	BvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NBqr228KO/MVkE0Xw5kO8Tsv33nCzwOppfeC6Sxd1eI=;
	b=V9Vf4CizHlKPzmjF3gI1vXboz763r3UQ0yHY8w3wF6ATVmGzWmj4Siq9qjyAZGJHnd
	0Pd+p/h6wsbbTEF1JSX31TuvAySFKC6V9b91TW+hkV//Cryv+tbgKVZnhuwd2L9ZZtiJ
	pm71O2uI5GKoAPBeHjFnhl5b7QVvGiwLC9JxcUapJwFeZBrDUh6Q7BJvSZASLpmyalJ2
	RUSjJo1Q2b3moBFxLl4xXSj4guLOQNKl+z6hE/nXPYp0k4V960T4tDK05IVnHDaJYT29
	fXDXrHgQidsH5BRjO3EztpZUcMtiwskqVIfXdt/DhZWq7zTuV/K2qSq1LUQTOYSLHUYj
	PUGQ==
X-Gm-Message-State: AMke39mdX/IyygYmxSMuADBMyvuhr1fxCPSVSL4CcDp4sjwRif+DWcL17wNb2NYZy9KL6g==
X-Received: by 10.28.150.194 with SMTP id y185mr467364wmd.47.1487025189199;
	Mon, 13 Feb 2017 14:33:09 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:08 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:41 +0100
Message-Id: <1487025163-21628-8-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: h[meta-initramfs][PATCH 7/9] initramfs-kexecboot-klibc-image: remove blacklisting
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:09 -0000

Recipe does build with the pending changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 8010c91..6b845bd 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -10,5 +10,3 @@ python () {
     if d.getVar('TARGET_ARCH') == "nios2":
         raise bb.parse.SkipPackage("'nios2' not supported arch")
 }
-
-PNBLACKLIST[initramfs-kexecboot-klibc-image] ?= "Runtime depends on blacklisted kexecboot-klibc"
-- 
2.7.4


