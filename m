Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 943947C88C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:56 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i20so7619574pfo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M4LVeNZlfMNX/etHobu5kja7MzvbzBo1L3+XhLAR0zo=;
	b=OEJ8m+cmiYhjWnq1Oey1rpyfu4zUK0KJMMdHcxXqpeoqZTgoY20g6wWNmmqSGGcl80
	zNnVqbLyZBex4/yAi5/DzMOZm0eRwLgwCeYDrWm85ZluT3uWHKWvm1RCL1fg3bi7X4gs
	5pvKPbc7y4W9ao/InT0onnc3WWOBQYfNZZUZzZj/sR9jutr9An3Gx0MJhPzN7mJax7F7
	oujJvdeU2xcuM6fCXQLmpfJIgCP4l32exJg97bU4jICyhdkiVxVj6r7aNF4/AjbAvbKo
	Ij7+kAPDB/HVt53zEvXtIpgbuG7hipieaXczX0OLAgPPTAv5xsOpIVsYNQJC1NCXuG8z
	eCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M4LVeNZlfMNX/etHobu5kja7MzvbzBo1L3+XhLAR0zo=;
	b=VHZZ4SYZHKjsnF+9UnxwtZHMjLCjRJRKimnhYOGuuk6h8YybSZwf3SZS0ha6YGQ8st
	gdKo7i4qf/c/3nWlDbPhNLLV83zydfvfqz4s4pEegrJr6U4W8Tl849k7vkUem0u8DGjF
	LsyYScTCYmktgrPmk1ZQ0zd4WM+8ZpunDlsJc7DdrK/audlR90mlECcY6JYkdut5XF8G
	BzB2yj0Uu4RTwH1D1bsPraNu/7CEdjO2A8R2m/7S9ZUww5jVCIAa05RqnguhF39oQ0HA
	5OkUeMhjEwQEzlB8WTSrgH+/emg5Thdi8N3dZRzvkzbZuliO2zK2TZiJWXCBA0MujSPl
	bUxg==
X-Gm-Message-State: APjAAAUSeFVlK6641YJ9Uhdn9EotMaftfaMghtmN3uxpxPZDSWu5M4XM
	yDJ7H0sBQAkYJV+L7xUwQYRi3TFE
X-Google-Smtp-Source: APXvYqya+z6o1OFC4n+rTeQsSQxnamDw0Axwt7MtXDrSQwqDKcFzsBjWsJ9YlkLJm6U8j6cY9zAg9w==
X-Received: by 2002:a17:902:7798:: with SMTP id
	o24mr5243413pll.212.1551851157416; 
	Tue, 05 Mar 2019 21:45:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:40 -0800
Message-Id: <20190306054548.16430-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 04/12] python-greenlet: Upgrade to 0.4.15
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-greenlet.inc       | 4 ++--
 .../{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb}  | 0
 ...{python3-greenlet_0.4.14.bb => python3-greenlet_0.4.15.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.14.bb => python-greenlet_0.4.15.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.14.bb => python3-greenlet_0.4.15.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
index fcd81f6c3e..c7c656c84a 100644
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "a87b6028c3b742b210bf5973939db595"
-SRC_URI[sha256sum] = "f1cc268a15ade58d9a0c04569fe6613e19b8b0345b64453064e2c3c6d79051af"
+SRC_URI[md5sum] = "10fa304f673fc18b28fa6d8c6658cb80"
+SRC_URI[sha256sum] = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.14.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.15.bb
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.14.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.15.bb
-- 
2.21.0


