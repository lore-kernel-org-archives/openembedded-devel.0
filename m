Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA647C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:11:52 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47658.1789992711358663579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BgQooesO;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: joaohf@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dec5de01eso601089a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789992711; x=1790597511; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG0sqEAfMj6GkjxPV3i6O+hBGHrs78OZ5yHiX3PJSnU=;
        b=BgQooesOMC3ueOpaZWZ+NpsHkQoXr6WyB2zvP9Ce4W8Kq9hnXYMr3SFcxVFHRq1uFg
         7SKdBSnP4w6csfETazTgN00BIC91ZLzWxdY7KSGkaUa/FCP/ClbQum7W9NsukimTJTzm
         EM84BPvY3ZEwqS5n+/L413DMizJVD5yTDivXbGyO3bl5sdCPI9BaV/nnNS7QWt+Yb3s2
         YlpZeqXxM/yeZoqZUwH5yq3qrAFSNIWNrLolZJ47MU31reXSFeinvr3ZfMN69T7am4Ic
         kWlhn8PBus1IBMpE5xwAWTU0r+NGWmyZbODbn8yNZLkCrdF6cp/JZLA4qMQbXOP8KW/c
         LtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992711; x=1790597511;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG0sqEAfMj6GkjxPV3i6O+hBGHrs78OZ5yHiX3PJSnU=;
        b=1BRFCuCb2u9/MmXg2qNqTCQocJ9d7nhZl6NXDTs+Okvs/7FUC+T8Y8vqo5qZaBQLxt
         d+D9GGZzcJjfTUZ9ySDr9LihaRDc27RoMqFleWIym1GGwKixmLpbbVwbDqNo/rzYAdXY
         GL6u2ffnmSFfhhh22oWFIjeKAedpbUL1rxiv6DDZQARYaqSA3/6j+PZSV2fG4CAyzQ3I
         OOACHtttDfjGxQ4iLE7esIZG6IeGSkv0U468sy/GWIMhvY+QLY+BTHnaz87c0mFK793K
         SobdiMY9qDrCaPc2YqS9Ix30hJ5wkD8O/BV1pIoByjvhOdX4tbqLKF4Bd8UKoomE0gwB
         KZWA==
X-Gm-Message-State: AFuF++kHjYwmB58wCQBVPlkFsD0sxi9Oa8eI4oWWQWe2jeMm8GusmofY
	7GXVBzSRWeVku68630luq8YwOMDYCJAIQh4wvH8T8Opf765NG9KfSe6BY4lxAw==
X-Gm-Gg: AYBFou3y6uW1dZRsN0kBzRabAL8DYUWE4Ey865VPOs0z1i3Eyu2IAqI+Dq4hQRQvACj
	ACo3FVnvmn2PkKCHvFQ6PsVrsLK7zf4FcqDwmmAngMYDuCjDEBuJowU5z4TIdlj8zAr5ah3AZa4
	uzknAwKwIp1rmxDQXotyiLPjlfuOy0YqhvvGjY28sOaEfYJcvoPD9fceXk6dQpOcNuttQNLMyHc
	IxekLmoQjhHjOdsQf0drAsilvbaFNMqBi9Ad2qFBZtzXPtkFRR16N/OHXhT61jm8+qSBN08/62q
	SwCzjKj+mf7F+GBOuwRZqweLMFqaf6OWzLeSOybF0TSk7w7odk8TwncGH+Tbb2ZvC8MYUOVL+op
	5n8qHfoI5CRygY7S/FxCRbwrq5SEZ2MuGJr5YApOArvrQ/MIKL6lwP9SBwad/nXHPapX9z4CUoe
	fz5TuhaApkaL27g60nI4UTuk/Zi+EDqx0Vsd+C4mWj2cWBy3pUBCH2L+3IPGrhRtTe+wDaKC00D
	Xl8
X-Received: by 2002:a17:90b:53c5:b0:39d:f130:8f12 with SMTP id 98e67ed59e1d1-39e5942a918mr18187644a91.2.1789992710565;
        Mon, 21 Sep 2026 05:11:50 -0700 (PDT)
Received: from porco.local ([179.228.7.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d907sm18738943eec.11.2026.09.21.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:11:50 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [meta-oe][PATCH v2] boardid: add recipe
Date: Mon, 21 Sep 2026 09:11:33 -0300
Message-ID: <20260921121133.3377823-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130161

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>
---
changes in v2:
 - remove PV
 - remove do_configure and do_install

 .../boardid/boardid_1.15.0.bb                 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/boardid/boardid_1.15.0.bb

diff --git a/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
new file mode 100644
index 0000000000..d77d91162c
--- /dev/null
+++ b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Print out a platform-specific board serial number"
+DESCRIPTION = "This program looks up a device-specific serial number and prints it. \
+The original use was to provide some non-changing and unique material for dynamically \
+creating device names on a local LAN. There are implementation specific boards as well \
+generic mechanisms for getting serial number."
+HOMEPAGE = "https://github.com/nerves-project/boardid"
+LICENSE = "Apache-2.0 AND CC-BY-4.0 AND CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSES/Apache-2.0.txt;md5=c846ebb396f8b174b10ded4771514fcc \
+                    file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032 \
+                    file://LICENSES/CC-BY-4.0.txt;md5=9b33bbd06fb58995fb0e299cd38d1838"
+
+SRC_URI = "git://github.com/nerves-project/boardid/;protocol=https;branch=main"
+
+SRCREV = "2ccf22a8be22d7597e16fb225c1173876674f7a4"
+
+do_install () {
+        install -d ${D}${bindir}
+        install -m 0755 ${S}/boardid ${D}${bindir}
+}

