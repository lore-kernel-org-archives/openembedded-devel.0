Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 73CEC71A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 20:32:22 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w69so6935555pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QL6jIGTQdvTocV5pdpntgxbJpWsaqiiZHSQI+yVKNzQ=;
	b=EStqcK78mNZnABAYu98TH6F5m6Kwxii67BDjBIvoDuSgdziKe8zJJ2++u3viPJvzSY
	fRxhiaSD4qQ2Tp1uQ29hPnNgXspX52IkWcKvsKyOVF1XBnP3KCahHeFl5I3M5wbJqmMm
	Uf8HACxwzF+9kZvjGoVZhMCC3gYHrPrHihzX1b0Wg01LAMIHRuUrb0JzRAJm0meiRvgc
	ebG+swUbXnsKoIN//mcx9K6WxGT2DW8tzCRhyVhftlBoj92Yylx3MfDEVgU82QrGdlBs
	MvZCjMtx8YJR/xGPXbRxGuZpPRoWuAgy1jALsrx9719xzcUej6uYMWaJnU4LwCNLVH7E
	lWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QL6jIGTQdvTocV5pdpntgxbJpWsaqiiZHSQI+yVKNzQ=;
	b=ktD4DVXdxzjt3UcYXFctxQr4CF7hiHOWuqUXKoV4BqK2PtI3Uaqlb0FwcHneza9Sjx
	BuEcCZ8YbWTCMsgOTnrUlRyVh/bn7U8DYmU2u4a+t+5AMvvWBbtJImbNuFWdFLKAwAFZ
	RxWUBXeQ8KjlJQeTl0+G5471cpk3/AZM+9/yeQqCiPQKoVFePFBiZLpdNRIBY5/1dyTu
	NHh0vCTfOY3EjFE8zhA617QQ70EQoNvZdk1L9iFtbLUDTzkUgiVmuVVOXxAlOioB0l3O
	WW7Z8BHMFz91KTDHr4oEnihmGZ6sNKrX/96xBj7AEzC32tUE74vlHMndFgp81F6kBO0/
	YgjA==
X-Gm-Message-State: AODbwcAE+pIA+5OSJz7MDDtQKks53RovkAUOs9M9cNYZ2N1s4eF5Jq/E
	4q/DLn4hPredcA==
X-Received: by 10.98.138.150 with SMTP id o22mr6496464pfk.120.1495139543895;
	Thu, 18 May 2017 13:32:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	n7sm10733593pfk.74.2017.05.18.13.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 13:32:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 May 2017 13:32:12 -0700
Message-Id: <20170518203214.34947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-oe][PATCH 1/3] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Thu, 18 May 2017 20:32:23 -0000

Helps fixing build issues with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 4c4ae66d6..7c8deb3ed 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "17.03.00"
+PV = "17.03.00+git${SRCPV}"
 
-SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
+SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            "
-- 
2.13.0


