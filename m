Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDAA174197
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so627702wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7tpfPymehV4E6GBxtxdmB0TczFtmheVgsLmusMS1aEg=;
	b=LG+b4o5sp8XOVHztTQ5KunRiq4aYAW9puwLO0mXu2yRTOS5PL/+Z+dTnn8NW2TGDv1
	hTcA4nZVj3qfQvE2jAEjL1nsepyL/KN5jrhSD2JDZ1o4QR6q6JKMJ9hToEoJzBm9MSSs
	MjZKQxrRwaIF7Dzh97YRABJ//IkIyYmCdcIhzpJIGC/tcz6N1dv5HHC8IKnJ1nGGJQoa
	KAlE9YXWW4azBprcYQJTbzVrIDhBa8mC6gctUzhj69N9oG+se5GIbbf/j2I9+ys7TjE4
	g61NT+XgfCFyKCTuS/3ClQi83Hrk32G9XLrJSNqwpoE2nd2qhz9B+fhVx5dTkHO50I0Z
	b4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7tpfPymehV4E6GBxtxdmB0TczFtmheVgsLmusMS1aEg=;
	b=QxCCFdFNwleXdoHSpmublIn9J2IHbSLXtFO40uanpe0MA/HkboKoDNYzGGvxeDPnkO
	K23nlWG/NGydlV8Qrcg1mLEMjvRDY03M3ZeCcIpqPti/ybhyDr6HESiUpV2ttjXU7kCN
	TeCeqDDw/WMOKDe1TlZsUkvaUuwFuEobRrxEHyTdbOqw9/ze1lg7uQU/j8mFwGJHhCuY
	0V3aBaZZqOovNUc7nL+rYu6eC10QgzNWv7N/SkXhWLiGSczzvAj7EJSRf1FAnvE6vs3E
	uo1+To+9oRFeZEJVW7jkMXHDq3uCy15hkRLUk1yZnoqMApe664d190pHktn7NIoiLQTJ
	S+lg==
X-Gm-Message-State: AMke39l9EGaXa4uzpp5CHGn5kqiwdUIgClpFurv3llibhmiavCDLAMznoz4RroVh4pMJzQ==
X-Received: by 10.28.92.83 with SMTP id q80mr502903wmb.108.1487025191004;
	Mon, 13 Feb 2017 14:33:11 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:10 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:42 +0100
Message-Id: <1487025163-21628-9-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 8/9] klibc-utils_2.0.4: remove blacklisting
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:11 -0000

Recipe does build with the pending changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
index ebf43bd..06e71cb 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
@@ -12,5 +12,3 @@ require klibc-utils.inc
 require klibc.inc
 
 DEPENDS = "klibc"
-
-PNBLACKLIST[klibc-utils] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130679/"
-- 
2.7.4


