Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id F3243796E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:23 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x17-v6so5625489pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+BvYWPtwcXFUYk4XyoHyc2L0Pw8tvanPNsLPMSqzpts=;
	b=H9XyILPBwT/8kyhvb+HDIuuPkLCHKxMAUOnPkAR/wc7YCOMkisFJmCgBqBmZK1F6Uu
	zwGW7z2vmjheCTrXdHRgHbg1XTgKDX/QGOu9VBdgbaGrmNW9TjMMa+3CCpT2cm9Vi/cy
	ZvIOCerxcyfVuZMWzEfvq/Z6xRuzoDT2bobcnwVSrZ0tpHRjdsoSRGR8P2p072WIlBGh
	7GtUI73IRBRBV2Bjzb5+wxOvLd9y9MEgJg0ox16Y657tPK/1AaLerAR3JTgwHBzvaYwH
	WsFOSkUg0gFG7iAdfuh7AuNKMgMpy6q6DfgICIjgF64fwnz5Ew1xcYwTaQA2y6+A2j3T
	uV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+BvYWPtwcXFUYk4XyoHyc2L0Pw8tvanPNsLPMSqzpts=;
	b=awO82sQ11jAZpZedJ35Xu7V36kgm3ZCIngytDjrwyS/MCl784CxOHCDf62j1z5TaP4
	kbXJLtkpPoEzy4tL44/h+l3AqJ9jVXWrSwqRann2Fi6KOCSDEpz5Kc7BrjB1a+qf2xKz
	+QfWjLn9hxFmHvxqmuPi9cYMyeHdj2yWwY2toxUxZbtyp8NoRscoTht0IglNbnAUmOML
	ynnIUUCxFwlOLgoMYaPiLLTxOMv5Vu3Nq8+CPIThlY5TCOAV+4/yjaCnTa034BfVS7lf
	DRq5E+1ftpe+Cc18o6tDBaxpBhSBf3qzVdM8SQh0ByGt1QJf0TS1VYdSVttG2TAh0FB6
	zT/A==
X-Gm-Message-State: APzg51DqV5yqDmeMnZEbuDIFjj2UVAExWuJ2BlqqtO7gWYykMOCcfPzU
	jaRbtk1du6FiUnd4Za1m9IfIQYQ1
X-Google-Smtp-Source: ANB0VdaEEWD/933hZCpCCqJCEK6CLi+aaY4ZmRFnVzt6R3Kg16oaD/h6cxZUlL/IqJl6TWm+6agYuA==
X-Received: by 2002:a65:49cc:: with SMTP id
	t12-v6mr3901213pgs.27.1536254544742; 
	Thu, 06 Sep 2018 10:22:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:21:58 -0700
Message-Id: <20180906172210.42551-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/17] uftp: Upgrade to 4.9.8
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:24 -0000

Fixes build with OpenSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/uftp/{uftp_4.9.3.bb => uftp_4.9.8.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.3.bb => uftp_4.9.8.bb} (73%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb b/meta-networking/recipes-support/uftp/uftp_4.9.8.bb
similarity index 73%
rename from meta-networking/recipes-support/uftp/uftp_4.9.3.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.8.bb
index 1166f9a8db..0bbdd6b1d1 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.8.bb
@@ -6,8 +6,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "231d6ba7820d89a712fe7d727ab0f8e6"
-SRC_URI[sha256sum] = "9e9215af0315257c6cc4f40fbc6161057e861be1fff10a38a5564f699e99c78f"
+SRC_URI[md5sum] = "f7a5affd3000b5aafbb13df49719b6c0"
+SRC_URI[sha256sum] = "e98c6318e497124d777ca71eae752d213207c35de9f782c8bcaaf82ece20e599"
 
 DEPENDS = "openssl"
 
-- 
2.18.0


