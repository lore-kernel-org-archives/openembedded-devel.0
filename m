Return-Path: <pdmorrow@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0397F7DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:45:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 8so4256872wmo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CBkGn3OYr/+Qw45eAZJbo0bnJig3GCu+i8LpnzL+MrU=;
	b=af6ZjED8QMiiFIKQaGrpdUXLpskV9SLCGAqYgzndqes/jQXjMx+y190ECIaZk3MiCO
	djVgtwANYoDEP9BdShTGrR8S31ugQCDq6hlJfP12SL7/oDQkGhfeKdeDb6xMrgyOkwTv
	hM1lgLLCWHaijoQWsVQPkC+VwSImgNCdLvQwGkeX82/HgMqzwYccF47rTHZdsf4Fmg5e
	EeMrwFzRY1PSTqYwHsUVjY3hHJmOn4IqpJYMAOmwlfnKPK36kltywyrlbp3q1QgdKg1O
	snEMlRnmIlGhVuj3z8dYqUXOXMt6epKdKi15TyUx/HFUaHStqVCHHiJO/N0dAuDgX1JH
	qbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CBkGn3OYr/+Qw45eAZJbo0bnJig3GCu+i8LpnzL+MrU=;
	b=avYyPsjBxQCEuLe1o0V7ut7yJEa3seJ7U/JNLm7FFjVtfkjr2Jy4GoqohzulX7LaDy
	DOErLWkj+ww8Qnka1EJDoZAP6O6xRQPGsWEvkb+JVLjZlXpIGfjO6BKkxdSUjZ5g0z1r
	VFbLkcpxW7K9zYBQLxZpTQdFqmsRC/cpwpt4WLJwtnTHx9imi5cdqXaHMcpLyvXP9MOZ
	bYNYnuIXCeCTbFkNh5mVwxdSNej2jhb1Ns3/GboCyDAIfdAMcBWSX0f/h2gCiF8Vc5gy
	onno7oUueeDQiKLR4ZFZ3MglwmmkQAejR7GBVFzpGiPyt4gzqQ2InqH2L8+euDIdPzLE
	W+tQ==
X-Gm-Message-State: APjAAAWsC/oUDIG1vm7P1M1jPh2Hg1JkMnJgPKy9stFUlWylrxW4MLhU
	sZQ1NL3hHJlKd5xAoMyNJ2V9B6X4ut0=
X-Google-Smtp-Source: APXvYqyzhqXRS8572NukY93QECPb9aVL5y9A2XdYneTWQWV+Vv8NaPGStZVeG9HoKQ7uUEKjThN+Vw==
X-Received: by 2002:a1c:9e10:: with SMTP id h16mr6322787wme.91.1574178349719; 
	Tue, 19 Nov 2019 07:45:49 -0800 (PST)
Received: from localhost ([88.215.3.59]) by smtp.gmail.com with ESMTPSA id
	x9sm26828831wru.32.2019.11.19.07.45.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:45:49 -0800 (PST)
From: pdmorrow@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:45:39 +0000
Message-Id: <20191119154539.22200-1-pdmorrow@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Peter Morrow <peter.morrow@microsoft.com>
Subject: [meta-networking][PATCH] chrony: install chrony-wait.service
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
X-List-Received-Date: Tue, 19 Nov 2019 15:45:49 -0000
Content-Transfer-Encoding: 8bit

From: Peter Morrow <peter.morrow@microsoft.com>

Any systemd service which needs to wait on ntp synchronization before
starting can order themselves after chrony-wait.service.  It's useful
to install this service as part of the recipe as it saves needing to
install it via a bbappend file.  Note that even if the service is
installed no start up delay is introduced unless another service
orders itself after the systemd target time-sync.target.

Signed-off-by: Peter Morrow <peter.morrow@microsoft.com>
---
 meta-networking/recipes-support/chrony/chrony_3.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/chrony/chrony_3.5.bb b/meta-networking/recipes-support/chrony/chrony_3.5.bb
index 7c6356d26..fa11c443e 100644
--- a/meta-networking/recipes-support/chrony/chrony_3.5.bb
+++ b/meta-networking/recipes-support/chrony/chrony_3.5.bb
@@ -103,6 +103,9 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${S}/examples/chronyd.service ${D}${systemd_unitdir}/system/
 
+    # systemd chronyd synchronization unit configuration file
+    install -m 0644 ${S}/examples/chrony-wait.service ${D}${systemd_unitdir}/system/
+
     # Variable data (for drift and/or rtc file)
     install -d ${D}${localstatedir}/lib/chrony
 
-- 
2.20.1


