Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB05DC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 02:33:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5080.1667183605158425785
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 19:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c++SVphg;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id k15so1461026pfg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 19:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5f902IYk84fuxGb1UcZM9ucGDyqi1wfrU8HOWquhq4=;
        b=c++SVphg3wvKzPX0Q7eHZAVAXMqHs/ksbv0NE4PcPANXpbAHtUGyUL0eXBSCdq2iSp
         J8E5Jj1Lz7Ki0gy7K+XuGFpCv2m3rY75LlKP8zCpWAIYm9QActxYI27Mks7guI9Qu64O
         RqWi8ihzaUOCPL8Ec0h1zRyigsP7tznP5voOA2lRo1+cION24mAeIjJzx0p9T+svyK68
         fneHxBDn7zWJ3TidPyqFT81RaH71dZgRN0hFi42fv+/T9lpNe4Rvb43KMpyLN+ex5baw
         fUEKWbnDtbJkbMhs1FMATYzXTvIm9jU63PhcYH5yHavd4LC8PZ/zfX+vbBkRamwOBAoa
         vEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5f902IYk84fuxGb1UcZM9ucGDyqi1wfrU8HOWquhq4=;
        b=iDC8TbiifpO3DMAuiSV8xq6qgJBtpnyLcJ5QSK3IuNlYAKU8YpCE7n12pfHRleT7RP
         uHl33CW3pUoF86fFTp+e4aFR2RgOz/vQxT34D2t4tzN28sx1lBe4WbOF3nU0L83maQYP
         RR/7rcnfnwpQMz1Fi9vuQOnZGLmx5V0R2/KDUDvc5dtS++FMFOidq2Vyv4DSnhl2ibDn
         ywApIOqR2MnZ4YI3APNHhx4tRVoNMzvjuN+hk89I5N/XGTa0/76gltGQzt5fxsL4Nhu5
         9hzAimaePlm6c0iW5BRgdf6kaV/I/J+6CPIRbipwQ4CsocAfcFHiJMMxgirRxJ/ZfnOU
         P73A==
X-Gm-Message-State: ACrzQf0o/9C0E2EBNc1EoIvGH2BQQbUPnu/as1TJ37EIStoyCT3TXb+0
	kC9qM8hIXjABwi0Sn+m5hCNRdp6QQLPfsQ==
X-Google-Smtp-Source: AMsMyM5VQKTNNAPxZmzBVDftprDFXTwDFIgA2C9o0CHg4c6wkvOqPC2ojfDv1pLxU51Wn160ipTjMw==
X-Received: by 2002:a62:174a:0:b0:56b:a319:76d5 with SMTP id 71-20020a62174a000000b0056ba31976d5mr11791047pfx.23.1667183603824;
        Sun, 30 Oct 2022 19:33:23 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f504:8040:1a2:6bab])
        by smtp.gmail.com with ESMTPSA id x5-20020aa79ac5000000b0056bdb5197f4sm3301788pfp.35.2022.10.30.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 19:33:23 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 4/3] packagegroup-meta-perl: mv libcompress-raw-*-perl
Date: Sun, 30 Oct 2022 19:33:05 -0700
Message-Id: <20221031023305.1561609-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <172303FF7172A0B9.26928@lists.openembedded.org>
References: <172303FF7172A0B9.26928@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 02:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99360

Renamed compress-raw-*-perl to libcompress-raw-*-perl, update the
packagegroup accordingly.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-perl/packagegroups/packagegroup-meta-perl.bb    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 4b2f5cc029..e4e50957f1 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -11,14 +11,14 @@ PACKAGES = "\
 
 RDEPENDS:packagegroup-meta-perl = "\
     adduser \
-    compress-raw-bzip2-perl \
-    compress-raw-lzma-perl \
-    compress-raw-zlib-perl \
     libalgorithm-diff-perl \
     libauthen-sasl-perl \
     libauthen-radius-perl \
     libcapture-tiny-perl \
     libcgi-perl \
+    libcompress-raw-bzip2-perl \
+    libcompress-raw-lzma-perl \
+    libcompress-raw-zlib-perl \
     libdbd-sqlite-perl \
     libclass-method-modifiers-perl \
     libdigest-hmac-perl \
-- 
2.34.1


