Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 83F95731A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 11:29:53 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a4so21808391wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fctnZUIjVrDXkBhQORNoqzjHgE6v6nYd5+XxrPVJkOQ=;
	b=x6+e2EWFJyJnVT08qsUDFRMj+vfNeMPjAIQGTFyNnVq+SiJVPQd8UfPUIFtyvbGlpT
	vBjq6igFhs32p6KrW7k2bm6utSzw9nSALibMo/SIksOUemVc9Xuo+6EgrkBUfL/kecFf
	CSagx9x5YMPkHrggryWn37D5yFaJdQCDFYMVEPUbzfPmz7bvkHUzCkLauJo/RDDQ+5JG
	vSoc9A510wrbcJtTOqLbEUYhfcuWT93C9znkz7br257zbmG+/Du1yyO8FEf4ynZZ0Zod
	Ikixjvv4Su0NXNE+22/Dy5xNRDQh0aOmQzqbZH06hPRDMkvF27E3mhKXUIa44mzuNqDy
	CIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fctnZUIjVrDXkBhQORNoqzjHgE6v6nYd5+XxrPVJkOQ=;
	b=HlXNqyJCS+kQU+40wXTa6VaTZ8fDuTWoO+Loab326VPiWLcWtpoqI29I0uH/ddJ9JV
	60OtHTD4JlNn+mNRpUaiChzZHKuzR5yzKd+RzQnw9CeDwq7ANd55+z8ZY2TnU0brrKCK
	nD9iu7I+hQX2JJrvm2nR3+1mEx25+ffpzAO02PY2AQJwFxiz1iF8igqf7B0wf/1q/N8z
	4c5qG+eCkje2aSF9jmsLBeE6D/MJe8QVze0vexm8rQi6vhgIcAKj+bEA1FfNK/J7g6zX
	xci2VzM2XJo8Sr6H0yA6KiGGjEMeqUrSFMCA/aBdRYG8yFRIQLrNFTND6RiEUl7uP41+
	RDvQ==
X-Gm-Message-State: AG10YOTJ7H5yM87g6XroKt+LM8J5wPF3KL6Pu3QyM4W89ll/q2OEgxdEVESBO5BTmjABzw==
X-Received: by 10.194.87.1 with SMTP id t1mr10570787wjz.170.1455449394019;
	Sun, 14 Feb 2016 03:29:54 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	c185sm10686414wma.5.2016.02.14.03.29.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Feb 2016 03:29:53 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 12:29:48 +0100
Message-Id: <1455449388-4505-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: disable do_shared_workdir task
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
X-List-Received-Date: Sun, 14 Feb 2016 11:29:56 -0000

Simultaneous builds of mismatched kernel versions fail because of contamination.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
index f6d2fa0..2904ab6 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
@@ -11,6 +11,7 @@ INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
 
 # disable unneeded tasks
+do_shared_workdir[noexec] = "1"
 do_install[noexec] = "1"
 do_package[noexec] = "1"
 do_package_qa[noexec] = "1"
-- 
1.9.1


