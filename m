Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6B97CD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:54:41 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id h28so14669435qkk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 08:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=8aZfADJvUtkeSAK8hDRtJhgT7z9k0gL9B40pv7vsWpM=;
	b=gFNzAJWAW9DgMq6ip2xSw8D9Tm+KhdF8ixCqYHh8xjViZjEaZCnTL23SEl2h8bPwrv
	W1G9igK9sZhBsmzdAqeFUAV6Rp4Uh9z9qGIaiTnOcHBaWKN7rVTdMpgcc+gYvRglSPYi
	R9umi8ANElt5O7PcNYEGR491ntqgLckGcMBST1mOI8N/aZ1e1Tg7SlxNs7XM83vQRf5T
	mITWLUnDbebc+rodujJibQpF2uZoTjrBYLzxv/SmdZBCM1WEoPuLelKXArTk2EP4rS5A
	YT1Fl2mbS4j53MZ75rHtDRyIQ9lbIvMIk+QjiAOeeZSTv46exkq3gYYI8jQf15CScK0S
	pbUA==
X-Gm-Message-State: APjAAAXagVcRD2wsXym3ph+b31Z7fsjd8SNu+O3JxN8PpkDTOvYVu4d2
	QR7bBuP+BSqOEEEdq4/HZGj1Cy04
X-Google-Smtp-Source: APXvYqzuAdLx2hOSk6nYK4n6zQi+nlw3W0jPpBwCcqWYjGmy/N3tnkNpTGzjshC4WjDTyvxqWyhDiA==
X-Received: by 2002:a37:e30a:: with SMTP id y10mr4563741qki.208.1551459281985; 
	Fri, 01 Mar 2019 08:54:41 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	d32sm14147576qtc.88.2019.03.01.08.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 08:54:41 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Mar 2019 13:54:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Mar 2019 13:54:34 -0300
Message-Id: <20190301165435.8367-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Fri, 01 Mar 2019 16:54:41 -0000
Content-Transfer-Encoding: 8bit

The chmod was removing the executing bit from the directory and then
the native version was failing to build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-idna.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 436b58606..519812ddc 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -16,7 +16,3 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-do_install_append() {
-    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
-}
\ No newline at end of file
-- 
2.21.0


