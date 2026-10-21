Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7529.1792575021511402958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JMVYDFr0;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-157fe9d771bso660811c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575021; x=1793179821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wDoYXBWDgdtTs8yzVacPsTRlcJX+k9H2JnfxSGfVbM=;
        b=JMVYDFr0MzjEWHpg1MNTumyrn2kA0sJb87eeHztgi7XKUG9+6hVsuDfzzAdrS1b0Tq
         K1/sC6sknYM5RaboqOJLKEK2TV4dzmGc0mfgygpHgyztxh1EmYt9sPhiWR9UXCXCtIb5
         64LMWu3Y5WIPIlcs7V8HdarDjV1UnYSqfYVEexDv4VmQgpwYWCPPh4LRC3hA92T1CTNC
         qhfOttl3DN5453Ro1AQf/5FUIDRHAzDSDbRNsuZE2Ou4xA7aWzHPvDA4/rz8Y04d13ZK
         xmB4mcAuEEfa+XOPPiLvYFFN1ZSrzj560TDlw+5h9NuhZ35Asvpc2p6HA+dNKfylvBeX
         JYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575021; x=1793179821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wDoYXBWDgdtTs8yzVacPsTRlcJX+k9H2JnfxSGfVbM=;
        b=fqOBrA8tGFU0C2QzMV8gPPNdSeyUqOz1lHp79udlHJPFUH1qXf/HVUpsf4HdyGt8DI
         us9NfsJrxpZyXXlvAbtGlSyNJqI4vlZuux2auLxHdQKMsBErS/3KLH7gYavK0GwDpd3/
         QoQ+CayaBexKVQR+R6mGsgZV6Wi0YBSIU/N39ff2WsgbtTC29kzhpE3KkEzqmJH4h5AB
         hlZ1CjrNAhq3cHe2WWDN6TibhVfxMrf2Y48A1BHAV6m4HnvoaR99ab0xOpepb+bTbfgN
         bU6p9cQbV+H0e6bTWQxMkatWZZMfIa6lJJYa8HbONB5A9k70NcSM/9CbBADd05BTNT+F
         Cqxw==
X-Gm-Message-State: AFq9FYIAQlb7ridl+C7Ec7O07qAQ4oJjDn6AIhqjMSNJftiCjegZOSbs
	ZbSouTPkCWUSiG3jQVmB60x+iDps4uOD1ThuNqL5fokhVXpXKzo3zfEb9GGSSQ==
X-Gm-Gg: AYBFou1ZjJJxX42KGNjATqRsMX9+f9UWLO/LsO0/9W+HVC42vIp6H3ibNrEnyh6+KZ6
	dwSkmpfdSSP8eIRg4wgn25xHP1jK7X6/I13BFD9g31DxUpiYc0aCSvg3KJBGBr6wiFWMIzKfs8u
	49hYQUayVXW62Ciw2VeptPOAaDg/yGYCoC87wGR7qdP/C6F4P0+fq9QIKtpxkamJMcyvboDJc7E
	BUYoLeEI7em24mKCWi8BkZAzuX/7J8hhTelLnYqurCXOq7K6wqw3/9IVWUPHBs0+06Fgj3Jr2By
	1pDI1/uma1X2DciMJLlZNpcCO0/EhVp0rlLQmoxo46plcIO7jFR5pzKqd2/EzroLwZGhgrOWu/X
	S+WQNfpQprUfhGp4WeaR/E1iWRyxyor6YplKc6UzFq73rZ7IqQo78czLRT/zuy5909pLY6334Un
	co2UKH1xX7KGPQZgIJw3XnjJtgJCh3aOuRXbP6TiOwRUs3ToSYDZSdGM9taQiRCRJ7HUe9YNPs6
	bPMtUTjEzOsviN8DNJPDBkDkwtHuOHlCaucaL39dJr9ObDyv5N4LLwdZ022q3YP/s2CijCNbSLz
	YEDCynBNS/UnSQnHjbamvcj1+4FtmfI=
X-Received: by 2002:a05:701b:2806:b0:168:6ad8:e89f with SMTP id a92af1059eb24-190a0428c2cmr1866742c88.3.1792575020644;
        Wed, 21 Oct 2026 02:30:20 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 33/44] nmap: patch CVE-2026-58058
Date: Wed, 21 Oct 2026 22:28:46 +1300
Message-ID: <20261021092857.3585453-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131220
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-58058

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nmap/files/CVE-2026-58058.patch           | 34 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
new file mode 100644
index 0000000000..3717d37b5d
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
@@ -0,0 +1,34 @@
+From 63815f6a8865d8c99a1f3abb9d7383a2be0ea67e Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 25 Jun 2026 21:58:49 +0000
+Subject: [PATCH] Fix extension header parsing. Credit: Himanshu Anand
+
+(cherry picked from commit bb6754e76bb1686315008e1aa1c40202a513fb83)
+
+CVE: CVE-2026-58058
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/bb6754e76bb1686315008e1aa1c40202a513fb83]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libnetutil/netutil.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libnetutil/netutil.cc b/libnetutil/netutil.cc
+index 6e81f558c..0adf18b8e 100644
+--- a/libnetutil/netutil.cc
++++ b/libnetutil/netutil.cc
+@@ -615,11 +615,13 @@ static const void *ipv6_get_data_primitive(const struct ip6_hdr *ip6,
+   *nxt = ip6->ip6_nxt;
+   p += sizeof(*ip6);
+   while (p < end && ipv6_is_extension_header(*nxt)) {
+-    if (p + 2 > end)
++    if (p + 8 > end)
+       return NULL;
+     *nxt = *p;
+     p += (*(p + 1) + 1) * 8;
+   }
++  if (p >= end)
++    return NULL;
+ 
+   *len = end - p;
+   if (upperlayer_only && !ipv6_is_upperlayer(*nxt))
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
index ea792d30f6..515623d63d 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0002-Fix-building-with-libc.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
+           file://CVE-2026-58058.patch \
            "
 SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
 
