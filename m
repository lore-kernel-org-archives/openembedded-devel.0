Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id F3CA96D666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 18:08:00 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id c17so5285903lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 11:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rVV+HW7w+QGc9EWjzvZ6lronh4BcdjWXi9ibCqfxuJY=;
	b=2En4sM0occCdjToBPzRLuZCfhodKERrTb4PLa6C8iw+D8LwNJ4KqARodoS1eXCqsVC
	FAn6WJj7EGXIwZD43q+Co89J/lD/1uGJKF9MDxHyKQQw5ei6l61Wa778a1Ss550D+4e5
	OSPiE/7R0nMi98w1LDsVL7Kj/KTIRKZCNwboPg9VD6jdbqwIS92wjmXZ0j0nfQHWwRnP
	13MwSak7zNXr3PxyzPUr7Uz/bE2Vx/0yMNP15LFbhSRB3XtziGzpDx7Pva3V115Alwpc
	26YjptRSj/s8BdnVb9lZt6I5063Ox3ulLgltqt10IP4vBsQm7Jg2VKfV8yLo75sM5P+o
	D18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rVV+HW7w+QGc9EWjzvZ6lronh4BcdjWXi9ibCqfxuJY=;
	b=KWMAyD14OsxlICG0h3URz3+yDJFWR5TZkc4HxZCoiRMXaqfH8tVCo9MsfEHyDoz/3h
	wtMFjqKgnUySnroShQqTJuUPer4O3gJn8DBjNbuPt1UNwK2S67g64luVIsUGh7L331cZ
	BIT5lwXeFeKDufty5cUBnyugf+HDJllsH0j9Fpd9TzC0H3YxQYagrnA+I16bUI4/J9zl
	8xyqNRT4U3yJ4W2r6MQx0omDPLyke0SemLGcPnspkB3HVyHqveN0OXYB6fMS7zp0Azqj
	/GjLNyagb+PItArV65ewEkIU28Mnei5mvz1BBwGxYcuSO7P18nkNllmfdsJ3BZ1wyqc9
	Xufg==
X-Gm-Message-State: APjAAAX8NdYV2NxXweUC78+uThkV6TFzcMl8C+XR/LKmzWOCu/Gaw0ip
	6QfuFuGkQxVCG+i6pHxLXKvI2t/Mo7Q=
X-Google-Smtp-Source: APXvYqzMB4kFto0t0fLXimEwvtTFct0VcLOEO8nHcABLH39qDU6BaWJF0ckqqqpkwQa2yRj64H7Bpw==
X-Received: by 2002:a19:4acf:: with SMTP id x198mr17447232lfa.7.1557857280958; 
	Tue, 14 May 2019 11:08:00 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	123sm4575418lfb.81.2019.05.14.11.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 11:08:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 May 2019 20:07:58 +0200
Message-Id: <20190514180758.21446-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] znc: update to 1.7.3
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
X-List-Received-Date: Tue, 14 May 2019 18:08:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-irc/znc/{znc_git.bb => znc_1.7.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-irc/znc/{znc_git.bb => znc_1.7.3.bb} (93%)

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_1.7.3.bb
similarity index 93%
rename from meta-networking/recipes-irc/znc/znc_git.bb
rename to meta-networking/recipes-irc/znc/znc_1.7.3.bb
index 728ef8746..b7d46af6f 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.7.3.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl zlib icu"
 
-PV = "1.7.1"
-
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "c426898b3a1b899dfe8a8b2a3eeb4b18d8be1bf2"
+SRCREV_znc = "be1b6bcd4cafbc57ebc298d89a5402ae7df55a8a"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
-- 
2.17.1


