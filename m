Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B0447458B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 19:59:56 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id t17-v6so4445881ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2018 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2OjSz6ci5u8YE2uysWLM4i4KdO9qEZ3SAORJOFxJBr0=;
	b=pvL4a3Nt898pyuNHrPEzrPNPWE0BWnYtKoiMwecouK92RybWQJIiJyQsjbu8grCfoy
	T2MvMcvWaBVS8AIIGSXiuhgl1Y5Y0WautBPgsv25uInnl1p3G/IWksmDH6WQ1FcoR0cj
	24G1bqO1r/OPTD/VB8EEmGKw/3vbmtu6ezLZrx6qSfq9c0qN9TtxPOpxhqYsPjc0RZnx
	v7/NDmKPc0INWAIEmXZ2c0uP1xMvBNSzgcpFCjCfKTHRtRt/fXsBIEGj9iaLQb7lxW8R
	i2MaLYP9W4c3DcAzDNlQ4Jezhk63oFldyIJ4yMpBXaXve1hmIXdelfrK0mcsx3VfKDyx
	6RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2OjSz6ci5u8YE2uysWLM4i4KdO9qEZ3SAORJOFxJBr0=;
	b=CMurCHu87nSCYEss+PtBHLJUmSKkiNTPw5LtOdqDWe9taNtlQP4PNB7/8XLvGQt5hw
	cmuNY1a0vD6SagAwyt1TTuUHwAHXeU2bettJl00Bz1wvvC1dEzQzSXFltGFGHfSo5Ovk
	wEaNEvut9EmN/33X1ZxEB5UYkOL36MNa/8yUfenrCOdgk92A++EY0ya1Vai/Mp3ZSN4/
	7m1rpCVrbXwz6JoWR5uwBFGUdInM9zL2Tix51Ler3DVKxngOOJUk7sHHfmYpOKsOHwXi
	6MQ0I39CYPidkzIgoHsNQASYXw0b1y5OggHpA9qgIjYHD6D0CgHdCnBrktgnYje/DIGK
	0r6w==
X-Gm-Message-State: AOUpUlGGvzAOATZTryS3hAouNkwZb2uKFyDyvxD9bG//vDNC2qHX+2C6
	rBnuPPR1Qcj/DcvLB32MFEZu5zSJ
X-Google-Smtp-Source: AA+uWPyZmkoGdZAFdcUWLvjwmEG3ZWyC9DZ8Wd4vZ95wQ07dF2iTLLLWi0jn1EbNUbDs9yvEbWL9Hg==
X-Received: by 2002:a17:902:e28b:: with SMTP id
	cf11-v6mr7438770plb.86.1533931196968; 
	Fri, 10 Aug 2018 12:59:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	r198-v6sm31317742pgr.8.2018.08.10.12.59.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Aug 2018 12:59:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2018 12:59:49 -0700
Message-Id: <20180810195949.25394-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH] toybox: Add missing dep on virtual/crypt
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
X-List-Received-Date: Fri, 10 Aug 2018 19:59:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
index 347c2856f4..eaa548f897 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Toybox combines common utilities together into a single executable."
 HOMEPAGE = "http://www.landley.net/toybox/"
-DEPENDS = "attr"
+DEPENDS = "attr virtual/crypt"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
-- 
2.18.0


