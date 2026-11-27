Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8233.1795739777977069726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CXtsrs3c;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0458cc9easo59788195ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739777; x=1796344577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84cNBIDBPq8oJ5v9YnXqVRIpBZ6Ig5T9r30nASpLemc=;
        b=CXtsrs3c5Io/3BONnwx3nn0v3JxgLnnmys80eie5VMpxPkxzRnc2C4goLrbmx9ZL1H
         wbm/zhzwLZblJpSORLn1qVpo/ZRhrRmlHV6M2cZHgfGUW0pOt2QJqsU8OCB1X8YPXgWI
         3TkcA1n0adUyiQq/DxRIM3g4sHmhqeZy4ZG+kkLycohhZ7zBO1+dDp90bcsjzP9ZbReb
         5E5KNdcojW1kjE2W4UwCAFuHiKp4fc0h3iveLva1A2cyIo6aaj+NP/cHAefOQwcsk4X7
         5JpCmCTxESFYckQtezX/2f3zBSD1fd19+5XMB2ErmtpXMHapfVPB0K9yFQf5qmQlTQw0
         ffYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739777; x=1796344577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84cNBIDBPq8oJ5v9YnXqVRIpBZ6Ig5T9r30nASpLemc=;
        b=Nsy3ycfk7Oz90ZWkVUsqqpihRMEQtq8scG8v/fcx0jhZcyuGjDV8WQ6/JT32vZkbal
         XJ2MBHmhx1fS8uMauyWchuU/QYC5huIwrDR/23WERZnederGXDa92Sgc0yg8fuOy1Ett
         SiZIvXvHVTuTFKZR78/ehrIP6twd/G5Pk8Vyou8zwJjJgoFOdTkNJJ7K787XRFOgF1sr
         /OQ/aaRoUp+9FSooSeVGXlgtY6coyEYQPQUzwnDlSQTvQ/jHh0Eraf8NqBCc4OoTGuKK
         OSI042RZNw9d8JwhsjRre1/YL4UMGIwt74Afz0s/Z8vYIRmeoxqaHtPb0jDQUC9gkwyI
         wBMQ==
X-Gm-Message-State: APuU4Z+qplSCg4Cvnyk4fyF1EcWp1sMN9XVgc//1CptieOvuOC0mpUuL
	xzbXbf0jd/djU/iuqvh7kZG312mfJUeOyZK6g8XCFzkSHY6j0miD7gWKmHREEdwh
X-Gm-Gg: AZFdTZcne4JUPRnveQvomW1NqPNrLc59QnBbbbhnGA0hxz4yqWtcUpnqw3bBPCB1qHD
	g+EAUH3x5dCtmb0UPzQ5MfUcbavuznn80heLB6rv3KlBoU4U2A6YszecC19Yg+mXNfH7d4a1+NH
	PVB+5hDOBPD/umYL+b7xIZ5BpQjf1PK1WXH//buwi9hATr/ykfsbRrZdMiozh2f7NOOssEb1Tws
	xu196Xr9WpoQ07scbsnBp0RVxNy8rGYFeJVVWLphd8ONjGApaYGdMf1m86y+NtDc8lrV4qqyxA5
	/f/uhey63nz29m3fEUdDfP3hAVgX0uCHCIElvTVCytEygGGqD0CKkSdAnpEKODE2Bvgh4E+OQei
	GIEYPqjUkzVC5Bwc6Wb8jHsXZLM4mdrQEpuVsWTZbio0gNOoD9pEr6bRJn6y+QOedYl+1DpB7D2
	HomjOgkWSjfWxe74Rdebxs61OId6kvMLSmbeZ5pPA7Mep/EZ1EPSaB86Wvm28r37IQx5ELNYTuj
	lkiaAuCnYP+Q/aaK6VoY+Nnf/jpZDW7VqDuUDJnvFq92Sbdc1x4oIppAKOM0445ueJmMDtGQq7i
	8zgbpKXGFLl8txTReNP4te0z8kwJbsbeaQGQ5dFd/q6bVYVuQiX1L1I+HdiyCVt8E3yNNJ4pLix
	J1wJw74TW3iNFlc0lTlkKg7o+rFMiWTk2nysadW+fB+sH7mdFoKeH/oqLxeH3vDCH+PV2cHCKlf
	zbEMw4GuZ6yl6stOe9l7pNtpc6W8r0jVZNMetkX+YNzFtAGRu0yYgD118DfLl2rublnCeksxQ5/
	6xJYR45On9/+Tb/mTi7U7BwaxoF0rxCxOGlMtLR3CLnhwsKSTtw5ZQCPnWLQbgLwdGdI4kkbnYC
	X5mH
X-Received: by 2002:a17:903:b4b:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2f03f1c0a06mr231450185ad.39.1795739777211;
        Thu, 26 Nov 2026 16:36:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/39] flatpak: upgrade 1.18.4 -> 1.18.6
Date: Thu, 26 Nov 2026 16:35:15 -0800
Message-ID: <20261127003543.2167775-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133181
Content-Type: text/plain; charset="utf-8"

Security fixes:
- CVE-2026-133842: prevent a malicious app/runtime/extension with
  extra-data from creating setuid root files on the host when installed.
- CVE-2026-133845: prevent a malicious app from escaping the sandbox by
  manipulating file descriptor passing via flatpak-portal.
1.18.5 was never released; 1.18.6 also fixes the CI release workflow.

Only SRCREV changes; the pc_sysrootdir patch still applies unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../flatpak/{flatpak_1.18.4.bb => flatpak_1.18.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.4.bb => flatpak_1.18.6.bb} (98%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.18.6.bb
similarity index 98%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.6.bb
index 3b1bf63014..f53bdaa075 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.6.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "a02d0ba48abe9aacc377de15699e5d8c024b5669"
+SRCREV = "7a986ba376d9e2fd8857b0afcdf5d171ef733b1f"
 
 # Odd minor versions are development releases
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
