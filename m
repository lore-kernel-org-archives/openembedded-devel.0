Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 38C2E7F4AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 205so4262512pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n1oTuk9+7qhLI2LxPEJZ4J6nrAdoZPXqYU5l1Zn/qaQ=;
	b=sR3n3HHyxntFGA5UdiaPRpglrCIhEetBhYP8BFiRO1lLunCu1paGmwvQPoesneQCHa
	ZQejCZ/V9n2A9eldeGZDRchTjANnIMqWJnlUSBz+IPvHMfvE+mjzbs5GI0wLcCgcorFz
	mOW7YZPkqCnD6z+HQPE/vMgt/iHuPO3NlEa6d/bIB8z+tpuhNeNlu51FQjUpZofa7Cm9
	9DuP80eWOFdmpY8KyDgZln8dTt2BvD2hXAvbAaNIJ/dGWTLM6fm34RO4J1aQe9gZVrAc
	QDeoS1wBZ7QFxyub+JE2yQoNhJQhg8UajRG/aAlNAh79Ly/XHy34OvXvdmO8uLfKS/QC
	0KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n1oTuk9+7qhLI2LxPEJZ4J6nrAdoZPXqYU5l1Zn/qaQ=;
	b=huG+SKZwLNVHx/meOe/U6Azsp7jqIRzRsgR2972BF5GSUFy6zvxpLHOtA8OdXL4Jit
	Apv5LM9cql89KCSFEFj5OP2rfWOOuDEUXbtFZghGCe5LhMvad52MP0IzJYdcj1gVhUUA
	UH9kQHHhqcjBUPLR0jpCKVDg73+RKo/EuXCR0eg+sWWt+b/lccXW4hY4S0QP5UpNdFvg
	EfZIXMiTxqE50fbkgjN0GvpU3aiqC5HBUsSMtl0DwJYAXj/+lPM97jvz+lPWWIX1JiRM
	4v/FnSLEkkeS6x1+6xAGk8Ms3CmtvcaY3/V0kglvQq4ptWsf08AR8BMqAG7N3M20v/08
	3Cxg==
X-Gm-Message-State: APjAAAWksug285+AeAZsqH1JU/rYCYW7uYYi6jom+YlfW5J5CG2RVN6w
	Z4YmS8giFnFM/+DVL0gWh/VprQUl
X-Google-Smtp-Source: APXvYqyktHLygb2JeWXVdVW82kRlhy8CFZ4i6mgz51856MCIsilTzgLGttg/MKoQl0G6rAWedkTh8w==
X-Received: by 2002:a63:de4c:: with SMTP id y12mr18965293pgi.264.1567287114279;
	Sat, 31 Aug 2019 14:31:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:28 -0700
Message-Id: <95d4ffdbe9549e2a551b6dc008bf4dd95bb1552c.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 07/23] satyr: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:54 -0000

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-satyr"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-satyr']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/satyr/satyr_0.27.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.27.bb b/meta-oe/recipes-support/satyr/satyr_0.27.bb
index 10dfc2b..cc07dcb 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.27.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.27.bb
@@ -19,8 +19,8 @@ DEPENDS += " \
     gdb \
 "
 
-PACKAGES += "python3-${PN}"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
+PACKAGES += "python3-${BPN}"
+FILES_python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
 
 PACKAGECONFIG ??= "python3 rpm"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
-- 
2.7.4


