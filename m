Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885ABCCF2D1
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9802.1792302973715676518
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xyyxxu17;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2777904eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302973; x=1792907773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXiYqnpwbhKh/w4F72+m/ee7O2j1rVXKQ2rBRVjWtms=;
        b=Xyyxxu17nJKcfyO5E3QAFlqOwerrokxDkr8EV0qWgdlIw08b5jLdwFtJKGqbDUOB7s
         +Y8n9J5pgswOhvJvi1ETbCoP4hVQnUYQcv9nD5GnohAvq2EsR/EarNnzP0fkhI6BR+9i
         ggfM+LJngmkhDcyvKIa0DgV9Lcl5VLMq2vfCzxqcgufWOZeLlA3kG2JYwzwYDqGUa7QC
         ixyoVdMT4sYF7hqodTbwI/EBFjhLQa/TCeXh7qOlnPgrkUrShAMO70f7l9SDzZqnJ2J8
         9E/ExrzyIB96qu2bYkij5bCK9Dhx2fUlVhSeuZD/ig15BT+U8BQWxy5FQXLhDBdd2V1i
         6GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302973; x=1792907773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXiYqnpwbhKh/w4F72+m/ee7O2j1rVXKQ2rBRVjWtms=;
        b=CFrEaXzdNoWdrulkVudJtHOH1QYgD0wk/Xp4uOoFSHb44PmDEStWp4XGKa2n/va+hk
         GzMdo+xg9yScMYzfwPD89OcdBtmeUllqzcRzYzsQrleU9H1NCVnr19Hc94RMiRD3rFzB
         ShjUuR2Ijfp1c0os8nZkzs++i+xDPnzD/L9dJ2JNOW7v+mNmNpEVNe6gSwpofKEMCjOA
         HtuoDuCPAy4KK4E48cBVNCbZoift8hY/j5+fdP/MHFUfbtBjmFT8NGAwaFPbhoIWZ34y
         5eFCQkgj5aj8/4j+30++BtT/fMrz8a8jj23NwyWBqnxGg0YZ9mBGaObX5cpqA7UqqCvK
         82rQ==
X-Gm-Message-State: AFq9FYLxUwii3MB+L/MShrqxMORdNG+NmErThWUTdaqmXkmtZvFoKnmV
	wUElvb3iaMpMI683B+i3DRtj24E4BW+MSrwp/aueLX8pv2LuG3+bScjnoZUTbnKqOP8=
X-Gm-Gg: AYBFou2YGx4vBxCuUTpKz7gZ2YubOEBhsYNS24v2fG2G8j3Y7xHqnjQqpNZnHo5LXWx
	HY+2h3vQAfqkfVUQE9wcI//xybXdm2+kcSQ7OFkacDjRO2gcq/bOfBZ0JNFOfdgJ3pEpqMNnG1c
	4k/DZiZmHbRESM5Xj95BrYJBe2GsnB763cJcXH2aaVbAseYj0HG4pT8yRAcpV2W1UBmKYjFni0M
	6TSL6HqHDdL/hzyCNyk+IhFCK46R2FQ2nbgqrr3rtXflDYVjdvcwdIt5NYAnYaEDF5L1HDC3DnB
	8UcpS28Kd9qBZgvbfjYsNiI0tOxOtkMcYVxTgGdmY3PvwIR9uEkRG8zXhu6FZUWj7wSG5ABO7ro
	syAEoISA3tMMGCbXLSmBv/zYnNml+Sy3e8s3L+wDbK0eG9EwKq9ykB3bJdELp4Njwr5aJ5gGAwu
	1+GtkXrIvXNdRr97UrLyt/9UATf4W1FSxIqClRFooSAj4drPwwziOj4XzaRL33tEd6yJqu8lKKo
	7kz0rjh3kO5F43Aw2JQmewiBkNT0lFpjWr2heBJcRvQkGRTp6pSYeeOchIXuierMlzt+7l1MjvA
	rGALNQCAVLzXlJr05Nj7ePlDbm73H4l5fY5DBNz4r+23oTdvmhI1gvdxy1WVKixTn0K/qj968F1
	dU2VyexfEhIRfhErIUxy+a3yUQuJcpO3ypVOXOw2xP2Kb8qEoHpIIVXBeGpR/XxOthAzs/alrGM
	EKEI1mxZkESULrvjIMamTmzM9vczSj9f11zk7cT2KMNJ+aLw==
X-Received: by 2002:a05:693c:83d2:10b0:351:8cc4:e18b with SMTP id 5a478bee46e88-361a2053bf3mr7105929eec.20.1792302972923;
        Sat, 17 Oct 2026 22:56:12 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/11] wrk: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:31 -0700
Message-ID: <20261018055605.179605-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131086

It depends on luajit, which does not support riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
index 299bfbf310..47ca9ada01 100644
--- a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
+++ b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
@@ -32,3 +32,5 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 wrk ${D}${bindir}/wrk
 }
+
+COMPATIBLE_HOST:riscv32 = "null"

