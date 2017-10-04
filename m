Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDA0E77ECB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 18:52:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e69so12968475pfg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Oct 2017 11:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j6V7JRd8Am/aX4iV6UdBwqk6Y0+lar5mH8gC4Sjh+mA=;
	b=iJoxR7yU41XulHz1ZKFCh+DVv2In/plH5zxF2hmT40HHdyfM+RPvzxCmZaKRjW51ef
	oVQiHQjeCfpTreJ9S5iwsq3xVxgssmGu3vdCeYrDaQVygC6DIlFCO5dSl8/CmG1UweN9
	2QF9J4c6cCTNvA5xsOoABgyrPFxaqxQY6R/rRi6lHP/+xPs72aYzISGXEcC+QvFgxmos
	KoPP/BKiuug0ggpmWB6bxYqaorPlpUIPX2qrlg7LLRBb7GyZfTrCjxq02jONx3fshY8T
	ekBNtjXeCZS2em6MSjqrAUu6yc84dJrQvIJsdRQt7LDnq/iF62NAuiBS+P/ptcPaCSmB
	U58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j6V7JRd8Am/aX4iV6UdBwqk6Y0+lar5mH8gC4Sjh+mA=;
	b=VlHeHvsHS+XbMoX3p6cL5ClqrvUM2Umlx6/gqJ5JAjCq17Ono5xvxxw1v02rv0qRcx
	rH0O9QIw/8+5ItKb20R7VBnCKkTwf26boT3X/PMl9GqUg8489iFIv8RNMfXOH+zviyII
	d6/LLLn5JIoo21YjoqPqc0RE++ODrkmccizfHbvs3yGY9fC37oH/JT5oF3CM4IfuGR+V
	ce72xAQB8Vdkxt0kPOSiKCYPLphRp96eokc4iSiZg/YP9acqTY7I6i1ju1kveTFZ57Oz
	HGMfXR3XcZ15fKSX7DBmfvuBm7PGrLJ/02F7EnYKakjnaxQAX89jOc3uMgcUM6J9SZvw
	lRnQ==
X-Gm-Message-State: AHPjjUg1jwSK/LfFhDrhMO/VQ+c5VpyiWBlVWjJczedKMF7HcsFm9i0u
	G51jEbbxL/+5JxPtpeIvtS8xmg==
X-Google-Smtp-Source: AOwi7QBhhIerjUql6NiO14Ari3rbnnRFdyWrh/xvB5pa+orjWgn1PLHuLHQ/Vg02/0STq+lEyy3rfA==
X-Received: by 10.101.81.1 with SMTP id f1mr19748675pgq.204.1507143128644;
	Wed, 04 Oct 2017 11:52:08 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id 5sm7558875pfe.128.2017.10.04.11.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 11:52:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Oct 2017 11:51:58 -0700
Message-Id: <1507143118-9319-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][morty][PATCH] mariadb: Do not use ucontext_* APIs with musl
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
X-List-Received-Date: Wed, 04 Oct 2017 18:52:08 -0000

From: Khem Raj <raj.khem@gmail.com>

musl has ucontext.h header but does not implement the APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b545c0643d2b2a1f1a816e789ff67116c613de5b)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mariadb/0001-disable-ucontext-on-musl.patch    | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 689b8ab..f3eb4c7 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
            file://change-cc-to-cc-version.patch \
+           file://0001-disable-ucontext-on-musl.patch \
           "
 SRC_URI[md5sum] = "fca86f1eaed2163b4bdce4f98f472324"
 SRC_URI[sha256sum] = "e142f9459507b97c5848042863b313ce70750118446bb4e35e5c07fe66007293"
diff --git a/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
new file mode 100644
index 0000000..60e9199
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/0001-disable-ucontext-on-musl.patch
@@ -0,0 +1,28 @@
+From 5bc3e7ef9700d12054e0125a126f1bb093f01ef9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 26 Mar 2017 14:30:33 -0700
+Subject: [PATCH] disable ucontext on musl
+
+musl does not have *contex() APIs even though it has ucontext.h header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/my_context.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/my_context.h b/include/my_context.h
+index dd44103..9b28c17 100644
+--- a/include/my_context.h
++++ b/include/my_context.h
+@@ -31,7 +31,7 @@
+ #define MY_CONTEXT_USE_X86_64_GCC_ASM
+ #elif defined(__GNUC__) && __GNUC__ >= 3 && defined(__i386__)
+ #define MY_CONTEXT_USE_I386_GCC_ASM
+-#elif defined(HAVE_UCONTEXT_H)
++#elif defined(__GLIBC__) && defined(HAVE_UCONTEXT_H)
+ #define MY_CONTEXT_USE_UCONTEXT
+ #else
+ #define MY_CONTEXT_DISABLE
+-- 
+2.12.1
+
-- 
1.9.1


