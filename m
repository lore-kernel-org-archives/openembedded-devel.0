Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1197CA5FC4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:57 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3435.1790823834801701066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WJg0tPyp;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8805988a200so3956662b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823834; x=1791428634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xluP7E9CvYug2tbvkzY+l0HTX8Y3nxCkOGkyFjYW+b8=;
        b=WJg0tPyp9ec60k8AnFrPH0RV2vzqTJe3QxKEu8F99KMRzy5I5mki4PjKFC2IZtHBi1
         k7GIUD0+D3xae6L2rxO2nIaU7wNHJFC9SYa1ADtbOPbOTD5eyHN8PLV3V3pJjh4dTI6G
         q8EcGq5uRSY9NoS/LA3+AYWUbmNKQxSm07f5LyDUgpggn1u90YX3ABH/YpSfM/ckQTVO
         VVWddjdsb5nQMazKudkDb0Gl2iuHQinQUfb7eDIreCQUVDtoG8W/yMMdhg+1YWd6F3KI
         w7Whfl/85mxV2GB3os5oNm8oYNLg443FLIFLUn86RJbiyxrzbI2xbd++QLfdzfklenWU
         XD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823834; x=1791428634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xluP7E9CvYug2tbvkzY+l0HTX8Y3nxCkOGkyFjYW+b8=;
        b=LapvyQXvAeS4Xf6Jg0NYsUEsYDgdevJkAiY5S45IgM2vo5q9MfKeIL00+Px2JoJqoS
         stnWKnd6n+XUi4dby26qwr+1lnLIlamaA9VwwjFxRj7MJdSnqzY3FqeWLjGGWul7zeBd
         +G2C+XZ4ZmLM4BSwZmcYpkTSH/Rdk1V2XUkP8eG2Eea4WA3elBHkCbjwaia5KFgQtalW
         QkTQgusT5Y8O1lbs+mjPVkVCkwaUVOEO/Iui7kjLtITfjwV06PnY3uCMLy4SWKIqxRLy
         QYK0vBR8UjYW+WWGiKKq+RFW8TfVloi/rx0dpG9T2u0BRBIIIae51raKs2yAToCD1vzl
         /UTg==
X-Gm-Message-State: AFuF++kqT1QzPfdrBl5cp5/nM2kJ4zgevqyufAXj3VZaK8LIJcOy8DmD
	8ckMfkYpVf0eKWNUe/feqFkfBIFT8PUGObNJBLCHkdEAofcGb/xGXIo0eeqLSA==
X-Gm-Gg: AYBFou1UVJ3Bwut/x+BRXc7gvbAvC2UUAAL2yGrqvB1OHLmzDHs3qv9/kEUWBlvYKWq
	m60h1r90sHpben7SjW9zLLcjv2xpsytx5q7JXunOqaoCsQGdU4adek2SgKbe+pBW1e3IUDi4TBZ
	UYpvGpqbDk3DPOErasXjiGiySBjaQPHHxkJARPNmDEMbfbSE0imqqvCdHO6pdhGLPmmAbCX0ZK+
	WaxthFLgbg4a9aMXwmZ1LoWqi/ZqsPWk/+OP4JItioJ/Coi+OX3/S0V5WPpNPVnBBc30uUaR/AK
	8dZg1G9B4xrNuLsmAqS21D2RYsE3Bs1T/X2L3gNH71D65Ey7+1237mDF1K/Ezy+MmZr6H3jwLzk
	pwYQQxsxwEoetTmHjKbbgKeFaOBN7ZudIy+6ZdfXAdDcfXBfE7jKuKGc3qiK03H3yQUdjkRjZzE
	LdE7wU3gevVi+ABFE4xdlSzYy8n9uGZA+4kmLfXAza9lY+HnXq882NK5To77lvUbelulUaN6QJt
	457Yscm5WMEgZBCLs9XYP4=
X-Received: by 2002:a05:6a00:4c14:b0:886:cde6:694b with SMTP id d2e1a72fcca58-8874ba1ea2amr2493443b3a.38.1790823834078;
        Wed, 30 Sep 2026 20:03:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 9/17] dhcp-relay: set UPSTREAM_VERSION_UNKNOWN
Date: Thu,  1 Oct 2026 16:03:21 +1300
Message-ID: <20261001030331.1581021-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130558

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As per https://www.isc.org/download/#DHCP, software has reached EOL

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 04fe9b9acd..3988ece8ad 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -24,6 +24,9 @@ SRC_URI[sha256sum] = "0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+(\.\d+)+)(-P\d+)?)"
 
+# As per https://www.isc.org/download/#DHCP, software has reached EOL
+UPSTREAM_VERSION_UNKNOWN = "1"
+
 S = "${UNPACKDIR}/dhcp-4.4.3-P1"
 
 inherit autotools-brokensep systemd pkgconfig

