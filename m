Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972D4C54E49
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 20:58:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.24570.1708635511234565967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 12:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clkWKe+e;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e471f5f1a5so63788b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708635510; x=1709240310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKJAgSvMWxMRD/1MRvm5f+RKh0ZMD9WzNxgYMesv9j8=;
        b=clkWKe+elibh9uXVQCIU/VJBLzKoaQXdptDkcmFbwYODh2wFkhi6ztsPvFNOO/upsp
         kaSdTjyjakRqRo1WpV6Qj6k1ONP4xiCRoXW+qUfaQM+tcAR5ermPv/Q+cF/M1FaSyWG+
         adTeTnAKnsmVxawnxs+zgWwWhF4C5Xvgc8s7SqHM4+SCqYSKRRUeHd22SFsxKmn+OaqU
         y1DUZl7PB6Nt4H2NDuIgXrJkxkX9+jaaHj4+WNtZ2e07R6MP7o5fUFaaUTvRIE1bD+k7
         0KVBjvhuLUjp8vSBaNGGu8zRRzYsMJWW6QamH0zD7KUTL5BynOAadL2smh1X4vwcKFU1
         QtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635510; x=1709240310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKJAgSvMWxMRD/1MRvm5f+RKh0ZMD9WzNxgYMesv9j8=;
        b=tn2GXAqLJT3492NLIFuw3EXpMJvzxIliJyMNTH2qWyMPsDumrt0gv4ntkzTa0AvMOs
         SThPYR+usk5K/f1rRS2u7KBiIf0Q7eGDEInulgVBezDu0k9FUtdZAtF2jk/pYUZQD1jc
         7V44gC1KkFZsWEowufleDTehdWwUFyFNne5wPmVG9vnHbzCzxiWnXKnqNz3IdqdjZz5C
         xZ1vODpsBZGzfmeD7jhd9V+9aEH3blqUVbDnrlvrLiyyeGRayI8N476C9Qv9kPBr6tf0
         XLeRtf/hk60qLSos1J+rzTFLjexSeqCMciD0bkqZPzPAXARU0NV+f15204l03oyxl38Z
         oGKw==
X-Gm-Message-State: AOJu0YxDJmL2xnVMzKZdTwuU6Lnh/+5L3rwxj8A9kI44csaU6CvndJ/B
	yIf5DwmxAP86TODKF89DYmmRR1JgNaRNsWr5ogMqVnWnW4FaY06f1wa6Lu999cw=
X-Google-Smtp-Source: AGHT+IG8bdtmDIjJoewsUDOzXhYe9O8LxU3KHsSD/oDH0pLrXdw2OZ6XdnS/HFUDQCY5WOf2XLwJog==
X-Received: by 2002:a05:6a00:4f8f:b0:6e4:ce30:ae1 with SMTP id ld15-20020a056a004f8f00b006e4ce300ae1mr43684pfb.20.1708635510328;
        Thu, 22 Feb 2024 12:58:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id y5-20020a62ce05000000b006e2dde36edesm11444010pfg.120.2024.02.22.12.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:58:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/4] python3-looseversion: Add recipe
Date: Thu, 22 Feb 2024 12:58:25 -0800
Message-ID: <20240222205827.2813212-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222205827.2813212-1-raj.khem@gmail.com>
References: <20240222205827.2813212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 20:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108995

Needed by fuse3 ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python3-looseversion_1.3.0.bb                  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb

diff --git a/meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb b/meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb
new file mode 100644
index 0000000000..323ddb4157
--- /dev/null
+++ b/meta-filesystems/recipes-support/python3-looseversion/python3-looseversion_1.3.0.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2024 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Version numbering for anarchists and software realists"
+HOMEPAGE = "https://github.com/effigies/looseversion"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5605fc335ce1bab614032468d0a1e00"
+
+DEPENDS = "python3-hatchling-native"
+SRC_URI[sha256sum] = "ebde65f3f6bb9531a81016c6fef3eb95a61181adc47b7f949e9c0ea47911669e"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "looseversion"
-- 
2.43.2


