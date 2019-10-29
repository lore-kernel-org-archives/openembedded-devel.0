Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E08E76BBE6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 16:42:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c22so3150072wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VMkwcC8lJdpCVr5Z3oXnw+86zvE1oJLyEiIrAn6z1QE=;
	b=Wt9vFWCFwALxjwCbnGCNAtLXKF/LorDN+FDM0kJ2d2X042p21KOxN8psfiiodbANw6
	+MwrAUzcOzgq8WhlSKK/q0PoeR8JJDgVXz++U0nrLiT7+Q33GtSiVvT9Rpd/SrUTw/Px
	0oGqVUdUD1HQ7WJuVoAoNUFIJMjIIvXlN6lrs4ceUzkPfSd9jmmUyahm5y7oVrTG1/bB
	qwq0PVJz+rYQZSPT2QEn7gN54+7p+4cOtoPK5F8c0oA7EfD1XAYoWunSSahE+60Ugjar
	XParWZ3JK0ZKRas3tvIlzjzSQWb17lpnopw43/+UlL8e6l0XKxkBNewgl5hbF2rlaLSE
	thbw==
X-Gm-Message-State: APjAAAUHZAm0NraunoVanbH/E31iFJ4f6oPQu5fpR7uyeinRUJQVTYi+
	Cm+O+o4/AIVtS5HlS4iuqAaFC9yD
X-Google-Smtp-Source: APXvYqz8INwBlp9yqSHCaQqCFFCzG+X+FBsxcPgHUW4eIogA+nIeVlsiwxTBKs6P1bceKCgoTuykhQ==
X-Received: by 2002:a1c:411:: with SMTP id 17mr4644590wme.122.1572367345373;
	Tue, 29 Oct 2019 09:42:25 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 65sm27082196wrs.9.2019.10.29.09.42.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 09:42:24 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 16:42:24 +0000
Message-Id: <20191029164224.40188-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: allow use of system c-ares (and make default)
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
X-List-Received-Date: Tue, 29 Oct 2019 16:42:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use system c-ares via PACKAGECONFIG by default. So far,
nodejs had been built using its embedded copy of c-ares,
which we generally try to avoid, for the known reasons
(independent updates, cve & license checks, etc).

Notes:
* otherwise nodejs uses its bundled version of c-ares
* the PACKAGECONFIG variable is 'ares' so as to be in
  line with other uses of this (wget & curl recipes in
  OE core)

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
index 30724d41a..6dacc2824 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.3.bb
@@ -49,9 +49,10 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "zlib icu"
-PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
+PACKAGECONFIG ??= "ares icu zlib"
+PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
+PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
-- 
2.23.0.rc1


