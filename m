Return-Path: <paolo.valente@linaro.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1603D7D43C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 16:15:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v14so21224097wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S9zua6ErlzDPYlx+3tP6zkPmmxDvkgDWrh1SB1e943U=;
	b=San61k3aAF6ARasD6q3qStVyXmBC3AvBK5vSNUIvCfejkQ4W5INPi8S1fyF3KeAkXa
	bjyYKaDmnT6+1jCvwT4PBZGnU3NsROHpKLflnV3SMDyobzOwN5uZHFb/t4oQBKHNq/VP
	ryQhfEQRPKA8+stLR//ubX3JYa+fwN+6GVntkK700/s6obuuG5nBlJWgjMOm7CyZ4rFM
	1iYw0pRI7XPQpWI0l22CcpC3T3/e3ZArGYmyVLadxweWpVat6ulv5KBM3PhpVPGQ+Pc9
	v/140MNkXR0iNvkD6jbSn66DRMHS/bhvv56WkutJHw0yC6mc1TcsucPbC2gHBnMRh+L1
	ddVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S9zua6ErlzDPYlx+3tP6zkPmmxDvkgDWrh1SB1e943U=;
	b=GNiz8eEmFlWGXg+48MLfmGsmYz4bUPH69W4IT0tExj7nzi2ceve0Do+Rq9RTEdi+AV
	2Ed4sscOWUXe8zRihGOV2mI4aIZpqDY6fIX87KJtqGG/ppOsrRFg8mHWQ3+ES8sqNXKT
	DwYjWc95cvYJ5nBnY9oFgbOr8CFMdjrjlOGeMIpC9HjqIVjid723TuYl4xnZ3Nkv1IFy
	Sr3OF//JKvddsnOjd4YAc30MzmxtCO8B1156XAdbTZ1KD09p1D6GRZXuL/h3cvImgw4P
	bX3FUXWyoYHm4mKbLYEpNfUYfH/A69/uKErgrMm+9QtFFtIvO9hDpjLKC2unLBjoM4ft
	C8cQ==
X-Gm-Message-State: APjAAAXUTK9xTFcSfe2xdJ1OkBPHsd0pfnLj9Cwdkci7Py5uKFvyi2ev
	yp/4Rbvra0C7voYHN1qhiTp/Bi8qL2Y=
X-Google-Smtp-Source: APXvYqwFTl7wfA1kO1WCSLaOut+0dqRePUu9P9Et8WAGh6tzJATz+wVyiQWMwYgThqNB1DE79OsXCA==
X-Received: by 2002:a1c:1a53:: with SMTP id a80mr22902420wma.15.1555344932499; 
	Mon, 15 Apr 2019 09:15:32 -0700 (PDT)
Received: from localhost.localdomain ([37.160.110.140])
	by smtp.gmail.com with ESMTPSA id
	o20sm17167862wmh.21.2019.04.15.09.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 09:15:31 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2019 18:13:26 +0200
Message-Id: <20190415161326.5464-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] s-suite: push SRCREV to version 3.2
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
X-List-Received-Date: Mon, 15 Apr 2019 16:15:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 47d21d36c..78d299e3b 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "d05006865f68829fa7603bdb92bd51649f5ba1b6"
+SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
 PV = "0.0+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
-- 
2.20.1


