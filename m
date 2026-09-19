Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93170C982D7
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 10:12:57 +0000 (UTC)
Received: from mail-pj2-f27.google.com (mail-pj2-f27.google.com [74.125.227.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9923.1789812777177202370
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 03:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aCbkq+Fa;
 spf=pass (domain: gmail.com, ip: 74.125.227.155, mailfrom: joaohf@gmail.com)
Received: by mail-pj2-f27.google.com with SMTP id d9443c01a7336-2d6ff23d81cso2046905ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 03:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812776; x=1790417576; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWRsx7uUKih/SZLVHPHZWC0Xl2/4InYO/CCDmBzF6iI=;
        b=aCbkq+FavApO1LHO2IS5AFJLwaHxQkXst5IkINFqclT1iu6+6JUkXsGJZVa1jNMK+W
         0MR1eEVqs+TfEamrPWbrQHH2+CHu4/6qUeslhVpRUNFxr1ta7Z9TANIDt7t7Jcjpl6zS
         mWG1IQQx9BsA9LePi/kc2LpTxE4/3PgCFNPIj5Ey7Z8OUzKlPO6cYnOp3luenjjIp/tL
         glfzyFovg5lcWNNzteKTPwxeDq9Vb99QwaHHT3ufp3rAwswqoC/MV9wHNI/ylXdzPbVB
         8qAKo7pCMsYkqW+fNqfdeHqu/LXgNqex0OYqI+7LfEWTFq0Zzrj8vOMsh3PuzTf3nRAP
         FCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812776; x=1790417576;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWRsx7uUKih/SZLVHPHZWC0Xl2/4InYO/CCDmBzF6iI=;
        b=b9HwWZnQmDCc9UHhmj/IbeOxGLLl+n6ZazrpIAqv8olPKS0Qbei5AAcI6IIGbeO1zP
         7Duy5yIoalGgdGAhjUJoAeeBPZ+xQOAwBI8ip8/QghQYOlMgjUmFsY6Yh8Jk1BWEkH4b
         aaE3v31gJXl3WjbXDdVUooLr9bSRntWuBI5lOeD7jigPcDCjqc7+/bvM7KucKlgPyuN7
         BwGPNURGEAbNcwhUzxTCra63o9Q1pZE1f5T+ft5ECx9FdfoGK3AK0ERAzJwgdQ1b9ie1
         Q00KYJiAONvMP0f0yxj8kiAYyRspaeGjFZkHfndI8zb/URCqrUmJJ+ZAik/EYyZxA1vF
         d4nA==
X-Gm-Message-State: AFuF++nlELs7GrTRFfbJ55jNtQASDQlfSDZlfMhzu6WyOR7+MrK533GE
	lE1JJQG3BpBGE1AWIN2QVfRZZtsi9nBSdClrKSFtYtoEOgOzqOgcbjfN0S7ZJA==
X-Gm-Gg: AYBFou2gKOg0BP9wha26aL7oGQrcYz62V2F1+Z83DXZ4S3aObLjnySPwVJUrmPkY4lG
	KwQM9Oe7S1mowDltrlohKQ76mbHuf3bzK01poVrqph+zjX29q1iqy4//8lDlSYYL7LcLHzrENEn
	T/PtdUnsZffvJGcHapIV+kQN+qM5YiWGBb57Db9k+Qh4rFIzc4cX4vb1DAwniM1rJa7beyQgX5A
	t0itdR958ZvgXF5GcecsNx5sU58n4D3cLznTGX0nQFWkL56uufw8j+zS7tVffInzojHTnMZTPs3
	bT7u49ZbJwgLzm3JP7zUnY3n1L3xVWhLnh/y1153VXtgSMAnE0oUOz4ptOa4l0tQgBs4nFbi6R9
	G1PyywI8fhbLYtGbs5a/pQ9bVj+3wLRpkqwh52nD8MzXMxqTprdrXglLtcAhNgj9btX+lQAeetA
	J3mC/joSlTn/RtvcApaJbfjdQHszRdS20NKmpd+18CIigWf6WQrSHJHykfau3nyyTcrHwdWdMNV
	rHm
X-Received: by 2002:a17:90a:1507:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3a0238bdf68mr1644611a91.5.1789812776083;
        Sat, 19 Sep 2026 03:12:56 -0700 (PDT)
Received: from porco.local ([179.228.7.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm5317348eec.14.2026.09.19.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:12:55 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
Subject: [meta-oe][PATCH] boardid: add recipe
Date: Sat, 19 Sep 2026 07:10:28 -0300
Message-ID: <20260919101028.2828097-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 10:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130116

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 .../boardid/boardid_1.15.0.bb                 | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/boardid/boardid_1.15.0.bb

diff --git a/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
new file mode 100644
index 0000000000..8e88ec9371
--- /dev/null
+++ b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
@@ -0,0 +1,28 @@
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
+PV = "1.15.0"
+SRCREV = "2ccf22a8be22d7597e16fb225c1173876674f7a4"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+        install -d ${D}${bindir}
+        install -m 0755 ${S}/boardid ${D}${bindir}
+}

