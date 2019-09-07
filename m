Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 720287F323
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 17:31:24 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y5so3843034pfo.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oGTmDObQ5XCjRNCt+7CMsC5OFhZRzoiOGBH8OCdG0I8=;
	b=e7cLyfIAQXkaha4ClnoaTrXb6wfVseEniG4lW1FarYMbCux3vyY1pe8t+uFZDDv8ow
	O1rz4kcpbdWYw0ziu9tTu+0YoJXMrqYSOLjpwHYRxdhJkNdCL952jep5zafWwhiOwrVc
	fePZtX7E8OesTPciYGN2yGlsU0ZDqSoPI9k4oPFdvlMe6HhFjIQysXvHlTH270wn+HA4
	cx3ULBWRCOqGj25HrL52wtI9KfFgoTE4rMAnPPHVKsNKhIQcOAzf66oqvHQLLiQkTT94
	UUZ6HU6ESgesOHZL99anb7X/nPjYraIGNZgqFwQHjZhoAHrfDIxZw+JG3/C6HoEpW8a+
	XPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oGTmDObQ5XCjRNCt+7CMsC5OFhZRzoiOGBH8OCdG0I8=;
	b=OP4oyMqJ4mrrCN2VGVgJD3kmidoKmJOTuqKQh1U/3aG5XLr0AjN5dEd3laSmU5gGI3
	lihoNJNpwLSv+aVVJx6fmFn28Q9b9oL4mqrmfd87HWoSFWDiAvU47Q6noHDaLEDKWI9P
	pEf/V/T9lWYpZv8e1h5OPCSDLg+Z85hhqVVafczCnaheaoSStCTKek7u56lF8ifyGIyi
	Ov20weFuCGcRvOHjcvtCQhoMzSQeqVvViMVclCb/iLkvOmk4hvxEDB3ZjnGagwlf49W8
	yalFLApsvzvJ8cbhcXmiROFf1Yfn/nQgECuRbEjLKGl0pQiQZfUx60R5/twzsQdQDB0Q
	2Qzg==
X-Gm-Message-State: APjAAAVTsSwZMwTDY7ie8+1ptO/33BkWdgC2nB1D5N6mZBZpk6nJ0sEE
	+CKK5/L8IdtiY9n1P5WDzIqglPxvUo8=
X-Google-Smtp-Source: APXvYqy4ZjaZY5G8LHvz7iWH5FE0gd+P/YiFPakagsNTg24l1TdPCg7OVmz1TeOvlmhkMj6uyVWl4Q==
X-Received: by 2002:aa7:8edd:: with SMTP id b29mr17854517pfr.138.1567877484268;
	Sat, 07 Sep 2019 10:31:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d10sm10812474pfh.8.2019.09.07.10.31.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 10:31:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 10:31:00 -0700
Message-Id: <20190907173102.35561-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [nodejs][PATCH 1/3] nodejs: Mark incompatible with risc-v
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
X-List-Received-Date: Sat, 07 Sep 2019 17:31:24 -0000
Content-Transfer-Encoding: 8bit

Arch is not yet supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
index 30724d41a1..a978eebe47 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
@@ -12,6 +12,9 @@ COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
-- 
2.23.0


