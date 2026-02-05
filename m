Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CE2E91277
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15258.1770274805388728139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FowvGti3;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso4596375e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274804; x=1770879604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv4S1W2lyrtVPtQ7mUq5Db8PAaS9WMqldaxu9U/T0ac=;
        b=FowvGti3aCbuQ8FCn/Rm9GFi4lbqxDaHpKj2fEIKjaOLSLsM5Yg/thIW5l96jk9EDg
         lEvoP6VB/OwRS1J7RWzb7y8CFEC4bF5BVh9+OIXrkG/1L/MnWa8/K60iJbSrYrcQCDeh
         za+z/A8vilu969C6PHKWjMLGPzDD/RoqVMHKQrylqdjCdyKgIrmTbdufuG+ESOesdFMc
         NStGGF+i95IsytH77bde8N0tELpMiNuNzuG0lHFeTCJhOLpz5DR+qXorgymwt+/7s8Wz
         FFtpHu1AXpQj8S7LNuGJInnLrr/W38LPqhlyKB6PJ8eZ2TMDmELm/j8IMwG/iOdGOayz
         NCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274804; x=1770879604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dv4S1W2lyrtVPtQ7mUq5Db8PAaS9WMqldaxu9U/T0ac=;
        b=Lqhob0EL2an0rGRrXoSzcKb7IyiFST6Fv8vMXaoPbnc86h6dvBQI7A/+fRCz/VdsHf
         PvTUUSaQbjWhgHtGQxA2ztcQbiONlv/bp7h8QTgpcloa1A5wHq3aTPl/f30oNWSo0gPs
         ZhIgXoA4123dZTccMnwigRrg9RPyt5GJvp/KA6bQBqrzroHtBHADCpBZijJ54Hcx0jQM
         CtrASIqmNp+GuQEmCp8w+wRRoFuvEGVrjv4iRO4gCXLGYpICct1mPrygtMmNrf7QN+zM
         IhnZZTpfeZlEw6HgDJupbH7y984iLr+w/P6Cy2fYkN3Rb4sA8ha8xWNB+HRCKtSSYh32
         mzhA==
X-Gm-Message-State: AOJu0YyvpFxLhmOYBnwpPKvmz3+dcZu4UILwB7qEt2iHM6sXUwAeMQuu
	+5Ca1RjxPedD0rOf5XVJTI1B5WwK4bb+47YVQbcSia8I+qg5JenuSI7bjzY04w==
X-Gm-Gg: AZuq6aLj8JS91U+58EmBqG6m5TZ4ZarSfy/SKNbcFu7J2atMzAYPRrjQka7h8NRnFht
	WWb7SXCJma1JPmfexkn7NlkLJmQWy0K9Y0EM1xM/ylguHwX6qLV66sy7gCF6vKy/xvviSbf8NlF
	QP3R1bNYnJGWvADcpC6B3sLftfP12KwIT+auG9G62Q8wMImiCa+LpPkuXBTMG2nCQeqLNuFVxk1
	5W6rTQu3THqto8iY3PosWL21TKlDJPRrqUQNB+5ALMCgxWWX8DIj3svgpmnbB7fqWVq85ax4+2l
	n46zZxGSClqFH423svPzjcBIYpKi3ri/L7CKCEKcZcUojyR/rjnfFaJtylZYDZOSL9gIxY8Wwt9
	6phMKz8eycherLnvUf5aUwGo+eBgbnJMfct3J0OOtmdPoChKJeojTtT4zKPXQxa+MR8l9kIJAeZ
	iUsYYTvCxX
X-Received: by 2002:a05:600c:c16b:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-4830e96cf91mr62933675e9.21.1770274803489;
        Wed, 04 Feb 2026 23:00:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 10/20] python3-py: ignore CVE-2022-42969
Date: Thu,  5 Feb 2026 07:59:45 +0100
Message-ID: <20260205065955.1267785-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124186

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-42969

Upstream could not reproduce the issue.
The vulnerability has currently the "disputed" flag in the NVD database,
and Github has revoked their related advisory[1].

Ignore this CVE due to this.

[1]: https://github.com/advisories/GHSA-w596-4wvx-j9j6

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91f6b85b36316d5940ee194b1d195caf3ac040b1)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index e0ef71df83..6397114637 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
+CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it, github also revoked the advisory"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta

