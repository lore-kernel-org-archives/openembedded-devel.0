Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FFDEE4983
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66708.1767109750990520908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eNbFSuO/;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so100836745e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109749; x=1767714549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSX9f+go3xbXTS8CDFDHT9RFq/Xl1BQVz4FH1aJ4ais=;
        b=eNbFSuO/4SYp3PopTL1hv6p/Y3nuzkyDodAAvHhJrRblaqxtxqEtdWiZIiPfpQp9DN
         /A1pneXHXECc+e7b79H73uHwb5Y8hxJEum40TZHmWZ25kB/tkOrMswwePgeId1K3h85L
         zVTmGHta4c6RtsFOTXdHrK3Z+t/zBl/o2dlJzJ5RWUK7MQsh1Ib4FgxaryYMvI0V5RVK
         1jLcDn3zZFVYqtbfGY/VzH9OnHm1vV+5bvLTokXoU8rFHXFmtJerWtgfHrHEHCMROF7n
         3+yAV+3vpcpRAK+kvL2HoUEnXFy3hgvNhRSo7/n8o3fKsb502iiay5dWSldq/E3YWp5D
         om/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109749; x=1767714549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PSX9f+go3xbXTS8CDFDHT9RFq/Xl1BQVz4FH1aJ4ais=;
        b=uV8P0go5fD0GKtg3X9icy8mbdlw4hWryQ3anJ7wlpK9h1Y2e2as0u4OnIoNCAavdTj
         aHHl8K7cJQbUYTG9YjsT6Z1uGMfvlr7lQV03Eb+OE9qM8Qb/wHSkG1jynrmMwEKWdNEx
         /zVtseFfOoFqc2Rh9FP2YfhcnH/AP4YpeMJRg3a406KcN5MTSVIVcCdg+LGzTncNNvlI
         s9abCYexe0iBaKtDzQqcQhIkI4l2fyuwhvmeHYGK8tDOJRM82FQM6q+TR1rBzOFy3teT
         AmOk1EkJ7TzI7wwuXa5hENRUYFQxXIV1VLL70ue/dRE2DTEvcncTQXA2us1HPQCOAohq
         LXbA==
X-Gm-Message-State: AOJu0YxWlMwxnBSsZ4VEMimWnMTUJ6aVEY/eeYJRi3yeQWKnEpoVIp/D
	SRtqYIpIVUCW+WHQ4/xDeyyuXeKS4rzEaJzfH6/hPPZU5XbVTOQVmU9W3npPPw==
X-Gm-Gg: AY/fxX5hsiapMPkogG+34q5xB34HM5qlnxNBXDwb2/Uh/EWL3EgqOtFXiEZscxFFPgT
	RBZtFWmJAmwmIhd1yZFq7jL0ILFV+qK0Nny0g5gTn4PQvGURWzdBBHkvlq3J0ZJfXXAHPYh6Abb
	6Mp7ArAoOg9670IWhEC4jPef6CnJ/L/+8ZXF2yhlN6nrNLJO1UwrG4kWBRIqqcRpWHc/GdcSYyI
	8F2KSva9azQOhE0vtW+jaV7tCB1WpuycGnOpsrqGs39HFIxfTzF1uHPX/HbqXlkmHtUtH+IquyM
	wwyGdOFY65Afva5Qkq6gvcak8bgOGefhPBmHfq3QAAl/Ssy4+8nuCzNSaJSB8S3IRjlJpJFYMNk
	hEEfSZiW9odPHc7M0mncQIwILMS5aXmVm7YP5m1SfRsNvyChcpPsr/HoQUW38iFUBcYLCHztK1U
	IAqhdUpMuO
X-Google-Smtp-Source: AGHT+IEgFljcdhcXtZZYSk/RGbRPp1bAS8gs5VILYydlmDOGVrNZqD/5yJGats6V/kIlOc6PkM7t6w==
X-Received: by 2002:a05:600c:444b:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47d1953b77fmr348628905e9.5.1767109749253;
        Tue, 30 Dec 2025 07:49:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 07/10] python3-reportlab: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:49:00 +0100
Message-ID: <20251230154903.736590-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123032

The relevant CVEs to this recipe are tracked using reportlab:reportlab
CPE, which doesn't match the default python:reportlab CPE, so the cve-checker
misses CVEs.

See CVE db query:
sqlite> select * from products where product like '%reportlab%';
CVE-2019-17626|reportlab|reportlab|||3.5.26|<=|0
CVE-2019-19450|reportlab|reportlab|||3.5.31|<|0
CVE-2020-28463|reportlab|reportlab|-||||0
CVE-2023-33733|reportlab|reportlab|||3.6.12|<=|0

Set CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
index 4c411d5716..3ea47e355b 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
 SRC_URI[sha256sum] = "0457d642aa76df7b36b0235349904c58d8f9c606a872456ed04436aafadc1510"
 
+CVE_PRODUCT = "reportlab"
 inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"

