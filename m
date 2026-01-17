Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1CCC98322
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:19 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5739.1768643171822029534
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9/y5xvd;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0a33d0585so17683275ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643171; x=1769247971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBfcWNr1J/LRXgDlYYTehfAgrjvHV09FADTJUiaM1UQ=;
        b=C9/y5xvdD/3/T/lSRLyLAlW8j2olqiavTTLSIxKwFdoxgcH9fhzOw2ftMf246WSKML
         cpg6gGs2qVq/Wc/2G8pUhdL1Dei410oqUJHBCCjq7sXygwHQI1o+ERKdRdpfNsp3PadC
         xFe6Jhgl8ffrHYUGqOJtsBX/Sl+6JFQx6jR1YLDdLaeJcvjg57U5IhOPUFo1mqDXWRHq
         s+Y1bK/UEjas+x19LWtf3CJHC3aBekUOzEiaFiU8d+xc/HXxyvJf9Gt55f6v2VEZmjJW
         Y2M6ffnNdT1XWXpa9J5UStaA0gexxwbItwmTSmw6HJ6x2QyF+FqyzUt7Afe+sbcCIQnS
         iwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643171; x=1769247971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBfcWNr1J/LRXgDlYYTehfAgrjvHV09FADTJUiaM1UQ=;
        b=v4Sn0/y7fnNQop5+l1m7QnpKBo17fCixXmHWzbe5Tyork3Zxqi3pmzspeXd6cqInyw
         C89IocuD3JHuF9zvvKT21h1y1DC/J3RzdGtaHIoE7E0lE3GM9oMxbSVwCxrMLdnchcpL
         SZPaGdnoHN3pUrXyKE1mKUPr5alOG2vDFo59KfVcI+IP+TdP0SPLfewW6LdLeVdd739Y
         pqULxL2h4D53B8yYDHobMCB7kuBhpE5CTHHqXVC2EBZbTCWIAU/hqSRmq0sx4SoQ2pBW
         M4a1xZ7yuFeOw60oLrJ9Q06v1NBCb2kPCfo9TVSHt0+vCzkIvqZSuL5sVd/STVe4QgQ2
         GcFQ==
X-Gm-Message-State: AOJu0YwHfpPmB2ugL4Fg4MHlFYtxBBLyES2bhe3FxhQZ4VqgMFfc1p6e
	dUvpeLjahBJiEBPUqOWvB5rHYeR1YKqPnOT2/sYL4ftsqy6ZyEQdcIEOsQXqq3Qh
X-Gm-Gg: AY/fxX76PTGY+aiU6EkUv84QOMobNQUnbn2s7Jgfjm9NlxieHkwAmPBXQc6L1PZ+p9s
	YBFG14786ll1srDTXjEtt9KvGV0KUKB+XgfSrmvGYlJOnXP3PI3+vXTUTwAqJT8j9SG2A/rPWX3
	rbZYpubbms3o+uRunNzzl6WISqOi94woRkPFGRLCWk6tIi0uXMYuuQVe74ycawoPXio5vZZgxN6
	wyf72bwjkxd2MrO9wbB/d6nSiGwLQhkBou1gew0HD13nAR/saEJJpzdJhTHaL2e4/UfiUYbSYaY
	znas2Y2EGtBk/W/kaKBV5++0NGhuW0tYcdjecwwVCgMFK5qHXGzLNvSyqgjlg107PqZ2oFQ4j6G
	qpNyKno7uth4lWxW8fwufO2wVFqRYQstNupLKAF2XbNw6KfLyqf+MltW4GbqK1vLz/8Izacg0Dd
	Sb/Ud69D1hrM1E1pqcLDFCJvg=
X-Received: by 2002:a17:902:d2c9:b0:2a0:8be7:e3d0 with SMTP id d9443c01a7336-2a718859fe1mr52565375ad.10.1768643171000;
        Sat, 17 Jan 2026 01:46:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:10 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/6] boinc-client: fix hostname reproducibility
Date: Sat, 17 Jan 2026 22:45:32 +1300
Message-ID: <20260117094535.4191231-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
References: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123549

From: Yoann Congal <yoann.congal@smile.fr>

The generated svn_version.h contains the hostname which makes it
non-reproducible. Fix this by removing the hostname from the file.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f23543fb6e8dc8af1f50058ed5739c4419e462db)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index cfd134dd4f..624be655a5 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -78,7 +78,10 @@ do_install:prepend() {
 }
 
 do_install:append() {
-	sed -i -e 's#${S}##g' ${D}${includedir}/boinc/svn_version.h
+	# By default, the SVN_VERSION definition looks like:
+	#define SVN_VERSION "$SHA1 [https://github.com/BOINC/boinc] ($HOSTNAME:$S [client_release/7/7.20]) [Server-Release: server_release/1.1/1.1.0]"
+	# ... remove HOSTNAME and S to make it reproducible.
+	sed -i -e '/^#define SVN_VERSION /s#(\S*:\S* \[#([#g' ${D}${includedir}/boinc/svn_version.h
 }
 
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"

