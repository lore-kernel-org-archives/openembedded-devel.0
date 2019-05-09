Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFFF77C446
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 20:29:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y2so4810856wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SMuCGO/+3Lw5WKHqfrovE6yTQlZDFm+TsujMf/TY66s=;
	b=s5y8Id0T1WKIO5XWvK67RdN25nrOW1R91rA3CZdmUIs4t9sTA+tRf9qNZXrgN24aNM
	KFwtYMl6Z3JFSFkHnfcuj4bQKLHNHrfKNM8kS6kxB9MUwIuAgH3ARd65+XVt+4f5vW0/
	lBNn3k+kCnEt9QyY/WCBl3nqsRpmDWAZkAl6G5ZCJ6FDCvi1UK3kxxXOeminaT+S2LK1
	izRgYefrtbn3Me/iUSgAa6g0PeTL0dNqcBi5kAootfO93v0qtphJnE3Zgqzv4UOsLw0d
	YeMbVZJ84je/DyNji66ChiTjbGtY9Pmwm1VbSu/M6kmzk2zAW6ZTuhzzxYFvEX/lNIzL
	ZHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SMuCGO/+3Lw5WKHqfrovE6yTQlZDFm+TsujMf/TY66s=;
	b=kfDDFs9NZjmSHEJt5NV0Zetz9HNhuJnSTkBxQ9Qul0hpZxFJnaxaDxyCkjcd+SFbCU
	kEWBfTQHqiolx53HIfXn9uVPJuvTJQzoilaMECeTMxiiX9iRPmBzoMhu1rTDjr6eEeYM
	Wnq4kE91208+/5lTL22wXQXkuEamMpMQIF2PG4hIbzh11ai0wIcyVu2A4eK3wSw1y3v0
	BSjckWPq5J8oJirt0TSIgIXtDXzUSegdFjrnhvlMiSdsVw3h/1Y6oYAwC0gn1JWet0eJ
	kvOaXuWt2gzSG7c066I9+6N0gyDJVmI1JP0UytxmKyuhkey6RXObVSGSueio3fx2BzAG
	UFxA==
X-Gm-Message-State: APjAAAWW+OO2XPGXQDuAM8NWwurOjmG3tLOcHPSRREE8isvWkqbZa6is
	sBK6cOVTEyNktC7x52PP1Ocb0y2LBO0=
X-Google-Smtp-Source: APXvYqzqmd2c0JLSflXNKp46DV9E3MwU7YZoRMsnysKrMo5Wx8sfC4vY9TVrstp4CFKHBt+tRUYWxw==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr4168083wmb.13.1557433775057; 
	Thu, 09 May 2019 13:29:35 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	v20sm1911141wmj.10.2019.05.09.13.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 13:29:34 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 22:29:14 +0200
Message-Id: <20190509202914.21757-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] cpupower: remove LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 09 May 2019 20:29:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpupower is a 'special' recipe since it does "inherit kernelsrc" ,
which essentially means that it doesn't have its own sources, but
reuse the kernel source tree, from virtual/kernel recipe. As such,
checking the license file in cpupower recipe does not seem relevant,
since it does not fetch anything (kernelsrc has "deltask do_fetch")
and the fetching is deferred to the virtual/kernel recipe.

so we are basically checking the COPYING file twice. If there was any
license issue, it would have been caught by virtual/kernel recipe
already.

Hence we remove LIC_FILES_CHKSUM like it is done for perf recipe in
OE-core in meta/recipes-kernel/perf/perf.bb.

It has the nice side effect that BSP layers can use different kernel
versions without worrying about any LICENSE checksum changes in
between kernel versions.

Reported-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 5798440e9..cf70eb2c8 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -2,7 +2,6 @@ SUMMARY = "Shows and sets processor power related values"
 DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
 saving related features of your processor."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-- 
2.20.1


