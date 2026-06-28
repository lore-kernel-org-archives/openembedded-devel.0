Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3F3C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69111.1782634295833320879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HeypW5WW;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4006385eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634295; x=1783239095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOJ3H3HZTp4qP/3plZhTPcPVrs3v6zHoUnVqQekR+V0=;
        b=HeypW5WWQgPzv8CycCpy3U70ZLqKNwQcE0oaoyCp7mZ8GGyCSNRYqVzfU+H+nryIU7
         ZVUjWaGPZvMYZ15Ni5VbUV1DpC6XmbpqI9PshYOwCrpVEfeogS7GX7AQkA67pvX25ZwH
         QfGuvmgfAxLWlu4i4MDBeJGEsgZ0OnQOqeid8k0wya3V7TprJnWxGk8KjIPRcZbI5SVn
         WzkNhZktLfqCSChZaQzBXaHRf8DzAkE5IwhSM9oVAfCi+8LIirfrVyOShoy4cRYdY9af
         sGFnkGt4Z+z44R/qTWPeu3qmKo/SY0L8OKmbQ/IZ4iPRhTwRyP9W/1HLXgm3orpLN13x
         tCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634295; x=1783239095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOJ3H3HZTp4qP/3plZhTPcPVrs3v6zHoUnVqQekR+V0=;
        b=Ho9zgl6gWJBRfQ3tI3gZPGuD9oW6tuPANrEbSQkUpJRMIuX/0eRKsYhXIE92+G7+AB
         JPhq9EQTJjaQBIuhTYz5QOcZYJe7SS+Nhjs7dKBN5xvjoywhKSTj2/5ouc6OEtcuQBQq
         SavFT3UM6aodu6dBKkPaoY9ChEJQI/49sKRHkgxUCWXx49tttPsY2e++/AL+9t830Ooj
         7O2fV/l2boGM/F/h17o3Qc5fb1+Ec1KVd0kZwKTAPuqQvruWa7agYKCi/ofHYDmQHUtD
         ssNpSQ3psua80W33c4dk1QK4xaUgsWKPSDx4xf5Ya8wbvmL9LmGmw2ysWdg24ghJOUsY
         E6ag==
X-Gm-Message-State: AOJu0YzF/R6RQqX+OeacmWig7iCKewPc4gHp5HgTsOyZ/pY/jBAxXbWC
	DOH7cWSMVUez0NPA/eqoXYhULEO5Wm9epvFotRc+7LmWieIJnqbtEk7S3Y0pYmzzVmUAsQ==
X-Gm-Gg: AfdE7cmXyCkRIc7BAUXJ5R6gg0rzOABxSPzvPOdxL1drQVQmw82dAOTYf5lVxlLZssN
	H6VE7gXIAeMjltiKwfNL3Xfa1heMTPXQKEFlO6kK5sU3KhvNO+yrwRBjT51TAdAbBIoh5RO4IqV
	ReY+jrgtY5ft/6u/diNCcI8cbps/IeG5U4CJmDCrEvUODYstvF4te1c6eKArRwv6gN3o02b+75j
	aded6RkeaIuXT+AJgOII1hHIegkBturdlTOfPtk9lV8uhAbqqT6e/q1wISyFYA/7URC38Ymwo9u
	DfOSicY9RF8NclJ4XLtpxKXClOdii1//A9PZ/OCFtf/ZLF1fuHt8le/6FuROAwyjDlSwRwwmCcS
	G3otdJ/ZC44mzWWkOZcJCsj4ZQ8w9ODi94GmcshMAnjF28mgMRHHntdmLybwGANU+nxva9UxP6C
	+oGE9Lcdj3RSRjWcwu23IEOpzHbY5C4RZE+noX52QGN6M4F53Bibh8jpnEsqoLYP8XS00eDBX5+
	ydDk3mP0BkaBEYG+B5aA5vv4/jCzL2uudyMeGi7fpH7Eg63nKLq/G7cQhyLTIKdtBSbYb2Q2rw6
	/iWmm2Am+fH/8nGGoocJw/mIzid2Fg==
X-Received: by 2002:a05:7301:4e8a:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30c84d0cb7amr12287971eec.22.1782634295179;
        Sun, 28 Jun 2026 01:11:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 011/128] libpeas-1: upgrade 1.36.0 -> 1.38.1
Date: Sun, 28 Jun 2026 01:09:22 -0700
Message-ID: <20260628081122.178348-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127821

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpeas/{libpeas-1_1.36.0.bb => libpeas-1_1.38.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libpeas/{libpeas-1_1.36.0.bb => libpeas-1_1.38.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.36.0.bb b/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libpeas/libpeas-1_1.36.0.bb
rename to meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
index c0b785fee7..3a76ed91cb 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.36.0.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas-1_1.38.1.bb
@@ -13,9 +13,9 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 # FIXME: When upgrading to libpeas 2, g-i is no longer needed.
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI = "https://download.gnome.org/sources/libpeas/1.36/libpeas-${PV}.tar.xz;name=archive"
+SRC_URI = "https://download.gnome.org/sources/libpeas/1.38/libpeas-${PV}.tar.xz;name=archive"
 SRC_URI += "file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch"
-SRC_URI[archive.sha256sum] = "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
+SRC_URI[archive.sha256sum] = "e82fd328adcac1aba34b64136bdfcbbacf2b3258a8bc4e5f480a72502a611ae9"
 S = "${UNPACKDIR}/libpeas-${PV}"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"

