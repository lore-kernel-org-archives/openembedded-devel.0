Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5165D71A6B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:33:01 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id b7-v6so1791517plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=HPWiezOOWGCspGTEA25IIT3efZBpydTTaubymdFzb28=;
	b=EeUeVLIKHcLbReHTu3W6KyGAfsYJtrXKnEntddWjRBtLcNHjJhpAbD/6Gq3B+80c1z
	YaLvW44LAYMGJbpGXVx/FTpYl2hLV7nyKSA2nYg1ML+odsAeCc4CywAPpwAN7Uk25381
	UoGOtBmNPUXC/S8cyeogdyiJo9ORfY2/ymU7dwM/6Q9l1mayntNADW5jM7zWfw3DVv7u
	upxRuvXbpXuALOmq7DGlFPlwV/BoHPyg1He4oSLdLWlGZga2VvxvuRPxCeXWDyNJNG6K
	/mtSN/YmCrPb1/X+lrTnQncvmH3I44XDZQKj7SLJPYrjJkRs8v8XTkWpr0i5DHDP9aXI
	VVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HPWiezOOWGCspGTEA25IIT3efZBpydTTaubymdFzb28=;
	b=IECRFTyedcNXgqlYlkdHGEo5xEek7eolFCFDK/nWlz7nEbrbBC58wpATsRXLAp6YTU
	+hxL/6ABkN5g4Z6LVh1D4/+0DRAMi5SKfIsVuxBX6gtECJMDUJDGSi45xQSjFJGMZG2c
	ntZI4n+on7CGWHYXs4+UKZ7Vj9t5lcQBnwTgG3ulWqapoIPx82d/f42PvxIPvQa+BCJG
	xYW0/yiezbMIGFJ+cEAZKR+YBtmINa33HYF8SKUaIw4QPYE0GBQReb8W1f57Mo0WSJ+A
	rKRWge7J1dZt/aiBYBezciQSSyxpynyEYtal/TEHRfigKFmF154VwsSpbps0TDwdJ8Qc
	qMpw==
X-Gm-Message-State: AElRT7Hd6ALz4QkPG2U49H7LWJUED1MArf5Z4CDDasvh2M1N7Y8dR7HA
	LQXYR4rJ6Qff+XUDdy7aKXc=
X-Google-Smtp-Source: AIpwx48cD+5qH5iXCQmnuz20ptOALr3DltavJSfxdLgSC6bduBIwRTpWUnFeivKJufq7kEskTZIQdw==
X-Received: by 2002:a17:902:8206:: with SMTP id
	x6-v6mr4421006pln.256.1522251182553; 
	Wed, 28 Mar 2018 08:33:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:315e:77dc:98f1:ec41])
	by smtp.gmail.com with ESMTPSA id
	w5sm9046975pfw.137.2018.03.28.08.33.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Mar 2018 08:33:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2018 08:33:00 -0700
Message-Id: <1522251180-2803-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attrs: fix typo in depends
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
X-List-Received-Date: Wed, 28 Mar 2018 15:33:01 -0000

ERROR: Nothing RPROVIDES 'python-crypto' (but ../meta-python/recipes-devtools/python/python-attrs_17.4.0.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-crypto' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-crypto']

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-attrs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
index 360f9c6..c29f058 100644
--- a/meta-python/recipes-devtools/python/python-attrs.inc
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83
 inherit pypi
 
 RDEPENDS_${PN}_class-target += " \
-    ${PYTHON_PN}-crypto \
+    ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-ctypes \
 "    
-- 
2.7.4


