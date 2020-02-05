Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DAC4060AF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 16:32:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so3502465wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 08:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dvSEDTB463Czsyq2IiUDuhqWArOZeyRADnLeiE7C2s4=;
	b=dGXaYAYBhC/XeJy6IY6nXNQkmTni94qzFLeG7NQG4TgxFFm7BThoQ4F65Q0384r2y6
	M8o/O+e9Mr0+7RjK0Tu2wOU4SfwRhD3jFO6DGAlqQjWStHkAEOKEHcfOioj2qMH88+7U
	wG/z8pKH4+3r4Qu0TcP5NzYv9Iz5uPIbnFg1r2pHMauUYOOx3s3F3jgGdKnxDS4AgyEr
	7PDFpN7/ZVCoq8pdtrxvh3knFWOCYq45qIYsK6Hi0wtYUNyVfbPgOqIoAlcwQm5A7KGR
	MR5mEzpYKQslq5BuECu1iBLnGYXXqmJQItGNpEEEqnyf8K+0S/o//6Ej6Hk8WLQCX/Y3
	UPZw==
X-Gm-Message-State: APjAAAVau1/KBJ4AfPd/jnO8CsC2LrkikRPnzZEgoKbTt/vrOE61ZzvX
	Fl7tGGdlJSuSp2f0KmH88Xe8RX+N
X-Google-Smtp-Source: APXvYqxgKZXNlGOJ0rgPwIVuDHV8csSyXPsyw1+g9FR/zGLRDq7wmj3cnWjb/TjmhQCfgY4z8e+JcA==
X-Received: by 2002:adf:f692:: with SMTP id v18mr30086796wrp.246.1580920371383;
	Wed, 05 Feb 2020 08:32:51 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s139sm110026wme.35.2020.02.05.08.32.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 08:32:50 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Feb 2020 16:32:48 +0000
Message-Id: <20200205163249.19668-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][master-next][PATCH 1/2] python3-matplotlib: provide a -native variant
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
X-List-Received-Date: Wed, 05 Feb 2020 16:32:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This is useful e.g. for smem-native.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
index 9b86ccc83..824680c24 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812
 
 PYPI_PACKAGE = "matplotlib"
 inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


