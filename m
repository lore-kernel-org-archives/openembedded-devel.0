Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 56BF5731D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:16 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id k127so50631487iok.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9RJ8HLXs4YOc28/z1Qsa0PhVvDMLgQIrPU4HO6VkTwY=;
	b=apa45M+oHfchiaAtWa3U308/Wdk7uK4hk1+uN2cdQK1aX5Z/hfZpBOM1Tpg7eMLZXj
	IxZGrP3pcku9k+mtLZ9cXnWI0tC4kHwJjsjafg2/pdqM4/HBRYsHmEqx0GW1QRX1oN5j
	SGuZJPGoXtJFQcMJzqa8RcByIzguVKaStmjsP89NeGYMqbxKdzITgk0oaNnpanX8tlNs
	WORca8Nmd1wKGV0kb/Ps8XOaQ2nEoC1IolI/IuqmbHdUsVwf8hspJYjfJIRiB1MDmzRr
	n2JvSu/ncbjxsVUaINw7ZKmV3bcobCAamFZ9IzVUUS1XPCYC7qrVYeSYLIZh+NBYGP+Z
	GmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9RJ8HLXs4YOc28/z1Qsa0PhVvDMLgQIrPU4HO6VkTwY=;
	b=nEyfud9A5NFCYGtprOtnCS0jvTHEt1NRFDEnfozh60mhCMhkKbjXLlQS2XZQpX8hZs
	k0F5UH9tNkWdG5g63iH/N2faKZSyXSlBK/8pcK4k/QEiNU4gxWyX9FEXgrpxqyzhmEQ1
	xm3OekFU7Z0Hm5ZXUSFqnA+NObR+ganrzTwiNhZURWlE+i8jWXLLick/DM8+/1MS0KIO
	TVI6LlvThMeuDxTGKH4AwzdkJNkvk5nJi+YO4hh3BS7EeMbZQqb7DQvTH5SZXE1AhTrz
	RO/c37XwMqQE72QgX+ZJlw8jnXLL97PbQBOelQ4QzbSlmSvyI3O3qnkHW8mvLftVn6Qx
	BfpA==
X-Gm-Message-State: ALoCoQms5U3SuX+fkL3b7mMNOK/rdUnNwG6WWVgOlxFRD2COsGDIAWUOKnVF3OkhgvPvbbMM0iTht/1+idsDsrSZz2MFxWWXwQ==
X-Received: by 10.107.1.198 with SMTP id 189mr7567926iob.167.1452805457355;
	Thu, 14 Jan 2016 13:04:17 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 81sm3210754iod.31.2016.01.14.13.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 13:04:16 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:03:33 -0600
Message-Id: <1452805416-22520-2-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
References: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 1/4] bash-completion: move to oe-core
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:17 -0000

Move bash-completion to OE core since recipes are creating packages that
should RDEPEND on bash-completion.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../bash-completion/bash-completion_2.1.bb         | 39 ----------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
deleted file mode 100644
index fbe4278..0000000
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Programmable Completion for Bash 4"
-HOMEPAGE = "http://bash-completion.alioth.debian.org/"
-BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SECTION = "console/utils"
-
-SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
-SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
-
-PARALLEL_MAKE = ""
-
-inherit autotools
-
-do_install_append() {
-	# compatdir
-	install -d ${D}${sysconfdir}/bash_completion.d/
-	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
-
-	# Delete files already provided by util-linux
-	local i
-	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su; do
-		rm ${D}${datadir}/${BPN}/completions/$i
-	done
-
-	# Delete files for networkmanager
-	rm ${D}${datadir}/${BPN}/completions/nmcli
-}
-
-RDEPENDS_${PN} = "bash"
-
-# Some recipes are providing ${PN}-bash-completion packages
-PACKAGES =+ "${PN}-extra"
-FILES_${PN}-extra = "${datadir}/${BPN}/completions/ \
-    ${datadir}/${BPN}/helpers/"
-- 
2.4.5


