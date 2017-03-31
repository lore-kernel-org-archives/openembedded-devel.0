Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4079477E59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:16 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 21so76222735pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LxSRdZAUXX2oZJZKBftehABRCC7pVyLUHtNF/s41Xwo=;
	b=cvUWl3R+mdAHSxNfAPo74wwoQrxQ3EpVdFGBqIAvm92vc3BlANx58m2HSMEjKiD0NH
	dzy+O00dPlDDr8a1O/6UDZe6XI9ia75W9woejeqZ18BYLlQU4gtgRtmqFTxNQUW3UKMV
	/m8yuG2isWk3c7ep1W0JYMEogkiF6aJOOCLhUj74ODeoQ637Tx+Au+xt5Zz6GbWzdfnQ
	0L1ypyaD6bk9L+bg4nTn+4eDs63I5YUKBzWpl9dgCYoDz64k/QkIzDfOh9oy/pJYkl27
	cgO2Uvs21gRwAnarrqPBDo4iULelKfhRT77wijLV8yC2GcEfPbpNSjjf7RqO444CTCZn
	ZOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LxSRdZAUXX2oZJZKBftehABRCC7pVyLUHtNF/s41Xwo=;
	b=aH7+0HAtgy1nOEJ9RlGFNMMON4kbzEx3BZXOn3LrWJR8qrk7FL6+We3THvjzwlzCr2
	49/JrNDuYMyGB2HicT/rR/N/2FPqx2FmvHUt4YImXP0epRA5qLBeM2GIwMQ/3hG34gAd
	835upFWjSWHwXGCDHuLaFTjLwWUkaYvSfvUiM2ooF/MzHkpjTkNF/3nWVuAsfyCp+Xz8
	/atnneSLD2RmDMCtp4lini6NHJfAh5zdBEvDfYMgq2hVm5VtpJLY8hZt5xHsNd+FCMsQ
	ehTcsNTcuqGuIEM6bo/p3N/c7KU9hxTkY2XNmlqHPnSQpnA1jX/6NaGVfoLaQmF6OITQ
	+7Ow==
X-Gm-Message-State: AFeK/H3Ki5/j3baHVSdYqglg6Foj6qdbhB8G2xi0ErfsD4K549v+1Oktq7ELgI1PQNPgOw==
X-Received: by 10.99.213.81 with SMTP id v17mr4291008pgi.130.1490978597931;
	Fri, 31 Mar 2017 09:43:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:20 -0700
Message-Id: <20170331164247.5052-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 16/43] usb-modeswitch-data: Add dep on native tcl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it has a tclsh need for executing a script during build
Fixes

| ./gen-rules.tcl
| /usr/bin/env: ‘tclsh’: No such file or directory
| make: *** [Makefile:26: 40-usb_modeswitch.rules] Error 127
| WARNING: /mnt/b/build/tmp-musl/work/all-oe-linux/usb-modeswitch-data/20170205-r0/temp/run.do_compile.30695:1 exit 1 from 'exit 1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
index 042cd383b..eeed5e275 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit allarch
 
+DEPENDS += "tcl-native"
+
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
 SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
 SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
-- 
2.12.1


