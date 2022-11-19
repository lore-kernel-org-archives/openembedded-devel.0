Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85910C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.23269.1668873489953751629
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWxOVwaH;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id k2so4160417qvo.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fVuLBHbfHuh6tCy2LoToze+S77zF+xlTvbHd9dXWis=;
        b=fWxOVwaHoIme21HMfkmMkQ/gbYAzYIwlCA8FH8/k6AXL7MLakeLg4ToCo6iVQRFOzK
         3P/zdQx8pEBSbK4pVenCIpDDtKXPC2gGJjqpChrx7OuKk2up1hMVqKhhow4jACA4lSfZ
         JPf6ODbuV7Ry+D/w+aeqVgfbwQ1j54rOfDWqIUZnpZWd/ZgxN9c0Kz7hPh+8EW3sKVdf
         O0aJI9RcF90214astKljNqVKgxA8IAEpjLg4QwHui8kj+Xw2tBCubBkNuRI/XbtPYo37
         ozVz36ATqSJDzeLkTCnSDpJVH0k6hpM7irZWs9zn3EP2NzWjufwX7ulPpJ/JSfNm7nXq
         GS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fVuLBHbfHuh6tCy2LoToze+S77zF+xlTvbHd9dXWis=;
        b=UEf45C07Eq+7F2HpeE5I/GJ5DhxKArVjZl7qtM8sCBrq8a/Ad2R+RIrzGjFttPPGi7
         N9BJwIC2BNgtOHD463gSQ0luuqZYB3USIemKI0qTKD5ssSIl6dgDrilqEYKtdQpppsWn
         xvVldqpPy+RN8V/zk5ctlRi9euacNucn7KgP5VNgtpW8zQDQSLWf2yfnJ1QMOdRuGTHL
         FhMk6hL0wO5wJ8TpFZX59ObHz5+a8t06ELBcPr1HRHIoTrPxghkEEiv3j6xav2VboiGV
         VmMQySo5Hq4wllI55goNBJqeZ+wZ7Pq02F/dlY7vvvG59z2rEiVdAyknj3F15XRcKy1a
         E5bg==
X-Gm-Message-State: ANoB5pncTgZYr3OaYHvwmrmmC+A80/Yn+/SxBNhHQ98dOBCPhniAHRWU
	wsJDjugKuP/r94eECJX3+ovrJ4veQd2qvg==
X-Google-Smtp-Source: AA0mqf6thxJqNaOQQitRaWY1b7vMNIUkrJO4fNCo4A7JSUndrPQWDxjTarRoMbaS69SF1tnuch5usQ==
X-Received: by 2002:a05:6214:3241:b0:4bb:6c4c:6beb with SMTP id mt1-20020a056214324100b004bb6c4c6bebmr11152855qvb.40.1668873488435;
        Sat, 19 Nov 2022 07:58:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 04/35] tcpslice: upgrade 1.5 -> 1.6
Date: Sat, 19 Nov 2022 10:57:28 -0500
Message-Id: <64838fc07f3abe698e35c6e5ad510b1f433c07d6.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99643

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Changelog:
=========
- Call pcap_dump_close() on the output file.
- Implement new flags in ./configure: --enable-instrument-functions,
  --without-libnids, --without-libosipparser2 and --without-libooh323c.
- autoconf: Add the option to print functions and files names
- Update config.{guess,sub}, timestamps 2022-01-09,2022-01-03
- configure: use pcap-config --static-pcap-only if available
- Remove awk code from mkdep.
- Refine the man page.
- Refine the documentation files.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8e64d8f7afa26c7d2c4ac7ed23f6d48d639cfd39)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcpdump/{tcpslice_1.5.bb => tcpslice_1.6.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.5.bb => tcpslice_1.6.bb} (80%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
similarity index 80%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
index 4909acdee9..7128a23cd2 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa6
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "8907e60376e629f6e6ce2255988aaf47"
-SRC_URI[sha256sum] = "f6935e3e7ca00ef50c515d062fddd410868467ec5b6d8f2eca12066f8d91dda2"
+SRC_URI[sha256sum] = "60d23f00d4c485fef2dda9b12c2018af958df3a511238c45374733bbc1231920"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


