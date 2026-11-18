Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10105.1794999728057356838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SYbJoYRc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb606491faso4370665e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999726; x=1795604526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxDal0WYcCzPZtjpm8es+Pm05scYXlF+jmBUvFmFCQo=;
        b=SYbJoYRcqHwMcPsqCKB9lxYpSbbeDDz/Pmmw6EsEAQfWlCAc0vNQ2kGrhYg68RJdg2
         QwBASeqOvYctF5Cya9xTJx3Tqimdqo8rz6+8OUhULjc3EOfJEjMGE4n78wI6ItDxwgNP
         LJZEeQxwW2ijQfGiqaSiTmHz2Git5mt4XQ2qp5BQKNjtIdSrhRxmusKrMVfLm0NKY8qR
         AV2QcWFRLCo2zu0ag9HiWBt8Fu2ZLF4J9JaRBPg0gMSvhiqneaVFQQt2gQPQam2rjw15
         Wy4QEFcCBr57RT1HAv1JDt7I3dTeYpDlEL+6/pYUxy4s7kgw2X8OVziT1eMlxQf0sGQd
         OcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999726; x=1795604526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxDal0WYcCzPZtjpm8es+Pm05scYXlF+jmBUvFmFCQo=;
        b=XEqD7LR3Ic5W6VaKRdCrhQy9iQinrW3c0MJ2wNMkr4IjelF5Wlwfk3MmSx6L0p3vGr
         /qNYgItwjcXyKziJSyfVrenURCegqtxg+3H0U8zLy4sm6oc5S1LM4dkc1HV2y0bBEHKS
         uRI3htLBaRCSfqhXSSXewinIbMN3H98pPmkTc+6JsG+4KHXTo/wII+1xdiaUR8vxAHYA
         yvPqsoHOcU3zUpP4Osmmfrsc5Wr3FgW+58+jVjBQRPRTdfIIECqBs1XvUGhuYrrw0z1I
         ux4aHnfSN90V50+Y+o4bgL80SaWoEGlQkttIzqfipY6+b7N2QYMxMhDNMK6ocyLYmjbX
         6lsw==
X-Gm-Message-State: APuU4Z/SjjA97MtYXjKUt/I1MzB5FYek85Yn3czB0OsG2K+xWe99QOU5
	e4vj5KYZ8Skafbmv9n3bEfvwrAsdXFGtU/SBcp2kP/CzY4o7iiRa2fvYXbXgEzK/
X-Gm-Gg: AYBFou3gGO5UDO9BuR5s+TyjW1tE00rKUJQVtm/YQxe9kx/Ow34GCk5PA9D59VXkNUS
	v25W2ZG2vI1ZbNY1rWqiQ2fkUGjhCnlRjAD/Jlr75J+oeI3Jw7YiGYpsf28vIMvpbrOrsHKnA7c
	z1AE2ndVcCP+a1TVQjpB53/cXCirFNRm8upWWtsHCuNorZrX8Ez3sUNv4s/1amNAd3xjqyrfDJq
	csmlcPvIxuH/LgZt0kc3BDUrcafkq3KUnkQKZrY1whiVR6hpco4LcO1+xmweD9U+048iPYfJ92r
	0gpFBG+enlkZ2/hQEw9C426aXZe2VjNlgAHkNxvRnVp7UF4p5uZjeCFMKRnBahwCMOT6ZcxyJwD
	nsM+Y3/ALJ6QsHpNdGyjdOynJ629gGxmLzeT5JfNwgsWSd237NTSc8jPIls5u4NPCVMKCEXqWPb
	jJYcsvFPSWSgfFJO8z+zDQw2LoEtw+ImfMV9r369402/OCsI5UVSfmVoQUnfZtUFJ8kILVWxGBi
	XyAGqxnpNZjtK6K062V9Igy1KuqDNq+T9YHNSqPWaF+Q8Fzbx4uBVyby0q5iqclvZ4HRKuhSihZ
	yWSTHCsSRkta7jmupG18DCyCPTsuFABt8++7Lf01vg4WtCFokp3i9GMbq6WDtlhz55gowo5DnWw
	=
X-Received: by 2002:a05:600c:4e45:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb7da267bamr37209015e9.22.1794999725927;
        Wed, 18 Nov 2026 03:02:05 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:05 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 6/7] mongodb: Backport fix for SERVER-49099
Date: Wed, 18 Nov 2026 16:01:19 +0500
Message-Id: <20261118110120.3913031-7-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132643
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

The Node and Head swap() friends and the copy-and-swap assignment
operators in Biggie store.h are unused and refer to members that do
not exist. Backport the upstream removal.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
AI-Generated: Uses Claude Code
(cherry picked from commit cc2835067bc19f55632483bba26b67aa6174197d)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 ...ove-the-Node-swap-function-in-Biggie.patch | 58 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
new file mode 100644
index 0000000000..b2d1d92f30
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
@@ -0,0 +1,58 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yuhong Zhang <danielzhangyh@gmail.com>
+Date: Thu, 9 Jul 2020 15:43:33 +0000
+Subject: [PATCH] SERVER-49099 Remove the Node::swap() function in Biggie
+
+The Node and Head swap() friends and the copy-and-swap assignment
+operators built on them are unused and do not compile: Node::swap()
+does not exist and Node has no trieKey, depth, data or children
+members (they are _-prefixed). This went unnoticed because they are
+in a class template that never instantiates them.
+
+Upstream-Status: Backport [https://github.com/mongodb/mongo/commit/77ffbcb4f5673b154fe64872cba9f34ce97bc55d]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/storage/biggie/store.h | 21 ---------------------
+ 1 file changed, 21 deletions(-)
+
+diff --git a/src/mongo/db/storage/biggie/store.h b/src/mongo/db/storage/biggie/store.h
+index a09b5b4..aeaa337 100644
+--- a/src/mongo/db/storage/biggie/store.h
++++ b/src/mongo/db/storage/biggie/store.h
+@@ -809,18 +809,6 @@ private:
+ 
+         virtual ~Node() = default;
+ 
+-        friend void swap(Node& first, Node& second) {
+-            std::swap(first.trieKey, second.trieKey);
+-            std::swap(first.depth, second.depth);
+-            std::swap(first.data, second.data);
+-            std::swap(first.children, second.children);
+-        }
+-
+-        Node& operator=(const Node other) {
+-            swap(*this, other);
+-            return *this;
+-        }
+-
+         bool isLeaf() const {
+             for (auto child : _children) {
+                 if (child != nullptr)
+@@ -855,17 +843,8 @@ private:
+                 _nextVersion->_hasPreviousVersion = false;
+         }
+ 
+-        friend void swap(Head& first, Head& second) {
+-            Node::swap(first, second);
+-        }
+-
+         Head(Head&& other) : Node(std::move(other)) {}
+ 
+-        Head& operator=(const Head other) {
+-            swap(*this, other);
+-            return *this;
+-        }
+-
+         bool hasPreviousVersion() const {
+             return _hasPreviousVersion;
+         }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index c8095b0292..0cd1dd9def 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch \
            file://0003-boost-Fix-build-with-clang-23.patch \
            file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
+           file://0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.34.1

