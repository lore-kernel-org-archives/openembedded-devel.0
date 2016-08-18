Return-Path: <fahad.usman@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7227B6FFEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:06:54 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id j12so1389921ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=TX3qdOfm3+wAWuM9tCvtqSPZS/RGKTkZVKuQFiAnWgU=;
	b=ONT48H31yO+eQcUkfeMeCSfDz9Lk1pX1WgOPF3SmcBwbGHFVcZWAMefEHZStzkdTeb
	i/wSPwIW0CdM8+dBhBJ1C+ghmOo/LkcVUu1FTFnG405jV8d3yiemn+RzxGoHI2olKjZd
	xIv15FDhsy/E8b//DfDeWVMidATZrNtnFxiUN0gyG065ZHMaaVc8WHYSYUeeCtHu6688
	OX16hGqCeqohYkoNjxqQ3uU9TmvnAxE2DTVtmYGzoyenWqLTgk8GXeUsET5WRxWgKWSD
	EGe6uTqh0raue+6ycakDvi18Y4+HYbFk1+Xz8S445a07MXuV3kklmHo+XqRYrRA7IcbO
	WgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=TX3qdOfm3+wAWuM9tCvtqSPZS/RGKTkZVKuQFiAnWgU=;
	b=SW8TH4dx+VtonXDV/GcUjjYRKs6zr0XwDwJmRKqWhigCKxJg9jr9hiH+pEupX5W29T
	rZg/vno/sGHldd9qGMTXhX/17cKHxH+k7wq8LkiNFXsc/Ednm0+IRfH5dssyyo31DYmk
	eK5EdhiqBytc7+KIQUhuYHLEprciv55X1uVTjqU4kj1EkioXOMjn9yCipTGrIQDWSY5d
	NmoXAtAMHzn7+7WVB4p5Cm0SIUKch2AFw0uO6I1w24tse9D8SsCZHAcK6+PzyvSfaRhw
	gMT6KSeLQJm+CVrWjK8ZMqMCruAzNqmiOHZLSWqumN6SzSpDTn2AlFE7Vu2r/wgbFLFv
	G1JA==
X-Gm-Message-State: AEkoout/JM6kQzatz5pN2kCX/YbwqclE2hBm7qI0ZJiWAG7qoYl5JrXGq8+eqjYfUD2CjA==
X-Received: by 10.129.84.212 with SMTP id i203mr1609550ywb.201.1471525615334; 
	Thu, 18 Aug 2016 06:06:55 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	s126sm876816yws.13.2016.08.18.06.06.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 06:06:53 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2016 18:05:56 +0500
Message-Id: <1471525556-47918-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH] testfloat: Fix No GNU_HASH in the elf binary warnings
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
X-List-Received-Date: Thu, 18 Aug 2016 13:06:55 -0000

These warnings are observed when testfloat is built with certain
external toolchains.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta-oe/recipes-extended/testfloat/testfloat_3a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
index 28e9677..bb6e2ae 100644
--- a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
+++ b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
@@ -20,6 +20,8 @@ SRC_URI[SoftFloat.sha256sum] = "946fd23180559d60eb6683dda1cf8b142f5426dedfefb97b
 
 S = "${WORKDIR}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile(){
     oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
     oe_runmake -C TestFloat-${PV}/build/Linux-Cross-Compile/
-- 
2.8.1


