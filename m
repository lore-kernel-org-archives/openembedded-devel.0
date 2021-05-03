Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web09.1803.1620069133878122295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dg8HxMJF;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id n184so6402411oia.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZAgAdjnssQH5QErJYgsufJJipGtSiGXSgDMYUNHNP5o=;
        b=dg8HxMJFuaWQqufO6k2wWHjEQtnbeyl0E9WOn/rd+GQHMnUxLcPyas6woOukTJhuoH
         +TimpQKhCIKKywbTDWPAWYpYPN4qyQcqB9xHXdf+CYAklSPY7CtLvVMH0LiZVfW21KT/
         AhX9jGdt6mKn+Bm17YJ90qk4dmHlI1SsoOqU5ohaRhL94y+sadncRpbkvmibc4bPHH10
         HEd/OHEh41zSKLhV4OUNPu19/gYOdTHY7BUYqnBj5NYuz2N3QD/2qR8l3GT9azKaSayQ
         jR9fjKgovrQGNaWnnwnNNf5g9CalTF7G/PtxLfVJst5Gsi4yIjLOvZHgWTnQFhlSmYQf
         +zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZAgAdjnssQH5QErJYgsufJJipGtSiGXSgDMYUNHNP5o=;
        b=JVUKRhKdUCCHwryksTIhHND2J4j8QoNj8PO2TQftyzVTl8Z6FZGM1hd8uW68F7MSIf
         ZgMLka0KlmTwcj1JlwErXomKTdsYlG9v9OPgaqwfChOjynvX9GRc4dB2l+wdKaTZ7hAl
         EEPTkdkgNNu7CvVeaboRiGPxacK/82QoLRyVoyxq6PQA8YrsaqxLMQKMJ9psripNDRv3
         ZJbeKT+1VXLhZ/3qF35WXA47rjcBDVTxnJdEa8sm+NwnRzUCgeuB3M+mvMXHIN7XnuQv
         aHdheAIFGdryGCmemCZE5aadNyUJ71YnlbBTKUg6MgBac2+GkJdk4pkkfxiUHY3o1Alt
         ZNAQ==
X-Gm-Message-State: AOAM532pKDa345tNj0NTB0mSvqk599qCcE7VBKWvYaiOkthLLzX93ajO
	F0uW/SXhBQL+xHzp9x3ewfMcDR5sb6JJGA==
X-Google-Smtp-Source: ABdhPJw4BuCmfbpdSKKmHBLI0wAy77izUFwjKPLWX9WMxtWxh7vVVSb429O4FXvVHFIrgQkUivU4DQ==
X-Received: by 2002:aca:c402:: with SMTP id u2mr8290944oif.139.1620069132268;
        Mon, 03 May 2021 12:12:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:12 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/14] tbb: Re-introduce PE
Date: Mon,  3 May 2021 12:11:55 -0700
Message-Id: <ab71ab067d9723638dc424fb7df52ebe46b58e41.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

It was accidentally dropped in last upgrade for this recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
(cherry picked from commit b5ad9c011db2581cc84e5daa139acf73a0f6f5c0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index b05a59dc70..7e57ebf555 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS_append_libc-musl = " libucontext"
 
+PE = "1"
+
 BRANCH = "onetbb_2021"
 SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-- 
2.17.1

