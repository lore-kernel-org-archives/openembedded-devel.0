Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E040C5DF79
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:57 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24345.1786747554965783597
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NXMfqjle;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca88130e09aso892239a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747554; x=1787352354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v84EinAOPtSLQqW6zPKQbGfn2yp6XUzwjcJ1Z++7qAA=;
        b=NXMfqjle+IaEvqFpkdD5YsQyV2f3Z2mVevJ/CSn2hbmAuZu+zhMKLvXX750/NVuLld
         6zzAT67e06HRBEEjAckmVrryFcCZNIu3VM4OeGATwYvtcrMkzil7bVoPAjAFu+nxEcdr
         nlwJCwbO/y/wH2e8WRPYJVWh9PXvRMg2Z+mMZMY7jzimHiGERD/uw07KKO4dvq5nLa6r
         EevlcLgRk7A/noF9PDy89vuEhxtdCzgrZxiMdD3bgUtgKxyVVYmNtO+wOhb73tE/3suS
         1W3muwTl1ARLJEYdcZcrT68Efh2D7pT4e+271vVzfXGfcr10U1RD01acHSNXIonkypFT
         iC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747554; x=1787352354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v84EinAOPtSLQqW6zPKQbGfn2yp6XUzwjcJ1Z++7qAA=;
        b=PNiDH7nM3YV7x1toj8auZi1BcWt2YJzH80GYJ3DA39EWPhceYHuRw2xA5Oy/jxHxej
         2h6TgZOHvhHr7oi8vQTA7veIQgwjABpjN4yS/nS7fFURxlzd65yvwlO+dF+2ka2jALkG
         45fLDocOHCuIk1nTpY3Ktu+umIf8tybcDegiP/hhlSoBFYXHDrZHzX7/8mcoy667Cqjj
         55DOMNGIH62RinTr4cUR0hIADKFFrA2KV2mO+AwxyHgA6Y4WuobAwafxLdYJrybadrG+
         hAp1aYS3gvTUs1GUD+EmyDFNmeBNWtqXkn9iNFzQeq6juE2C73UMcr6hz9Xjwu+mhYFl
         +2XQ==
X-Gm-Message-State: AOJu0Ywcb1CtffBLar6EL1ojvItYIMAXUsZAzASK6SQ/dklpKjr8x6IF
	YRqB4+ekjJCtIpneX18KsPX8JyN1VpX+5A5vNeQ11395yyTlFmeEVKdEevVHOYvw
X-Gm-Gg: AR+sD10LNx9POInA43/66dF1gul+DiprUCA49FefBDWNQREDmYAcO4WqKjo7xQDGmUf
	mifSjTfgTwDC3KuUjiPlZiI+okZD1veGgfNJznLRr53Hl+7HRNlj0hsrxE52jeZ37XyI9ph4kYM
	wbOznQnn/TCNeKK2oJqYV8UAsjTycWEw7OBgiZnctIEZQTx2TQ2+3JfqJMSF6YYM1O6oMNBXFLz
	KxNz2IXDfeFzHZGvch8ZrxKHPCgIEL8weS1ddzO5T+21IP7KEdOmmHijkvnFfTFXFglvT6vRFGx
	sNYYLRue0o2jaq0dXl8aMsr7amHhxT9Fg+Jr1klYCxN5cCLiz94RCZFr6Byd84BS+v3Z+XooVdm
	kNN3zI/b09we33ynvty19HSOQSEx5hD/FBGWYgN/kqQ9u9qJufLjlXmklmUuJcMUf2lNI6oWVPQ
	91/QlK9yu0jyP/oD1b2fm+TgCwL4+ANalKtoWe/QdeKd8EyIf07ffdc6sahXyDa7P3Mq6jqNzUe
	kjjy5kF0jXuqwCqy31KTCh2AcN3KpC/pWbDCOKCY6teG/xDaNgN9UWYjy9eSDxE9zKm2+z4dljA
	+Kf2CILFYkBehbEMA+BzjNwuD4o5Onx3r2fvGAyWwYBMz87pZUyNDd5ZdE1niRv+7YkOa36qO6R
	P4EuATxs3Ze3qVXLN1wIw4ApvLNlp3oWaAYUxqI5VlrPg3Q==
X-Received: by 2002:a05:6a20:d48e:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cc71992308mr10759889637.3.1786747554186;
        Fri, 14 Aug 2026 15:45:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 010/109] unicode-ucd: upgrade 14.0.0 -> 16.0.0
Date: Fri, 14 Aug 2026 15:43:56 -0700
Message-ID: <20260814224539.1523174-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129074

Moves the Unicode Character Database from Unicode 14.0 to Unicode 16.0,
picking up the 15.0, 15.1 and 16.0 standard releases (roughly 5000 new
characters, including seven new scripts, plus the associated property
and normalization data file updates). 16.0.0 is the newest version
published under https://www.unicode.org/Public/zipped/. The license
file (license.txt) is byte-identical, so LIC_FILES_CHKSUM is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{unicode-ucd_14.0.0.bb => unicode-ucd_16.0.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/unicode-ucd/{unicode-ucd_14.0.0.bb => unicode-ucd_16.0.0.bb} (91%)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb
similarity index 91%
rename from meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
rename to meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb
index aaa419afba..debe26f4ce 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_16.0.0.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;downloadfilename=ucd-license-v4.txt;name=ucd-license \
 "
-SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
+SRC_URI[ucd.sha256sum] = "c86dd81f2b14a43b0cc064aa5f89aa7241386801e35c59c7984e579832634eb2"
 SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"
 
 # The tarball name (UCD.zip) carries no version, so check the per-release

