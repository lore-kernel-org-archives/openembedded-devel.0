Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA298760A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so627820wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lEZN32nCNhsI/0nw2FXeGd13JLjamKIZBhuxkQZsIBE=;
	b=pPB3LZbWzEF/bMbv1St//JNaea5UnXyRhrQSOre5WgaUZ2KPUX2IPluFE8V6/bkVyD
	RHV+q1j50oZuTAH0CXwNeKL+C/F0uyhS0cpNMzhWuBmAWrvTYfRwGQGOYHrdUiGts3V6
	Gnmz6lnAFAaIr8voATmhabiSA6CYG2zSz3nqHI1cTSNIWv0h9SY5q2BdqUlo63Kso5Gg
	mGmaLmw89mS0CasOzOJhLg+6+fa5p1GsH8ilg+bKp62AUFFJpWNkJhY5tLR6iXuQcYO4
	ui9hjAlts73WtfHmtQOBn+CeyKiMnLW+rWM0KfrHy3aisDmJ6glqqJQFwvDJe2B4AwdJ
	6Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lEZN32nCNhsI/0nw2FXeGd13JLjamKIZBhuxkQZsIBE=;
	b=HOmFfMULuHP+QX7abSPhb6gsFzPOqD1FMzkhSTl9AiSmNleDZxtWYO/3BPGb3YxA9v
	64tsD8gCK8YnhgomhKz/cbutCetrx556RNBBrzFc6NVd4I20RGxWO+S5PfKgzXZ5Zn7F
	wygmaVhlq+MEJnRKwBzKpCoORGiW4iZNS4dpYbnuPcWDo3Ui+aQHtxakTpgweI8G2RMJ
	OPhS+TappmGRK9vLZcSfW4jfzjdkDYt6g2/ERfAj4t8AdXAzBMEYyXxCrWtW2lj2LBYq
	Rs3352Dc2AM4cSPF99mOYK+1oME3ftC8OLgtRwW85YJiHywwJ3ZJADa+46sdJGxcVokS
	oMjg==
X-Gm-Message-State: AMke39nUHXfO0PqrQmLCStzkJZVJC4hgw+Z11ytJL0WsLkblUf6AQfJ92n+CD07VThxm6A==
X-Received: by 10.28.234.193 with SMTP id g62mr473135wmi.36.1487025193100;
	Mon, 13 Feb 2017 14:33:13 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:12 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:43 +0100
Message-Id: <1487025163-21628-10-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 9/9] kexec-tools-klibc_2.0.2: remove blacklisting
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:13 -0000

Recipe does build with the pending changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index 0e97046..c9fec25 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -38,5 +38,3 @@ PACKAGES =+ "kexec-klibc kdump-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
 FILES_kdump-klibc = "${sbindir}/kdump"
-
-PNBLACKLIST[kexec-tools-klibc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130674/"
-- 
2.7.4


