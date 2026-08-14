Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65436C5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24555.1786747656621899206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JBysif0b;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so21595785ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747656; x=1787352456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvGuVNzBixCfh/zy4CIoynB/JVZs1BCzSgMAyNArqkk=;
        b=JBysif0bIKGHZl9x97RQh0Cghrt9dm9kZPrk3A7HAmyfry/euQZU+ByI1jhZiNlPid
         BvD/5NfhmpbpU6ns0yShuYPmr/CiMuErob0kYd1W/boFJzEVZtMPWj/zOXj1g1yBy71F
         xS73friMNNVkWkrQq9e+I8ESh+HnCtecBEDwHrU5gfN/r36dO4WKEoNMoaW6q37Eqdrh
         7lBiXl2HofaoJA4oTCy1T4QB7cNiUdCYFfooQ+9bsM/lk+t1LvQzfvh/bFLnLJdNAzGY
         WIjeKrXKIutmsKhruR/1iIujo0n0BZEQNVa19jqUX4mEwMzTNQlijlaOH3qIeEiM0cKz
         bARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747656; x=1787352456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvGuVNzBixCfh/zy4CIoynB/JVZs1BCzSgMAyNArqkk=;
        b=sVCTNe0zdCCLaw8eorapK/7Oxa+ytlYlnSOOk8MGEet1FQkWAdTdQrCFdG3XVk1yDT
         IKJBS6BaKsR30u3pUr7R0nF3WaX/ohHt4/igqMQnFKky4IKcytQ9W6E1fCfZfzNbbdGZ
         2bfzUhaFdkKC17k2sEcYTVZmMacXHRBsuzA09Qe+A+MDsoNFkRn0CTMwEBERyfDuunsC
         7ALneV3v1NOWRgmuEKsPkVaqcwlzJoc+E4+CR/FYiu/uQSD5ZRMiLK9IuHW63G+/yHo3
         k8YBHvOfXyocJ6rbx/DlwDqanYoIE5U1STcJONOvarL6ENlwG56AKVsPvIzNzRKRmYln
         jE+g==
X-Gm-Message-State: AOJu0Yz0gqVgD3cFeDR9EW/aTJy/gRGyrs3rMBnNq+zYzXuCXi+Ofhdl
	cWo3KyopqCx3lB+feN/KQFfUn+JiQn7OAFw+ZPj+gZ8qofhrwHyQ0oPQbmQf3A==
X-Gm-Gg: AR+sD11ragLZp5pxEKCzWPrm1K4beH8wTXFYtFwomlpbZz1IN0n/2OjnhJKByj5tt0H
	oK36Fd0V7878Mf/qcuZxdvKiy5Q2neLU5wKfXu/cwlmTfqeYjzzkbErLnmP+LaZG+hEGh7ARvnX
	DbRDMf9juSUKVE1ZmI+PgE1IitFMuHLABr+c6geZMpORcWwO0btqaz48RXd5aTho67qd1g/BwTs
	8kYye9a9nunU62lvfPilxeyJFAiXKyhZlboUzzhAE4uH4T4IiR7XP43rTGqDiH+8oqf7MwsQQu0
	ao3zxQPh4A/37pwqDBI4QBdqGqXQfcGpa8it0WG9FZaW4KW4+6yTLodO/cpkHlwOfAmZisNa191
	1IR1I2ZBhwC+5oKRifghjdanKfTSBmAthp1wf/3bn+blWJ3WPwR/Dju27G5ux+IAp7YNqbSBjtW
	nylhWygEuJTPv6vOFMVclGC4JtkqZnSMBDdHX/qyhQIdmLDqTR/RQK+Cae/XpDNCbGqD9TpiRp3
	ZTZ4/GyVjQ5TKvsnxkkD3yLSGLhq8rZJ4byQFidJZDrRF+9ysmNvcMUbL7lzltvj9A9dZQwwzNL
	VaBGjrXIJRkTTwVPPK0H66Sb81Wse6815ebnSVKF30nS62ikM2SAWkfwZJqU7aHM3T0tvXkPD/V
	2eSdfPH6UUXwQca2pP+m3J+P8o5cvGp9eA2eOoa3Kak/Baw==
X-Received: by 2002:a05:6a21:339a:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3cc7200c614mr10071020637.26.1786747655883;
        Fri, 14 Aug 2026 15:47:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 096/109] keepalived: upgrade 2.3.4 -> 2.4.3
Date: Fri, 14 Aug 2026 15:45:22 -0700
Message-ID: <20260814224539.1523174-96-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129160

0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch still
applies cleanly and is still needed: upstream 2.4.3's configure.ac
still adds -grecord-gcc-switches unconditionally under
enable_hardening, which embeds absolute sysroot paths into object
files and breaks reproducibility.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../keepalived/{keepalived_2.3.4.bb => keepalived_2.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.3.4.bb => keepalived_2.4.3.bb} (96%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
similarity index 96%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
index be0f915b47..2d9802eba6 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.4.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.4.3.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
            "
-SRC_URI[sha256sum] = "6afd95ddb7d3e0d3b8b8e5b3a489144131b61a01b06d29e883d0c44acc8a36bf"
+SRC_URI[sha256sum] = "a0faef8e401c143487b131b526df7541c1e33d9b8814642fa9dfe8bb250a9632"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"
 
 DEPENDS = "libnfnetlink openssl"

