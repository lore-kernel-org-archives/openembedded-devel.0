Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3814.1794729002570829619
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sCN1mo+L;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3791619605cso4879080eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729002; x=1795333802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wzvna3oT9h+YEb3nr6HZbMBm4GoWTjNwJoI6G0eby+M=;
        b=sCN1mo+LsmmbP3uUU9KocR2KQOuxfV+nAlGdlCA/EI2LYKySByqQcGR+QeonJ5oT1C
         mV/tKtOQo7q6ZR+HLV5dYnxnE1SAinVADRJNnAZmxxIpQiE8RnVSmHahRN+tIYgxylga
         A3dRjkokBWb7sx5gwl4yiJP/MRzFUDcKjsvI2WXBfiKy3XwrXRyHjBEoM+jkuEQ/HMuK
         EYVg1cOC3Elsj4eBG49z0G9wXCF8aqteFMk+Hn8NM7xpQfkMjNuHhwMNINa2cPdlRXz6
         DSHIdx9rTaN312IszXTOmOaJqIeYDi2RvG9kvilcSZk6CMDycIrzMjs8Ueuk+y4b2Qaq
         oqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729002; x=1795333802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wzvna3oT9h+YEb3nr6HZbMBm4GoWTjNwJoI6G0eby+M=;
        b=sdBSqO7RmGv6cyvGa/k8kYZB/Nsx/BsBjcgL8G61Gc7Ry3P4rBv1nOvelmJQaw4/Pv
         fkmZucWpG6gJc0wE6ssGVa3QTzp19SA2nz0PgsOhNw2EIs3hehS0nX+gLdOVK2prTS0N
         kwXPPmcZZ2tq1oF5cE7f3FDUtd3WiMIjHh5Kji/8xo/PXNz1aIXQ36dZ2RsMSk9TsNZG
         vHH8kDS9bMAEhfgLG5jBlKXAfAXEwdw7SJkHEz9UpIfNUlTL0JYnNJM+LLnjUG8NtJiN
         +4Cg5ASeFM7h0vGahWtVjFdBgb7P27+hpfrA4XHuyjl/5U1xnyBAHyjqnQwYsP0W5NaM
         I9gQ==
X-Gm-Message-State: APuU4Z/kJd9INAnT0U62MOkg+1lZVP4jgOWErYCHWLXLXVEvEY8wkqRz
	LKss3+UQdt8lis67rqQ/K9oAyw0sr4roJ4SxM2MAYDvfCFeJkS4naV7zTLQwDt7l
X-Gm-Gg: AYBFou2FjbLjZLo1L7TWa3DLGrcu0wjbL3DJpidl4PmMI+hKfxA2bYRa3vjcSfU3Den
	BVLs5BFX2eBc4SvyQhLgSfyZrHDyBzY82cmy/P1OofC1H3ykIZalNaoxfCp9ucSLs0FIjAgxy+0
	H+Az8xKfsMx2lqTrm7b50uMO5AiGfqN3Vatw+r93G9wff132yvTmM9oTVT7ctZMZ/nOF6E0g9Dd
	yDGWMn2lCfwR+iB4NLJT01GOCgxT2foel2ywZetOj0HQ80X1hds3J24G3VJsOjeIKkPk/2xA1UF
	vxUdur1+xFRCGPzWlqCgJpv4Tz0Milutwbehwwu1UM7H1fIcIDzzv8HzR/ZDNdkr7YfYlRw3bH9
	7MQISISNK3yQEPfnTwps/EzEdky8YAq8JSFu00DcEl6fpTqN+SvCqYrOAFrPaCEW4QwEKzsTBIB
	rDYFxCRNqrf7QuE6PJqsCLIu+nyeX5RD3LYZHSx7tvU5bWEgJsiVhs2CfVNLcJ/ifbonUq0Dh+k
	fOt2TxHiL40cdNOJfMBSIt3TLu2S6Ge2DeMevGt9qTwxyhWsF7JR1oNTB7bu4Fh27hFK+NRIXKZ
	vTKH7Jw4olJAmhx9J9zgIcBuOq2fi5UwQbCQefB4nDPN2TS40L1IE7/e4HbxslvCWx6L7QZossJ
	10Z0cgO6mVYIluwhirtI68fAXjVCAVvdtFH3L6oGgeJddYjeldq/gypyBe9RJ0v1mc2e/49zh8o
	4j+0ZFMI91r49HO1pJAkwMHhXG4NifvPaqxIIZATvSStXQC+I7Y/YDRy5dIw0bGG3smp1zdW9qb
	l1tpOgbxH2IVKa5JKn9SW0srE5gnSNQt+R/xCmiIv5/3qEgkJgH87Vw3n4i9RDwgmSjU01TjLzT
	/dpNdeAcx+KCh1mbxFPIftn4we4=
X-Received: by 2002:a05:693c:2a16:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-3796721cfc1mr6751337eec.33.1794729001833;
        Sat, 14 Nov 2026 23:50:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/96] librdkafka: upgrade 2.15.1 -> 2.16.0
Date: Sat, 14 Nov 2026 23:48:04 -0800
Message-ID: <20261115074918.2932593-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132296
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../librdkafka/{librdkafka_2.15.1.bb => librdkafka_2.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librdkafka/{librdkafka_2.15.1.bb => librdkafka_2.16.0.bb} (92%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.16.0.bb
similarity index 92%
rename from meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.16.0.bb
index 887541efbc..95e287d427 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_2.15.1.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.16.0.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
 SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "c58bbed850ebe1cc493259d11e4de6ca930d5120"
+SRCREV = "c6c9973cf1b25394c58e0cade13a36f386856f77"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
