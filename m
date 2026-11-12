Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8300.1794467643448703086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mTPluF12;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2506697a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467643; x=1795072443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=mTPluF1247dlNqczEmuKz0i/Qg50hpcpEGvYP4JHsLTmBZ3neWVOCbcphjuoo5W4ib
         WBFR0RiVAtEAs0f3yb5koi+4suyBYr2b21o7EVOK54KEBkCPncwqfLUFR7aXxhfK04Am
         GgPFpJaaT2IIup6Y/4mC7a2GbbweMldzng/DXQVhZ/t1q1unLWbSe3qniLTFbiZl9OJp
         rnwUvEUEpfg2lbaSXgk0dVjCoIm/soekiwZgL3SUpQjsPr7YUnsFe5uepWpRN2jxWBaz
         sCK1lEtMN0U87/ObYcdz4Kk7qM5RTgk8L/90lM+6RBGQ08xsRBn6IcKGeWpL1KGFsLBk
         rf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467643; x=1795072443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDlEgziNqunqggW/luFDNrufEbsRgIUzQyEFSwkgPBc=;
        b=I9A1d6AR/7xojzkUqGVUvyuyzp7C8pySrC6U2RXZzYyD9Bk5GqkIDUxPCsjT//qxKU
         Dl+qEwYwmoufEPZKI9jV+lolJniRnnMxtvazRNgv7hq3223PUOwBRT9fODFofdb9Cntb
         6gOqcWtCtvSHuFJdtf6UkDBMyH7KDzFiRvnbpUcfiV6VirEYHO0ZSFzH+25ZJ6wwoVto
         NWxvnzWwame5IoZ9LkhPIyqLnPgUNhIsPI59U+6LGBdlUlCaiyCNi4vo6W3uwDej8F7B
         53Nh19P4NCAJ3qDBntpweFgtLgEwO+0oeWWe9Hmtw6+zV4INzxZkGEtozhlEtrK4lbDs
         X7bA==
X-Gm-Message-State: APuU4Z85tpdu+EYc61/xb7xsvbXCzvgVg4nDPNsJAMJ7snMPWPagMcQ2
	Cr6I74BaT3Hx6zI/cPSD4WolBifo08W/aW8PRK8kP7nP446PTFJkuLVTfOwU1A==
X-Gm-Gg: AYBFou1mLNNBG6b9fgSKsEfl4leokF62ynYAa68kH1eVowNbIKM0H+E5A4C1ONjfHeY
	7A617GCIjX6CD1tuN022+S6C5DYnGnj4BHoyoyBGfMYokONcfYj9FocfK6g6Ov1qdOXMgi6bLBN
	rJ1oHnl9b0OhPPN7T+gdFkd42JE7z8GHOkkcT7oSXvvcTdbRJliayyD+Jn3c+JfOtWqSpb8Ljaw
	rhhiZfyaV0l0ajeCFSB/hVMvUbENloGsVZo/UGQlJhNX72HXoCHCZo0yj0htih11YPSdxjP+BU1
	os2X3dcZQEiiT4upRWuMRjXWNFM6FmhR1eMyNyDV3DYZzUTMt6G3aUDKh9phwCCIDTFOi64pxJp
	QJoFeHa6pql/IobPIJ+2b+JPEijru5NIpd7Jbx4cG1by2UVtdVP58OtAT1JKe2Bkre51B+LcwmP
	cSXYcM4moCHcGvcuvF6p2rxCek5NAfSKjtCe8qoe8RtSusf2MLoAIVtCYvFO3yeHgLC+iTdvECZ
	aOxwxdlH3TOohm++2z9f8b169UvepJ2QPzLo8krBfWhBQq8Vc8cQqlPdFDwOpYaw78OhSD/XJhD
	GFCqtSMYAacBECeBwDBtOrhbvEDbQjJqmDkCZDFG0jA5itTIcaCGu0o2NLX5qA==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr4863208a91.49.1794467642726;
        Wed, 11 Nov 2026 23:14:02 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:14:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 3/6] cockpit: mark CVE-2024-2947 fixed
Date: Thu, 12 Nov 2026 20:13:45 +1300
Message-ID: <20261112071348.4144113-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132202
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Commit[1] also identified by Debian[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-2947

[1]https://github.com/cockpit-project/cockpit/commit/9c4cc9b6df632082538b53bdc8ee9ec1c5cad4da
[2]https://security-tracker.debian.org/tracker/CVE-2024-2947

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
index e12cabcd98..3aa1f155e7 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
@@ -202,3 +202,4 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "cockpit-project:cockpit"
+CVE_STATUS[CVE-2024-2947] = "fixed-version: fixed since v314"
