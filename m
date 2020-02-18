Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D06D760D1F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 21:08:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so25648477wrx.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ipbMcAwHbU/6BMVDc2vfW4sQYe42z8fHsDXoVedxWFI=;
	b=Cpuxq1YcnsZhpPVMX9NNaxs2DPSPBP8Fg3RmZmKdbnPBGTksU2+cvksKFqYLNjox30
	zhPxh/5vYJsPJHDa7GL0BqRnotxnGfIaUVFFORgguxzo17V1758hZg3MJO5gLCkmyBeX
	CZjXmwfcFrz/QPX5eO1IFCTG0doNWnIeBgzMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ipbMcAwHbU/6BMVDc2vfW4sQYe42z8fHsDXoVedxWFI=;
	b=WVXnZjzirR8g8i433/oBEGXzT+Ald7VCICiL6WXK24GWhKrL/ZZ8pE5v0CroYT+4C9
	32AYnYo+M4fC/27RKKpeodi5+cDQmVGx0B+aac3ODEL1HqHpR3JT8nRTWzVrYPzbBMVg
	1BSdzcgVBicYYsqBqLBXeU+5t68NAILUuFv20nyPwCTMSNEKpiXf7VhYCOW2nhmHow+t
	Oa3Ca08fpIOIsNgnNv/XKUfLKGmXirDBQLvIAmHkcRN38gBUgWETgW9lvykd6cDSGbVb
	CxSJr5Xp5sxkPHgl+cDmnb/oKrFT8xhOBEX1yXg4akO+mR5/Vbmn9lZIbzuHOQrzigCJ
	UoBg==
X-Gm-Message-State: APjAAAUoOeApT+6x0wMj3HHAOGvdHi0cl9FrEH7ZCyUYaAYYyPLuEvOS
	VdGHRkBgdynswp5oPZgcIqVJyh3XQl1+ekerx2MSX2QFsfuzAxhXjrFDPUElLXTINnyitIgLAxj
	EKRnrE4jcOV6HjAjGMBZrp4XUjxKYW2089VtlhSwOcU6yRBUWi62yUjGaW8lZuTmy+7vyeRs+7z
	aebt09SGQXgDP3bDwjWFUlZbqbyMnN+9g=
X-Google-Smtp-Source: APXvYqxRG7au3+CnK5KNriZKfav1GBbfQTJUaQN08cFAHbpkEl88fdMLcJoqUxFzfEui1N1t6TmCXw==
X-Received: by 2002:adf:a19c:: with SMTP id u28mr30797835wru.221.1582060092066;
	Tue, 18 Feb 2020 13:08:12 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id 2sm7491465wrq.31.2020.02.18.13.08.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 13:08:11 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 13:07:51 -0800
Message-Id: <20200218210751.8538-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe] [PATCH v2 1/1] fio: remove disabling of compiler optimizations
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
X-List-Received-Date: Tue, 18 Feb 2020 21:08:12 -0000

Disabling compiler optimizations affects fio performance by 25-30% so
remove this from EXTRA_OECONF. Disabling of optimizations should be
machine specific if there are bugs in the code instead of the default.

Optimizations were removed in this commit:
https://git.openembedded.org/meta-openembedded/commit/?id=739349da0826221f98648b64b693f9ae33e7d4ea

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.18.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.18.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
index b6484290f..2c461b8c5 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.18.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
@@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
 DISABLE_STATIC = ""
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
-EXTRA_OECONF = "--disable-optimizations"
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
-- 
2.17.1


