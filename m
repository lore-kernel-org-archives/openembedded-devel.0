Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB85719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so448594pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K1gEc/jtD4NJ85uOxfWuR1WlXOHFobDtEKQsmLHSQPY=;
	b=xr7j5A74T6DWWqIB2hAPaWFNm7eeTwsHIDXZBOMoIXmayUIlJxgDhTBP7r3CJ5eHwG
	0kfsqcYjkq9luD9RZmAIaICIFK84K61s4nr3xhVaosFY1qT6H4+esQsNmX4dyXuSTJM7
	fgTTTqGYrXDCdfctv7VCZuRVA2uDAl1i3kcASH6H8mgFehk9vm6zGMPwJto2FeoJKiuj
	+ZrkHFyMTQigWP4fSxrQ8o8DcjuZtVyD2n8/RG9jG5kW9aT6gkBy+UUAXjcgUQ5Bh2QZ
	E3bSmndodwk63io5C41BzXnByzWVk6qHaZ4nXdyVjuXgXdvwC2CqCoixJzqX+wurnxTF
	9tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K1gEc/jtD4NJ85uOxfWuR1WlXOHFobDtEKQsmLHSQPY=;
	b=m72tm4OzldpT1ps5s9JWlZEJ98PId9EZPD201lOarXfDxmAU7nzCRGGY6wUb4/ayJx
	NCvS9PW95Gjq7+aMZF35q4sr/HmQ7uNPr4faOuuxIUk9PI9ULipi8ekzwmMakiPBK+LW
	5tAabWRJ1NSOR0j03wQvUCc80Dov/MF9wWa0rwPb60jTYJIGy/fNF1YRXAQeSp88Imp5
	MUDuPq01LBXGvcmr89OIeLtTutqlDo9hQUnag4rRLJOrKA/bE/R7POg59N72Knv5P+AD
	B1iA0DoEpp2Jbn+WOlDxVNKmqRC5zGhJvy2jXqWzd/VxkIAiFhr1JAnojF2VhREx146j
	JGtw==
X-Gm-Message-State: AKaTC02u4gSKmlnOUahTXqQJwHq+9ebygDLmSSoO3mhOVYg6xVhWOFWTrnPQwDp3m6i6ag==
X-Received: by 10.84.174.67 with SMTP id q61mr4486310plb.93.1479892940429;
	Wed, 23 Nov 2016 01:22:20 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:25 -0800
Message-Id: <20161123092209.23699-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/49] meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 93f35e2..2559948 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -9,3 +9,6 @@ SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-s3c64xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-s3c24xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libcec = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libmodplug = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libcdio = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


