Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web09.248.1617899778012468758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k8iGQSt+;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so2914870oto.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=K+lMCt9ogiEdx78iTyTldyamuWeAG3Ki0zRSAg4skY8=;
        b=k8iGQSt+VuLsI3hzXXgdJfi/Zgo7W5JhnvQ/gJFEH8Zl2WQ0JeU7HYKJbjZaOILg2U
         4Ph5utfeEuIagFsUpQdwOAL72L5j+Rab38xIjSDNIlPcI0DLYtM9mfUatN+LkyPOdSXi
         MLAKgDMYZ95ikGAICX79of2j9GNIrYD96fr9BTONr3emeXJq6QdNnagy/9e8V+rlC6vw
         erXubMQWB2uaDHfKsgURKJ5yjmN1d5a32lSL2IxKUU9+MU/B3GdOCdsxODu+YAVVYObp
         t9ECrGWdOFjL4i2FWEnM76OlKc8EA/fcj5TddyWmsEeDOzZ5uUdurODwOUItnHfhAsVP
         3sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=K+lMCt9ogiEdx78iTyTldyamuWeAG3Ki0zRSAg4skY8=;
        b=UQAXmSSWqe+oWidmSRkSdBaFTzA4psabCoODu/ufYR8m9fv8bKLmEzdQVUsdbRxsgF
         F56d+/v7AwZ+/m8LRxCrh3+4Io0nDu9rRf7/75sJD9LzDIcbWfCaUHoW6/eWV7Cfx42Q
         8VSBUgTlwFx/RPPye6vP01hphTWURJcDGsfMbJMJ7T/StKbj22Q4bK2uCzyHlce2I1oN
         yQyk0cRdaaNURyeM2NEO/gkmlNcHS8DiR8J/+ogkbrERqUkijHjL7J7gmk6+Vyd5SVHW
         0mWP6AkQoaqVuWCPo9J8m9nJtJnnhiFh6Gb2wNS2YLrYaZ49eG85nAbP9zcRxgMyQh64
         zRcg==
X-Gm-Message-State: AOAM531Oa9biu2nvj7mlfUyQxXT3vRW4T/T4H7glKLK1imGkyXMbPT6n
	RuZO65wbBOuLZDBxzvu41jepollKPY8=
X-Google-Smtp-Source: ABdhPJz1ugKObyyG4mH+yzT9VYatomqbXMb8NlS+r1gvglPcDXX/h2foGoNLeKRVXSQhHkck2r+o3Q==
X-Received: by 2002:a05:6830:40b3:: with SMTP id x51mr8335173ott.106.1617899777258;
        Thu, 08 Apr 2021 09:36:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/64] bpftool: improve reproducibility
Date: Thu,  8 Apr 2021 09:35:08 -0700
Message-Id: <2c5a2f12a80e2aac93e3a46354d45ab4d87f635a.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: "INC@Cisco)" <INC@Cisco)>

Pass -f(debug|macro)-prefix-map through CC because libbpf
build system overrides CFLAGS. Also remap STAGING_KERNEL_DIR
because it is also stored in resulting executable

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 120de5e02ae4d48bb75e910caa2b7f4ae4b3d025)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 15143a90b2e..f0696db59b1 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -9,7 +9,16 @@ inherit bash-completion kernelsrc kernel-arch
 
 do_populate_lic[depends] += "virtual/kernel:do_patch"
 
-EXTRA_OEMAKE = "V=1 -C ${S}/tools/bpf/bpftool O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+EXTRA_OEMAKE = "\
+    V=1 \
+    -C ${S}/tools/bpf/bpftool \
+    O=${B} \
+    CROSS=${TARGET_PREFIX} \
+    CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}" \
+    LD="${LD}" \
+    AR=${AR} \
+    ARCH=${ARCH} \
+"
 
 SECURITY_CFLAGS = ""
 
-- 
2.17.1

