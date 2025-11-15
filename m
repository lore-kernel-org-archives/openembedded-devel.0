Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA871CEB2FA
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:19:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13810.1763230751939823678
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBsPhiKh;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b566859ecso2158341f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230750; x=1763835550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie7GsmXu/4OEGSkaGUxXhKRxe9O1r5Sfu/bzDNp3KOs=;
        b=LBsPhiKh9Lim3iw+bjkUZGq6YFfGqPs62zBE9FUXUhNFBxf7codaSt6bazI1sivxn0
         FR3Pbk8LwL8IjI4qZRDbRjLgbwsiYc/FXf9LjWyYHSRw2wf8/J3+FIaZRqZ1Nz+XwHqA
         BXNuMCBbO4qyY7Tk0ugFED7HvdGdHN+KjDGNEdaJ6JDNc5MYn+FWrk9si+eAxKsfiYf5
         qvQDIIw8MdGQ9IPkj7e+zDj+bEd5IJapypu5fYACvUykz5nCNDmpuv4dUAqKDDA2zPSn
         YelOPvZ+6w+hv4K2CxdPfxBSKlEs9G0jYWALKtca88tDd0jww29sgkw1oGJfAYnvcgfg
         Il1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230750; x=1763835550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie7GsmXu/4OEGSkaGUxXhKRxe9O1r5Sfu/bzDNp3KOs=;
        b=mO+Ju15e2MiDn9nyK1/IZ3TqfMDkfqsWqs+Scn+ZqminyD/ou2WDSV6rkDjErfCkgk
         LfQ3BJaYLQW95ms577bEMKzMSimzUmBv80Har9wXGQEF8Yxa7ntAVBOFpU6jxD9BlHfZ
         aJ1HGARHHZG3ABbE4BXW5wfteu5BHJPs5hfJgJg5di/e1lYIq2dFfV57tQjbIgZlTuAD
         w9wzjxdgYrVsTwveYdPNu3NoCfERMgr/gb0FCK9nOEaOtT1QCXPuuW8g3QWRiZtNALnz
         4ahs+xSnWxBaQWb/mit8kynkZLvglDUW/l6WgbX6vWS211zoI/dDu1pCRX3XIGqrQcPd
         R+7Q==
X-Gm-Message-State: AOJu0YwxasefQVKIG/YuKyZ9SyjcfazTNAC7nKpcfNvcsbZJvYKbxNiG
	B2Reqe0Ta1feI2Cv2Xm4gUNAbWcClWYg7p5/OkTwZfS/bH+NpOD4e8MjQK8uDaMx
X-Gm-Gg: ASbGncv7UtvQ6M/ZRs0jWGGpl0pqVHECTIKAGHMPsFQ+jNkQKtJ8kIfaxvhqfTMrJT4
	BFBwWjTlYts0ORLazsb+NTEKywoziB2VGJUAb3YYT3NcVcadVAQZCiXbHiAZJ7CF0kzp8xM+Vda
	O+o95ZtXThbDMO3/Voqe0WlP+yzRjDUkKNwnxR8VqJssM24sizTFvgTINxjjhtRawxeL4FYhGaZ
	HUe1Naf4sO/7ewQJEQHb7n0dCVz3wZx4Acfs7nL8Hf8VUOhf+L9B7VfYQkAMHTeVtlFGfJgAGOV
	l+rKBczTMq+C6KPxYgjuiUwlSvCVSmj1qtveTa3jezh7B0zRV9A4irliGQiyifJoINTb7WwMa4A
	qbT2vVCMxU3UcEsmvEIjh2FdreJH7vhcM8JaDSVnogGvm9W1nYma+NOm/cYoXXKHAzeuA2qjkzn
	Zwx3/l/sYFnaz/gfCGMa4=
X-Google-Smtp-Source: AGHT+IFwDqIU6HjhkXF3Y4Jdkm+VWWBN9MnJxwAzSwC5D/bzTGb/hCw39ItBViy/qGgvQl/2cvMmeA==
X-Received: by 2002:a05:6000:1a8d:b0:42b:3d93:9a27 with SMTP id ffacd0b85a97d-42b59385c46mr7359578f8f.36.1763230750113;
        Sat, 15 Nov 2025 10:19:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b60csm16882562f8f.22.2025.11.15.10.19.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:19:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] links: set CVE_PRODUCT
Date: Sat, 15 Nov 2025 19:19:09 +0100
Message-ID: <20251115181909.1262253-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121742

There are some unrelated software called "links", which cases
false-positive CVEs to be reported by the CVE checker.

Set the vendor/product pairs that were historically used with
CVEs for this software.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/links/links.inc     | 2 ++
 meta-oe/recipes-support/links/links_2.29.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index d772d54aff..a255f0ba6b 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -14,4 +14,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 
+CVE_PRODUCT = "twibright_labs:links twibright:links links:links"
+
 inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/links/links_2.29.bb b/meta-oe/recipes-support/links/links_2.29.bb
index 311d84e484..e3a15d1819 100644
--- a/meta-oe/recipes-support/links/links_2.29.bb
+++ b/meta-oe/recipes-support/links/links_2.29.bb
@@ -9,5 +9,3 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
 SRC_URI[sha256sum] = "22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998"
-
-CVE_STATUS[CVE-2008-3319] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different links package compared to the one which has the CVE issue."

