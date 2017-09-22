Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id F15B178357
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f84so3253629pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TBypkqbfEVfqqyRLwlq/Hhn68r67VdrgBIRD0dQpRF4=;
	b=uRiRLl1i8H1ntN3V4uo4/GH+Dn1aFXwEaW8kTr7Hk/0gb0VY/SRmggX0lxemZwfFdR
	qsRtPBFg0RiSGKUF9Rf8syEWJbMQX/LK5L3SQvi6eyEQPklnEQiDYI1G7LgItA+hsvQF
	rHL8T1dAjuUe3TbsyF/g/tffOuCbEYug6cVUs2WiaQ5m0FkB3tH/+L4BJPQ5y7RaBFkx
	K9R+v226zT+9s8Ka2FUAjrJgvxWraki8BUy4rwGw8OP1Shws4OiwpckNN/uuWf8XUHxT
	xBBF2ib2h9VrNVqgymUesKFAPFQ5okYXGeMisxho7w+y5nAUzolS3AC3TaHLNzyPhIXp
	ic1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TBypkqbfEVfqqyRLwlq/Hhn68r67VdrgBIRD0dQpRF4=;
	b=fgD1MJV7hq8sRfXLbDrK3Bwt9+NrRCX8Le+B0GbEGFw72BDF7MRloOiPWizp7tJdov
	eUbxnwWKTPfAOa24vK0bgq1hPVq+Pi5rUt5akQLxMX+Z/anwfe8VbAi8Q8bQmhWwi87H
	eA/ZMmM5OPNnvUp8j5sR22s8wESsvfB3ZChPpisE8xek+yX7cbIlSxs/u9vbRrtKDtmR
	qRLxYj3b86RH35I7HdzGNIrchFlI2ZGj+6ezRFSprrZKQiYOnS4qx74Ae8guJtqJDiWY
	lBCrnV8lAIxKdFYxlSVSydW3X0ZCxiNkkU4vNje0aOrYYKEe8gmAktVHzDFVNOwHTQKt
	+tdA==
X-Gm-Message-State: AHPjjUitTcqhrkDQU2h8hl5hRpcbdk45Zwd5HRlWbhCQbW/O6BQh+svC
	jyGsruD13GuZzljhAJjQBM4hzw==
X-Google-Smtp-Source: AOwi7QDBHMwbbQQFfk9JJMREvfDVcU7Hsr6hE+CcJgqkAi7ioIHC9gFghMe0weUoXAjs2ZM7LMxUew==
X-Received: by 10.84.134.164 with SMTP id 33mr1952146plh.323.1506050610458;
	Thu, 21 Sep 2017 20:23:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:14 -0700
Message-Id: <20170922032316.18616-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] nbench-byte: Update SRC_URI to fossies.org
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:29 -0000

Current SRC_URI responds with 404

Fix
WARNING: nbench-byte-2.2.3-r0 do_fetch: Failed to fetch URL http://www.tux.org/~mayer/linux/nbench-byte-2.2.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 56272d985..da2cb4b32 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -1,3 +1,4 @@
+SUMMARY = "A CPU benchmark utility"
 DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
 designed to expose the capabilities of a system's CPU, FPU, \
 and memory system."
@@ -6,7 +7,7 @@ LICENSE = "nbench-byte"
 LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
 SECTION = "console/utils"
 
-SRC_URI = "http://www.tux.org/~mayer/linux/${BP}.tar.gz \
+SRC_URI = "https://fossies.org/linux/misc/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch"
 
-- 
2.14.1


