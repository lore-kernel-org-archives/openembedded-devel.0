Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF620C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:10:16 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web12.3672.1639995011890953906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=nslfnzCD;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202,
 mailfrom: 3glbayqmkaeu3hrnvvnsl.jvt@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id
 i187-20020a2522c4000000b006093b616e65so17005972ybi.17
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Q9YhD6CQ+peSGaUqMPFB9e8WtQHLv7HgWctNZcLd20Y=;
        b=nslfnzCDUoRHy0S6ayPIPjcCuSNE8Oje+HGkhde0XDsqJuDwzM4xl/XQhIL4E/hgX0
         J+3iBgxsf4H7WxN3wgUDVmacmb2Dt1xEiEAbZKszeIdMv00fplcn636TfO1De1o9Ch43
         SqoLjZw96htLrRXpE0gBe37WHUYw9fy0PAifARm9vSg1iElv3Um6fqq2RZ3GfGGXDDWN
         ecssg5rd+snia8vIUYUGJawVbjYSJqtyzL8B33py3K47Awu4eY+dujokffL6D6qdDydo
         JynDcnsnk3IPwZOdfPHPR+OsQTHQid6oAFPaALDIZ9Cyr8ofC/xMM2Etrqr45l4xY0iD
         3UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Q9YhD6CQ+peSGaUqMPFB9e8WtQHLv7HgWctNZcLd20Y=;
        b=6+BQZlA113aOjd6PxaWwCJNnOjYzGj94rnuSaUBb/mcMMAshohkvB2bzizcbkErNop
         SCbCAnZwKQVctPNyQIzVpMRXXZ7ySLLTV0/79DifRniRwKoI/RbDxaWbersZTdzsDWho
         A7xeEOJYWvUlsTZzD7ll8wjTh5LGhK1As9J1GS81woL7TKIg/yGL4QV/Ry4JKiHkjJj4
         6sx4Khd3UVWJ6Ujie0d9S6xW/U6mCSgyoJL8Q8IB8s9WrPsaOkhTS/15v/3By9zP2TPv
         7vbXqiq92oUh/HS1yrzTzCfAN1jShJWw/U4t71iLIEg20iLlUxbbmkpqmPpgX24vCgS/
         fUqw==
X-Gm-Message-State: AOAM530m/QfrR1NsMe9CLcEPlr4kmzpipERIJDfVs+1RlzmAjphWsoIO
	d/A2K3wvi8RmK0jUtqcj1g+islzkoukW9jZLoLmRvNHSi4SBw4tiH2GuWdGh7nLUJ5EYzQcqbg3
	pY7Y4y6fx+Ht0+e+wCvRPiXpoD1TlSUGAtt6AzIPIKWwWV7Rs31Z2OGU+ctqCWQypJS6N6R2R8B
	8E/40=
X-Google-Smtp-Source: 
 ABdhPJzRCyj2SHcaFt56f6w4JbfoMkZ4XuR3/Y2Y2oGobkUyXfqYWjeMmVaC2sGIR+ZkEommxJ7/fiA=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:fdb9:c51d:e38e:83ab])
 (user=wak job=sendgmr) by 2002:a5b:14a:: with SMTP id
 c10mr16461112ybp.586.1639995010829;
 Mon, 20 Dec 2021 02:10:10 -0800 (PST)
Date: Mon, 20 Dec 2021 02:10:07 -0800
Message-Id: <20211220101007.1464326-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [meta-oe][PATCH] ipmitool: Split ipmievd into a separate package
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 10:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94443

We generally want to use ipmitool without the event daemon. Generally
this utility is less commonly used and takes up space in our images.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index e3c74a516..3337fe500 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -37,6 +37,9 @@ SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8
 
 inherit autotools
 
+PACKAGES =+ "${PN}-ipmievd"
+FILES:${PN}-ipmievd += "${sbindir}/ipmievd"
+
 # --disable-dependency-tracking speeds up the build
 # --enable-file-security adds some security checks
 # --disable-intf-free disables FreeIPMI support - we don't want to depend on
-- 
2.34.1.173.g76aa8bc2d0-goog


