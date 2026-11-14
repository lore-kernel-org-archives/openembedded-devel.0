Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3141.1794685060796871402
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y9F9l5v1;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3712b6d9843so1803979eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685060; x=1795289860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clqOrSkZJXrW2L3zvwMQcrOAWgY/R6BuynaPJDPHHA8=;
        b=Y9F9l5v1Svyqf6rgq/SzqKU0/+g6qneLCaQdK5zBQ3l5WJKMf06mkVs27gjYe3vQ/o
         xdJcAzwszR5FD6qnConrhKh1aCyMVhApjdF5oAbJPKyAcovMv4rZol/GCY2rwJPl6K5v
         rjrXalgrn2dxV5hbSQFxQjrvo5DPHv8me4Tam8lJS7Is9YQ0jrycd0rOnDpB0OxkC4Kz
         y//2QaIjITG4h4HsBvZofv7+VoSMItt6eSGEX0CJ3Xz7Gmqp6ws8pC+6Ah7pBXvKrQCi
         /5LP/9JHL05xcBW60kmNbLAwnIE8TB/glJ5mPreaa96llEzheK6Id/AeH7WrW4nunXwv
         02pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685060; x=1795289860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clqOrSkZJXrW2L3zvwMQcrOAWgY/R6BuynaPJDPHHA8=;
        b=wuHg2tH6PxxBx//TCRTQgN62hwXMBQ+wvG6UmrbVSMcp6Ayf6eW8ZUQesSVeGtKWHQ
         cIREq+GHaNc0/diueWmzDhGQh3UZhbCAwm7Md10SUuXUA4sv/XYo+cWwruxYF0J727Tc
         Y9aJ0wsvTZBe7zTs8vw5i+ReBaGpad60EKVwaeWR5ksmpRyAUVQd2vScOaHhDqdqKpOH
         8Czb9c8lPn9RbpFnfQRBVXty00/DCrzztNOBH7HN/x6T4oJl25D9Cdq9nyJHhe/YOiBX
         T2BAIrKihysDxd/UItlCus4pJTC2ozKYIdUP3ivwkwj9VNhynoj7B3GjNPJdGu7LlVaO
         W+ow==
X-Gm-Message-State: APuU4Z81URXd23fz+wjkQ740VxoAulINAqcqAJvts7LqmUSgwy608LTK
	bXiKw2YpWR+IN1FLrd7ZO56lvcUAw9CYq3142++WyA9xLePc4ACsDIScOCDEZ2i7
X-Gm-Gg: AYBFou2xCXT+5vmSBtLMbKVFTcClc3lmiSGNi/0uqTeKkESPJF/jDoCvqCrT3WHIH3i
	Ix81tlMOKhTR1iBVI+7LXvqwAuFWvk+QQQlIe8C6HIRoJKwiOcKRNo8SGvRD3xVwTS/gBwPDyX+
	uYwkg1PWDTx599We2k8jM4/frrms1Q2R7XrjYoo1D/DqYz+3KmHVYJlKRopd5bw25Jdm4H1T8/O
	1LG2cCJOFgfNzxW2ngBsBNzyQMu5FPw2uKVBivxKkyyvnJvVSA4IApJeEXAS5hvWmHfjCNNNZp9
	TTMEpapeoZ6twyz0b5oEItBYtg/CIskR6ZnT56gx9RjhfDcvVaeXMQ6vAWk3Amz2ElbaX+cZSD6
	Q6oC2W0Jg6QifxyAc69Msen6QlPVUorbBoWlPhvaLNBe38SFw4YgcjhTJpAUGgxOcxlcahuLdUj
	oeq9xGnFNn6qIKZs6OuKGzDlfeh9H3/2KxDRRC429eodxbVel9jkLgi/PvPAYRDm37KQUJY+ro0
	vUWu1RHDwYML79Yc7cRELN9a2ZUgXmYaEiHzlzBUzdNroqy2hhaLG7EG+KdcQ2ReDoMGOA9/REz
	WBKlxRTkDGFPrlPRxn726/T5Cp7gyO99oq+kipHqkLI6Goe8a8baCTT3W2ajuj8ptXT9Z68R09H
	DBMOCNYxhYgYwM5RmQZ9Xtl+DoSsrtKSHDQAPNybNpgfPnfR4u/LxWUwxGmF55XkmFyeuEj3FU6
	dCXpD7i/X967tC1z6HCbmEL5X38zXKhrip7aEr5BzvhbR5LURx0tm4XYTfqwYA5ElEzijnb+ziL
	rHl3WkHZ4vvq28mZ0PeoOiEpOMSHC7B1Lwj2SBOZVsWAZQd/IJrwBVON7e9HjqzCUeso1DurxmQ
	r39E
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr9062001eec.33.1794685060046;
        Sat, 14 Nov 2026 11:37:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 03/13] tremor: Fix build with lld
Date: Sat, 14 Nov 2026 11:37:23 -0800
Message-ID: <20261114193733.1743149-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132260
Content-Type: text/plain; charset="utf-8"

The version script lists vorbis_comment_add() and
vorbis_comment_add_tag(), which tremor does not implement, so lld fails
with:

  error: version script assignment of 'libvorbisidec.so.1' to symbol 'vorbis_comment_add' failed: symbol not defined

Drop them from the version script. It has CRLF line endings, which a
patch does not survive git am with, so use sed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index f195a4a654..707054d540 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -17,4 +17,9 @@ inherit autotools pkgconfig

 EXTRA_OECONF = "--enable-shared"

+do_configure:prepend() {
+    # Not implemented by tremor, lld fails when the version script names them
+    sed -i -e '/vorbis_comment_add/d' ${S}/Version_script.in
+}
+
 ARM_INSTRUCTION_SET = "arm"
