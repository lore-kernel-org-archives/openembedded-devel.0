Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B5ED13C06
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18920.1769432716000522941
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyfBUfqz;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2854045f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432714; x=1770037514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BintwLvDcCtgAT+7KCneustgdv8UVv2m1G6ImUELGYU=;
        b=NyfBUfqzDyyqCboa9uPjtDkfs4O+7HOquCAHZJeQEdKQ73UAi9Mtasfm/frk/S3csM
         Nz/ZnjLK18zwqqCa3jQMOwRmXDyzJ/B3KF/4G6W9uI3yiE/zixpUHihPGgcnJvys1z8V
         kjDGLa3AXUrY6Szx0+8gf7RgbyvFo8p/fqqKfSuhtnUfr2k/LGESyPEdNo13o3cP/8aa
         DyfguTelNaIIq7JbcyiRwVgUxEicKTvkf9fhPsTOlk7bnCmN5w4DRuBqvnG6wA6uMLd9
         E7LKIlSOmyhzLxLIbTKAtQ3zxCjzlYEuxSPnxD5A0FBgOPasbZyuo5knsKGPK7/A/w46
         ZJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432714; x=1770037514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BintwLvDcCtgAT+7KCneustgdv8UVv2m1G6ImUELGYU=;
        b=Vbs+lX707+hsHbdYObiwOsZBd9oh9OUWNI/CKQWjwvn7ciOj7E/MDNZijfb4lMxPAi
         KRby9IX/Ry8O9aRfOUD3EZadjSZPBY/yS//ztb3wKe4ucttlLbwTKZ3fv/lw5AcuQmDo
         5fL/WehglO40MmKFBugErQTlOZz0cMubxd6bXe+GXSCSj9zITPky03DOcmx1yNHvma8K
         ew6ArN3KGJ5kRzSYnXIdSgEs5IUydX3npfdbyUOcn9LgDe7D059mxqzU93QjMt3gGTRV
         ug2DajuI5DUGv0V4pzZgzND4U87yydHgw+TMt77a7KLXfAVzRHt88FIbKtoHDszRNEqY
         2oJQ==
X-Gm-Message-State: AOJu0YxqHCzkD7ThAEjUxDJfoA5e+Hj6Xkxn5K2hAx6P+oSzHnXfKrdg
	Ai7jg+lYU8zxb3O9pfxMrYMXYzxMrSHaNkYckY2NRiLjgF1QR6AlcTlSq3ZJbA==
X-Gm-Gg: AZuq6aItmY3yVC7a3YcPDdq1GqOkvXfun8lc6RrKqfn1Fd5pLxnVeFxglh8XuVsOn0R
	TQtK672lsUeOYO0bpx31SrHvXcSoU+IWlWtH46pmjT4VbQXJZUp7b0xFXTYtY7jRXd3/fRvuq/b
	uY8gL+qfMZxAaAirlsB6AN55HlvQn5LEAA/t4E2dY+8K98gsqVi/F7y/zY5bdWu45LQ0HZsCJgW
	S2XgGl1w9N3Kwj3x2/kMdB4P8eTZr+/IQMP4eCl+L/Z9oUmzpwLVulz62PJ0FyUjeCTNqYLf3Xl
	xE0S9OUuWZQa+FSr/mdWE0UIdhmjDxYuB8I2BzMym/3FGtFg+T5dfdZ6Yn175MpZBVGC7X2r2eW
	pr4HzvxFsNOr4I2bujQ3lj18kEt/ojmqBnShTNijX+I6NTvUqhDy/SveOoiKy0xtPVr/AZCKzJD
	U6xWvh/hDc
X-Received: by 2002:a05:6000:2483:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435ca1ab666mr6489037f8f.55.1769432714083;
        Mon, 26 Jan 2026 05:05:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 09/11] sox: mark CVE-2019-1010004 as patched
Date: Mon, 26 Jan 2026 14:05:03 +0100
Message-ID: <20260126130506.82699-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123886

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-1010004

The description mentions that this vulnerability overlaps with CVE-2017-18189,
and Debian's investigation[1] confirms that it is solved by the same commit.

Add the ID to the CVE tag of CVE-2017-18189.patch.

[1]: https://security-tracker.debian.org/tracker/CVE-2019-1010004

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
index 3ca829b230..20af7cdada 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-18189.patch
@@ -8,7 +8,7 @@ into an infinite loop.  Prevent this by sanity checking the channel
 count in open_read().  Also add an upper bound to prevent overflow
 in multiplication.
 
-CVE: CVE-2017-18189
+CVE: CVE-2017-18189 CVE-2019-1010004
 Upstream-Status: Backport [https://github.com/mansr/sox/commit/7a8ceb86212b28243bbb6d0de636f0dfbe833e53]
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---

