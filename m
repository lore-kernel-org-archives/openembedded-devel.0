Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 394D07881D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:37 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f23so8114577plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gOJUSuAAhKdDYCgI5eF/HaaTcmFEHuaDzTPN1KJ7fYw=;
	b=jM4FS8KdqMBDtzkzVM5spoK1dh3pgDBrDxL/MgaD2PFrKSuj9CcMO5KzqMRrsbl979
	488nAeLjPgPoHAGjZVttLPH75+Te1Z9Yrf/xBaXtFNfJRmMTDgyAnVp27qROIGHBkoVy
	LmAPXHHV0gHNr2hsxQkyJr3THjUYVDRGhPg9LHz+67thjKtxr81hq6II1us1jQZY7Gam
	LNAxTXwpGjuytmoQqLT6ccwbTF1bETr37RUjQt1tr9C9YONhbw56SiOmhotKZ8GDlDag
	QIrqzmRDAvJXCZb1oq/qScfdTu+ttKivx4MOn5uT4o8xgXo3E04x3ZxKOpF9Iq3RXYbm
	wpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gOJUSuAAhKdDYCgI5eF/HaaTcmFEHuaDzTPN1KJ7fYw=;
	b=W2tV7D/9ov6HagHvStDKTNq9Ucay7Nems6uAydxdwGHr8F8BnfswFpfaDRT7zDIjRI
	CIEWUczDepT0WDRu4e/pGnHPAhy4hCAsKx1AHuLDi5ZJ2dfQUfSF1zT/ZHh6B5aro1av
	xvpaXX8SlmxiypjmhCgn13r7Nf2z9pwo9+/aYBsjfj0j2q7dQWhgJcO2xwSTI1Mbh5GZ
	yIx1/XR3Pp4Wl7BSM4DHyKwfsarE173bZmxblHAiIE9gUngKMZNRfYMNg2avAXs+MjIe
	H7nQSOaY+yB0fMhmObPhE647H9uofqvWe6CSr22xvnaDMK1IOCBq3FiwGdZZf/2IaOc6
	YQwQ==
X-Gm-Message-State: APf1xPDLHzOy7MdMnEcb1FuXgRmhmmBoCMttoQhj35e9k4lIxW/e1u7X
	xm98bdpcGD0PZOZf/KkoGr8JuQ==
X-Google-Smtp-Source: AH8x2268mkJZJ8BX2wDXsOM2v5N2858XCTYmAlg7N6A44Xb7yVKTAO4sqLCDef4HCc0yqEJK58VS1A==
X-Received: by 2002:a17:902:5269:: with SMTP id
	z96-v6mr8494795plh.385.1519594418699; 
	Sun, 25 Feb 2018 13:33:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:01 -0800
Message-Id: <1519594406-24490-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 11/36] testfloat: move to recipe-tests
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:37 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch       | 0
 .../testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch       | 0
 meta-oe/{recipes-extended => recipes-test}/testfloat/testfloat_3a.bb      | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-test}/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch (100%)
 rename meta-oe/{recipes-extended => recipes-test}/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch (100%)
 rename meta-oe/{recipes-extended => recipes-test}/testfloat/testfloat_3a.bb (100%)

diff --git a/meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch b/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
similarity index 100%
rename from meta-oe/recipes-extended/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
rename to meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
diff --git a/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch b/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
similarity index 100%
rename from meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
rename to meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
diff --git a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb b/meta-oe/recipes-test/testfloat/testfloat_3a.bb
similarity index 100%
rename from meta-oe/recipes-extended/testfloat/testfloat_3a.bb
rename to meta-oe/recipes-test/testfloat/testfloat_3a.bb
-- 
2.7.4


