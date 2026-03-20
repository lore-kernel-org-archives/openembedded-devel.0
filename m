Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C651099B25
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:16 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18085.1774026127855865905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BsSrRON1;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0bb213b16so3740570eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026127; x=1774630927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si8XD3TZU0Dwh1lBas9SO6rsVINteaF3gQ+T/YtC7r8=;
        b=BsSrRON1vDN9GOTJBCGFUqIdgoGQqEkTp76f8BDl23+fAlEkj44N1QVaUbMUvcz4sJ
         Gky/5v+BNoZ7ZPRsgcfc0s/mWTDQavHly0Z+YAyFsp/joGt1+MLAMZRzYmzMm8Bgbblj
         UKKkRdS0HoNwY21+xi7bH+6d9HsdFjHrshikZC4bknfCAhrsj3II0qLr8TgQLhLZmgcZ
         zb3gUENTAqM3/1SUp/AXtAUhEQbrQCgnYpKXqYf9GkvGAhl5GWAXjTSw8122x/CMi/I0
         UgwnyZO722q3LIvLk+sx8lcZ7Io3mgN8569IJwYrAMNyl/84xxdoovDDsIYpd9TRRvPH
         xheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026127; x=1774630927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=si8XD3TZU0Dwh1lBas9SO6rsVINteaF3gQ+T/YtC7r8=;
        b=Hm2VOOYK7cKOOKPzrYzGVugvKCglk+oPepbUvOEluNW3TPVwKp2Fd98gMZ04uZ6LPV
         d8xafmwBSfOlrRo7xUrlpP0FaJC/5xUwPuUx/GELcwB01Dk3VgLl5XLzsc1H03MZyQ3S
         sk8jCsVnTdyzUHHtsLvNO8guokXQqHco2N3l4L00CjstsYNvwxtIWbrg1ilcnA8hFiZZ
         LetrWQEIh6Ci1gCId/bxxOR5CNPVEr1l9Qj/JUYGXqPkzebBN95g5CBbCGY/2etxitKi
         hFgxZNVAC2xwd6J1306hQNbjpfLj8fi/+zVH3fmb38tejoYzeP3wSXJnWjVYKU0eCO79
         6QbA==
X-Gm-Message-State: AOJu0Yz6YXQr/OQqvxQNGM0I0NhXd0S7B0A1evdJaxBg4GHaMgsWDu+4
	VmDHdn4XNn+DVxhi0YU0FLyaQ8tXdQzjptm93drnri8eaYO7mIxGd1s7DUDFsXjx
X-Gm-Gg: ATEYQzwlfeuBLsrea2R+a1iKD36UmQSnLbhystr+8syfFcskPmd2pQVF3QCC/13wuW/
	MHyB30cZT9Y/FnUaVxwPxEQr4o1v+d08UmsxOVIsq8Vjzn4QEolpkbok87KOJAhDde006yFa521
	ImpG/6SsTOCcti8M6cpZnP8NIRWpOJM0/1yp84yvZrvTV7T/3a+YznCXY/QLxw8Tk0B6Dmk7KGK
	JuCilMze2wiqekVRXt/dQlHi45uez88jrgNwlfJEBfZm7feHyFfrtkHX04kpKFOO9kMPMemrVUr
	VvS7tu0bh9eRYxQqsDKcQGIuhUUeQhUMS4wCaOeLLnpcpLs6fPakv2QOZ/wLDhJCpkZQqWA5dlw
	4YD2xTB/EL4FDkUxAQXtGdls+J8C5Ud53Ejn2ZajqdTEM588BByhYPuEiEPRJ7xJHa/jisvFYDE
	rkCAyApK0836cMF6hSqoDjQWbOHoWvBsEmJI5FtQDOPOEfC5RDV1Jzqr6Wd7jP6C/BlFvS8rtL0
	SO1a+94qaYlVgaGCwqKanNPVPI14ZhU5QG9pL6XGMWgpAoWBwHWGIcwSjZdSnTJ9LWxr/U=
X-Received: by 2002:a05:7300:7496:b0:2be:e92:7f33 with SMTP id 5a478bee46e88-2c1097ecb50mr2425039eec.35.1774026126627;
        Fri, 20 Mar 2026 10:02:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 8/8] agent-proxy: Ensure that OE cflags are passed properly to build
Date: Fri, 20 Mar 2026 10:01:55 -0700
Message-ID: <20260320170155.1413929-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125449

From: Khem Raj <raj.khem@gmail.com>

Current builds were extracting the relevance from LDFLAGS, which is
not the right thing to do. cflags carry the right elements to ensure
reproducibility with OE, so ensure its respected by makefile

Fixes
WARNING: agent-proxy-1.97-r0 do_package_qa: QA Issue: File /usr/bin/.debug/agent-proxy in package agent-proxy-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
index cce85331f8..2ad41da957 100644
--- a/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
+++ b/meta-oe/recipes-kernel/agent-proxy/agent-proxy_1.97.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"

 SECTION = "devel"

-EXTRA_OEMAKE = "'CC=${CC}'"
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS}'"

 SRCREV = "468fe4c31e6c62c9bbb328b06ba71eaf7be0b76a"


