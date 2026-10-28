Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36050.1793161489299839509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jeMpV6Vo;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so318263a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161489; x=1793766289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfAWJji5B93Z81VjOHA1zXK6H/EHUFsw2F280LxpAfM=;
        b=jeMpV6Vo/DGBE7ZJbf0s6s7r7TgbTP2oQ/EjOADhHjkfaHQuYuBr+L6HNKue03Ds7h
         5YBCdipsvU35w3jZWdegWqh62By31sxkD+nOROCj0AfYtV/yhItRBPCp2EB6jd6+SKL2
         OU0iD/lskbBjKJg9jktA7U6TkHz2Tu5kN99pMEVbCsdmd2mFTjvII1PYuA1r9teYnYgc
         KP4KxNHQEq9WxoG79dlzutJSfWq5xkmmrWFdpj3qIhr7jB34I6KKBHWUXt8Gz8qFVdM9
         tMJRnIOEO5N/0Y5KWWEB72FwMTGKMD6Mz9iFucyXyEt3cgkTYllr0PxXYkNZnuTPZ/nF
         E+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161489; x=1793766289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfAWJji5B93Z81VjOHA1zXK6H/EHUFsw2F280LxpAfM=;
        b=iYTUi3MRUEBJ1ugqj+R/m4kD8XVtYeBJ2HwA0+RxYR8DIPhIWtP5yGgAbcOju2A2WG
         7Fp1T2ob9bgtZGDxNf6GkcFOL54CuKeEb9yVBhz3at7KpKXyXgj15BCcEpeJB3a90luM
         9GzjEbnHqEflCI5/mZUdJtn/Vz7DjNrozC2ip4UG44c+UpjBvt32l/vC84XgLPwDFa1I
         kd695kYS3f166ZwItPp4FUhDQKEj64yOodDicB4km/iu3JNPray92XtwvLNeE6gBdqU/
         a2/WhKoh1IcZlCjxWRL5PpNUhw7w/19IZlHMnsYFouLwT3Jiv5m+Q9gnru4nhMOBtpW7
         CbrA==
X-Gm-Message-State: AFq9FYKBRxa95nx1N0Nm+X7Gki4vUxXoVtvehNNJBCAQfvhCrcwxYziH
	pDoG0/Ypfr2ywK7rrKxo+2WjDsldWRLqlF6keSo8N2h3Rven+3smQP4YIc44cQ==
X-Gm-Gg: AYBFou1MI8gAnlFCu6HZ0PUFuySzMq894OhN08ktbDOrjkw8ACMSsnVwt/M2ADUCZ8o
	tzx7EvbYTqmb4lG62fPAtPhAY2XKIol/oX6o/XzzjkkkJ+zrgjbMZQSzYF8yWpzZKqlTGIHHQl4
	zc5AfM9Q0QpSI40hE9vmP+ugx3/Qim1z4kLtXbZs8VULAEOH7U/FvckoS0lf0fQWmm+GPkucpZd
	Hzf058vj9tXhI3XawPpHCaEad+h2oSBMYU8xuu4T46yybCqF6VYxwv+YEXdCpSrMLQ7OYlydZ2r
	RVWMzKDYMeGek7jDiZRXNk5HfQYzmqioOXAvzDPnVKA3VPZsvvVGOwmInvCAUEG9+8jJqyBo4U5
	88Eh4Duij/KCpXlRIUeQB26LqS8Da72jLXoUTE8lJ6ZDfcyFFcqZnWrjhHNtYgA7RD9ZCMWrJIQ
	A8Vnc1RaLrsmvGuaWXfZZn1NZN3NqQOVIKiPWRsbrfo/JZTub4rrRMLP3xsLc1S0RaWYeQ8EncS
	tlELjcQdHTxk32Oi22nCtcea6T8+YAVpC7+dw5FJOnwyITtYMgBoFkAv5bGmpWwBUjUt5j9pa7A
	s9NtTd9i+pJ2HBltB/DsFkfJXfQWrxXAMWhayVK+z7LDYAaC2HqR1CCvYErlQA==
X-Received: by 2002:a17:90b:270d:b0:3a8:195f:186 with SMTP id 98e67ed59e1d1-3ae581568d2mr777080a91.42.1793161488630;
        Tue, 27 Oct 2026 21:24:48 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 18/60] proftpd: mark CVE-2026-53994 fixed
Date: Wed, 28 Oct 2026 17:23:16 +1300
Message-ID: <9771015a7d3dedfca881ce6e10f3f5aee99146f5.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131570
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] identified the issue[2] associated with this CVE.
Changelog[3] confirms the resolution.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53994

[]https://security-tracker.debian.org/tracker/CVE-2026-53994
[]https://github.com/proftpd/proftpd/issues/2115
[]https://github.com/proftpd/proftpd/blob/v1.3.9b/NEWS#L35

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
index 81a7094359..5c194ebb23 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
@@ -26,6 +26,7 @@ CVE_VERSION_SUFFIX = "alphabetical"
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
 CVE_STATUS[CVE-2021-47865] = "upstream-wontfix: it is not a vulnerability but inproper configuration"
+CVE_STATUS[CVE-2026-53994] = "fixed-version: fixed since v1.3.9b"
 
 EXTRA_OECONF += "--enable-largefile INSTALL=install"
 
