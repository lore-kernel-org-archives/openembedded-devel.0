Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A24E360806
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:13:07 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id z6-v6so20583722wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iBpL3I4lLEDCq+6Pm4PH5SiIjwe1dWThfK6xiVJZsJE=;
	b=cksYaja7QP9rtM0CzJZGzTY7sClEd/185rJ2LyoYxKrBmnRv5j9OtkNHjY39LWnQRH
	XWlCff7nyfAh6REdPc1n4OoomF2BuD1fc+t8uJ1lXI+1cCZBbUWSx/OHtXNqLGQZ0SVn
	v3aOS/YRi7kIpJu27Q/uThBnLHfIPExBcJbLjQX+z6owrIuAcwrEy5wRDpobLVcT23zY
	Nkcg3rCOJ6CX2UJ/Nv8PQP1NhzcANb96sUkBUlSE2KGc3HSUHwQt57Xw7yeIjWLBWjhM
	dcvW6Oz0vgK+qrkQpy2JtmC7AMq+5JlPri3cgtT3kz8I+d/sm0xhYX7BMGZUDM9NwLmq
	BuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iBpL3I4lLEDCq+6Pm4PH5SiIjwe1dWThfK6xiVJZsJE=;
	b=Ts+paL0R0H5WsMaYBDOU4hXiVmnNE408lftu1T9JVDbHahFl6YjIZ4on25ZhCM2O4n
	SnhBTzhLgoWYR559AD5w+UmcvuRArEoEk1gOjkcCiXgjXNtn4otcyLv/6EJNKfHfd2OV
	QxuAA45tvqKA3GDWt59Y/V2bcrX6/zYPORWSwN24ejN5fDkfzSTtmceVj2V4vUdTKJ1W
	/ICbeMH60TeFR+6rJClFxZBoB+Vxbm4GIoz+iPLkrsT9Tw0fhviDc2Z2RL0rmIFOXsYO
	q/OlmAh4p81iFAjsEoFGbrYZeohgjZ7QJ3FLioTfLeF27RTjCvTLSmHM4k/K+tx6taTJ
	/jZQ==
X-Gm-Message-State: APt69E2Hn5KOqmlHNY1M4yPF0i07JoP7nT1EHWl7mHPxVnCaHQrccXv7
	Hm/hAlCZp+s1AUxuTMRqujX1kg==
X-Google-Smtp-Source: ADUXVKLPVYOcX0v+QqOkgXAbUODYkr9fUAkc+FjG7BU6TuIQ4nPEhhbEYhTFS4sbLQDEKpCQIEUDgg==
X-Received: by 2002:a1c:8590:: with SMTP id
	h138-v6mr1029123wmd.85.1528827188267; 
	Tue, 12 Jun 2018 11:13:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b74-v6sm1574565wmi.13.2018.06.12.11.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:13:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:12:59 +0000
Message-Id: <20180612181300.2478-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][sumo][meta-oe 1/2] Revert "libxml++: only include when x11 in DISTRO_FEATURES"
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
X-List-Received-Date: Tue, 12 Jun 2018 18:13:08 -0000

This reverts commit 44ece3daea4028e72473b6316ba3c7c54d833166.
---
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index a38315c4d5..c001c184cb 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f3
 
 DEPENDS = "libxml2 glibmm"
 
-inherit distro_features_check autotools pkgconfig ptest
+inherit autotools pkgconfig ptest
 
 do_compile_ptest() {
   oe_runmake -C examples buildtest
-- 
2.17.1


