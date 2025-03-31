Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B53C36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3837.1743454887078492864
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lVTac1XN;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4934352a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454885; x=1744059685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLz5TDQabhRGvXFlxV4PFI6AYwMdek7ss+ETYYvHqzg=;
        b=lVTac1XNZeAbxYgiB97xH5fa38yF0PLuR9TxWhK7RfXu8/oXChnbz3K4I/FqogNNkR
         ehptw7agSjid5dj7KmJK9yjkiGQZlwNvEH2SKkkwZTwQyCdWajfiTzp1LhikPUgFC/bM
         B313B6Pv7pTG4li/BdvDEmjMWLSDrun0XALhtJkUyt5em4YlA49lxr3EX4+iYQrfoF2/
         fbKv/7bCQVtAXGFQxDCYEs/N1BpfVTj2UsAX6a3Rw176B7SEGCABHbTRRWnM5FO16ofE
         pT2c+bWEK0T5AHSK1kw/A8/QzPz/+4miFDvLgXhSV2r2SrRPXcCmYqzxwPpGzzvtZRxj
         ctTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454885; x=1744059685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLz5TDQabhRGvXFlxV4PFI6AYwMdek7ss+ETYYvHqzg=;
        b=SeQ66CsOahLENwO8b5Ns6tsQ9pkrGFz4v7B71NtVXv3PFlaBVsPHmmfLDzyZdN2nZ1
         B1mehONhY6anSahR0hG2RWHJTJZLWbUPUplJWZHo0V4k1EHBDP5WNrJPeyExsE05Jjvf
         ZnCBcPwRnyZCjm0oxKbIfWuNOzRc7imu1t1CqNGrShycHkZ1/GeDL9+CT4sNC/9edMST
         fJx1MXMBjTXpI4UQRchqF9kR7M5Tg6ukgWgjBN05Su+paKv3DMS80cBXSh9ZNGE/KVOg
         JM03SXXW2PW83OsyJ42IVVX6D8t3DxnKDJSWLllce1N1d7rezANcuF2NYnAnvobXHWHQ
         rC0A==
X-Gm-Message-State: AOJu0YyWkEeVoYufhUNzw4fCa4IpZK3pIiNzaToR+d49FbSC1yG7mOiJ
	jAb/eSr94Tx2e5kuWqgKXR0hvKUga4vn5MREHAZzUBO0FIsCGjDuQ2StRw7j
X-Gm-Gg: ASbGncsd/N6I1IXCuQygOamNw8SDYrFBXjC+35ncesojFHguX5DPnWysGxXOuYqtdhN
	UvgN76t8O6ZeNFMOS5VsPPBwg3IrY1U2rfuAiqfk6uLUqwcSATLCBqEEi1y9LYbo9pp7otGi9d8
	ijDIfBIsbruNNtOUcvK1ux86rjGKFBH9ox4LD5WZ7VV4dlMY1ridW0mF+u7lNJALJuHfQytTLAB
	u5julIBOs+SQ4ye5fFVi8kuJAiDV7EUud9KeccMlxSfQPGu4RSUQpepYjFCGqaTcMjtQgEVhS1+
	WCajzGoWrzb2zFv5vl8w5StKT7Q8KAGciEuKKUVZFN/JDXJO5g5VJhmQksQu0W0zi5CZ2Pbv/S7
	27Q==
X-Google-Smtp-Source: AGHT+IFL/0SKvW01cRCiaXnIDzL59h4n2lwG5n9Pu0NO3h9+/E/30LZQBC5/XPYvdzJYbvOn/Fmf7w==
X-Received: by 2002:a05:6402:254a:b0:5ed:17d9:91d4 with SMTP id 4fb4d7f45d1cf-5edc44e7895mr12595363a12.8.1743454885411;
        Mon, 31 Mar 2025 14:01:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc17e006fsm6074088a12.68.2025.03.31.14.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 13/21] boinc-client: Fix contains reference to TMPDIR [buildpaths] warning
Date: Mon, 31 Mar 2025 23:00:53 +0200
Message-ID: <20250331210101.3460858-13-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116449

From: alperak <alperyasinak1@gmail.com>

WARNING: boinc-client-7.20.5-r0 do_package_qa: QA Issue: File /usr/include/boinc/svn_version.h in package boinc-client-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index 4e35283dd2..cfd134dd4f 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -77,6 +77,10 @@ do_install:prepend() {
 	mkdir -p ${D}${sysconfdir}/default
 }
 
+do_install:append() {
+	sed -i -e 's#${S}##g' ${D}${includedir}/boinc/svn_version.h
+}
+
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"
 
 FILES:${PN} += "${libdir}/systemd"

