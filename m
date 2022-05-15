Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1F3C4332F
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.16687.1652622575053180738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZIQJuGMI;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c11so12072779plg.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MBLGP6+NoWqQWF9vXDAKmZSID7cQoKzERzNUjQS1mvw=;
        b=ZIQJuGMIH1Y/Bhff5S7GvSF04qENrFIQ6aYJrLnyStWABLpX2NMvtp84AZxzS8RAJP
         oZzNG47Z+sWqiA2EccrwrftdJbNbCL2GQ3GCELaNVYhxWT3hqO1XV5/90d0gyBOlBKNF
         GpsU+JVD7mFMn+wvpFIk7y3aLaKPKqIXWYP75uuTSBP6eCTUjbh2FDUYPpi3nrQbRFPZ
         kgmy73aeYqfuOzZIGdG1UN0MWEKxhjME0EjhwyQXgadAO7im4m5Uvemwe+DXJK2ZwBF8
         v+0BEbzLhqWZP5RigNRzRcH2CHth4+kfFJOJKjOWMZhrNQC9BlIeavkbwZhQwz4j3P2t
         vnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBLGP6+NoWqQWF9vXDAKmZSID7cQoKzERzNUjQS1mvw=;
        b=WhJ1R2pUPsgGfJnmJAkIAMiZdWtIJ/eRxtinVXQmiUy0DCFMgyMtP7RoKTu6Fpy4Bl
         Zl8FhlvKKfBXzqcOf4Man7YQ9916ParK2bsf+UeTHgBGca1e17QoTIh9b79uF4PODTPR
         BG1Q0wtlXCNDkScpFCyE9yMUsb87DQA7k4uWeF2X6sAL8hq3zy4hj/GloFxPGHTeqkiG
         IUR0GP+q5smrAKco8/XAzhzIV61yEh7mHx77dZtVsQKXxoJi1Hv/Jq29Y57sBBorVdCI
         8t6xpqgKmD5WzbmdKCGK5dsQk83aMOQ5DLLEBpUodfTn+Vll4ICIKAbPQsQMTFtDXKel
         d2dw==
X-Gm-Message-State: AOAM531+54AKohcgsqPE9aG9maGHD29v8zA/8517hdFpcGLaV5XGeAw5
	SttFBlf0GU+dmE4HsCX/jWssPwlYe8tioQ==
X-Google-Smtp-Source: 
 ABdhPJxxlNpKJ+eNcipj0M/jKkeF+UPyUFW8uqoyIZDTBIUIZ7Bfp5WdvCHy3Y5DK3tJFBrHcFGYVw==
X-Received: by 2002:a17:902:b412:b0:15e:dc07:4c14 with SMTP id
 x18-20020a170902b41200b0015edc074c14mr13462195plr.99.1652622574220;
        Sun, 15 May 2022 06:49:34 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/22] mimic: Use special rateconv.c license
Date: Sun, 15 May 2022 06:49:06 -0700
Message-Id: 
 <6a1df186da7bc9ad8d0c0a666a0e6253cc87e1e5.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97103

From: Khem Raj <raj.khem@gmail.com>

rateconv.c looks like BSD-2 but it has second clause modified
significantly, therefore be specific about it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
(cherry picked from commit d901de434d2fee62e2a37c4150108921b2dd13e5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/mimic/mimic_1.3.0.1.bb |  2 +-
 meta-oe/licenses/rateconv                     | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/rateconv

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index ac0165a5d0..76f51196aa 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "MIT & \
            PD & \
            CMU-Tex & \
-           BSD & \
+           rateconv & \
            BSD-2-Clause & \
            BSD-3-Clause & \
            flite & \
diff --git a/meta-oe/licenses/rateconv b/meta-oe/licenses/rateconv
new file mode 100644
index 0000000000..a0f5683a05
--- /dev/null
+++ b/meta-oe/licenses/rateconv
@@ -0,0 +1,27 @@
+Authors:	Markus Mummert
+
+Copyright (c) 1992, 1995 by Markus Mummert
+
+License:
+ Redistribution and use of this software, modifcation and inclusion
+   into other forms of software are permitted provided that the following
+   conditions are met:
+
+   1. Redistributions of this software must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+   2. If this software is redistributed in a modified condition
+      it must reveal clearly that it has been modified.
+
+   THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
+   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+   TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+   PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR
+   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+   OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+   USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+   DAMAGE.
+
-- 
2.25.1


