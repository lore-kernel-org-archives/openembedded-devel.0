Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9671A788AE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:25:42 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d206so9414782qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zZrKSnZ7CibfPVNrLT/39NLIRhNER1yE3nuQlyXXbtA=;
	b=AXsoApc6tYCSJgjFEl99qmYz4iQnmTIwtJs2F/58i0M53paPeJuBwZJNcZrPyjuuDW
	fCPTRUQOuhp1K5rk2AkRT2l8Ea/GVsQ7wjjtjU2cKUh6sNcwFkRaRQmrzgXSUoE5hp7G
	WDSvl8HvVD/HSffPpCTHji0cY9peyrhdvNe35SfY4soqUgqlbhnTipE+drLGVFMMIJCF
	gP3M4bD7T5X1vynl5O/U3rm5B6KGAKgRC54gHsE4v665PY99Ss8TZnutB4mo2NT4htlC
	BkJicC4ttQG1MQoOqi+QWS9rCcFXuUkV+Nr1lpo+mjLk/KK2XMqLojs6fNQ1Xs9kxvAI
	aVUw==
X-Gm-Message-State: AElRT7Gwb6je20272FRIKquLDRz+gFgy6rT2WiKrNsYX9nSXyrhJMsr1
	ciHjspEWn86W1oXqtLAF20xPW2Hm
X-Google-Smtp-Source: AG47ELsS7DFJmr+60Zyb7TTtIbtMQ915g6f2JCPr7Mh1+PRHKbe3IFxC3+YfksOzPZRisKO5MNr49A==
X-Received: by 10.55.145.4 with SMTP id t4mr8374420qkd.135.1520803543251;
	Sun, 11 Mar 2018 14:25:43 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w56sm4262115qta.65.2018.03.11.14.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:25:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:25:39 -0400
Message-Id: <1520803540-21139-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH 1/2] phpmyadmin: update to version 4.7.9
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
X-List-Received-Date: Sun, 11 Mar 2018 21:25:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../phpmyadmin/{phpmyadmin_4.7.6.bb => phpmyadmin_4.7.9.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.7.6.bb => phpmyadmin_4.7.9.bb} (90%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
similarity index 90%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
index 672db58..27dfe0b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.9.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[md5sum] = "a9aec05d44c68b4ac5e4987118d70cd7"
-SRC_URI[sha256sum] = "5fab6b92336386646bbb189d55817799487b5c27b06cab0cdfdcab3c88f5988f"
+SRC_URI[md5sum] = "0a862e3fa52c8b9078e0441ee82be831"
+SRC_URI[sha256sum] = "f19b503f0afb0dd3389d4bb11dab3f438d36e85eef11a5c400c592fd5f539398"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
2.7.4


