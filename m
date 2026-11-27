Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8216.1795739721741957138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=L6N2MkPK;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so14472706eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739721; x=1796344521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDyarmWE3XoviPiyYzlCSYGubK0EjQWM9zJtyjt9rAc=;
        b=L6N2MkPKcn6ECBzjWwB3bNgAQ0TQYSbjHmXbv3RwPeLU4Qkseq6Sx3Bd7G5fdyURMl
         4sdbjhCl62lhAN1bqiyeTgze4/kLbVyR1sKJEQ5FxLHz2eRn/FjCF17mwCaQn+j7JNYu
         srEh+KVifPrTmL6CI76SPhw3xWvAHs+lCflv6G5hc8OyyIYVGbv65/JI77/ZLXvNluH5
         e7mGIjhtlKcM0qjpDv/qgdF1px8rE8sLpjhVgY7keB86sowiIt858pahvx6n+I4018n2
         I4V6ehWgXKyjGHxXc57SS0IcorALK2WEkVowZpZ0p9CRXSzRRdj18h3QVyMAUbkdK8vc
         9sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739721; x=1796344521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDyarmWE3XoviPiyYzlCSYGubK0EjQWM9zJtyjt9rAc=;
        b=txRGKAc1Fhx9o7r4OqWPuOlEeIt/kxmzFAOSpDYMqTYn2XZ+iP5S5RGUrNop4sMPkm
         cAifH3IHY6sfS253FZhSYf/0+IL0sk6GUi8oRnNageq1sathd4Jq0MXLeCn/WgqB2cXf
         g+n3Nl5r/ukmXtIdaoMJxpgfa2iU/YfLDDpzYjgaUWCzmGNkRgHXjnFySoTXuM7JnQt5
         +/wJtOzDowoB9gzCUCYUmoathYJHc0AJVKpROWb6Y/9OxZYRjAe83NqDdfi01nfS3eia
         EUDgGdmW5EetJRhcwQVUoV04KV8W8Q8epCR0bTp2czevXkm3SDD03CCzUQqjPIsdPTG0
         Iabg==
X-Gm-Message-State: APuU4Z/h8H5DhA9WqCPOL4xmVzU9JrfCkrmlXhZv2D9j23wwyY0JxPxz
	Ilcq+sadM9UEdrE0BvViLXOquotDU9BSG4fDuOQHkuPmMv7cIylXZ0whaiCcI2uU
X-Gm-Gg: AZFdTZcJDkwgT9OURYTbLzmSRKSEyXqg8c5NrQVO7aBSu+kWgWxAkindr9umDbEokZk
	oFDxTomhSFNtnltB1P3dqHwMZMP8xnxNhkcCaeFrn8NqUBlUhEI80IVnY8eochw81HZzMoBx+uo
	x2Q3Zt1Bkc0/uOojm8P0Wzt0KXsqFT/nNEj+pE85pJFF04RrngoaCZjy1HYLhzM2Agxy4ru1U1W
	uDh5xsRsrEkNerTKIjbFPI7aaqMyHUL3D88p5cP8PcGNKcsT8GH4ol+m4nZKnRCzLhwKy81bTcI
	5yVRevXfwp3mAez9CFJQxHpv0TN4DlL1gXjrQkiB9m9qN8yVs+G85bAneXRwvVQ3tGp7z5xwCC1
	bLnJvWlkMPa1hDcLFF0hL1JeY3i5UmJEzF360bRcJiVNhKPgkBELQ0I8BIXn+mfj3xow9KretQl
	ud/0Vd4+jBAeIl5IrSi6heFhXnQ7XT5Vt8JNsBbxmMkBS/vXE4MVL/Pyconj/6u5eyOXKhC8sXt
	dYw76XSjlqDYPBZjRpS6XT0Va+rMKb6s2NsFFGTTVncokK+oyyrMCaIxWvKPo0DK4S3KpzJeFTn
	bl5fCDx+fTNQDGJv0/SwkSSeLfCVSXamEz1eSrLuLJdH5uKTGr3q4lDYcAT4U5JWE1djVzWS2SR
	P/VJ7FJkROHxPPunszMiI49t5dMEwsABwmQgGBVDQG0xZYVpss5ABCk8oCBaejDvbrfwAdqcV6B
	2MOn0oMEFvyRo7s2E3ZOqOmz7KoypaKxe5VhCouo9ehvBBEOmLnL6/WhfWH3cZD9KGTtapmJLhp
	5kgHoNwJy9xlb6dKNlcJdpFhzfuKTQxPVZsxUZBktZiEDcDheljhE62/uG4FEDJkLI7FVYYlu29
	qS06RIucmRpc/h7p65R2GKGlXg==
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr27933859eec.17.1795739721118;
        Thu, 26 Nov 2026 16:35:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 49/69] ctre: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:05 -0800
Message-ID: <20261127003425.2166632-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133149
Content-Type: text/plain; charset="utf-8"

The default tag regex matched the year in the cppcon2018 tag and
reported 2018. Only consider v<version> release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/ctre/ctre_3.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
index 901763f0ad..9f64e5dfed 100644
--- a/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
+++ b/meta-oe/recipes-support/ctre/ctre_3.9.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e982d844baa4df1c80de75470e0c5cb"
 
 SRC_URI = "git://github.com/hanickadot/compile-time-regular-expressions.git;protocol=https;branch=main"
 SRCREV = "eb9577aae3515d14e6c5564f9aeb046d2e7c1124"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit cmake
