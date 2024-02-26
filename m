Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687ADC54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:45:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.18577.1708947951437858290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=Uy+WIUR8;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.52, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412a38e2adaso7164875e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 03:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1708947949; x=1709552749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uaGRM1l6GMJqmhevcPvEbEPEvf4pI3xini/+3ZvWW3A=;
        b=Uy+WIUR8PHwHWyLE7eVDqz/qToAL1YSuPkPfRRsmHHTqMpjA/zIR8ZjQDOVP0Qv2tN
         01BmhhB0QOCHWRoEf9K4nnUOZUYZ6NRZMcE4kqPj73eDRoQRuh1T8eeZDp7S/7WO3Zw6
         Ff5VaMjUyt35104Kb9rRL/pTWmJAJk5nckMRqtiJgsmM8bs7cf/qOB3IrYk8qV+e52Ww
         iBuN8R7tyvaGWY6EGP7NPYdhiSweC4Em1RMnUMW92ycSW76Igp0JjWhCZ6Wlkb/3WQ3c
         3YxEE6Esz+UJvZ5Y3Rxu8j0r972w/KcKP7nzy1Wg0nlrVUKB7DUUBEBQsVcos93K1YKc
         P7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947949; x=1709552749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaGRM1l6GMJqmhevcPvEbEPEvf4pI3xini/+3ZvWW3A=;
        b=eYUZduYb9lUOzV/54Wah4zY2myBO9zchZjQe7GZ960WsGXU8REVwNmPMHoxUBxo309
         K5APi2h9mQICq6y/nDu3u8QMCRdE+cWhO4x0bnBHZg2idrHrhioBuhwSWI68/3mAj9z/
         TS6lL1xBee4ebXwfCeSpoAdLi/9yjEB1912fVtOpNcefZqxxE3Khufz6BF1jilSPNAJx
         2xZVGg8yecZEYb562Il7T5eR8+6emk1lLE8IdN6JbFYa0gjv7gc7QhHNVPIe7V5PJjER
         l/VUraVSovW9QQ6nIqRTRvNKXH6253YS/k/uAA3YGREQSF5yo7MNJVKPNkDbGQVlMaKD
         Zr6A==
X-Gm-Message-State: AOJu0Yw3k22VID1XByKvUFehftGNJmxIAjxlnstoDAENdS0yI/WSDARE
	lOO9dqKdzPOMloOL3FCsMNxBgRLT5cNi1hg3C2XDAwQavA2ea1e8R2nBlQ4enavj/GTxlEoPgg6
	4
X-Google-Smtp-Source: AGHT+IH3xHYvRn27il7c9J2BcQyyhqNt9yorxz2yaBwvbNRpajsZbDULoh8xsxVKqEk6pYMUBTeV6w==
X-Received: by 2002:a05:600c:458c:b0:411:a751:322b with SMTP id r12-20020a05600c458c00b00411a751322bmr5155152wmo.18.1708947949358;
        Mon, 26 Feb 2024 03:45:49 -0800 (PST)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b00412a013817esm6053748wmq.7.2024.02.26.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:45:49 -0800 (PST)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] sdmon: add new package
Date: Mon, 26 Feb 2024 12:45:32 +0100
Message-Id: <20240226114532.13644-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 11:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109034

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-support/sdmon/sdmon_git.bb    | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/sdmon/sdmon_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 740835b217c..6e2012daea7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -874,6 +874,7 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     raptor2 \
     rdfind \
     re2 \
+    sdmon \
     sdparm \
     serial-forward \
     read-edid \
diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes-support/sdmon/sdmon_git.bb
new file mode 100644
index 00000000000..522539a67bf
--- /dev/null
+++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Get SD card health data"
+HOMEPAGE = "https://github.com/Ognian/sdmon"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/Ognian/sdmon;protocol=https;branch=master"
+
+PV = "0.8.1+git"
+SRCREV = "ef1aec457f04a50721f0259651cca9c946f11390"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	oe_runmake -C ${S}/src CC="${CC}" CFLAGS="${CFLAGS} -D_REENTRANT -DVERSION=\"\\\"${PV}\\\"\"" LDFLAGS="${LDFLAGS}"
+}
+
+do_install() {
+	install -Dm 0755 ${S}/src/sdmon ${D}${bindir}/sdmon
+}
-- 
2.39.2


