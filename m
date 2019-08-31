Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id C42D47F4B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:51 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 26so4357652pfp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x0Knxa2oueVBb6LZhA4knXT29ONpmmG7Pf/gVFyFY4Y=;
	b=g1INl2GqI7pBDV5aw80AtHCc0rof+x7iykwnZ4koSk84pN8yILZoH4bHQJqtJbqc8l
	6ftsqYoNEU7F2otoVxnU7qs1tCjo1skMJqlm6ELLffdGISecZl64BCAZbieqJmpgcUXA
	caOG7pPEqsnhFBFv+yTW1WU7s6++toqqAmxR3b0mtzOVkVhjg77FduZlPW+XAraX3sdp
	gV+oO4YteT61oBqdnmJVqEc3p/cEdUuREPd/J3bxn7/9WfooMw9GDvUqXCsJMJsSwLGE
	D2piDXE126d1A3fuoEDdmqH1ctmkD8bSOI/sgVt4Zw9WncW3SZ9u4RR+xlCooIJWyf7Y
	J55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x0Knxa2oueVBb6LZhA4knXT29ONpmmG7Pf/gVFyFY4Y=;
	b=p0ZSHVHlB9TJwoTs142oicszMsxpexZgSv3FsWHweswffg6qOjIS6yAD+BPDEV3/F8
	xpVYL0brnNi9ybFyqUlsf+voYQ5eVANc1/Ui+1kW8YW5L6OYjkjSQCF1ZAkUCZ7DrZcU
	9NZF4dOAYphVLviLL/HkDD8TpJZYPhcwwc66zHY+OpzFjxIUlOQ8YVkElCnav6G3dWbH
	QoaisyiuxPyNxx0pbDEqsgWXTVPsu/IxnZvqzVMsZSEotvzvxot4HCoG1rOMUbZcibkk
	Kdc9pMwTgulPLj89SDE5rm8euO0RArfZIcPq4sJN6mb2xuMcICR2HgD4fcUrSxzCzBEz
	ZGew==
X-Gm-Message-State: APjAAAVyQC2bURSIcojCTfaMYA+vWwcPRqCARz+H75nRq8OOJCMpA9yE
	KATrprwsi2UAe2PMGyQem7gQ41TL
X-Google-Smtp-Source: APXvYqwDlRd8GKQm35Byaekq6uxDqUQuF2rshCW+uvfMeI+Zq0tLWLqHa6z/2YVX2/7LFpthx8cV7Q==
X-Received: by 2002:a62:5343:: with SMTP id h64mr11711536pfb.4.1567287112665; 
	Sat, 31 Aug 2019 14:31:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:26 -0700
Message-Id: <86d6c292cd045d1b2103ee0086c5e1da839c8a84.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 05/23] volume-key: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:52 -0000

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-volume-key"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-volume-key']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index 398ca5c..3103748 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -31,8 +31,7 @@ PACKAGECONFIG ??= "python3"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[python3] = "--with-python3,--without-python3,python3,python3"
 
-RDEPENDS_python3-${PN} += "${PN}"
-
-PACKAGES += "python3-${PN}"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python3-${BPN} += "${PN}"
 
+PACKAGES += "python3-${BPN}"
+FILES_python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-- 
2.7.4


