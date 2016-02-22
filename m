Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 991B0731A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:06 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g62so162851211wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L26eb4tP5MSVDPSczEaQEoTAMnvfmy9HpQtynEebAK8=;
	b=CMPq/ZLuMp8uEjV1OIUOY40zzWFXQubd91AfVMLa+MStPCHlCNSXsPucFCrjMV1Q6Y
	/w/TECJbgPxr/S8mkRB/uMEn1ZaxgNZIXaWF4f+V83HYy0+mKPcANvfGZhC1Nj3zmUHF
	i8t6Sh+QTBTC3UQkfKO/ysCn3rGALRkiCCUY1AaYz+HdOJABLs/Um01X0QMiiH5WncDT
	yckmbypVfdK1DRoBQiBakFd1NyP6f51L1cjvE8oFc8JPl5KtsZSfLHbWjVql6MJGbdC2
	72iOH0YNtzqcz3ww8Y9adyxljeNk44rnIDXca7b8q0DoZvBfkGwaPq/gAbRFZhr/Qw1b
	cUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L26eb4tP5MSVDPSczEaQEoTAMnvfmy9HpQtynEebAK8=;
	b=BS7rRe5RmrPUm4oMUKSYoGG62vhI9o6JosYwvtVlcABpD1fer9jR4S0zS6aMGr9z8K
	pZausETdBHjo/iuvRAu6bdE2A5DZ5E6uN4KFdoro8mrS458VfR+ustVPVAYwM0UEjlIi
	to5vnnAUO86D0ka/R3XsnMKOHpIgXjqYUAR9Sb5LVWV3BJrmexLrY12ix0nXXX1hcWsy
	0F8GQCsI3U2StwquV5BH9KPY6edUSUKQ6Amnbc1CpjVYzeYkmLgXisEK4DuJOnYKIBfN
	8IMud8ZhUfmBZiy5ku3x+dvnyURJVJDQfqHu5HC/dJ4IhdXXqRM43Yg+WLgns6eqMw8E
	Db1g==
X-Gm-Message-State: AG10YOQHdJz3CZLGr0Zi2DtPKGhNcOP4iat47sLZmoLuHUtO2lhoplDuwoN92COFYhmpJA==
X-Received: by 10.194.174.73 with SMTP id bq9mr27575137wjc.145.1456146547248; 
	Mon, 22 Feb 2016 05:09:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l132sm21032722wmf.7.2016.02.22.05.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:48 +0100
Message-Id: <1456146596-6976-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 02/10] log4cpp: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
index a543044..9bd8ac9 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
@@ -19,3 +19,6 @@ EXTRA_OECONF = "\
     --enable-latex-docs=no \
     LDFLAGS=-lpthread \
 "
+
+# http://errors.yoctoproject.org/Errors/Details/35139/
+PNBLACKLIST[log4cpp] ?= "BROKEN: QA Issue: log4cpp.pc failed sanity test (tmpdir)"
-- 
2.7.1


