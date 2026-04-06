Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE64AEF4ED4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53492.1775477010664047486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BsTzmKqo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so2237823f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477009; x=1776081809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPL3MuGbLk9KLhGntEDHOwXuQBz5TrAXCSRpo+GgseY=;
        b=BsTzmKqoiH+LXM11M4CdA76VwBa0JAClWe/TbkmRxukvIHiBU1eFBzsL+xQESLFnPY
         lZ9zeDLQ8OCcTYznNJMLDvK/tz4Bl4qYHTOLUUPsIkuSotb55tZgGki4LMcdECoeJvKi
         bKQfcLcSb/z2TBdr3140ISBVSis5fmtb1306byZDjH7yfSabwsBADe/uoR4LsQOaO63b
         4UUEFilQKfiQWVrXVSSQEX5DxrbWn2RetBN0QD79xzll+E/+UaV3viy8q+qZcWZqqSDh
         x5yf12yzwyLmdt9ketK1pugSgEQ52wuiLtEgxdfb/dCojhWaghdBJWtbWMa21cwLdoi5
         tllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477009; x=1776081809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPL3MuGbLk9KLhGntEDHOwXuQBz5TrAXCSRpo+GgseY=;
        b=IAUOwkvcCeY/Mt8Z5W6g7Ovtz/M1HuLWdBzpWpZQofYPquiU/fdYTPAD8xTsUTcZed
         44x2xtp+l+U3NDBhc/Io5qkEls+urbBsc4OJMNB28mM7mzjwsAh53UNxiLsWt0HlFqdM
         oNDoYRooZQuFv5UnxnSzKLUMCYDGuv9x0XFdADAPJEZZNSAseDPSm1dIxCxnJMwjzgKg
         HmpuGNuxr1UQiMzRTzO/IH1ZYqgVAz1n3B4oxuCN0RC01I4nSfim62oudxgvstwNrpho
         YG9pwTnw3qna7onQno8EiRyVmCnUu+hwVtFzVoVlBWEsDoj30oiVYUt5fsEPzLIK7QqN
         Zvog==
X-Gm-Message-State: AOJu0YylyZ+Tz731nCaf4D9WP+54KllrWuMQ6gT0W4YgHzOFqLumBy73
	+lhg8xRPYulcu5zndD9es5usS/KmH2BdnhIPj6za6NrwrU6ye82aBvMbt3ck8w==
X-Gm-Gg: AeBDievlyJLrGrakZ1pNZc+IHbDZ6RFjorW0cIRNvlKoFZdNoAjav2R+XdnmlBhIDv5
	kLFJtDXmUdSSU/S74lkN4NQf/0t12OEZJFbB6rSYk1bqsXs3szXoC35J4YzMN+9LqJDTTzk4djv
	eFeBwONQZJM4PEhzjZC50Q6GBLEFDkCuJBcOqA5zhhSLF/ZKkYUNX381B91s/rxTbHPyAbpwafU
	I6n+gE6mVdMmmd1GkUnY5mtwal6Jo/jRL6ws27lOycyJdkrSli7pWOby3ZpyitO8pWBPSOaDaeq
	+w5zAzuTEezZTJpLjJfTFA/8B/NidmdqBHXiOeoZTVY/d6eSJZsPxopqSJabwZ7CKsDjAnAZYaM
	BWYMXXd/Ag/prv1pujS0xTTGqu461Xw/YIh90jfvPiwN36rOriscONok6zpwpGpuYGU3lO1/s2K
	40b6YG8I0zpYJPP1XzDHVU
X-Received: by 2002:a5d:5d0f:0:b0:43c:ff58:35c2 with SMTP id ffacd0b85a97d-43d2929dc19mr18775028f8f.20.1775477008840;
        Mon, 06 Apr 2026 05:03:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/7] libraw: upgrade 0.21.4 -> 0.22.1
Date: Mon,  6 Apr 2026 14:03:14 +0200
Message-ID: <20260406120314.3514982-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126044

Contains fixes for CVE-2026-5318[1] and CVE-2026-5318[2] (both are tracked without
a version by NVD, so they are explicitly marked as patched)

License-update: copyright year bump

Changelog: https://github.com/LibRaw/LibRaw/blob/0.22-stable/Changelog.txt

[1]: https://github.com/LibRaw/LibRaw/commit/5357bb5fc67ac616838fb84de67260d45987489b
[2]: https://github.com/LibRaw/LibRaw/commit/2468614a9cbcab6b75ca279ab60cac62156f7aeb

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.21.4.bb | 10 ----------
 meta-oe/recipes-support/libraw/libraw_0.22.1.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libraw/libraw_0.21.4.bb
 create mode 100644 meta-oe/recipes-support/libraw/libraw_0.22.1.bb

diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.4.bb b/meta-oe/recipes-support/libraw/libraw_0.21.4.bb
deleted file mode 100644
index ef0a0255d9..0000000000
--- a/meta-oe/recipes-support/libraw/libraw_0.21.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "raw image decoder"
-LICENSE = "LGPL-2.1-only | CDDL-1.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
-
-SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https;tag=${PV}"
-SRCREV = "9646d776c7c61976080a8f2be67928df0750493e"
-
-inherit autotools pkgconfig
-
-DEPENDS = "jpeg jasper lcms"
diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
new file mode 100644
index 0000000000..bd0a4c0b03
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "raw image decoder"
+LICENSE = "LGPL-2.1-only | CDDL-1.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"
+
+SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
+SRCREV = "b860248a89d9082b8e0a1e202e516f46af9adb29"
+
+inherit autotools pkgconfig
+
+DEPENDS = "jpeg jasper lcms"
+
+CVE_STATUS[CVE-2026-5318] = "fixed-version: fixed since 0.22.1"
+CVE_STATUS[CVE-2026-5342] = "fixed-version: fixed since 0.22.1"

