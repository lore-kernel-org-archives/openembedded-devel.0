Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 03B3177245
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 16:24:33 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so84313327wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SLz4lrAeylzHIKg0cmwhkTR6nB7PaT3HXNojYvlXk7w=;
	b=Xrjb7ZfjcgXOKRO+626ec3eQMIX6kpqWf5Z8ehEo9YVk0M0izoOlXSB/X+ei7N7dpI
	nqvzVNDe1JQxE0rwNZ5iBhVwaoD8fQbgnR49EdzYrnIqlhikScQGetkSZLbUVVvTyVR1
	stcaX4ToVrwTV65rLx9ROXs4OXsq3vWhydGw23h8l8pgcYvDTkjqCthgpCWfN85cELak
	/oAlzkfd45xdA2YM5SIevkkQ8NjMch60JW5op3dslgdvnH8NwUfMCW4j10GDY2wTZ0Pf
	c94k1ehpMbfCxjFt2N+0XUDZvwU12AwOMDvqoEe0au7soVhpC4TrtQIIBsYs5FieUxFI
	FRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SLz4lrAeylzHIKg0cmwhkTR6nB7PaT3HXNojYvlXk7w=;
	b=ljWb0LFU/h7igdRyF/Zpchasukefxp39UmBCePIqStjOa3/RFJ8PpidorLyt2P3b+i
	aVu8YL7H3k2fH+ThuEBtq9jXx4YAwsHwU+voZY3gl8UtZ6zCu3nvRgCsJ9bruHOY7I9D
	z8RjngUB2PXo5+45bGernGaxq51zdM9X+SHyXfeF3KNn60hJJV7dP8BIZaepNQqLu+I7
	KxM2ViwlEJmxhRSzyNVU+xsTELoMwP6hN6skvMpnKsTDdNPc1LUwEC3xEx10xJFhXKNa
	ynNM6EyMtt5DJ9AMpaBkswqL41/Z8GDIaRyMTKR31/R/r0U3SU+u1C6UvnnQphTVMsmW
	XF5g==
X-Gm-Message-State: AG10YORict+fmoeDdN5qfSfnxO1dCOX98ArbhEChWTqLL3UUR5o4lnXr8/SyE/QcYMc66Q==
X-Received: by 10.194.87.1 with SMTP id t1mr13852297wjz.170.1455899074110;
	Fri, 19 Feb 2016 08:24:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e14sm8320160wmi.21.2016.02.19.08.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 08:24:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:25:03 +0100
Message-Id: <1455899103-26546-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-systemd] avahi: rename the bbappend to apply for all versions
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
X-List-Received-Date: Fri, 19 Feb 2016 16:24:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../avahi/{avahi_0.6.31.bbappend => avahi_%.bbappend}                     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/avahi/{avahi_0.6.31.bbappend => avahi_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/avahi/avahi_%.bbappend
-- 
2.7.1


