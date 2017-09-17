Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF5671AEB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 20:21:43 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p37so4006960wrb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 13:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tkpt0Y8JKIfB3ZmowDILDLa0WhqYUPVBZAl4Q+kiqTs=;
	b=eBWqWQu8L5ibLKRb89jczlp0A9hmj2N85eFwPIw+3o8ST5GWzuq7F3UxzDI7xuZZ4L
	KRjGCCZjYa/Iqc8ZrAdAXYqLGWrAMao0qh+ubHBaJPK+BhrlGv/3s8GhEBExwaunLQGW
	cAGGEbi26Fcsxy/5q3zluyUFvNoOvWKgdVfK4ZYTJ41UWT4lxhArcxET1PN4i0Ca/wOx
	2/1QHlU/5J3AloGRaVXkB3pf19TBweubIndpDcZOIqYmZGs1u3S5dwimIjmGT4LLJsqo
	7Ze5ImMhyGFuTPNEWOCisdmfHT0p9HcGnCSWdFiBXcOp184Lnw4M2chgTiR+jeHj1GlQ
	IsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tkpt0Y8JKIfB3ZmowDILDLa0WhqYUPVBZAl4Q+kiqTs=;
	b=YKUzuDuLNpYQ/iScHCej3LHd6yETIa3t4dYTrZtc+f1/BWoXDCcE5DNwQ3aJL4Bt0R
	fJC0m82CdHASOEwj3zVBOW8IDuCJ7wO5MYWsvB/gUBsopplyCiT/EUxGBViCAvTRsBv2
	TUC+dR38xbPFT7u380cLSsf8NVk9I8yHHRtwXTRQ/J/uvEFyalkRqzt+8IToKAHXZfvF
	kljmJ7MQdzhsKHJsQt4bjgnSY6dTCI6xrDr60/SZDMttcQ+9qCcML3Q3HeXoiP47PDn7
	V4pHj1barZRxi+gZ0MYVQeW66nUQnWHnAZqcP/hEyIiGkFsPo4alIyZcQpUvlTaVZewA
	S+9w==
X-Gm-Message-State: AHPjjUi36Yge5oU0kz+4RRTl+WLbc1apHYlXX2zE5/nuvLXKRhFUvLlB
	QeZulU1bQUZraRwN
X-Google-Smtp-Source: ADKCNb42whQWcvScx5TVWq/+vvGBGRJ3Ym3VZBlsC3KH7vh/scwIBlzwXyOcC1wBAJScHJvGopULSw==
X-Received: by 10.223.178.166 with SMTP id g35mr27625663wrd.262.1505679704339; 
	Sun, 17 Sep 2017 13:21:44 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	q19sm5833025wrb.17.2017.09.17.13.21.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 13:21:43 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 22:21:30 +0200
Message-Id: <1505679691-3610-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
References: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/5] zaurus.inc: explicitely define ARM instruction set.
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
X-List-Received-Date: Sun, 17 Sep 2017 20:21:44 -0000

Default for armv4/collie: arm
Default for pxa: thumb

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index c80e89e..c6e9e98 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -33,10 +33,12 @@ XZ_COMPRESSION_LEVEL = "-2e"
 # machine tuning
 ################
 
+ARM_INSTRUCTION_SET = "thumb"
+ARM_INSTRUCTION_SET_collie = "arm"
+
 SERIAL_CONSOLE = "115200 ttyS0"
 SERIAL_CONSOLE_collie = "115200 ttySA0"
 
-
 CMDLINE_akita = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_c7x0 = "console=ttyS0,115200n8 console=tty1"
 CMDLINE_collie = "console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1"
-- 
2.7.4


