Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id E3E11776A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 09:23:46 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id k202so69550537lfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 01:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZriMCpWikkfdUy0Ty/nmhvpAKfiDWE2apL27CdVNvZk=;
	b=lYdGtVPMePxXlhxpaNO5febRWPwQXe2WeSsKKk8uDA/2lN9rIimA8Yf45FSCYgj1uN
	iicU1YSUOnIw1xqi8/hpzBSX7Bpuwhaa3d/FwP/yG865YK1vSskJEQxjtHtbz99WvTqH
	8dlX01sxjFhkRbzqZoMfbrDtUJQw8jIQylZNfTlrMqUDj1KuZw/T0yg9F3Tod0XTcEnX
	DKnOo3ZsdTTd82qBdskDV2AG0pyeu34kqg8bib/RyVo1TX1PFg1x1EZFAUVZLOSj/y5k
	3fyVLL0G4FY0YqChkh8b9LQTfe4BinHMFD3sgjJxPWcRAGLcJirX3VPQTFaxJchpoZne
	h1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZriMCpWikkfdUy0Ty/nmhvpAKfiDWE2apL27CdVNvZk=;
	b=ODucTElqkEXh7UupwPfLMfyo5qevV3LLTeiYa5elcjMN6tFYtKIhiUcQA97yjH8TVA
	YbLLgN4GXn7KQP6tWSj8V3gjGD3QhBc8HRMvBigrFXXxjaR6zmHEcXpGWETh/gJPCMBk
	1PXazzFa9SJU3Q5f9XKEJ40Z82sXxSu+gTMkUMvYgPlYWydfIY2Ew26QMtsWg46IvUV7
	aoLI7JBYoBRByhy+u7FXpX1kMYJVbXJUA/eHdnVY60el8smV6Wm/meX0CQEd0XVhlAXE
	uWk+HmAMQXj1BWBoofInVV/6at984oFdXtXSA3I/OXSnrlQXGdpbuIp19m1iiJucGS2g
	TUSw==
X-Gm-Message-State: AMke39n8EBQZsB4nQah1mOWgXXj0ZMDX0k+f+VGZPtXaCQe5MEo3IQ1JiEiUzAtNZOGsiAJn
X-Received: by 10.25.25.14 with SMTP id 14mr4541391lfz.153.1488792227560;
	Mon, 06 Mar 2017 01:23:47 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	a11sm4071504lfh.37.2017.03.06.01.23.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 01:23:47 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:23:45 +0100
Message-Id: <1488792225-28104-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.5
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
X-List-Received-Date: Mon, 06 Mar 2017 09:23:47 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.4.bb => wireshark_2.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
index 29dfbfe..03ae3b9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "6d0878ba931ea379f6e675d4cba6536b"
-SRC_URI[sha256sum] = "42a7fb35eed5a32478153e24601a284bb50148b7ba919c3e8452652f4c2a3911"
+SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
+SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


