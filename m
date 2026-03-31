Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2613E1061B3F
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 12:44:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19448.1774961089387903102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 05:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gq8kRJZ4;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439d8df7620so3991302f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774961088; x=1775565888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4NAA/WqVW1BstOsLY8fRQ96peP+/vRH8p9Gil11eCM=;
        b=gq8kRJZ4UdyzNukflIX7iUNHJeNbT1HGzoRG0nC+foRd0wR6tQnQmClTOMPvOYMEEo
         oNyqk5cBcwx96HFCcYWiVttggzO55C6VKh20ifjaFW8LXq/30sYWIuGyXV3EYO7X5/w0
         O7qLGbirGeYJ/BRe7Uw+7+C6VeMq+9JRETqJLGSTeDP8gjklB4xmSRjvUt3G6zbZVagX
         yFb1bKk53G4f+9zJDMYaBgNANmbOWfpDF9TFJ325MdeJNuZ20ExI7SiMl8zfuuDHWDXj
         +1b7CwW4fzZzxhSOyQC2t+DxDvyR8ggwkIZxpo+z+ydybZ3aU34JRP9Akx72MQkiu/ie
         iwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774961088; x=1775565888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4NAA/WqVW1BstOsLY8fRQ96peP+/vRH8p9Gil11eCM=;
        b=rdtOKc2cptxUudKLkBOX4uUcRXMjlED2wh6t2nxCEBFToEPNPzHBDRq36Qsv6srlAd
         U1evRhbI1//BN78fR8HlauhyWLWqOaBpnE6I2K+779Vb9lBBJwqbk19nFx1SJtnz+74o
         XxpgNHroAtSSAsd88g3g4wAwQQ/yO1nC2IT5qg0adoyLQyVocLplJa+CREhjCfHQnJJJ
         i3NuPAPoUOZA72rXywIIuEocrC3xyYdNDfAuHeabBpfRyBCYHdTL2QZ/G1dbG0AfkyY6
         BavYjpmdGnRTtiUlXB6ZlA57qEB4T9uPnzg9fKbH009PIxxceyA/StzJiqs7j5Z/Auvi
         r+og==
X-Gm-Message-State: AOJu0YzpW2dwTW1utWXrHyT0nJgdMlOjfrETxPInTLiL9ENZMOYhLhm5
	svy3CTJciM/nC2TYSS8SuMV0EiVBsa6JakVNbd190kqKqIvaKKRwzH8QN0OLLQ==
X-Gm-Gg: ATEYQzyuRRZx+T/U5EQLxFhQQo8MdSjuVAVkW6dCUTMdwvbmThcqgUyYjGIJ8cZsT+T
	gy9AGwPuwOuehy0ZMB/HYs2LQnFh+PkeLZqpAKN6YgifQwdJLkmpdxJXhjHNCTUmt7ODXIz8gAa
	m+vVlh4vrpz/p1IjZarOmvLySEksIIAZP5TU9fVCc2Vuuca9kfszng/ukK7rA7yrxvjSj1z4U1h
	Fsp36beYh+H7hgN+228mdXxJuOTH4O2Sy5sEKZoq8M+gdNrzlNu6zrgjOmkRTN7zIUCMYu25Bhe
	AQ7KsSHjumJpbU8cLLFuhw0bEvkdybjSmEyJD4Lk2FDAjZckbJklZkL3DLg0hV9fRuIHeY0lbal
	9S2m3Z2f3Am84lQqC6TARxMxDlwGzYydLjdEJsC5/0f9F8Eu2YhrIMk4eBz8QAJcnhhog3yCpJ1
	aEHPo1WHhWzHmz2Dy1GfWE
X-Received: by 2002:a05:6000:2013:b0:439:beee:43b5 with SMTP id ffacd0b85a97d-43b9e9d5ceemr28874720f8f.3.1774961087475;
        Tue, 31 Mar 2026 05:44:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm27186994f8f.29.2026.03.31.05.44.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:44:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gattlib: drop obsolete CVE_STATUS
Date: Tue, 31 Mar 2026 14:44:46 +0200
Message-ID: <20260331124446.3575038-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 12:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125889

The CVE is now tracked by NVD with a version that is earlier than
the recipe, the vulnerability doesn't show up in the CVE report
anymore.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
index 1ebb8350b2..65b1e93468 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_0.7.2.bb
@@ -14,9 +14,6 @@ SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https;ta
 SRCBRANCH = "master"
 SRCREV = "f99558d9b8e3dbba2a952a0b292d3497aec8ee69"
 
-
-CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
-
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42

