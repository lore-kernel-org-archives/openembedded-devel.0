Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBA460268
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 14:07:08 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l131so4541674lfl.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2016 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PUgLhbG7DPJ94S9yCGSKC/smujCOnjDWvZ6XnW+lbDM=;
	b=UOyzs5PkdMOBPuZ0Ui/XdvgwxAc9MplNCB+koioq/f89Ab8fYBXdTvnXlwhPjUH51R
	XuN4xGMnDUilCSKj8YsPwfIu3tddrzCc3mYO2v9Tdzxl70GIPbhy+TCiI4rAe5a75JRF
	vrOlgzF+Z8iJ4mWdmWDQM5X4G05ZrpAdxawHXn/UGbdS2Pr1/y7zG6Aeq4jvhpgsWpAZ
	fHxK5XruKhfs8OrWKmn2xDkJogXpmV2vz+vbb+76W5UMEZzvyApBe8pamVs4UKZVOrtz
	ox/s4fp69eWfQfYEM8fVn74Zl+Ydvqz1v2/W1tFIjN8Lpw9W7JY3nwDi8JyHM8v3vF9O
	QurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PUgLhbG7DPJ94S9yCGSKC/smujCOnjDWvZ6XnW+lbDM=;
	b=KmxUxLMkAoKKP6hdW17JRYptD2jXPXv65HJdXerof9KClxOX9Ujn8AruZCX1HKJFYs
	8Tgx26tbEwG49xdX/c87q/czyTavCoRHoFqcGqIZagcpp9orbbHK3dUiEwdlFEHF7BvS
	JgqDqUbUidmH0U04+VfXB4p3eAtL93aP7wxoxHivSE7jmRtT7oK+qpTKPHH5nkZIkBYk
	9lHH2Nv2nWn3h7DgV69UimVpb3r5zCOdU6h0C26c+FucuwEOjQPwD9ye5AjqXrOuqrk/
	FfRSbiEO9zUDbyHJxkHpgBeKzbMDLKtgaW4TJrEoE2v6l/1EAqQpdDNGG909ckKvc8v/
	cKYg==
X-Gm-Message-State: AA6/9RnW3qlga3/eC+UlBpQWjHvuIDGRCEa8sB1XOwph7xTJB9jxIj/Q63xOWLpDNOvTgw==
X-Received: by 10.194.16.161 with SMTP id h1mr1773824wjd.164.1476281229223;
	Wed, 12 Oct 2016 07:07:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	n5sm13133169wjv.35.2016.10.12.07.07.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Oct 2016 07:07:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2016 16:07:07 +0200
Message-Id: <20161012140707.10113-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-networking][PATCH] linux-atm: Blacklist, not compatible with default kernel version 4.8
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
X-List-Received-Date: Wed, 12 Oct 2016 14:07:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index edfb045..f87ca13 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -25,3 +25,6 @@ inherit autotools pkgconfig
 #
 
 FILES_${PN} += "/lib/firmware"
+
+# http://errors.yoctoproject.org/Errors/Details/89295/
+PNBLACKLIST[linux-atm] ?= "BROKEN: not compatible with default kernel version 4.8"
-- 
2.10.1


