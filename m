Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0634C636A0
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 16:45:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16922.1771778734843188682
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 08:45:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaLObNYU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso30827015e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 08:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771778733; x=1772383533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Oot0KeI6H9bWCy3XycscchSIiEUYd0wzsMlzO9I/+g=;
        b=BaLObNYUKXS1AxIYO4108sgmLDULqpKp0acDn+N6fkKntxHaoDu09di3prga5qDkC2
         pi6FdfZFWSJaWWX6YmVAMnq9YU+D8mLFky5fXNt85xI4BvE7s2pyh3aPvoeakGSMx1xQ
         Af1jUTG2rpMRKBP7yLAiv4FwdCGtw2OikqUzC9as1xHTAs1Q9vRL8LnAcYhINV4tUPMN
         C933BoHkFpZmc9Npqh8kJ5hKD04VFQTZ8JVuHdFPnzSQi2EHUEp4dGpSkiItbgMGwHUQ
         jGIDDB2jdrlyV+xbpCUhZ0dWa1QEo3K7/64PYk+jWp2inTLPOgWLRbIXqbE3Olwb2Qe0
         sPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771778733; x=1772383533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Oot0KeI6H9bWCy3XycscchSIiEUYd0wzsMlzO9I/+g=;
        b=JU8VmsgsujCe9F/d7HRNzyiVJWt0SxwpS0qZ125HNdxz2NJ2Ze02tQKPGSb1lm5Dc/
         6NgVx8t3wJr/Uwc4EyBDli8rLAtnSXEVX5eX6/8u3ekFpR7B2VSuijWNHZ1VALI1mQUN
         GzaJ0vtRrZg82w0Dx9QqBp+12COV6mqn8YYZnZxrSb0lqsJHD9sGpQqpASk/Wv14anSw
         yWJBuKMGQU7M1BfM3jFuT54NKKp4KLE1tarA2Dsjr9LyJEQehtpenazqcIHVWohwiysM
         JCy17JFlNv9YWovs8qjDi67Iy9ooijmt1GBDOBj3DzSF81RpcuLbXFbP2qRLNlTyoYG/
         Xnpw==
X-Gm-Message-State: AOJu0YySUW4muuXaWuPU4T9UAaN0rlxsEke1U0C6BDWJROsPswxhT/5n
	5xDK7nLoEereun15WX5A55eVwBOyrklDdoAO2YH3BzOygjoe/20VzjKVcdRPyQ==
X-Gm-Gg: AZuq6aLaeIZTS2nUL9yX42ONQRaIxnOzqge7IDeNBKWjvThq7TnAj96p23EMwlBZTmy
	DNT402Itrd9wFES9TUmwDPMFg0vyekkSu4p2FEAbMKLaINHKeJ+PB90POmXCS3xd26lKmmqJ/G6
	mKQ/+k9XRlm0VrUVHLm07yNWCUWEfA5WUcIn304CcJlmc+Xoj7GgT1rB5z6HINRmGWJ+yHaED36
	XGtPr9SbHA4ysPjfxOF3jOQQ2BniBZKSSOcxNmOR4oprEsvusW25vpqvd1HgMNM8Mtx8OBMpOsf
	9gChEl2crdDzJ4DPB1+FjaLJdkD+67FIuBPBfCfQNpjf2gh2xVkIEB1XDrgU+7nfJS3L5rEJJR6
	V8NIdRcQYxhg9wk1NnvXHkyQxWsTnDxjWr/milYdmxa8IFh3RbK899rmjqENHiC0fqUKSrlAsxG
	pWu46Niaoj7Q7u9+WBc/gz
X-Received: by 2002:a05:600c:699b:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-483a963baf7mr91134325e9.30.1771778732992;
        Sun, 22 Feb 2026 08:45:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75b4dsm204792545e9.4.2026.02.22.08.45.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 08:45:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] dovecot: ignore CVE-2025-30189
Date: Sun, 22 Feb 2026 17:45:31 +0100
Message-ID: <20260222164531.1971606-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 16:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124532

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Vulnerable versions are 2.4.0, 2.4.1 according to the full disclosure[1]

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-30189

[1] https://seclists.org/fulldisclosure/2025/Oct/29

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

Adapted to Kirkstone.
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
index b9473d0345..c1fa702eaa 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
@@ -78,3 +78,6 @@ FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
 # CVE-2016-4983 affects only postinstall script on specific distribution
 CVE_CHECK_IGNORE += "CVE-2016-4983"
+
+# cpe-incorrect: The current version (2.3.14) is not affected.
+CVE_CHECK_IGNORE += "CVE-2025-30189"

