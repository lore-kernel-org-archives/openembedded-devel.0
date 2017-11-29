Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBE871A60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 22:45:27 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u42so6493501qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 14:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I8KU6zAtlTl3sP/Vzu//t1iwUhgMPspw3qhHq/aIgMk=;
	b=OfBkym/Kz7DKY2k5W1yVp/erbh8EIVIUZ6AGog7pi7Jmwy476I+NU/1O1iKS54ta8W
	VcznW9GZrGgsbLSuMMGqDvYDGxQGwgoI1NkQvEQvaJ6MCY1GgobZYDY3nHqk+6rvRumf
	myxJsg+P3cDVJuy0/Kz39FS/Fkr6mxCAVZZpJ8iw1iHqFGki1YMm+02qA46ngGsOzHIB
	T48n99Q4Wymw0v9YrXkCu2QB6IaBxuDiC1rPKBm6xBxRf34FCqkFExZ976mvJlm+JuTw
	WHlNf6PUgjMjrGjZTe3ch4qWjM+WEXo5cd58c56jGP09T4hrYVihfS8IbT9PdqfLYjWz
	cgCg==
X-Gm-Message-State: AKGB3mKTaIFyDmkXGCeZQ5tv6xpDtkYwfEw7GHCzZiFQHgmZp2Ogdall
	5P0OI0Du3vQ8Nd6ew2AF4gy27uvd
X-Google-Smtp-Source: AGs4zMbfauJ5eNqE0uki70EdevoEMRcNA5i6Uf6rptkKBl3D45GFhisgD+blAJKxOri29vMZ8kSaKA==
X-Received: by 10.200.49.173 with SMTP id h42mr736356qte.147.1511995528409;
	Wed, 29 Nov 2017 14:45:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	j129sm1939341qke.11.2017.11.29.14.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 14:45:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 17:45:21 -0500
Message-Id: <1511995521-8415-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cffi: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 22:45:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cffi.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 8dcdb63..78addb6 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -8,7 +8,10 @@ SRC_URI[md5sum] = "a731487324b501c8295221b629d3f5f3"
 SRC_URI[sha256sum] = "ab87dd91c0c4073758d07334c1e5f712ce8fe48f007b86f8238773963ee700a6"
 
 RDEPENDS_${PN}_class-target = " \
+    ${PYTHON_PN}-ctypes \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-subprocess \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


