Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id EF9117BD97
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:28 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e5so1494945plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QOB3YfI0Q8s3aT3FufQrd1gxRITWgz781stltFHz7U4=;
	b=fKDBcjDsKXilgqGMiV8s14N+GxaOxQIUcnYx9ObN57qL5srZ09VI6gl30NxWeL7Urf
	8/501lMrN8DLMJD8zaqDNB8kxrVi1C+3jEOraQb06u0poXkSl0r3UAW5Me/VKb/HHNSd
	ugcuCPK2ih9EA2A/bAUhVXp3GhuxUfBzX37y1twn0FcEqI46QMpYZ5iGWePAF75622L9
	U3TQhhv4DqU7VhLieBQIjPd/jrnE58bNaR11wJN+U8LJMcx5IR0iQ8FHTwjir4qGP6bb
	o0lirSsdFFqhJT2ixO3uq2G+iJVxz0fMU7hmwdYMU5PrYrB6rM5qS8P2GmMPs8I8larf
	yDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QOB3YfI0Q8s3aT3FufQrd1gxRITWgz781stltFHz7U4=;
	b=EoUy9M5eNT6uOmxzWMcJRzADhh6HrVWtbnjLuwkIicxMGSOekzHaE1Cph+fwHNZDOu
	7Sco8N+t1/fpVQJURjz1bR6lsutEN6Gu36Qe+wabXHtMUj0hLNR+1NQOVD96LWEcl2PT
	yBpH7+KF2FK+kQdbF2j6XwC8i4sOP8SiWoqcu2kXBBV2gdSpEQmj6F2bxMQGIYPvO/qp
	Zaeo1pkMZbzE4uH4qVksgA6qpBO3wT2ZkwY+A5yaNxcMcrzOCAWqfXibzwFK4R75Vgqr
	TAFGmnnnxrs+bUL4aeRvFzi4iPWeGXDbdoOpPuUIebXmFwGjoijsditMaOI+BYCcI69+
	yncg==
X-Gm-Message-State: AHQUAua29vzKqFxnuBXZbQNLphs2URtvGBoyFY8TrGAZQ1dmYZNl8Rx8
	P6zrp3PVwb0Ae3n7xL1dozKsdkFv
X-Google-Smtp-Source: AHgI3IbJv2y73EM8+3toQ6xF8287UkmXLlpIcCd8euRr/JJu8vdrNF67Cnb5nnyNcUNGu/GWUoOhvQ==
X-Received: by 2002:a17:902:bcc2:: with SMTP id
	o2mr1517261pls.69.1550079089545; 
	Wed, 13 Feb 2019 09:31:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:17 -0800
Message-Id: <20190213173118.44597-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213173118.44597-1-raj.khem@gmail.com>
References: <20190213173118.44597-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/6] cli11: Add knob to Enable/Disable clang-tidy explicity
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:29 -0000
Content-Transfer-Encoding: 8bit

When building with clang otherwise this gets enabled and we have
problems with headers especially due to OEs multilibbing effort on arm
where headers like bits/wordsize.h are hijacked and some wrappers are
translanted, these transplants have additional requirements/constraints
e.g. compiler internal arch defines e.g. __arm__ etc. which may not be
passed by tools like clang-tidy which are arch independent.

Ideally we should not require to disable clang-tidy here but we make a
compromise, since OEs headers are the way as explained above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11_1.6.2.bb  |  5 +++-
 .../files/0001-Add-CLANG_TIDY-check.patch     | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch

diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
index 6899b1264b..e62c1d3d13 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
@@ -6,11 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
 SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
+            file://0001-Add-CLANG_TIDY-check.patch \
+           "
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 inherit ptest
 
+EXTRA_OECMAKE += "-DCLANG_TIDY=OFF"
 DEPENDS += "boost"
diff --git a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
new file mode 100644
index 0000000000..bef3548a29
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
@@ -0,0 +1,27 @@
+From ef6310bc726a53ff6b45071633fa7b37224cae96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Feb 2019 13:22:21 -0800
+Subject: [PATCH] Add CLANG_TIDY check
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 79404b8..f68217d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,7 +39,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
+         add_definitions(-Wall -Wextra -pedantic)
+     endif()
+ 
+-    if(CMAKE_VERSION VERSION_GREATER 3.6)
++    if(CMAKE_VERSION VERSION_GREATER 3.6 AND CLANG_TIDY)
+         # Add clang-tidy if available
+         option(CLANG_TIDY_FIX "Perform fixes for Clang-Tidy" OFF)
+         find_program(
+-- 
+2.20.1
+
-- 
2.20.1


