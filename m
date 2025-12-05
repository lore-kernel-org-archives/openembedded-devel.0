Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A6BD2E038
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:19:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1269.1764922747709651685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kXWP0kpn;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29555415c5fso22971725ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1764922747; x=1765527547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30DQnTicUaWtK4JRmveIKHNeK62DoQ6Yex2b/FCDCFQ=;
        b=kXWP0kpnLf+w4w3VPrueb4l1iy6DrV60r8L8l6d4rzdUIGgM4p+V7pJPB0fK8uFPGL
         ftdfQS679/DQwdTEHo9qmHONGJe0Yz63brkROXSVDz2Y2A/wF3sVYBSSp1yG6IiPjZsM
         BBw2dl5kl1j/kmfMiDOQkBZ0w7lkaG4StfE5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764922747; x=1765527547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30DQnTicUaWtK4JRmveIKHNeK62DoQ6Yex2b/FCDCFQ=;
        b=nztJcgjluIp5wTM6k0QUXITlfWz3cxr8TTnPyzxWrleF2tUOlQ0tg0CQFge/VqXrs6
         O1336UHj/1FkyGUp30WqHOpXuVk69WKH+wt5m1VCAlg7f25oDcJEqGMx1lzPIaGKjzWx
         Y01w+MRmeYFzp3+x6oLrFYm7VNk3m7FafAeqf3Oy7ByTAPH7oCfR3GlQkh41tdAXkFaM
         mE9HlEJJUusf9St1IgyAaGxaDSjcI3tF37BrYiKM8ITfQHIbL/3GXvK0edvGU0QZBJHP
         +0RJQHxpMuwv71lrpWYNwUeCely33PoivTX0sSigaH2idhQgbdQTyRfsNjSALuX6WTqQ
         cvqA==
X-Gm-Message-State: AOJu0YxPD+biZKDMJHhq9u52hVjE9atVtznU85Jfr5vYl2OOTUA3ot1W
	+hDrGRtEcZPG+C/kzpavyhh9BjoXAbEriUIxG/CkZ78fqQ14hytC5T5h0Hy6EW9othWm+tFJZ7r
	crS3S
X-Gm-Gg: ASbGncvGTGn17LLxRjx6pKAEYd9aqLp6jQlP/UcabdLYB2akV0vQUEL44rUFkQ5ezlD
	Kw6ORCxKaUfpQXfwhBocdAJ9IiImLwLHtmroE5m5DrvoHbWL4kgyH6N2Ka32mdHVNsQ6JVU1qjC
	0BW2J4cz30vswmvDqofRkOaYggCKCyKPqpomV0e3DDtNfMrFsSB/OJn6PKklr9pDlj06FBi0VRe
	VZNOlciR1q1asvSUrxbirfQgitvIIRwQRWnQZ/UxJLfgceCsp0Arvr2plcF2VRtUSaAdSf9LgCe
	BwESncPUanLqeuD9jVqslU9YpaQ2llywjLcwDgkGC/QvtZ3Zb/kU/j6LUSxOn3C33Rm0SAvcC3f
	7+sD6RFpRRDVbbfW8ywu3C3ywh2U6ol4Qg51BOVx0MhRslQKbLbLFPX1IFM2ZFfXvHcIdlGwnBJ
	YslQ1sHV33hRFk6/0S3+1XNCs=
X-Google-Smtp-Source: AGHT+IFDL5AlYRH7MdaU5f0hYcYDFsyKthGyiaazj1mW/D77nNCbPWIIFRgw5P5GFqZDfj622j7h0Q==
X-Received: by 2002:a17:902:ebc8:b0:297:e66a:2065 with SMTP id d9443c01a7336-29d683dc2acmr106411115ad.56.1764922746601;
        Fri, 05 Dec 2025 00:19:06 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:7205:8451:cf5d:1824:de5d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6817397d0sm3921514a12.6.2025.12.05.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 00:19:06 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch 2/2] net-snmp: Update Upstream-status in the net-snmp-5.9.4-kernel-6.7.patch
Date: Fri,  5 Dec 2025 13:48:40 +0530
Message-ID: <20251205081840.2716037-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205081840.2716037-1-vanusuri@mvista.com>
References: <20251205081840.2716037-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 08:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122341

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
index 3f978d5f80..9111ed8ae2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.9.4-kernel-6.7.patch
@@ -8,7 +8,7 @@ This breaks the hard-coded assumptions about the Ip line length.
 Add compatibility to parse Linux 6.7 Ip header while keep support
 for previous versions.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
-- 
2.43.0


