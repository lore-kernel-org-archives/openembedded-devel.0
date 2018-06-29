Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8133A6006E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:07:38 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 92-v6so9079179qta.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ou7vLgu9dYCtNM9uTCYETkP88mtdsALxEbNUQ+7Mbg0=;
	b=YGdc+vIL+oijlzADOn8JBP4EpJQMEZKY1mWThgcJef40HrHJ2IS1A1l4PzguVLoGyS
	Mx+3t2Rx5ht0Ug6YnX98PIycq3ylpXufeHpYEQ3wvi0CG/R6QwGppKM3G4SQC/RAW5Id
	b9vZ4hznsm6dkNj6OuzkmmlxK4piMxMNPfE3OxsIVJv9BLPWEsmmzCa5If7IUTjZuK77
	CxVPGydFcyhcXypvXfunmFJHINdyKpvfR1ue7G5JrAfw43h7BTPwTyBoq0Mg4a36Dm9S
	Hx7QrD4UHfzst5cElBmy6miigJ3C73yLoo3DC3c5MwMbukkZsX5ZkPMCUGCjwAxxW90O
	cRkg==
X-Gm-Message-State: APt69E1broG5YqI2Oik5uu+DQ6iheOhRqOsLYfVDtgsK42WzHRqTmgMw
	DBNeXWCDC2DDoASejWlF1ZZgxc6N
X-Google-Smtp-Source: AAOMgpdeDFSSHbb9qrGjy9x2Oy1F/fGbl6LcTlmQJ5tlZHz3Nk95CEswsGhxBr9AAkR0dd2uX1o+NA==
X-Received: by 2002:ac8:7158:: with SMTP id
	h24-v6mr7738851qtp.309.1530306459096; 
	Fri, 29 Jun 2018 14:07:39 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	b188-v6sm6630784qkf.71.2018.06.29.14.07.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 14:07:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:07:25 -0400
Message-Id: <1530306445-26528-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyperclip: update to version 1.6.2
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
X-List-Received-Date: Fri, 29 Jun 2018 21:07:38 -0000

License-Update: Update checksum for latest package version file. License terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyperclip.inc            | 6 +++---
 .../python/{python-pyperclip_1.6.0.bb => python-pyperclip_1.6.2.bb} | 0
 .../{python3-pyperclip_1.6.0.bb => python3-pyperclip_1.6.2.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyperclip_1.6.0.bb => python-pyperclip_1.6.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.6.0.bb => python3-pyperclip_1.6.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
index e05de67..205038b 100644
--- a/meta-python/recipes-devtools/python/python-pyperclip.inc
+++ b/meta-python/recipes-devtools/python/python-pyperclip.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ed92115c8f96b19ec34ed09df586e51"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4a3129a2c1b8bdc0e2895a1ec0e2dae2"
 
-SRC_URI[md5sum] = "d2f6a3129cd6f2518b52bb0b8deeeda7"
-SRC_URI[sha256sum] = "ce829433a9af640e08ee89b20f7c62132714bcc5d77df114044d0fccb8c3b3b8"
+SRC_URI[md5sum] = "3680607974f99d6e4411b102358b1884"
+SRC_URI[sha256sum] = "43496f0a1f363a5ecfc4cda5eba6a2a3d5056fe6c7ffb9a99fbb1c5a3c7dea05"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyperclip_1.6.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-pyperclip_1.6.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.6.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.6.2.bb
-- 
2.7.4


