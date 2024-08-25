Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B62CC5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 15:31:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.33485.1724599868481788281
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 08:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=GqKmrUeF;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.45, mailfrom: michael@amarulasolutions.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8679f534c3so399103666b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724599867; x=1725204667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBdgLSiptQSRslNZzN+/Gs8+swDboitweIKgGYTBZcc=;
        b=GqKmrUeFO+BjAekja1o5iSGiGFmodT6C17RKu8eVwE66fITLapr3eSKRl/ErbKpUml
         n733oWoOYmwEKmi9hUl5E/YKYUEsdpovPMhx96UsEtxweuOeG+Dkm1RvuhqP3n9hL7zJ
         wbvdjeTBDTvx1OND3wXlRKc68j3u+7acBlf0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724599867; x=1725204667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBdgLSiptQSRslNZzN+/Gs8+swDboitweIKgGYTBZcc=;
        b=WTNqgg9EWSuMgJ0MFqCtJ2yFWCLkb7AbldoeEqxGk5hqSArjurChw6FBc+hE9lHMmL
         OS97NeaeSLOR1iaRdiJESR1/2KBvelsMtHQbPSlOsrl3aMH2PKW4/0ivf9q71Omvz6Su
         AUCRBmyDvt0sRR7T43TxPSV/l5LcenyRzFoLHKrDajWlqgpiZSuqHcIL6pfpuyd3JwK9
         3+ADHtbVj2ikiEFYw3ibJpyJfJWfXB8DOaBe4k+MwOW/MxirQkqhR1mM3BY/WHYaEbTz
         btsJR2XDhSqWT3xTFWiUCcmV9p2qCqV5t6n4KRcbrdvVqJOsNHxmAJ4shJQVfld6WNsA
         J3LQ==
X-Gm-Message-State: AOJu0Yyrt4/SR7TvMpwOBDSzoTwj9BUzso72r7zY5Fq4cOCuysW416C/
	k/QDg58BQFQDLx12x3VAKFlY2xHLS+0Vw9IDGbzMDJViOu1pnILmOKmxaBHFje8AL5EYIkdjsh7
	VtJA=
X-Google-Smtp-Source: AGHT+IGq66gcPMFwx47Tz94MICYqjPRUgACMGIXOwxnf6opL7JvX1THgV9Mo4uuVKsdXLACZgmdDDw==
X-Received: by 2002:a17:907:2d07:b0:a77:dde0:d669 with SMTP id a640c23a62f3a-a86a54d137dmr560384966b.45.1724599866297;
        Sun, 25 Aug 2024 08:31:06 -0700 (PDT)
Received: from localhost.localdomain (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f29d749sm543761766b.66.2024.08.25.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 08:31:05 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH V2] cpuset: Add recipe for cpuset tool 1.6.2
Date: Sun, 25 Aug 2024 17:31:02 +0200
Message-ID: <20240825153102.1055323-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 15:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111932

Cpuset is a Python application that forms a wrapper around the
standard Linux filesystem calls to make using the cpusets facilities
in the Linux kernel easier. This can be used on linux realtime or
standard linux

Example

cset shield --cpu 2-3
echo c > /proc/irq/287/smp_affinity
irq=`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
cset shield -s -p $irq --force
chrt -f -p 75 $irq

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
V1-V2:
	- patch was on wrong project
	- suggest to move on meta-openemedded
---
 meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb

diff --git a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
new file mode 100644
index 000000000..b404d4131
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Cpuset manipulation tool"
+HOMEPAGE = "https://github.com/SUSE/cpuset"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/SUSE/cpuset.git;protocol=https;branch=master"
+
+SRCREV = "4f80263208935f0df4f616cf9d8cb7285599a670"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-logging python3-pydoc"
-- 
2.43.0


