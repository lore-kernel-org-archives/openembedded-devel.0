Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id D14FE77215
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:52 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so1071070pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dGbbNKp4npf1Vj0f7cPVzv6xv/KEN/VnOrx0FoETZSE=;
	b=C23tjjea2t1EYxvrCUB8drPu4K2Stop1IsXKAOg7PxbroEUjTm/fcks6Og2AfTTreR
	PdrXWi1g6YhgZ3dFRscC/7b5HxBfGowOhuD6OeO9WRmdH8g5/ZmLA+fZxqE38QpEnzKb
	+qbjx0zlQvby/8fWSX/NTl/HHCCHkUUYEUA672StV4hjOsu2z7pkeSb/LfF4rDAC2cws
	QDEIrfi0q7c/NpbexFY3PGpSyeeDi7JohWg28ViREmRo8K4D9d5cHsyJhTyq11pG7Qj1
	cVsVfeavpGYuUDOldOe0hSoT6us9Tv5TLnqB7ZqJCJPHg+fNwa5ZIXg4Xw8ZbhLkvhiB
	G5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dGbbNKp4npf1Vj0f7cPVzv6xv/KEN/VnOrx0FoETZSE=;
	b=kN9eFlBiXMUieXN2DasBRvVvLtdFiNuDKgrJq+NKqVD7CsCZJwRjJ3zzUo7sFJ6+cN
	vMlQG066A36XPHmfIcUlYGSFt11dlIqiAlAa/QZYd5Hn+jrbww9Z6w2EINOIryHqA1RX
	jqsR8+W9GK89JR3/tRNhM/rDB2iXbLwgCdt0TENiRvHPwj1CnyEhSxlippaQWK9mviAE
	Mq8Bx594jOgGbo2AAEfI7TpC+nm9W4niEITavjhdycTZVZCkI5ikl+t4zmiJKgxGD4Fw
	nrfEGXh86tavECPMv6Z5bx2jj6fYrmgLIX3PZ9JUWLZRiDXyd0U4/8YqnlPbLRC2oR0s
	rjNg==
X-Gm-Message-State: AEkoouuck90MTt2hQUjvCjOGCDMXcxhekZ5y5orW0TPn6tpeYpr2U+WrFAwUgEuJ4W3VGg==
X-Received: by 10.98.77.70 with SMTP id a67mr171625598pfb.151.1470757252544;
	Tue, 09 Aug 2016 08:40:52 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:38 -0700
Message-Id: <1470757240-9091-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
References: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 4/6] concurrencykit: fix fetch errors.
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
X-List-Received-Date: Tue, 09 Aug 2016 15:40:53 -0000

ERROR: concurrencykit-0.5.1+gitAUTOINC+f97d3da5c3-r0 do_fetch: Function failed: Fetcher failure for URL: 'git://github.com/concurrencykit/ck.git;protocol=https'. Unable to fetch URL from any source.

removed "protocol=https"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 51243c2..19767c3 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -10,7 +10,7 @@ SECTION = "base"
 PV = "0.5.1+git${SRCPV}"
 SRCREV = "f97d3da5c375ac2fc5a9173cdd36cb828915a2e1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
-SRC_URI = "git://github.com/concurrencykit/ck.git;protocol=https \
+SRC_URI = "git://github.com/concurrencykit/ck.git \
            file://cross.patch \
 "
 
-- 
2.3.5


