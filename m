Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288ACC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:03 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17542.1635592562510217193
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lBFQnb6a;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f5so12383075pgc.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yW+FxkFgFkpcfeFHUluJm6IF3qldWSvHi+N05ZThGNg=;
        b=lBFQnb6a7Pxwgk8QrAx4NazIteagBlo1VaemCGRGmmT3KLj8NhArYOnXyzpP+W81A2
         AS+iMbMBvoz0vEifF6PPxZPMeYN5Gcj7U3vDXowzvqasLsjOGEC2L+NuzAOxzG5/QhA6
         EjSzanOkCqmHQSDfzjf1eOM4NBAvGyrf7aJdB6/y3pHDXDdgpm9f6+vQtsDNwDl520gZ
         tBDpz5h9jQSF8CSa3x505/TbSzIvgkFAk8Ffds4rxZ0mOpOGQLop0I+b6ifd0NXwvvDA
         b4X4d3w6vL61lQcZLsms4kOxDOCtgKiInZ4O9ZExvYnwphAJ/RF0slUxb25YTlw+Gy1j
         O+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yW+FxkFgFkpcfeFHUluJm6IF3qldWSvHi+N05ZThGNg=;
        b=Yzz86aztCr/odzSxgLr9evkhcHcxVG0truRxvpf8Ige2UcerdLeO31Zoy3i+T0YFoF
         BswIpR6Ige3R39kvcwZ09aCYijE7woYJki/BBK/nZLTLb8qssifiqldVozPreyDndh9E
         KqtnhtCTmlZqz860hGv9Duk9hGaCG++gws2+x9L8B0sXvIwE5adlgTCGMw+zxuvMxmbO
         1rE/kGrF4HKLdGdhxvY3z5elv1X7P/inD3nacApk2aeQagm4VmATaYsjVAxLiOn/iS+d
         eog/wQSKLTwpVqVtbZ4u9BfSVXBNMNbQXd2VLZoqpYauPZhSNY65rNLDvLLARA2jAeNK
         RjgA==
X-Gm-Message-State: AOAM531J/fWOG8w/wDhZyEpNMahFXM/aZBO7AX6aAzNbCcGyPigSbZBt
	QGzkaUcfFBNoE4M/5bzsv7GPpO+Fpg8=
X-Google-Smtp-Source: 
 ABdhPJwmwFw/Y/HLz8Ufv0wgdzM6Ca4+FW1VxjUnMTFJhJnjWeAzebqSF73lZRvxLKHP8RY44nBf3A==
X-Received: by 2002:a63:bf45:: with SMTP id i5mr12350830pgo.161.1635592561802;
        Sat, 30 Oct 2021 04:16:01 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 04/14] python3-transitions: upgrade 0.8.9 -> 0.8.10
Date: Sat, 30 Oct 2021 04:15:41 -0700
Message-Id: 
 <516fcc1ca6d3b8995d1a6e01002c71a662a2aad8.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93661

From: zangrc <zangrc.fnst@fujitsu.com>

Release 0.8.10 is a minor release and contains two bug fixes for the HSM extension and changes how the 'self' literal string is handled.

- Feature #545: The literal 'self' (default model parameter of `Machine`) has been replaced by the class variable `Machine.self_literal = 'self'`. `Machine` now performs an identity check (instead of a value check) with `mod is self.self_literal` to determine whether it should act as a model. While 'self' should still work when passed to the `model` parameter, we encourage using `Machine.self_literal` from now on. This was done to enable easier override of `Machine.__eq__` in subclasses (thanks @VKSolovev).
- Bug #547: Introduce `HierarchicalMachine.prefix_path` to resolve global state names since the HSM stack is not reliable when `queued=True` (thanks @jankrejci).
- Bug #548: `HSM` source states were exited even though they are parents of the destination state (thanks @wes-public-apps).

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 46132922023490e5ed2063467eeeeffb284d4d4d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...thon3-transitions_0.8.9.bb => python3-transitions_0.8.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.9.bb => python3-transitions_0.8.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
index 178dfad3f3..46292987b1 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.9.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fc2ec6d6b6f986cd7e28e119eeb9ba1c9cc51ab4fbbdb7f2dedad01983fd2de0"
+SRC_URI[sha256sum] = "b0385975a842e885c1a55c719d2f90164471665794d39d51f9eb3f11e1d9c8ac"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.25.1


