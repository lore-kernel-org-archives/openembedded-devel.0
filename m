Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 78F1E71E53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:26:17 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id z134so127735353lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 04:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WpVHbFuWuwaDNwo8SzAwB+ODQ7MFhIU+DFU9faXYlJ0=;
	b=QxPmiskN9kQ7wfvcx0eQWIUM64S/F5HEQBTG1HwoUuhCs3mNht4nbJSRSoNsumdN24
	AK/ZwEcB79axoiWK9nXuT4+nyE0wcmpaF1KfqQjJHYZ4GZ2L28RNoOyyhTsr6p3bpxns
	USsr8cIUWRYH8E4W11iC+n3SgdeMcUU/D9vOzv7NpiK1YUGTJOx/NrJ4738DG0f3heYx
	ClmjTeuR2V+PLMhDfcxB6cO3b33eLB9SwaHBotVooAnyx8WD2LVQQSgEL6SA8RlV4w9Y
	H9HwvBofIrjlOSLU1z2Q3CSlKvFhpnB4YBTY1ywXAWIryLeDaeXFyGkl0wktAgyydxbn
	Iz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WpVHbFuWuwaDNwo8SzAwB+ODQ7MFhIU+DFU9faXYlJ0=;
	b=lFYCp0Ak9wiB8pbovEkP/93/EczXhHISu3004K09RlMxnH6bRK8bMMmUyCyXYtlrkZ
	HbDWuud4jIGnfjgc9GgEcZhv4+3bVCQNpeqTxALQRcvPgbX674H2FuzXWI64LcQAMyap
	Ql3H6fGr6wM7xcO0riHN+4RqDgxLrdSbfLlDzmgKFC5dQWDHVymC/e/D94ypVaI/LeLG
	kqZDeY7qwqNVjeg1muoowEzspn3oNqIQYVvtpZg+7IXT4GllgM4Wad4ch83EPv9HgPP3
	5U2qpe+Twd0MhRLeNJJYOzrQvkJnLw4y1IozHiZ4goFs/TUX4chlVG2X8Pa0FCLig5i5
	PAwg==
X-Gm-Message-State: AIkVDXIO9cCzzjiF1GwnChZWywoMlYxPOIID5dh/pNcLV/9Mh3UAtSuIXoT+0XtW27udFg==
X-Received: by 10.25.76.196 with SMTP id z187mr12889756lfa.60.1485347177648;
	Wed, 25 Jan 2017 04:26:17 -0800 (PST)
Received: from localhost (h83-209-191-235.cust.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	y10sm8428830lja.22.2017.01.25.04.26.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 04:26:16 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:26:13 +0100
Message-Id: <20170125122613.6776-1-anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-qt5][PATCH] cmake_qt5.bbclass: add qtbase-native to DEPENDS
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
X-List-Received-Date: Wed, 25 Jan 2017 12:26:19 -0000

When building with recipe-specific-sysroot's, qmake can't be found:

| CMake Error at WORKDIR/recipe-sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:32 (message):
|   The imported target Qt5::Core references the file
|
|      WORKDIR/recipe-sysroot-native/usr/bin/qt5/qmake
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      WORKDIR/recipe-sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake
|
|   but not all the files it references.
|
| Call Stack (most recent call first):
|   WORKDIR/recipe-sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfigExtras.cmake:6 (_qt5_Core_check_file_exists)
|   WORKDIR/recipe-sysroot/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:163 (include)
|   WORKDIR/recipe-sysroot/usr/lib/cmake/Qt5/Qt5Config.cmake:31 (find_package)
|   CMakeLists.txt:56 (find_package)
|

This is solved by adding qtbase-native to the exported DEPENDS.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 classes/cmake_qt5.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
index 3180fd6..5d605a6 100644
--- a/classes/cmake_qt5.bbclass
+++ b/classes/cmake_qt5.bbclass
@@ -1,7 +1,7 @@
 inherit cmake
 inherit qmake5_paths
 
-DEPENDS_prepend = "qtbase "
+DEPENDS_prepend = "qtbase qtbase-native "
 
 EXTRA_OECMAKE_prepend = " \
     -DOE_QMAKE_PATH_PREFIX=${OE_QMAKE_PATH_PREFIX} \
-- 
2.11.0


