Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C735C83F2D
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:46:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.15736.1752648391472143223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P9TTehnm;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b271f3ae786so4727664a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648390; x=1753253190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLuDURlBMwyXMTFMj5l9fJYZoLMcK+ppstGRaNN+80M=;
        b=P9TTehnmxKYq4sFVG9bubiYctf3gUPdFuLuvP68X688kNoGq80Wm3V8HaaDhjKJtmv
         Aj/w3WE33n+I8Mln7PK7inGnQuyMBgSXo3OHKIl9RQ2SrNg/2J1BR4Yl+X1HeX0wBRdo
         0a1ouHle/offPeBOijGBgDNpmPtmFrMB8ZUtkA9HdoMkDygHPFW4ZW/a3+BEtX+Qx1vD
         OcslkprYrwvGeRQR8IIyrvo69AFYLN4BvZMzLhvhV79Yk5mZr61rl348pq3N9FRaP1fn
         AZgWRK3uU0UF9j7soa0XIXgEOQDsyP9A63rZGMODcM3dfXDL8+xMJAsd3/3Q+SjGostf
         vefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648390; x=1753253190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLuDURlBMwyXMTFMj5l9fJYZoLMcK+ppstGRaNN+80M=;
        b=NvnHiwgf4yMesyJ6D+3v2wUyjixq/dtoLgLPxgiWWiES2nMxFFpBtxKQjhZwTth448
         R1PAo/0gvVIDs3AuXUeVJsS2Rj/lqeJvBKYzle+YnQymuErrlTJSXONh2iAuIrxL2Y9U
         GVfaF2a73j0c2hr493Akmq61gDFdwvSWHb3BgxjZg5c4oJWdqgTmsKdkRZM8yW33vE2k
         3P/ioM8NgGg+u5dM+2EkXi0cx97RJlg7viYC0GZYwa51VN4BTFbQR4CuV+0x3bPM6sdp
         o1r1gernRsfjC410TTi515FisuJdCqRoTLtET+2W/VEpjiIpmuHOAaI7dVtq1AKPfnNN
         zQpw==
X-Gm-Message-State: AOJu0Yzf6FFmVzEaMbldH74JaXuZN4kxCZgSiFh5/ijYCVZvfRymx0pE
	8j1VXKvy1ZerBT+62H5RFYH+8967t+9PstNVHyvgi4ahhwRczi9KNnj27C1+UAzEyZc=
X-Gm-Gg: ASbGncv2+G14dJPw+78+I3Y3BcXW3VBNFi69hNHozXByDwjol6aI7MTFGkAkmZyLVP/
	PLS+y6Kdd0Q/AAHc82fFDife1t/OpqIyGwO5K4cmm663UlpqcTrM9ARA149K/jHE1WEIrs4oL6J
	883sAo+cL/OrjL57dZeYQ5QY7r6XFjBL8gzdQxzLcBZjPOqxkBe4KHN87yR8lAdHQRaDhoX9Khg
	+TTAZk6jhoEwOfXmOuHI0TrO768TocAAWLNCIZpHnvFfm6Tg/wZlxTYTb251nJM0/oCNXZmomr5
	aeVDr6xO67cq6L7Lu7e9BJs6/LB3nu+V6ogGrQYhZRvGgYo1NQ6RVMkEDDjxTpQERR18SAVqabh
	LOv0XIqoUli3wLA==
X-Google-Smtp-Source: AGHT+IFaUHyI639KQbO/EJcx8ROEFK+tLFDbbrvb75jFNrUyL6Jwhx9mCtsMlVMYol1H+YBkkJaecA==
X-Received: by 2002:a17:90a:dfcc:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-31c9e76374amr3129035a91.20.1752648390448;
        Tue, 15 Jul 2025 23:46:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::730c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e424sm778208a91.40.2025.07.15.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:46:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] castxml: Add recipe from meta-clang
Date: Tue, 15 Jul 2025 23:46:25 -0700
Message-ID: <20250716064626.339595-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716064626.339595-1-raj.khem@gmail.com>
References: <20250716064626.339595-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118587

Moved the recipe to meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb

diff --git a/meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb b/meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb
new file mode 100644
index 0000000000..69663e01ab
--- /dev/null
+++ b/meta-oe/recipes-devtools/castxml/castxml_0.6.11.bb
@@ -0,0 +1,12 @@
+SUMMARY = "C-family abstract syntax tree XML output tool."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master"
+
+SRCREV = "f38c024b395187814f14f77974d8f5240bb2e71f"
+
+DEPENDS = "clang"
+inherit cmake pkgconfig python3native
+
+BBCLASSEXTEND = "native nativesdk"

