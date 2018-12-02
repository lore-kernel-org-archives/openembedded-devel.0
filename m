Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFF86C5D5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 19:13:56 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z10so4687366pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 11:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QincHImYuIQdn08Y7o+R6Y6R+NXYrlJWUtvm3qDBnFM=;
	b=MtqnLNZp+lz8Ie6oGQktoz1odCj71qM5UDPDvw94Pib09XSTdxPtV3nAXoObq6pZti
	uzvewAYh9mdFEtCX4qicQ03TKt3LeLhOYYiHD7bXT+xfpMkJFENYepxZmdktIIaz3JF9
	uV/n+PZSlBbftt3K9wd+zkNIs7Ki9TjUhK3rT6qZxghU+DGNQWEd6tyUJVANtRIEtd7l
	46uq4T+Bn4j2WVDWBSdBxLOwkdmWJNtw3LzOteBCKhcmf64BuI1kURjtI4jWvSOOJAZD
	kQg0VRFY2BKdb7zVsqtDODc62cFmrE2D9ThHhHtJ6fadnrYR9HV338cfWn5vTL497qpZ
	XFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QincHImYuIQdn08Y7o+R6Y6R+NXYrlJWUtvm3qDBnFM=;
	b=p6UGleol2GN+MmbNDblx+oTW6VfR7cB4AGv+scSnjMoGqs2A2A64cGiOAWPNB0MlAP
	+4VKPfaaZ43PEgg1YKzxtVyksWeoW1U/AAx/aYxx1JO6W6E5B2EogiqeJku/h+44chuP
	ys6rFSzHLQN3F4LbCbAOcp8T7gO0D9MYlbURv3hPRu0rZXkvximWmv0VOikfHnp6gKSJ
	+d1HpehKkAisWrI3kMcxeGt9sJsRIlMpfa8iNO3QjHBrjxzK2wzgiMz+B7pJwjtH6CdJ
	UX8XnPdcJofqwffZuugO6h5pmtsaW3WUM2Kcgd/4iKhns0MvloOK3cbNx0bVyFJTooiG
	Xm4w==
X-Gm-Message-State: AA+aEWYFJnHouGOnFlU/YTuDSKp7h+a0R6+UHrbm4xaJEu1Ein34LYPF
	IDI9oAA4gucuaKaojtTiH+R6We8C7TM=
X-Google-Smtp-Source: AFSGD/XWyqWtK55zhAEoFuRZ6lR7TtaQlL+y5R3++HDtCTTQtSod/Z7ZUn+3d2bGZBfwgn7U2/LgwQ==
X-Received: by 2002:a63:d005:: with SMTP id z5mr11031871pgf.64.1543778036608; 
	Sun, 02 Dec 2018 11:13:56 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	a10sm14367152pfi.138.2018.12.02.11.13.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 11:13:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Dec 2018 11:13:45 -0800
Message-Id: <20181202191346.15104-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181202191346.15104-1-raj.khem@gmail.com>
References: <20181202191346.15104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Niklas Johansson <niklas.johansson@prevas.dk>
Subject: [meta-oe][PATCH 2/3] libzip: add libzip 0.9
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
X-List-Received-Date: Sun, 02 Dec 2018 19:13:56 -0000
Content-Transfer-Encoding: 8bit

From: Niklas Johansson <niklas.johansson@prevas.dk>

libzip is a C library for reading, creating, and modifying zip
archives. Files can be added from data buffers, files, or
compressed data copied directly from other zip archives.
Changes made without closing the archive can be reverted.

Version 0.9 is a little dated and the newest version is 1.5.1.
However, there are some breaking API changes between versions,
so this older version is needed.

Signed-off-by: Niklas Johansson <niklas.johansson@prevas.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libzip/files/LICENSE | 31 +++++++++++++++++++
 meta-oe/recipes-extended/libzip/libzip_0.9.bb | 16 ++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libzip/files/LICENSE
 create mode 100644 meta-oe/recipes-extended/libzip/libzip_0.9.bb

diff --git a/meta-oe/recipes-extended/libzip/files/LICENSE b/meta-oe/recipes-extended/libzip/files/LICENSE
new file mode 100644
index 0000000000..e93454e883
--- /dev/null
+++ b/meta-oe/recipes-extended/libzip/files/LICENSE
@@ -0,0 +1,31 @@
+Copyright (C) 1999-2017 Dieter Baron and Thomas Klausner
+
+The authors can be contacted at <libzip@nih.at>
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+  notice, this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+  notice, this list of conditions and the following disclaimer in
+  the documentation and/or other materials provided with the
+  distribution.
+
+3. The names of the authors may not be used to endorse or promote
+  products derived from this software without specific prior
+  written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS
+OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
+IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
+OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
+IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-oe/recipes-extended/libzip/libzip_0.9.bb b/meta-oe/recipes-extended/libzip/libzip_0.9.bb
new file mode 100644
index 0000000000..d1d7b89bd0
--- /dev/null
+++ b/meta-oe/recipes-extended/libzip/libzip_0.9.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "C library for reading, creating, and modifying zip archives"
+SECTION = "libs"
+HOMEPAGE = "http://www.nih.at/libzip"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file:///LICENSE;md5=01f8b1b8da6403739094396e15b1e722"
+DEPENDS = "zlib"
+PR = "r1"
+
+inherit autotools
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI = "http://www.nih.at/${PN}/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "56b9f11c1eee5eed189a20183d7e06b0"
+SRC_URI[sha256sum] = "23a8c3624122a3777bb4ac3be4a867fd0bed7f3aacb8f1d0b68fc459cfb035fc"
-- 
2.19.2


