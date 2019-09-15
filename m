Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 954E67ED81
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:43:30 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id e17so31963175ljf.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yUwnYtf9DLnHFW90hHmQRc86y0kxBRBo5/SleoxdyJ8=;
	b=MulFStqQ5uBPLVKVg2rlxjTaKmtwbMn+J7gq6EmrD7S2Lc+xlfwiMoi6ouVN6W4Skf
	S4pFKBf1sxSiNh0gpAkjoebLq1WJCE12dPIY39a9cJab/znXdDjclTLyeXPw3I+9unoH
	9TeR9hzcx/sc82yrebd7gcOnEGQvzXHlEGMb9XyngTLGC0bXxcqnbSEPKuJs5R76PWfn
	k3TBH4GB0CynObZqdbCS8BVB9pdzMCdVVY5aAhv34zyU1tHjqX9JOHSvrJvv7yaZEdnz
	qPAs4z0K2DpfyBqCU7d9+aDEdLQU3egEmyG2huToEeLepxkm7hcxgqjSeh3uKQDydjEg
	Y+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yUwnYtf9DLnHFW90hHmQRc86y0kxBRBo5/SleoxdyJ8=;
	b=A6VfDJJk4pLZymLhK4COQau674cXwn89AX89BCCnCB+wYJuOSoIts7hPR8C7YG5Bg+
	5qqpdwbiABegcToYlvivVP7we2UGBOhpPp47Hl/6guvETEhIsDqxxcfCrFy4hQStKvtF
	OQqwKbNVJ3OcdOvoyk0vEry6Naho2twweiKf3HEyJtMOh1BoqMOhOe7EZnEQTrb9Hd8R
	NeleACA3S2UQMTed56wAA7R8vTRtbk401ZtGg1hVMZLnM8ZEBYFqu8ZhAejiozQw3yWo
	Hidc1X522QfzUfgNY8W4z08Z68fusCsk5haaUJa1Pq7X9MzJH5ekfrwMVtfCSFWCQAb3
	36kw==
X-Gm-Message-State: APjAAAX207uZFWUKjqA5w7OJ1OmodN7orOtMRiiaMhzgE7dKggu7g/zz
	anNpxbg8/ex+UFpLM1r+Is+2FWFInzE=
X-Google-Smtp-Source: APXvYqxKjZEryTayQ0Qd8BwxQS7sC5qww7EJ4Vsraj+FdmHXTPg6Xo9Ax9WVfCKYU3Xb4ipSibFWQQ==
X-Received: by 2002:a2e:7502:: with SMTP id q2mr11476388ljc.202.1568591011106; 
	Sun, 15 Sep 2019 16:43:31 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id r8sm8577818lfm.71.2019.09.15.16.43.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:43:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:43:28 +0200
Message-Id: <20190915234328.14543-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] agent-proxy: update to 1.97
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
X-List-Received-Date: Sun, 15 Sep 2019 23:43:31 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../agent-proxy/{agent-proxy_git.bb => agent-proxy_1.97.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/agent-proxy/{agent-proxy_git.bb => agent-proxy_1.97.bb} (89%)

diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
similarity index 89%
rename from meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
rename to meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
index 8e370f962..2eb19206d 100644
--- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
@@ -8,8 +8,7 @@ SECTION = "devel"
 
 EXTRA_OEMAKE = "'CC=${CC}'"
 
-SRCREV = "e6c9d3d996bd55e7ab14dbd74deb7841e0c3a4f1"
-PV = "1.96+git${SRCPV}"
+SRCREV = "468fe4c31e6c62c9bbb328b06ba71eaf7be0b76a"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git;protocol=git \
            file://0001-Makefile-Add-LDFLAGS-variable.patch \
-- 
2.17.1


