Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5B437704E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:31:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 123so469261wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rxGGV6n/BrU8TjDjXeWSHgKYM1AMoHb/ISUiXIY5C/s=;
	b=o5IIv4P4ClcFY5E1kPVsomdJxknEFaYPhMilF19LHjCNXZuFGhBYmztIBTDmVJwfks
	tA8aThWd/B6sLFen/ukwtK+LDs2r/LHT5m85Ge2uXKjbTv8KUVXI1Au3x4VAl0JwmBXz
	w3V+Q+I8sKu5v27S/ZLEon1t+78Vv3FzPlZ3FuZ3oQ0wMOPOemos3pOOiBYLZfjJAfxZ
	eZyxaqSyU4d3rH9cPzIImDqWjQrrSpc3H0XHmOIhLJYK+HGFhyuaMmVIEZAbSH4lcH6I
	jYkfQugLT0IwaftIcWWcbXFmLAeniJLRElt2VCCA5TMXg0/peTtwd4XPUB96UDUO6XvO
	YZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rxGGV6n/BrU8TjDjXeWSHgKYM1AMoHb/ISUiXIY5C/s=;
	b=WLfxtzQC4+vr5kIzRpDhPvq8cSa2AovvgVa8993YcWeUmSKwvIplOnSjTdE9YVjjEE
	muTpHHndQdGafkGJNHxJZwYwgsG7OqfIf7ckn2AE4Vif+mQPMh9WP8B1bO9Hezj59nSH
	ViTyyBaw5Xbb0gVUI+9PkI/x9YzTl8ySQIsGp79DWeFysVO3byomp9ftZZ1XEvOfDnnx
	PNTO5YqjPrdD6sA/+gcuAoBgAaoxEVfzFM0PLKT5rcUT5lg7wBNdCtDNqtljcGtb45DK
	RmTYNOXR/vOkeGOhhJHl39vO4Xu+X5hcyGk220TxeODjo8MIeVsmxtQtK/sUHQoO/lbu
	5e4Q==
X-Gm-Message-State: AG10YOQpHTDIR3z5rsulNTdbHIIuC2psERIu6SzVajFH5wrdYtkuZXiJ324ro6Z6Kf2iNA==
X-Received: by 10.194.9.42 with SMTP id w10mr5405891wja.159.1453505462324;
	Fri, 22 Jan 2016 15:31:02 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.31.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:31:01 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:20 +0100
Message-Id: <83ebb776e1296320acdf6749ee0aee0318b80127.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 18/21] python(3)-whoosh: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:02 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-whoosh.inc       | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-whoosh.inc
 create mode 100644 meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-whoosh.inc b/meta-python/recipes-devtools/python/python-whoosh.inc
new file mode 100644
index 0000000..84868f9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-whoosh.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Fast, pure-Python full text indexing, search, and spell checking library."
+DESCRIPTION = "\
+Whoosh is a fast, featureful full-text indexing and searching library \
+implemented in pure Python. Programmers can use it to easily add search \
+functionality to their applications and websites. Every part of how \
+Whoosh works can be extended or replaced to meet your needs exactly."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
+
+SRC_URI[md5sum] = "9a0fc2df9335e1d2e81dd84a2c4c416f"
+SRC_URI[sha256sum] = "cdfc0e1c5173207ac7b312afe78d83fb552cfed30427bf7b3dba8b1d26cea8f7"
+
+PYPI_PACKAGE = "Whoosh"
diff --git a/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
new file mode 100644
index 0000000..79d097c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-whoosh_2.7.0.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-whoosh.inc
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
new file mode 100644
index 0000000..91f7018
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-whoosh.inc
-- 
1.9.1


