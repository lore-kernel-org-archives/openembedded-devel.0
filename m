Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36196.1793161482324438916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jIUQnsak;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-886e61fa30fso247471b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161482; x=1793766282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQg+0VGRSROtbeHPtiaaYx0eJ8t9+4O75AB5SIh9B0A=;
        b=jIUQnsakLX8DJozuQr8xp2WPTJ+zyyX195qXogd79lTyld+R0nY2NY1Cdji8mntHvN
         7aZJDKcqjHmg0akBpaOOwbb6nWMzwMgGLSnZVNME2FV6OEspXVxGhNfCZuJbNZ9Hhp1n
         iegIHSUhZI4sYEV/dzl68WLQPuGo7XUCF3D1ZOYbD7c3S8VJaijWIFDFWHFXY3RJuuv1
         merhekTV2Kcq3DOdDqKHaMuD+XsBrbYbUnm6qcbzHfPEglarnJVKEd78NPbq/uZVJz/i
         +TOfrg9zMJ7Cstna0C3tOQp2RbxbYoF+sDkKOS9rp2xWz5CnlVO9XUkz2fK8g2FWtaFt
         PoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161482; x=1793766282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQg+0VGRSROtbeHPtiaaYx0eJ8t9+4O75AB5SIh9B0A=;
        b=W5NFLzZmzx9TbJm93w38bAfdebFJjTu8cXx5xxNTF+5eeccb+VIr43pzQafRZFITt0
         k01/mGau+XlakOjYANBqlnX9WOflMpoGO2kR/d/APwZYPZKE5zLtP/nWmEwVD9Ys+Oo/
         3I8JmxktW2NM5nmdBKi/dEKaLvEMDwIgvynA1WThl7Tf6mbZy5L+ObQeKvxChmAOVM6q
         FRM7kwHrQwFUOMsCtHQhrB3HNa00KXP24BRQs5cW9Epucd6eHEJNBKqO5BWmyrZFIQDf
         n/tiFPV9x/6WV9uH41hSUHRH5rLum1/kv+WkDfa9sX8o1XHWVaLgt6oqtTTewumR/lA5
         yUSg==
X-Gm-Message-State: AFq9FYLrtD1b9NeWojXcHYDflSIvtHXJOmlj6LdypTSeedu4fEDfhHAX
	U/fKgaEOO0CzI8U+c5+ngRjq3qMlWVnYg8wRzcVu2rS2AQ49qce09eFuK9ZuMw==
X-Gm-Gg: AYBFou1RQ3dRwsB0NgTncuz6zD69Zt2nHIVl1ddPmoBAMKSrpJdvuMx+rkl9oHJdiW2
	PL4vDLOPlIMmCQYzdRRKWPFScKwwAUdbHa3mymYp9Divqn0H2/hbz4qyV88oPRRrJ0HJc6p46bn
	vQaIAP37JjLqCASIfHqVCYST/kCZNZ6SRbAwVmplZyJVmFmKZsoVCah8Slvyt5N8D0H62wfm3y7
	ab7Ee11O6u7mCJK8/fPylN/txckOO1C6evBg12Wc7cfKzDF5v5qlpo+ge9iOcNpacmqf8wpRCxv
	ficRub9hK2FCu7U2Qf/u2gZ8UzZofMgZGjRgIVvduLSey2ZI3m8rIBqa02rlxHkenioMj6cmmz0
	eKDEog345aKqKA4XLC7pGJlJEYylNLKit7B5kAjucDuvEF34nOYMJtkHbZPLdq63h+JaDMLk/PP
	GQBzbToX3BOP0A360j+gVLojxxWqpWr1qnG98VHPZ2OAP/GSObPhTAIeZCRFD7nvF5er8k5IlVW
	EC5TOx7zlmJWQ1iRsmL/rrOkDIxsBk43+fdTTTdNp3vAKtwl5r5mGe5B/L+B8SYQEpQeqPTc6+W
	og+boTEYhjcQipgvpC4RkoULvYaWAddKVy5f0ouR650F3FWgYDI5QxnTQpAebw==
X-Received: by 2002:a17:90b:3d90:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ae580ae5edmr755233a91.20.1793161481603;
        Tue, 27 Oct 2026 21:24:41 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 15/60] samba: ignore CVE-2026-2340
Date: Wed, 28 Oct 2026 17:23:13 +1300
Message-ID: <babb18114eb20d1dc4a8772c5aac9dd637fa560d.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131567
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also confirmed in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-2340

[1]https://www.samba.org/samba/history/samba-4.23.8.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index e498b30bcb..c0d8fe4a00 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -46,6 +46,7 @@ UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>\d+\.\d+(\.\d+)+).tar.gz"
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonStop Servers"
+CVE_STATUS[CVE-2026-2340] = "fixed-version: fixed since v4.23.8"
 
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
