Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id C602A7F00E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:41 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id y23so31987886lje.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Y0w/lvzlEeIAGsmmbSABQ5b1LQyWbgXdVLTFd7ahGcw=;
	b=rrngCQn4mM2ItRtN+cA+l3ULziPzJNYv/MkyMIZYdC3vvgNr84WcwJAgrGpFF5JVEJ
	9BsUwex+CyYWsi0gi3SMaxaIjO0avq27yZAW7Wb3nEoe1hD03hDMvwWBRCKndRkYIB4R
	9HVuYDN0qcCn9CcF+IMTr3gYe3uQIiTs4lgUX7HxP4Je1poEO9Rhl+zaA0bDDXhbWimO
	9xQrmVOiciKZKtylP5EQpUob6fVZgZ20DRCr5Frda8SjDZ+fwMnGtyGMKHucIEGRnYIv
	p3we8aGGXhO2QU6VDcP2Lc3tPoULcATzICWFpZRXMqVkCZe8hYZW96takk0GZ8+pYNBA
	74pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y0w/lvzlEeIAGsmmbSABQ5b1LQyWbgXdVLTFd7ahGcw=;
	b=HFEhSZDCNb4qD+Bw/J5jO0ZbCWR76w7HHAAime+X6xM/1spLcVFLbrq3BRSnsUpW3y
	PAoEbqVu+pOEk24QnwmjQ+1CfgjDJbV9NU1RCrN0ONpCK+A+acQMy06zynKAJs56QiqR
	XJiZ8sGjz0Jcb6a6P4SvyPCk+QaPhbde3q/7R0To8WQ/rqJVdWby8JaweC90LLL8J6mH
	nM/sRzcFuscdgK0U3ROFTq5ioqkePSES0fzFMruVsAWf4fKs94UOzmHH+CftC8ceyqu8
	Bvf6hnsZwI4wPlg/wNHVoAr04Ilk8aFvzsDFxiLVISNzvZaYSRxKVARZS0d0YlQK/ZRr
	DIow==
X-Gm-Message-State: APjAAAWl5zmzbQBtkd61kfivGpQciMBQp/DpR8hMUMWyPovdlJGCaWr9
	qa0IPNtQsdBt9X5mQshqJIvmkhQ5X38=
X-Google-Smtp-Source: APXvYqxK8RiKSzw/2BY1pWraPjZ+G1CpcUnI1WYAfditVeriqMaOstw87tp/k3hP0eqQQyF5Y0JoHA==
X-Received: by 2002:a2e:7d0d:: with SMTP id y13mr36121852ljc.191.1568590962248;
	Sun, 15 Sep 2019 16:42:42 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id 81sm8143082lje.70.2019.09.15.16.42.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:39 +0200
Message-Id: <20190915234239.13641-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] gsl: update to 2.6
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/gsl/gsl_2.5.bb | 6 ------
 meta-oe/recipes-support/gsl/gsl_2.6.bb | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_2.5.bb
 create mode 100644 meta-oe/recipes-support/gsl/gsl_2.6.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_2.5.bb b/meta-oe/recipes-support/gsl/gsl_2.5.bb
deleted file mode 100644
index 4e8541812..000000000
--- a/meta-oe/recipes-support/gsl/gsl_2.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "52fcbe147ba413d78841084cb43c95fb"
-SRC_URI[sha256sum] = "0460ad7c2542caaddc6729762952d345374784100223995eb14d614861f2258d"
diff --git a/meta-oe/recipes-support/gsl/gsl_2.6.bb b/meta-oe/recipes-support/gsl/gsl_2.6.bb
new file mode 100644
index 000000000..367a08321
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_2.6.bb
@@ -0,0 +1,5 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+SRC_URI[md5sum] = "bda73a3dd5ff2f30b5956764399db6e7"
+SRC_URI[sha256sum] = "b782339fc7a38fe17689cb39966c4d821236c28018b6593ddb6fd59ee40786a8"
-- 
2.17.1


