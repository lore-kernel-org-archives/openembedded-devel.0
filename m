Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3486C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 05:59:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.52851.1749448752034708279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jun 2025 22:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Bujf2cUE;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3434881b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jun 2025 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749448751; x=1750053551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWf9hpCKiVzYmHMw1hj5h8sPU6xKeiowZvCAdYY+xr4=;
        b=Bujf2cUExB4GNCO7cA7D4s72jiP0S9dfJw/AsKgjf04bCDdTpL90KuOkCArDXql2o3
         Ri0nVOl38TRdje9QYGbx0ZAmBezPCTVIW7xl+gxINbMl7LyJeRBYEjKTGFOmMrXm8q8L
         GOKlsnsUUE0+6+gTSYGEj/n8gIw7D3jxc1YyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448751; x=1750053551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWf9hpCKiVzYmHMw1hj5h8sPU6xKeiowZvCAdYY+xr4=;
        b=IGaqK/mlurDHET7ydTyFzw3KmAW27fBYJRzJIf/zP1p69DbU7wRrm1EavAws6yRkpV
         139tBpQUA+RiYVZlNEifKrXUfNEtc5jvMo+FDnR0qyn7Z8O+xkm4gb6xvxkUVFW7rTns
         Gn8ixy6QZu2y+X6nxa1MGerXiCZHt8a8ciEl5I9OCtBBQYepp4L75va4vW+lA1SLHt9W
         8ld5Nne1qbocgBz+0mYnrua3q6ks+4v6z+rQiXhN8YrVIBq5oTxwEBTT6ByWSgp9NWFF
         9Tn9VhmkqG58XwJpGVhkrTeAo9hqLbruP5WCu+cob7J8LZ0DlM8Nh7H9xHLaH0+yuoxB
         G3Rg==
X-Gm-Message-State: AOJu0Yx9AXcufClkWt8+O0qKItqLj+4cZrHTcWfUSJNTMAHMKp1ts2pA
	Qw2pUROpfTeLMQjNlmGRPXrBho3wDBdkJgDDlgE6H3GIaefBI1chdl4UM4xtyk2q9RuveSgdV9o
	xu/gQ
X-Gm-Gg: ASbGnct1on9aqcsXuXD1HcGAgLwpFpokOXx8euuYnYR5jxvOrhoCIyiyuHDIw47DdbD
	DDzOLWBD4NpdYbRQlDSB6Igw2PbXkIhbiE3nodSZiscId0sZW4eTS7zPqxe25TMDkw8r3bu03hP
	Rw6E3Bgc13IZKfPDcfKGbVmlq93jSvLh1CHI+NvJLDOBfDKwfkqQLww+zvBEENgPIrTAv9BUYgI
	0Wz3w0sHx4t8lmE2GFdeO2pYdcAYdf/2LFJIBVeo+koC7hfx/klSKBcLJL5dyr+gjfu3BwZAo3Q
	ZEmROAFIlYgEHswBjncELtvVKxj4Y7tVvGnxeY4bQcTsDBfibhtoQ/xpgm/FKFvbx2FipHSdlQ=
	=
X-Google-Smtp-Source: AGHT+IGUEvi+RxFra0FFBcgmnDMYtr6a/AN0h2P28RjF4hXhYhzwwGBbArLi46Mv8ZUI7lQ1Y4E/SA==
X-Received: by 2002:a05:6a00:2e86:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74827f36224mr17480928b3a.20.1749448751002;
        Sun, 08 Jun 2025 22:59:11 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7af0csm5133494b3a.62.2025.06.08.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 22:59:10 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][master][PATCH] wireshark: upgrade 4.2.11 -> 4.2.12
Date: Mon,  9 Jun 2025 11:28:56 +0530
Message-Id: <20250609055856.13801-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 05:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117779

From: Vijay Anusuri <vanusuri@mvista.com>

releasenote:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html

Includes security fix CVE-2025-5601

License-Update: Update GPL copies for FSF no longer having an address
Link: https://github.com/wireshark/wireshark/commit/18e4db97c424c11cb26fa7fef97b95dd3d001bb1

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.11.bb => wireshark_4.2.12.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.11.bb => wireshark_4.2.12.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
index 62aec8f732..dc987e08ac 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares speexdsp"
 
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18"
+SRC_URI[sha256sum] = "6ed51da5f6638aba609be8d1d64a7a85312749a49261146c391fea391a3e5f06"
 
 PE = "1"
 
-- 
2.25.1


