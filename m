Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id D25307FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:25 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id l35so2968644pje.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hXShPf7IFcpUDjK2fjBkxD3Op6cedswLLxUw21QmeXc=;
	b=tVpdC1bb2iw/SFWyOxq3WCJKHdqXZlbN2Zg4M9cIq82UuMuprtWHX30wEL4xWmLO6K
	l6DagFsHY37wiHJQQEaewroxln5vUDwOFMYst8LS1m3DYrE80UX1VSITWFKhtHkpQvuk
	3oiCDZRvfwFahJp0TRQu8OSIqk3Jhp0k7ovGgsSDp6p7FK1evE8qpKp0lEp3Y726CBSa
	qfvmxizRaq8w+p7igsQBzVZefmTYy05yyTAdPpCPyeyJKdQlAtt0Eb2M2eluZucql+pZ
	3ojdf1HZ1RW3kUGfyTUEdoOo6vQvKiE7KUqCymWBS7FqSKtsbfhJeX3tX+vvOWpQaEfo
	AbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hXShPf7IFcpUDjK2fjBkxD3Op6cedswLLxUw21QmeXc=;
	b=ryf/5Wyiw9dkRtWTzg94Dter8AOm+yLXURMOwEjxcRDeX78M8Nj5B+XL9+BJRGeusw
	thjaBxQAddqliLBmg4PP0MlC/X5GYokxwK4ESd1em8eQVrK5ys7j0K3gFsP7uFzUvMaq
	7djaudM6nSzg5hF+7GU9HSz1yj7hnpzSXRaeqPAbGOcTtTH9sywFd6duCp3JRdQrl5QG
	Z4Xa1fsY4hkwaCDHfRzVZ6DtuPo3wmCK4jBID6l+3CFsgOsJ/fALCKDZis5wsVb80DLB
	vx+wUS8RYPTn3h/Y79p5h81MQN8UbIxuW18MMjr0CqIlgC+VLKsVRjFXwEd9kLdNXwoN
	/Qgw==
X-Gm-Message-State: APjAAAUdUUhTfvcc2tamx8cf/0kfrSDy5PjeA6CYwbdGcMowXndLqWEQ
	Xig7XjyNZ/p33mbnfZRPGZMGPdzIojk=
X-Google-Smtp-Source: APXvYqwHeUtsjJw5ko8ppJWf2RSNpGlIvLYjhGhgrwpnRJmSmhQkMoGwj/J530asFRJN+HcVW+q0dg==
X-Received: by 2002:a17:902:a5c2:: with SMTP id
	t2mr9290627plq.86.1579675106475; 
	Tue, 21 Jan 2020 22:38:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:15 -0800
Message-Id: <20200122063823.242098-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 04/12] openlmi: Make it visible when meta-py2 is in layermix
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cb4be4a8a1..baf1fa1d61 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -153,7 +153,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit polkit-group-rule-datetime ", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "polkit-group-rule-network ", "", d)} \
-    ${@bb.utils.contains("BBPATH", "meta-python", "openlmi-tools", "", d)} \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "openlmi-tools", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 513bd11acf..e1f376d0f3 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=75859989545e37968a99b631ef42722e"
 SECTION = "System/Management"
 
-inherit setuptools3
+inherit setuptools
 
 DEPENDS = "python3-native python3-pywbem-native python3-m2crypto python-pywbem"
 
@@ -21,6 +21,6 @@ do_configure_prepend() {
 }
 
 python() {
-    if 'meta-python' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python to be present.')
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
 }
-- 
2.25.0


