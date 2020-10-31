Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.3694.1604102835801905556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=h3HtLbBJ;
 spf=pass (domain: foundries.io, ip: 209.85.222.179, mailfrom: ricardo@foundries.io)
Received: by mail-qk1-f179.google.com with SMTP id 140so6614270qko.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 17:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BpQru/CCbCAKZmfQNfdDD7PGdr/k2Tls/G0DlzhJ/4=;
        b=h3HtLbBJYWo6Pm1X6tqdSS09JvFHd6VnVJ8aZ+JqjGCjhxi8M6wTlYrBIVCp1POWVK
         aIZ+CPWD2zxgh/QILQDoe7HCmLnB/eV/zfdHste+Fy2Pfu3A8YhTjvhjd/fTKuvVKyag
         3+DJXyQ5CaW0Nq4J7JkCRdCPF8U5r/VmHLcfwcRgZvSmkm3quPcwPr0YbGQOp39ehKv1
         tLKk/hYd406VXkHNGnLgnKuDczV1FgOHVycbdjZDHt8moIDIpQcrhz4xcf5NxeLA7BGG
         D3T/56fOQQhmhmnXSbxyqvmnZUkvOBtkPu4S4p0FmAVBEyXO5rQj/W3JHmK9BV0gACMy
         WR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BpQru/CCbCAKZmfQNfdDD7PGdr/k2Tls/G0DlzhJ/4=;
        b=JaQqE2baDcq7R2cBkwvDp9wz/G+xx3fVGs6RsTaiWI9qMYk7x5RXxngObSKH/vOcmE
         zUKMHihBtGI0PdZCLxdzT1M1CWWmTNLOmx0UldaYWa03dvsHmod3pTD2FVaQXCGwjFD7
         8JKoTjaC9Ve3+klJ7q/NbuvxpF6BX9aQAn6UeLvjgiVapwgkhgDtJtnqT6KEjGMSuQUB
         rukPQZoqPTFBms3QTCEs7mtw0SUHzmCcTzVa1ls4y1K4gniOswctV3dE9cui1pZa6k16
         JEIVfhmUjJRmxyyoBgGVXDG7Oqiyn1hzk8ACGo3UGkwqkPy+pt2mBfqjmLfHp/HEFlYm
         9XdQ==
X-Gm-Message-State: AOAM531ZZjtycyj19ekEUv8iNnYjDzVPQntZdjSqWjS9FKwquCb9v6PJ
	gJLB3XoZWqgtOmeVYzBS2vQaNP6w+eGf
X-Google-Smtp-Source: ABdhPJxM0coGgtTgXnXXlJnkczgII2BYMdtCMEL2gt8Dg18ATWoHNZqp8Z0e05/KaVynY9uaJcqWfQ==
X-Received: by 2002:a37:5ca:: with SMTP id 193mr4863435qkf.44.1604102834575;
        Fri, 30 Oct 2020 17:07:14 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:bcdd:ddb5:2334:2f12:9430])
        by smtp.gmail.com with ESMTPSA id p77sm3680531qke.39.2020.10.30.17.07.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:07:14 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] wireguard-module: upgrade 1.0.20200712 -> 1.0.20200908
Date: Fri, 30 Oct 2020 21:07:10 -0300
Message-Id: <20201031000711.6805-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- d97b575 version: bump
- 482d020 peerlookup: take lock before checking hash in replace operation
- dace9d0 compat: backport NLA policy macros
- a28032f netlink: consistently use NLA_POLICY_MIN_LEN()
- 515d544 netlink: consistently use NLA_POLICY_EXACT_LEN()
- 1a41e32 compat: backport kfree_sensitive and switch to it
- 90a9e82 compat: drop support for SUSE 15.1
- a567b4c version: bump
- 4213ef0 compat: add missing headers for ip_tunnel_parse_protocol
- 5a45add compat: ipv6_dst_lookup_flow was ported to rhel 7.9 beta
- 372427a compat: allow override of depmod basedir
- f04dae1 compat: rhel 8.3 beta removed nf_nat_core.h

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...-module_1.0.20200712.bb => wireguard-module_1.0.20200908.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20200712.bb => wireguard-module_1.0.20200908.bb} (96%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
similarity index 96%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
index 3a83e48ee..4e3f3deca 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "d553aa7c52ac78c1963886afb74ba861b0b7b0fc"
+SRCREV = "d97b575a47fb26f27965bdc9e537c85f86165e42"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
-- 
2.28.0

