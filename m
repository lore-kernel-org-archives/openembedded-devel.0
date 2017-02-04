Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 137DA71A70
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Feb 2017 23:46:00 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 75so5396147pgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2017 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=d4lqv0WbbQfVePaBZ+LDi22eCKJw98TaXBj2uipCOQg=;
	b=E9c3pqh4/G6UxNeohLQ5Z2eB5LDmTPN8u6GI/DBYkVBOJt5WLainnS6nIZUKXtYPXx
	NSSKGXBf8th0UEwRVPw3vsRZcUHx0+8JtddCUDeHLhYYceKPXv4FeLUx2uqFGlWw+5nS
	8K/g2tSpaUUbrxVk6KWO84urxb49uHodVf92mIvuY3HgGitj3R9KbiNqyMfQLpXjACbV
	JMf1PiM1hOujujG8MAO65O0oG2uOU3GBpGqJI1cBVb68WyfN6QWJ0vfWXGFJ2Ap90DPZ
	AIOoZ+bEsJNFThbp/nRz2szJ/NZd2rtDUT0BIporBGeZM2E7Kpq81DkO201bW1NIdkNg
	8Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=d4lqv0WbbQfVePaBZ+LDi22eCKJw98TaXBj2uipCOQg=;
	b=h6GNnGlKuFLCxM3UV0z/EqFa8kTmxTkeAMl0SoqQDsAuovBrsib4rzjkl61xCmkF1T
	7+Sp+EBDPfPX17/yAG+tnCyEvLjtfVcwTDsvbZYd6Njr6CrKxw+qliyueGf72iHyZiQR
	BeXmE5LPuZUPSDLkxCilHGmavY8mkZn2qPQcBBCFNrj5dcGg0jxqzXgviI02Fa8IokY3
	3tDjOcRjAe5SMaFcYD6kYopM1g+u7TDmKsTxuEjQVP1rWKrm5gkEVcVbTlR+5QqekUs2
	887Zj1zUhLVf9YZg1a7hDhu+U7Jn7+C9YNTKANmlyTbcMTCVDpJvNgcyNr+952bzwjHJ
	MrHQ==
X-Gm-Message-State: AIkVDXLqTB9EPo4ZlMx4y2BDEIz8ozFhFbgohFXz59eZ0u3AUexXj0TlamyPAuJ9YruCHg==
X-Received: by 10.98.220.91 with SMTP id t88mr5195614pfg.78.1486251961094;
	Sat, 04 Feb 2017 15:46:01 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	n8sm51919802pgc.16.2017.02.04.15.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Feb 2017 15:46:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Sat,  4 Feb 2017 15:45:58 -0800
Message-Id: <1486251958-26541-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: fix build issue
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
X-List-Received-Date: Sat, 04 Feb 2017 23:46:02 -0000

This should fix:
 Making all in ui/gtk
| make[2]: Entering directory '/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/wireshark/1_2.2.4-r0/build/ui/gtk'
| /bin/bash: glib-compile-resources: command not found

Fix which glib-compile-resources is picked up. Ensure we use the native glib-2.0p version and not one from the host.

I could not reproduce this but "which  glib-compile-resources" pointed out the problem.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
index 11c9389..29dfbfe 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "pcre expat glib-2.0"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-- 
2.7.4


