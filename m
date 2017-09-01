Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1E9278481
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:28:39 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a2so1025541pfj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=CZuw/9q/HVp9pqUxM/S5XoqTx9oiQjH4Y092bHQQGI0=;
	b=lM1UnbkGoo/ZFjNcQy3lsLNqRPn8l/aSuXnC2jH9nf0CWYi5KatvEakAT3rl56q/B7
	+g0mhogf6kIar6fiSxLXN1HatfR7//EUUGuuokKXUZQi8VuGZx7nmakAgoYVT7x9Jgsu
	29Ai8Yd8sxTFKztc+dmeZhOS4OMGtaMjVquv0wIJ0Lov/x00skjZOl8N+xkXJPzSrFO2
	FcYBCMkSCK5luoxP7WaYfczwufSxztnVE96lFVjvb+O1MvlP+kECPTMYoommFeSvv9Cd
	S2s0ll3xf6zM9/+f5br2U4FkoNKLQ5ZDv7XbMEoFqe1cU7vyNGx/qLcInsPlN+82z91k
	C57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CZuw/9q/HVp9pqUxM/S5XoqTx9oiQjH4Y092bHQQGI0=;
	b=hy4m5HrSx62v3hhPln0AeMEY9fBD/q09/eFbeHgNWvBKKeA1vqC6gYiz9Db9k/zL4S
	2HYHnCJA719gLZGlJaQTdsswYqpE1XJHhXPSVcTcc/RXBRa5eNCdQsG/8LFC5bzIXsPs
	NquGrJ1l3ExLJmbxLF5CTaUf3bfvhLWtZ6Gkfa/orfx8uW9TFAmLXy+JNxKlKwVjh8hB
	Hb6BaEimzCM3klY4MVnLPQUC3lxkd+pWEWYzu6eo8c8a0iYMUu0P5y5n2bfzYGr0e13E
	0DRHj3oQAWzNw+kyK141c3L7CjbgU4u4TDS1f9ggoQniEpCyn9+wZExN1lSM94xjBhqE
	jQSQ==
X-Gm-Message-State: AHPjjUiRWSHZ23KNmYR0xfBuANQZBaYlodnb/qhpt+UllE86zGlJsYim
	NlF9GuMYUniQ7A==
X-Google-Smtp-Source: ADKCNb4Ugxg9IX5mTDV70icdCaYmy+ceGTmniOGbM5o+Kgj5TIgA0gY+ZtvatOc1RUyIxlqcy+bdKA==
X-Received: by 10.98.156.145 with SMTP id u17mr974850pfk.217.1504243720864;
	Thu, 31 Aug 2017 22:28:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:c400:6ad5:9d97:9621])
	by smtp.gmail.com with ESMTPSA id
	r135sm1657935pfr.109.2017.08.31.22.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Aug 2017 22:28:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 22:28:38 -0700
Message-Id: <1504243719-16782-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][v2][PATCH 1/2] libmtp: fix build issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 05:28:39 -0000

DEBUG: Executing shell function BUILDSPEC
| error: line 109: %package -n mtp-tools: package mtp-tools already exists

Yes, there are two entries in libmtp.spec. Under packages-split, mtp-tools is empty but
libmtp-bin is not.

Removed PKG_${PN}-bin , this alignes how Debian split its packages

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index b5df8e0..c05ff4e 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -50,9 +50,6 @@ PACKAGES =+ "libmtp-common libmtp-runtime mtp-tools"
 RDEPENDS_${PN} += "libmtp-common"
 RRECOMMENDS_${PN} += "libmtp-runtime mtp-tools"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
-PKG_${PN}-bin = "mtp-tools"
-SUMMARY_${PN}-bin = "Tools for communicating with MTP devices"
-DESCRIPTION_${PN}-bin = "${DESCRIPTION}\nThis package contains tools for communicating with MTP devices."
 FILES_libmtp-common = "${nonarch_base_libdir}/udev/rules.d/*"
 SUMMARY_libmtp-common = "The udev rules file for MTP devices"
 FILES_libmtp-runtime = "${nonarch_base_libdir}/udev/mtp-probe"
-- 
2.7.4


