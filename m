Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942D8EEF320
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:30:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39964.1772699427772662412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=oLPrDtS0;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.48, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483703e4b08so74868405e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 00:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1772699426; x=1773304226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4QepHVFC8YxoYbjlWJBjVCD4xcFI2byDqPOgD7Bf7u4=;
        b=oLPrDtS072oCkXNOCWhX1PIIx/M7QHShvQpI1IaMDgXeCbsVc/8kJPWPHPocySImj+
         drp9YMgbsrYSOfz8Z2UyqTgT+LTuxU0L455ioUgSLCXDFP0IRRMbqSlboi5E7G0T6I00
         z1JPDXgKLrTUGojg5NwflQ8Jru/7eN3aVA+po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699426; x=1773304226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QepHVFC8YxoYbjlWJBjVCD4xcFI2byDqPOgD7Bf7u4=;
        b=QY+V5Nn0rFdCI+yjane9jPeTPuxg0jFs+mTaQRf3z7ZIC9o99+/qAVW6ihkGxrK8qv
         ttEz2mw3pys+EYTkNwTrft+aUVAmtJPEEcAYuAatRs6sXo0YH2KwKjYLNY4ehhc1TtyF
         TO1aywYE/gYfUx5TFjl9K79gsVEp1+tyHKaQnDWZVHuRQrVH1gt3yZGeAWeHrgBzCA5F
         89H+RH1icVSSREHnWIYG0q4xdEbvXqpvHNJQFJEfzV796YI56WGPoVSsRkAHZTGcUdjh
         nR/RFzUmwKCeWnIO1MaiQvhf7L6oX3+5m8LHkGO/JG9Ivzi99Iq0M4AA+9zkBJhnlAhT
         S3Sw==
X-Gm-Message-State: AOJu0Yxi5lr290K70im1DAZOvMPCsQI6u4/saasvl3Aprnq2qiFT3if5
	265n7U3q0idMN8NFXCPjuzAlXKCqgiaqn9q37CqdjSWjwQMeRMrUHbmhRhE7S27HOFWE3D6Bmy+
	o9IV6
X-Gm-Gg: ATEYQzzgzqm5SvYqF0aJyVRDKgtETBZFWYgnjZyHLdbfz2/f8lXoIdis8b1XMV1IeNb
	ghhRs3xacybWXQxa+v0hDCfQe6bnM69nQyny/ps06Q7SP+MVfl+5olNwUpQCxwOZQy8JwWb/UwK
	TMZ/wYqDKLu+jyJmsiYrmvQCej2bFfOkFKfRui6wFU9GZ0a/dMPKfVRj3QW5ozQX4YXSScGrJAS
	wJA1VNtteLv1JvdxI8KuYTcTlwo6dkYLk2eSoZERgRIybRl067hbx5qlERsbrt51Zn0T/SnesaF
	con5M+B15LK2vPP46idrylj8Ds7lMiKW4mtnENIWhd9nmO4Bv2D8SuFK8c3Ob3K328xO/7zBE1R
	3vJkgUzIJhSReoRRrw3GOFmxwbjTDykrJYnPEMduJW+56SSkOmETFzYke5bPbzchdXw5gSnPcMD
	FBKZXF+fdT8p5RU/b6R8f7yaueCiw0UzwcuxfDP/rimZsCMQ4YEBcJjhx2Y53TTpcLN8zpWYMR1
	nWcQdtCEaVf4qjc/4XMMdmqPytMtVHWRimHxIo5g5Xa8cX480Pd9IQALkWpv1X5y/AMWigfrKiC
	9A==
X-Received: by 2002:a05:600c:3b8d:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4851eeaab98mr25189445e9.17.1772699425827;
        Thu, 05 Mar 2026 00:30:25 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851d8e28efsm47352915e9.1.2026.03.05.00.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:30:25 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Subject: [PATCH] meta-oe: libcppconnman: add recipe
Date: Thu,  5 Mar 2026 09:30:21 +0100
Message-ID: <20260305083021.18145-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 08:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124863

libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
simple aync methods to perform all the controls that ConnMan allow via
D-Bus.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 .../libcppconnman/libcppconnman_git.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb

diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
new file mode 100644
index 0000000000..daa32a8d48
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Amarula libcppconnman library"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+
+SECTION = "libs"
+
+SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main"
+SRCREV = "d89262c2cd7336da8ba9eb06228d422847fe4b20"
+
+inherit cmake pkgconfig
+
+DEPENDS += "glib-2.0"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_CONNMAN=ON"
+
+# LICENSE file
+FILES:${PN} += "${datadir}/Amarula"
-- 
2.43.0


