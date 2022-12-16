Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358E4C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 15:04:15 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.15301.1671203054452849818
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Dec 2022 07:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=M9A4i6PJ;
 spf=pass (domain: norberthealth.com, ip: 209.85.166.182, mailfrom: roger@norberthealth.com)
Received: by mail-il1-f182.google.com with SMTP id z9so1356115ilu.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Dec 2022 07:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjRQITZC4tVOLuwI/UtgWLljXlHZq8r4dYZjxX7+nQE=;
        b=M9A4i6PJ3yZCclo2tBlICFDCP4iKsrE4k1/WQe68C45fVhtivtv/ZarxBmQVLTLWBQ
         WPoGrEeAILG5Cduj0VCuJ29cRuwfQU+GQywZPxf9hhthnOsPkvGsq6JFGm3ih9c2m9eX
         Ya3pKvKn9GdryhjBJS9cFnnx0gb7tke9s54ImoKspjCg4s6bjJcNn22+6bwXj4jrKP1P
         qjpeWm5tdAi2iQx2moItxGNSr4hQpYSRLwaF7/gpuSQ/2VOb8BWScUJQpwtZfTsxq1mX
         dAeES0snJhT0+VhOaLv0MhC8RuIiffGgt3BKLE/ludM4lctCvKvomspc1JOyNMaL+2/w
         K6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjRQITZC4tVOLuwI/UtgWLljXlHZq8r4dYZjxX7+nQE=;
        b=IYfGxI7PWs5vCy3kR0qJjsMw/dzu4w2hkMI2Fh9q299cNY0TliO5bEd+15+BhPsX4p
         vzSKwVLcpygaBzFPX8rVFehXpjHHvj2Cn/whkSGDbdI5CWojq7ak1dcM8QFhm61gSz6a
         HIaYor9c8jU8/CgXAVw0K43STdF93F3X99nfGzj/3KG5mXIO1Yv7BXxRX0N6HbNGun6O
         hBCTJLZ4XV+KS3QER0+M4yhJRHzELrqx6cbxTsc65tWo4ic/iEdlQtBa4dLC3/rVhB94
         CHbFHQmRVIbqd/lzqC3u1H3o3N7ek7R0wKFxzJQKkHIzyUUqoi7zBtbSQY5debAcaTmk
         F/1g==
X-Gm-Message-State: AFqh2kp2MUKcQnm5lGVB7Q1ylkETtNMVMuasbgGYeKjz8kRJIuSQJ3hS
	hI+txETtF1BoDXL2ikFP2joAGqL1nQx3BuBVWwHRag==
X-Google-Smtp-Source: AMrXdXsCHnuqmElsqk2xtPjTP3xwTMAKLqx49rkCcQ9qHei8zdMrco1fIaMhmE8exslNTf1L6FhGQw==
X-Received: by 2002:a05:6e02:1524:b0:305:e07f:e7a2 with SMTP id i4-20020a056e02152400b00305e07fe7a2mr7538862ilu.6.1671203053374;
        Fri, 16 Dec 2022 07:04:13 -0800 (PST)
Received: from roger-build-machine.us-central1-a.c.qa-pipelines.internal (100.40.70.34.bc.googleusercontent.com. [34.70.40.100])
        by smtp.gmail.com with ESMTPSA id u11-20020a92da8b000000b003033505d81esm716454iln.58.2022.12.16.07.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 07:04:13 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-oe][PATCH] dlib: new recipe
Date: Fri, 16 Dec 2022 15:03:48 +0000
Message-Id: <20221216150348.19676-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Dec 2022 15:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100084

Add a recipe for the dlib C++ library.

Dlib is a modern C++ toolkit containing machine learning algorithms and tools for
creating complex software in C++ to solve real world problems. It is used in both
industry and academia in a wide range of domains including robotics, embedded
devices, mobile phones, and large high performance computing environments.

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 meta-oe/recipes-devtools/dlib/dlib_19.24.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dlib/dlib_19.24.bb

diff --git a/meta-oe/recipes-devtools/dlib/dlib_19.24.bb b/meta-oe/recipes-devtools/dlib/dlib_19.24.bb
new file mode 100644
index 000000000..0b6bd3516
--- /dev/null
+++ b/meta-oe/recipes-devtools/dlib/dlib_19.24.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A toolkit for making real world machine learning and data analysis applications in C++"
+HOMEPAGE = "http://dlib.net"
+
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://dlib/LICENSE.txt;md5=2c7a3fa82e66676005cd4ee2608fd7d2"
+
+SRC_URI = "git://github.com/davisking/dlib.git;protocol=https;branch=master"
+SRCREV = "6097093ab329fcd19aed03a8fe67949f6971a65d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS=ON"
-- 
2.17.1


