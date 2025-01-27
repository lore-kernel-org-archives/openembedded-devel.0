Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059F4C0218F
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 04:42:08 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.44996.1737952924956093680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jan 2025 20:42:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhKgpLis;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e460717039fso5359303276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jan 2025 20:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737952924; x=1738557724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tyOusSnsLU4Rt9OeLwiG0Gh/GDa240E3zg7/4uJb+c=;
        b=FhKgpLisxyW752ZYaJJp8VA1OjrnsiYKCua6f5kvvPdBlbyb2yntMQpYrGjnPSdhgh
         k897Vnh70u5EhprKtveOK2ZCVAXvEEM0Mf3i/iItZ+yCCP0ViRqp3VTIPd6pIPhsprpE
         ZoalAhERW36qmfHPiwKVOXcGuNm9C/PuUuLiv5LO3ZkE/xpdbrrWjCtXB6Fk9OS3EFH7
         Z6tcE0urVAi3XFzhDrSRBfNIfXguFJF24AkaVWPfgE1pR9VooyxAfXrh9JkATXZYVcAr
         KxUavlLrdlugiLx07BBr2pMauobc9JKwKVFcYM8DXvOZNYBNs0/Ra/h7RFIMvtNoYnBX
         XOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737952924; x=1738557724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tyOusSnsLU4Rt9OeLwiG0Gh/GDa240E3zg7/4uJb+c=;
        b=spGOM1mkNHiH6zgT/s/Izv6LnMQeVGRDylYTey42SyL6fdXHKHgc79FNumRnTu0fKS
         aAobrItHjA56yfbNBosqIllVTpci/XVCs5KuTMlOwdpKrS+jjV2Ek/NqTi+K0Rqu7K2N
         pZJRmTb0a3k64+FrWfNFQxTXqlmjN1+brv1aLrzxwOFpJEZim6gs2TdoBwmAG3ezkf/D
         bXpL1Kkxl8CsQJojRg6d+PjZu2H9VH57Amp8P35/cpgJ3Jaw53drPyTrc5pIaj9SO5Ox
         3IIZScexIF3r5gvur4d0+DP5/BrMtbwNagFJjJNPkPbeyJHVBLftGrdcqS79Csm3DUDY
         5Uig==
X-Gm-Message-State: AOJu0Yw4nO/Fc7AzHdVbS/K9YxgfvwX3qTk8NruavQsGN2adrWUXn6SU
	XQFi6ZOWne10+OXxWwnocvAS2wqtkMPNR2tXhQXnsdDRmJug1IWvveWFmGDA
X-Gm-Gg: ASbGncsRS4dvl52Ydi0E80efEjolMhcIUbAgYo69r9rYmqLMc/u43AYdMf288fd3e6o
	iZvv0wOTTl85RoBMnkEGKD6EXBhkzx6YVzecIxEvtWqUflJ+x6LH7ekTRfjHV6y/9QdESRW682C
	1KxZC9Zw7Bm+aQemwiV7GcnZJdP2W/NQqeTZuoFHiEsjNdF5CSTdWiZiFkgfNHzy5WEXjSHteMk
	jg8PUu/GrkbhHZ1liRXUR6+CNKh5umWijT5Gt1w9CXvj1setMzu2HbFGoSs/6vz6ffeNzTZEm47
	pUeSVaMs4xxmzdOeSJlDypfZO6TKh35ju/JzXMs=
X-Google-Smtp-Source: AGHT+IHM0NLKUkLzDmTYdm3YPzkry39NYy8eHKiKhEfGbS1TPYS8ePdgjO0RC/dn/uPDKvllucPs3Q==
X-Received: by 2002:a05:6902:168a:b0:e57:33cb:ad38 with SMTP id 3f1490d57ef6-e57b10360e4mr29912401276.9.1737952923529;
        Sun, 26 Jan 2025 20:42:03 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e583b746505sm1460499276.12.2025.01.26.20.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:42:03 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] zchunk: upgrade 1.4.0 -> 1.5.1
Date: Sun, 26 Jan 2025 23:41:05 -0500
Message-ID: <20250127044105.3433-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 04:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115103

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-support/zchunk/{zchunk_1.4.0.bb => zchunk_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.4.0.bb => zchunk_1.5.1.bb} (93%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
similarity index 93%
rename from meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
index 0c8a9c7a5f..a15540f968 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main"
 
-SRCREV = "4dd91d31157ede4a1b092721d944ae2fdd161cd9"
+SRCREV = "69dd7d6764e333413dd12848607d72cab310e406"
 S = "${WORKDIR}/git"
 
 DEPENDS = "zstd"
-- 
2.43.0


