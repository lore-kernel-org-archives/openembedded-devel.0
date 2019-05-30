Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60CCD7E258
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 13:21:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d18so4213969wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 06:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QO714HbqEh+sV7XfkKQpZuDizk5nPJTsfOE/NRtA99g=;
	b=ViZkKV/UuHk+aqmOvB+xpE6C6NfqrViUlEW0xph2BDlCNmoWsveEfIk2YCf9YSkNT2
	G+2rThRCMG+9xrkNJly7FvbVoRuFrdMlHsQDa+nosfOnGtQZdzowOoS3GDrktIR/DZHe
	9xfcuD64V8y/38WjrvO2WkLCzPT1vflEk9jMIl65kTnamzXso2cDt/nq5VNQ4F5XeLa4
	/a/VeFNXq6WMQSJnMddrIeiRu4VbG4iO3SCQgoloQbGMCLMKj863sHMkmyVDoxTXf6tM
	NM556lpK7gaZvdrMNN5rFI8BNUNPJkerTnO06V9TrkwuaUwQuUDCJxlLoW2r8eccy3GP
	pC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QO714HbqEh+sV7XfkKQpZuDizk5nPJTsfOE/NRtA99g=;
	b=i4diXDSB8wNh2hjqEl8nr+ZXgSea8qYFylRrr9F1pCcTi+2RJXmQAAseHLlzwHmR5v
	UpQIV+rBkiHOH+Ad9uFb/wEi/CZa1Ukx7o1YX6JUTO4V6v/1/TVjkp750y2kljPG9pJZ
	xQNcVdc5kMuT8PVvqIhglc1bGIabQsycOsuyV9FYuu0/HkROiGyKXF5526leKvqUIXvm
	Z8dOggGyb+J0UG2Jh54Z+d5xOSuvRkhmUpamINU4qTyZ50qqIeKQzIMubKUF+iKVCKvO
	t3EkK+XazRZ5j7yj0/yBdBKkdL59qApensVVn9mFIMN7aJdw+anB+ZqtLLw6n9zbP1Pz
	j+1g==
X-Gm-Message-State: APjAAAWepcYTisjRcyG5Qqa7hra05c6iALq8pSHMFHnkvROZhgOma9jz
	q9sqS3LiJb5PlcYk0lotfNeY5A==
X-Google-Smtp-Source: APXvYqxJLtSUc3GVwxu116QSli35dpIGkA+ELgtKbqZDnCTK1i4QxNc8KUwiZVe1Dr5SVLBc6h7Vvg==
X-Received: by 2002:adf:ba47:: with SMTP id t7mr2545990wrg.175.1559222520151; 
	Thu, 30 May 2019 06:22:00 -0700 (PDT)
Received: from localhost.localdomain (84-33-71-35.dyn.eolo.it. [84.33.71.35])
	by smtp.gmail.com with ESMTPSA id
	f197sm2760319wme.39.2019.05.30.06.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 06:21:59 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: raj.khem@gmail.com
Date: Thu, 30 May 2019 15:21:48 +0200
Message-Id: <20190530132148.66500-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, bunk@stusta.de,
	openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Thu, 30 May 2019 13:21:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 706a55e11..741142c50 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
-PV = "3.2+git${SRCPV}"
+SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
+PV = "3.4"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


