Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D601AC54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 11:10:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.40797.1747971134107963139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 20:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzRBYI0F;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c9563fd9so4817148b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747971133; x=1748575933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESmTumey/r28OcZsWJUVoMxVMJymAYQOqFYEnn1lwYQ=;
        b=lzRBYI0Fvj7WTzzkIX0OaWm85IJ5cI5h0Hf8oB08VPsgiaZ2Iazhw0Hp7iVGvb7l8R
         GAj67Z5Ef4y7mo8LlRKYgEKJr+4Q1z3RpqiV1s+PzcZt8u/lTvh/UHRHQBJxdkzuiNB1
         nR1UdwV4EqppRJ6LWOeD0DvujrylwfE5RfXtAzV7o3aJXF9i9esIcoWpadf8O4aUC9gt
         DhvAwKwk75Hywee0TwNsvwdpfvTINKDrSPuZN8wAyYQb5PNcNqpkYGRkyyI3pvcY8Ada
         RK5KQo+ZwmXKW5hFgAfTHnu/sInMJ8EokV5wGcbkDccnYaWlivpUwJab7MLH5+PfKGpB
         Pt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747971133; x=1748575933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESmTumey/r28OcZsWJUVoMxVMJymAYQOqFYEnn1lwYQ=;
        b=iZy9UYwBlDFlMo8mbKJJuggN4sLbWsRqI1owcaFPFvDTKMkWw6QHqBV7NBUo44/oEZ
         UMl8hANK3rYvqSbELajyChDCk8CVQKg0GiBE9yoQGSJMnZjFAG8meDYRILFxh8stdBOv
         nZrLgoik96drqge3ChDZJT1fWv6eAFpHjMeSCo+vsrNvJebSRqoHlALagigPp2QIeqeN
         yGZI9K6094w0OEWyUaGpp6kxKYfVISPSJ2glLdk0SVKZ2UHP1s5LTyN5MPuzjePnFDYU
         20WaSX/UQ5Xb0EwMaoGQq3G/Mb/N0/tGrrd23lvewpPMkuVZDMIhwBiIKybliNZw11Ln
         yydQ==
X-Gm-Message-State: AOJu0Yz3hfWmWTP/tuKB9gft8No5ZkWdWvhc3WvrS0wRbNhXoGG7KBdh
	ake+gexxMC7u3MGqszHJSfl7yojJAeA90MBhKyagzx/ADeSa6wzMWr0NF7EuKA==
X-Gm-Gg: ASbGncv4OhMKZkJflaGdjiDz2cJZwaV3UJf1fPNzFfnwN23NmVNGElLcC6o5p/Hio06
	bjl4nYHOyAr+PcREk30nKqa62dhnN+cXGO25+Dmu4kslwMjwySvTvPu23y6A9DYlh/ko3Q1jfur
	mEVMzTmBWT15QgfwQZfvquAiVyF3di5n8Bay2+Ppoip/gdNgVXbbvNBSApi9lRId1Uf6TJk5d7k
	MFR5psqAYShAh6zSMVF4fRh+FfrMXSmwCi+tSQ2a781/I+2hywGZegqP0Vj6LSA1Ll4ox1U9odk
	eBOFJo1yHxUPhMPlPxvjvighiDadhPTyigTnDf9aNfwZzQgib4MvnJ6LRxHVQHERh0IBlhp6dlr
	QfjBpKjZBqOnMEgI=
X-Google-Smtp-Source: AGHT+IHlKeXNbSB0UMNixrJZspmahjYnaqOnCyJPVRwm0s8ghHySMdlmqqh1FFY1kPa749hm8W0jMw==
X-Received: by 2002:a05:6a00:e0e:b0:730:9946:5973 with SMTP id d2e1a72fcca58-742acc8da9fmr32825949b3a.5.1747971132769;
        Thu, 22 May 2025 20:32:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:9111:1040:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm11936728b3a.78.2025.05.22.20.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:32:12 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libserialmodule: v1.0.6 -> v1.0.7
Date: Fri, 23 May 2025 10:31:55 +0700
Message-ID: <20250523033155.9118-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 11:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117609

1. Fix/check "DSR" is connected before writing.
2. Add "spsr_err_txt" to get text of error code.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../{libserialmodule_1.0.6.bb => libserialmodule_1.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libserialmodule/{libserialmodule_1.0.6.bb => libserialmodule_1.0.7.bb} (89%)

diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.6.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
similarity index 89%
rename from meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.6.bb
rename to meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
index 558547c1ed..ac5a3eaf09 100644
--- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.6.bb
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 DEPENDS = "libsimplelog"
 SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
-SRCREV = "975a95d38ba6bd4ae214567ed2bacd4b3e9f0268"
+SRCREV = "b5a5a436900d0bd69f990ca062de916c65f7e2e0"
 S = "${WORKDIR}/git"
 inherit cmake
 EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
-- 
2.47.1


