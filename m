Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.3290.1608096617922942063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 21:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LvcXpAPE;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id n7so16848957pgg.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 21:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwJqDH+eygTRLGnVYkpZBvfNBnDq1lYaCOkm3f9WvPU=;
        b=LvcXpAPEzQ5sxAvQZdSZ7EPwOpKa6kYOtq+k9EYZf3sytZ4QAgoaaHHOInDVlgpysz
         yOgnXf+U1/eacaB5ZN5to3j8uQb9U5ejz0OILEjMvSqQ5XvRATB34+r9CQvG+kO5b+tU
         2Ps3MBwW3Lz6SI644qkG9SzJ3pwsVhn9ER9N6XktInENUhTmpf1BA7uS+WWUhZ66xV0L
         aHeP2TCS53ZMR9zTC94RsaHP+AVEm/nwzgLfQf1gM/FQ7JAHNrvcTcckDVEPuzTFHgQZ
         MEt2ifYpF9HybOaV3AoK7JlobtctjdRYNjS32R89l6lqHhlQUkpc/OL8hxllVlE/M0IQ
         LlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwJqDH+eygTRLGnVYkpZBvfNBnDq1lYaCOkm3f9WvPU=;
        b=oLX93AgndKBeqFUlv/gzfsPbvIecW+sTU63ajaaPxMFCwg7NF2gfZY/7RbuQFkXd/a
         KnqwBUyKSTwiMYr7Roh2rsGkeveMJqmrOZ0pQETLS1rzfend5/kgdUeopYTVuC5sNVUs
         +Md0vXaTJQgnYP/zrEkePp7DO+nl7XLR49kHwb5rEQK+HDY6zahe0njPFK8u3oGpMWnK
         doX8TMe/caldKZDMWoubLfD9D9Bt9y1GJLFvXM1SzGkuGoLTFs7Gig/P1JZDQMesVPOs
         4rYMibvZYlz7T7pH132CMXnx9cbQ2MP+HXyqpIKbNs6RN1hOFDBpw+vsdJeWc8mbbbpw
         s7Wg==
X-Gm-Message-State: AOAM5313a2yxS9Z5CPoIDtIyZGzgvv7jm4LNyGE+hgcof3/7T+2F56tO
	0anCb6wt/1WMlC26CFP4v8NfOSoYJ/t9YQ==
X-Google-Smtp-Source: ABdhPJzAjKMl0tdHOQSMDHuBtZz3N4tzjcI2tUAKSt7TQKvbPWD/vgGSDbEWeBeH+/yGrGglHwp+vQ==
X-Received: by 2002:aa7:970f:0:b029:19e:758b:dab1 with SMTP id a15-20020aa7970f0000b029019e758bdab1mr30381173pfg.24.1608096617216;
        Tue, 15 Dec 2020 21:30:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id e13sm887230pfj.63.2020.12.15.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 21:30:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Caio Toledo <caioviniciusdetoledo@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] Add recipe for dbus-cxx
Date: Tue, 15 Dec 2020 21:30:12 -0800
Message-Id: <20201216053013.1661310-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216053013.1661310-1-raj.khem@gmail.com>
References: <20201216053013.1661310-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Caio Toledo <caioviniciusdetoledo@gmail.com>

Signed-off-by: Caio Toledo <caioviniciusdetoledo@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/dbus-cxx/dbus-cxx_0.12.bb    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
new file mode 100644
index 0000000000..7a170d66f5
--- /dev/null
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_0.12.bb
@@ -0,0 +1,24 @@
+SUMMARY = "D-Bus wrapper in C++ for dbus"
+HOMEPAGE = "https://dbus-cxx.github.io/"
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
+
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master"
+SRCREV = "ea7f8e361d11dc7d41d9ae2c4128aed2cdadd84e"
+
+DEPENDS = "\
+	dbus \
+	libsigc++-2.0 \
+"
+
+RDEPENDS_${PN} = "\
+	dbus \
+	libsigc++-2.0 \
+"
+
+S = "${WORKDIR}/git/"
+
+inherit pkgconfig cmake
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
-- 
2.29.2

