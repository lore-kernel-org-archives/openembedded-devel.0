Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E00BCD13D2
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27301.1762704044471919322
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Od1xbQbb;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso15002975e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704043; x=1763308843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=likw4R6JvlA7JcfZ0R50Gvpf/qqlNtu35K5HK2dYhY0=;
        b=Od1xbQbbLHlaqJ6FEGt1nxukIjfmE5hZBcVoHj9qredffLlAsp0cQXPEmLMiU5VDS1
         QVcNr6Oqn1kJmJEis3xOb4WTt4mv4FSR5tC9VTNXxuFy/53TakAXb7cZZMZx4u/sl3tT
         usNUPgMdsvqYVwcStvM/TOSOnxCPuEFUJLAj+1VRi6BUOGHLqEBQn2HQt+AzAbVLixk+
         tuyrVE1JR33br3POCBZxi+Q1lyou9uPZNKKCje5Xw8qYAOcnrGDH39PN32Kjm1AYD5yl
         sYNnFOga1r4dAtA7vo7dEPsniIUCxGqMxh2PneieGsetSO8WJnTZ+pufGb7sf/9KAIie
         zXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704043; x=1763308843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=likw4R6JvlA7JcfZ0R50Gvpf/qqlNtu35K5HK2dYhY0=;
        b=U9DVNvSNI+rnFhOC+JFwpMHgXlaVfLldc5kPtqSDIjVrlgTePXDKeuZhNsxcoPzLcA
         73PbedFrpqqTrZTafm406lUPXBytScJ2/Lku9ElX/Ns428HU7XwKuOnhSIMbL9x4Pgwm
         r4eooKmaL5MZbUpxfFIi/5IfxGZkkWiEI9cTOlNzrHisGcVzf7ytpnGOoHPYQsKwcCz3
         Bi870N+UETQ8UUPiqcBwdKJZerOLgQX9cc5nxlgMcMKtAdzxvqQalwfSDpNPmIQN1BVM
         HYD9rYxLQRMbbzkX7eVWsiabHNI+f8FWvT0xzxhryv9BXjYUEbJdBR6VIEoUcWO/Oxy8
         amuA==
X-Gm-Message-State: AOJu0YwfqYE3JdLcxkpxRXZxAR8T+msXSZVd7L7jryyLTeDJpxzOvHLr
	haaypE+6BIIHe7NWmd2xFxDPYKjVbT/D2iDM3Qy/p3JsuluqXX5wbpxK+R5sNcVo
X-Gm-Gg: ASbGncuLgRwpJMrqjKPVtqR2Ixxos+WwqmQbn8/qntV3PKrFL+hay4tpPELH8YOYi0m
	Uz8ohWUyfHf5T5C1OdVqrksB1eTmHEk76OX6XmuJQO27mHs6sWeHznHLILvHHc3nlWwztblN1Ev
	GLP6nkBCt50DoZlasTlFkJCan5Kw6UJKdsOfyHSJlBWUzjl3Qh1FZrNUfdkDu4+e5ZWspi7OKLR
	A1bKPd9dm/dEOP76RiP9g2SwXA31Wxn57j5rN/3MBQPiaqijyQez6CMP4ydmVgrvDs199F/jqzT
	/0zyJy8jEewnZyjZmI9fdAKL5j05MHzpba/nPsOVRxiY4Ko1XJpS8w5PzKd0QHCK+ocOJNBvCPS
	rilfFr92hQUZAN3b3ueGSTab0J6pIPtBwrmazDju1yh6qxppwePXny7ILDwkWYv9QQPX3J9SWV+
	OSHC0MXKDY5LEYXDYJyk0=
X-Google-Smtp-Source: AGHT+IEZJfjNAVqdE4rgFvZyrvQmheJI2tAeJGUJr1mfacHkNz6R6oDyybE4kvu+nv0o2NXImTVkTA==
X-Received: by 2002:a05:600c:1f90:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47773271adfmr58662335e9.21.1762704042738;
        Sun, 09 Nov 2025 08:00:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 19/27] wifi-test-suite: correct SRC_URI
Date: Sun,  9 Nov 2025 17:00:11 +0100
Message-ID: <20251109160020.2522353-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121435

The commit from the recipe got detached from the master branch - use nobranch to
avoid fetching failure.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wifi-test-suite/wifi-test-suite_10.10.1.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
index eda01ca388..c27e6849a9 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_10.10.1.bb
@@ -9,7 +9,7 @@ SECTION = "test"
 
 S = "${WORKDIR}/git"
 SRCREV = "12e85fbeca8ca21a632d18e55089a8a7606d64aa"
-SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git;nobranch=1;protocol=https \
 	file://0001-Use-toolchain-from-environment-variables.patch \
 	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
 	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \

