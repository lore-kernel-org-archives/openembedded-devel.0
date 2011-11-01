Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9oG-0008GO-8T
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:04 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rg7E34j6J9zbw37KDBLW6Y5S+jDuDivYKQKjUyOseJA=;
	b=Cg+cK2bYZq2oECwI4Ocr7mLxs/ZtozW+sT5mCyvBSMTquxgJk2TU3nDXHSYk3wLjeu
	HcjH5dHG5TFgYUs795cVZLn/4A0PCy94E0fRn32v10EeynIslrdCwyPGqxhcGfAE3sIN
	jj8t+2/PQ/fNaFReKYTlyxhTFJLEzpf5sTzCk=
Received: by 10.223.85.139 with SMTP id o11mr35649023fal.0.1320136139711;
	Tue, 01 Nov 2011 01:28:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i3sm5066890faf.0.2011.11.01.01.28.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:43 +0100
Message-Id: <04a16e945c48abcda34fff59791d4b0a80bfbfba.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 09/15] systemd-serialgetty: use better default SERIAL_CONSOLE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 08:35:04 -0000

* having /dev/ttySO fails with:
  | ln: failed to create symbolic link
  `/OE/shr-core/tmp/work/nokia900-oe-linux-gnueabi/systemd-serialgetty-1.0-r0/image/etc/systemd/system/getty.target.wants/serial-getty@/dev/ttyS0.service':
  No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/systemd-serialgetty.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
index 86d833e..2b88d0c 100644
--- a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Systemd serial config"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SERIAL_CONSOLE ?= "115200 /dev/ttyS0"
+PR = "r1"
+
+SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://LICENSE \
            file://serial-getty@.service"
-- 
1.7.7.1



