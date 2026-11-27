Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10273.1795753048711302112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0tWLRhgw;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b563e32936so3515015c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753048; x=1796357848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTxj+akO9mFXfhUB/6uvh52zqJAmxAZuUxxa+atplkA=;
        b=0tWLRhgwfQ4xb+xlMro2TwlNod9mjstpSKVZJpByB5usx6yx8zgGUDIuwT/1sGJDda
         zk54VryHD6yT9xDEzOz7zNMJwghfM2bcgIzmUrIcpGbE6mHnIi8XrBJY0bKeOVnHJyV3
         mXbcGfSJw+6Egtqd0W5carnkgTP5YPuouwGTJgH+2pKw0nzoMeqSzjCQaYNwmIb9/xzA
         WJ3AvN/wwzpfoqBD5wzWV6w0RMz/JXJ6fxfiefvQNnvx0bUTkPjrEbWRNEbUoIOysFdZ
         J4EGlzl9Fb5IHua+qfaQtdYFLsnNA6ACco/q1NJAeWFnkzgqI6DUfzcau1a6E8UMbOay
         +9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753048; x=1796357848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTxj+akO9mFXfhUB/6uvh52zqJAmxAZuUxxa+atplkA=;
        b=xmnxYrrrMp3LKCIiCgH4v6nDAKUyLPhuWdrAOieL6v6dQE47PMKVto5RG+klR1OuKa
         r2qp0imW08YBCfHzlu2l1I8UpTc2/hRaR3VbSqmQPj9M/Qn0MaxUePBfFsUna1DHrm2S
         wGAsmipc/OVHDtGayCKZfIMtnaTQtVtepjEBmO5QNy06louX64pN7ZClPHedp/VYpA+A
         SbZovw+PKJJaQrVD30tJ5bZYzv2zExOfd4vF7A3pylQqOFvoUqDrrW1QMmaryJ0xXpAu
         7R5hLbxj8c3xaZs0ewYIpuU3wgdumu3OcHoA96M5YWaBpnHmluL4z8T8X/vdUBWi3keZ
         t15g==
X-Gm-Message-State: APuU4Z8lxskQOFSQLEuYLo5P7XILAHK6xbTtYaInXxsJQ+1lxNGo6+io
	EHYncI4EKgS7YX0E63oqiaR/9BO1N3sL/tM/Di6/KxsiVxPjjw7mPyFGpQl+CaTb
X-Gm-Gg: AZFdTZfzWcgQmz+rkAmdqJ+xrAX9fyjJKLx7NG9VIsgU3kRzz63I6GE8y8G5CYwc6h4
	73RCkafGjKM81Jy9u+KorQzfRhPTbn1OoCv5NpU986Z7n/xdT+d3BewXl2Sh4ras8h5phzTGKpE
	zSOlsMuw0rXAhJJcDTY0NeNALL4RJVqt0fvfzRO/p3XyJHi9pzXCnUQ8sFt6WUkkVa9K2wlnG7D
	HF67tAfhsAHwSwSCt809MBjnxVLtuVJMWmBuKLU85XsWrnDYaXVT80kr4XUARd/2+7+9n27i0KH
	iOifaRLkwLCeukJD8uYTAQ1iSVKSxRNbU6vLyWSNsUxTmeRPT3JCu2foSQF5Z8UgZPqs36jx+Yf
	hGj9ucE17r4emZDle3dQ3NnzuEWU07kVPN6lVXp3uFj21ypWC809tiGZjsbfIvCMb98yWrBVB6I
	csHxPuimhve5dQJqJE61SyY2Nm/IoO9ChourkPvkd7O5apEbvWEu3h6SMJrjagqrc/zQEidsmXW
	AVxPJ8Q7T3yvBQmwhiojh9mXLO2xMAbm8fp5NxTBvEsqrkSul2YgDY8cxzlixnQ2960rmYz/mcV
	910aDw/dZDrDv4l3LWVrEon7G+cs7IdAyG/KoHNnhjhbulXQQ4FEvzNapfYr7H7EIjGf/WXYkIJ
	cqhMYryMHKg0EtAcrhpW9NE3+MVSGZptjDEytgfK9H8m8DmUti1zoUXXZ0z4RgFCbbJMPkne58H
	ksNvylETZCFU4xKYke12zU4wNuF3hSa/leaZvVzdPyOnfOph25/9DI5Vv8iQpGRO6C8SALb4eE+
	83c/BNLL9Azz1d2q+Z81olpNDvn9YNqOq/XR9AQPX1BFbDL1+22boG3idOrWXSIS/6FXTqOBSZm
	Bcdj
X-Received: by 2002:a05:7022:3c02:b0:1b3:beea:eee5 with SMTP id a92af1059eb24-1b5567c23e3mr18281813c88.1.1795753048061;
        Thu, 26 Nov 2026 20:17:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 09/35] wpantund: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:49 -0800
Message-ID: <20261127041715.1776485-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133261
Content-Type: text/plain; charset="utf-8"

The newest tag 0.07.01 compares lower than PV 0.07.01+git (the +git
suffix is not stripped for gitsm), so the check was reported as broken.
The recipe tracks master after the last release; check for new commits.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/openthread/wpantund_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
index fc042a21e5..4cae66848d 100644
--- a/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "gitsm://github.com/openthread/wpantund.git;protocol=https;branch=mast
            file://basename.patch \
            "
 
+UPSTREAM_CHECK_COMMITS = "1"
 
 inherit pkgconfig perlnative autotools
 
