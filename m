Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD5CC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.687.1787286952817650086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k1M1j7hc;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-395cf2535acso130398a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286952; x=1787891752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oge0uvMmYW42Ne9KKCd7puSwUDTi37oGgzsXKKheDds=;
        b=k1M1j7hcoEqgC1A+/dZm/x2fzSbm5dVh+EiDnDZPLeLMs1CDoNtugjuEEdKZbDbad0
         TVI4Il3lhsItk7xbxILBx8Rw8PyUthvFSj+pjNVX5VCEy7ca5YbSMLFwr0SBssiKpowt
         oWUhxON6R0u2IT1YqRIorp3u0VlX7Elr8/9N6TUPaQq/Oja30sO+Z9eNVp45JVa7cUPr
         nf3uBE5+kgTNGHLO3eTPbm4u6sBd/6dWlPr6KyDDzWmSdm/IoMGb83QsZNsH/5danNwZ
         WjimHP7Mr6086bud9piONvGKa5s0qKkgAF3Hp2v3KzJswJyJxx6YrXYmFjne0EcVBkgo
         b6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286952; x=1787891752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oge0uvMmYW42Ne9KKCd7puSwUDTi37oGgzsXKKheDds=;
        b=QMJk4Av21bLlYdIp9JTt2TgEWvMf2CkMw8VxsN9QoSvc+T/sR93Y2YVY4C3xHO3SHf
         I7+q1wDR63qBg/lIqo9cVSKMm5gvVPMlVWEnhQoGTTBF3IBxqiVA8xvB8s2OaY+GKtBW
         LpwtYbPF3Xi7/drlU+W2dRPuHTVtWWwOtREDYYyOYGQqwRjK0eZF6zOAokX8MKu4+hNn
         1fk+I2lLefb0dUrEdRBsw+b4OL8B8GRKkeyeMXsdbLNlOTjNucEQQ51MuZpzBSZSGikK
         5BRamfFxC+NnKUnTabWlIYExcys5m9vcsM2wbRDiA/Oij2d+x/1YrTVJ12zOorrqz639
         dTlQ==
X-Gm-Message-State: AFuF++lDlhBvqLkt+zkQeeSX7+EqJHQfL2xcyMguGrJvByqPhBP+G+sE
	P6HquNfpWbmk6YL3Knt8ilz/toNAZhKtXevVGJAFnDfUaOhoKocHW1Bb8+ctoQ==
X-Gm-Gg: AR+sD13uu11MMjJBCtfL6W6kgBWo5cafyhGtLPwmHXG5nYpGpAp5pvPkmpxvhq5FO0r
	8nS2Y2gie6aGYRox3taP4fmQzsERUTh/VgM4No07RwJtBAbc8Ua1HZ03g/c3L8yb8fWBLNe6dD5
	Gn3LKE1WXbdz9CjtcZE0R5FrdRdgdEidbu3apa8SSGvehviiXct8sNwEmwMeRWEjcFgFbEsEELz
	vh/A1E0n5Wj4KuPdIFouVsMweLfHnIm6wGEWFFoRS0YRNDYjYWi7PJrtQhn+cUEL9mm2Ah2jNDt
	7nMugCSL3HKOndtgzqPjXMmJnhYwnUuzBCglyaPNCvBXyKwUj6vna3wlAz4G1JEhqS2dIlZG5H2
	R4YWBslFukxvpkA7HMP6KdCoWhyh/V+jDPE6cMuzi9elEBYnhXKaLTa2hUvTLndfnb+/PrclmnB
	uPOzLt4tmKrStfdW9OmGbxaPF71+oK6CcBzAwh4xHT2I5u7YEhEXJZ5hOZXGzrJpfMCKL/gLXah
	2aDmXuDFyOnQA==
X-Received: by 2002:a17:90b:57ef:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-395a06363a2mr14288961a91.12.1787286952098;
        Thu, 20 Aug 2026 21:35:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/15] libpaper: fix UPSTREAM_CHECK_REGEX
Date: Fri, 21 Aug 2026 16:35:17 +1200
Message-ID: <20260821043525.448011-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129403

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libpaper
...
INFO: Current version: 2.2.8
INFO: Latest version: 11.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb b/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
index c8680eb128..83932d3830 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
@@ -5,7 +5,7 @@ SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpape
 SRC_URI[sha256sum] = "1e330571690191874eca415ec76889dd11bab9887a2302d6a3665cd081c4d77b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rrthomas/libpaper/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 inherit perlnative autotools
 

