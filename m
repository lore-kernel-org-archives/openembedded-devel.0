Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0F5C3DA4A
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.48486.1736119445836616851
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1DiUgJB;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46c6547266so17144383276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119445; x=1736724245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZM2xUpVq2KDHY3ucgkyVCmoSX3vYd72Dg6qZD3Pb7A=;
        b=d1DiUgJBEVl/IBj3pk64rAXjoPQooQVk0tfh1bsFflYWp3epD2sYPV5/Jy7YGDS4lJ
         J0Hr8lFd1nJpZjU+FCv+E5218FnMd7gHuOtLVZLKWC3wGehewGliNfE/CnrAgDDtgHl1
         H4Z9njA4PXgrae6VoZu0SfKQSnqsu4RFcovwAGdF+xIQsFGrtJSWVKy9ZsIlUfuNnaIq
         mgIXXqdacse4ZECYv0B2Qce2BZ/8+eR9c35I5RklvAfuQB99fctdXjZbaEvapkLlIJGT
         ltDRK2tZK/SlLV+ghCzUX8qja5gmshxM4lmZefdQMLfRY4xqdKHp2r5vi8wHwtkHq0M6
         fnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119445; x=1736724245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZM2xUpVq2KDHY3ucgkyVCmoSX3vYd72Dg6qZD3Pb7A=;
        b=bDEztSkNRruU1F6aYYGT7TJ6xQguSHf6o9IeiprLnv5imcQ7tT0yxKbzP7nKbO2VQY
         MC8xlYMOAnCKw1p8gB8ivta0TbK4K67dF1QHvRf8wqvPYjMbpVZXGxupleZF2ibEt014
         m5QEyR5EHTCo7Ga2QDub2xxyfkApvcgjH2MZIBqtzphdsjb9PZ+kjeKZ4uKkVH44ygCE
         B9qGWyhDSXD8o97AFESPOu8Fq9NxGJPRI/YIXteDy3N50wyg78hySddq+zQjfdTv/pXF
         Y22tlWxqUnOXYM6RMwkLAv8xgF6GkcdmD2z20aGoPstHCxPI0pmURqr7EIfzxTzJWqEZ
         X4xg==
X-Gm-Message-State: AOJu0YznaaNTYn/Njc0jI7VT3/WzyS3zaHa7nSXE3JwodbGJRIGaRvdr
	p7fa79B51/vt6QLKs47k9TNmTPIQzlIPqH8+vIaAoadzRHuRoDzFrOFrtTry
X-Gm-Gg: ASbGncve5AqITodvxYgxZsiOb9G28wqVZrOFy3gWCaZAQ37VUlbc3NvNDciyHWBTD+l
	c5a6YCbYl/AzB00g9MrU6KnPCbHDh/o+JDWAob6lr2uZqpZ7w0O9aL69f2MfqiIj5pT33sDosoS
	HXJiWiKElJo/uXOEeXxoXnlAfTwqFhKMM8UuuuReHUFU88jhvsavExlGXp2zRnCYrSlz9HG4cjr
	Ax2p44UUdFlRfiN2RHhsRGjucz90tEnUDGvj7Oe4OzvH1TVGWz2HrDDat6UGvLkTyHqiw==
X-Google-Smtp-Source: AGHT+IG0UdHEasIT4nbarVthk+TuvZVnhg09bI4yPE4yYoT8S2ZFBPiOSUEuptOZLV/CYLf9UBdB3A==
X-Received: by 2002:a05:6902:200d:b0:e39:c292:9f32 with SMTP id 3f1490d57ef6-e538c25dd03mr45226047276.20.1736119444955;
        Sun, 05 Jan 2025 15:24:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 10/24] ace: ignore CVE-2009-1147
Date: Sun,  5 Jan 2025 18:23:43 -0500
Message-ID: <20250105232358.1502946-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114639

From: Peter Marko <peter.marko@siemens.com>

This CVE is for vmware ace.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9bd6efd135efcc2e50837a8e70298ddef9e2f432)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_6.5.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
index a9bdbc916f..46e4795a14 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "739be290a38229aaa5b5150e6ea55ce427e80970f0ace4c5040ac46644
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
+
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"
-- 
2.43.0


