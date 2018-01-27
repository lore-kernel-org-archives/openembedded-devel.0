Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD65787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:47 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id 36so166880ple.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d6mvI3Qy6FzmborkmbULWdvF+X09dAaYyFyDwwV9kvQ=;
	b=Tko6WlcpdTQGcn6BAdI9zN/rAkHzDWtfVfpQV7vuXW+WLsrHbTdSULagjSK+RGGMxG
	n3SG/o/riOc3ol4YtOf8ZwtvB5xeVmxxiHIF2rT+rmT7wZeI+20t7OsQLjEgFH3Bfp+c
	eNaH+Lnjm3C6y2qROKAMNKsBNIZ8jyvYF8xPsZn8ObMZtdM/3YKccIr1xlq1+zKkS+Zm
	6yhlsUlCoFVhhlYfRqVM3prg8B0HWNw9O4BO8HvHWueQ5vIhx+rX0aeaYPweWqwGn4a/
	bI2WV2dCgiW4Uw7TgIDm9abJbtd9/GrKnUwNmrkcJY+EGbjwbyHhkP12CIEjbmrspvL1
	IXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d6mvI3Qy6FzmborkmbULWdvF+X09dAaYyFyDwwV9kvQ=;
	b=BexPRirZ7iGVhzt/oUAYw9vJMuSrHaHrAA59sfVhk2u86C6JX5tElInJa4GhKO+PqU
	o+mOLQ8LlDOGaq5Pjc5JA6JBxSoq9mrqKVnNADGWer+ECV/EN2AznyNlNINoLSoptl4B
	Af6JvI5tWnJ+UvszaHnzA51Pdvr0O9CmSDFcxaIknaSsdcEVBDC/2qAGfK0C2zMArOLx
	98XOHeaRcBg4tnJ2EAHa81qIAYiAb2Ugc4Vk0IldE6fBerHBRXGlnTCCO+eGqtXbGI7s
	Jk/j1qiEzQyLWILSrlB/BTOBPcAYpXZELuJNNfBS+bwEVVd44Z/lzOpLdGu49khqdHIq
	88UQ==
X-Gm-Message-State: AKwxyteP7tI3DpsWyh1UADfFdxrFejwDtUZifWbYILpOrp8Hl/OPawaO
	W69PuHxacofEuR2HteBAxww=
X-Google-Smtp-Source: AH8x226QIlaCZ8NERqwnUx2iuGEunPaUFP/JkjTIy74CtXmIzvD1qSK8PKD8hzqQHSl8ixjyVqQ0JQ==
X-Received: by 2002:a17:902:40e:: with SMTP id
	14-v6mr15787269ple.64.1517023488762; 
	Fri, 26 Jan 2018 19:24:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:08 -0800
Message-Id: <7ec5de13ed990d4e3cbbd1ee239c82f1dd48bfdd.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 08/36] mariadb: Added missing installation of mysqld_safe_helper to FILES_${PN}-server
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:47 -0000

From: Jonathan Haws <jhaws@sdl.usu.edu>

Per issue MDEV-14044 on https://jira.mariadb.org/browse/MDEV-14044, mysqld_safe_helper
needs to be installed with the server, but was absent from the mariadb.inc file feeding
the recipes. This resulted in a broken mariadb installation. Installing
mysqld_safe_helper alongside mysqld_safe resolves this problem.

Signed-off-by: Jonathan Haws <jhaws@sdl.usu.edu>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 6363c0d0ee412b80877f890544df8343f5556be6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 16dd9f9..263b313 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -258,6 +258,7 @@ FILES_${PN}-server = "\
     ${bindir}/mysqlbinlog \
     ${bindir}/mysqld_multi \
     ${bindir}/mysqld_safe \
+    ${bindir}/mysqld_safe_helper \
     ${bindir}/mysqlhotcopy \
     ${bindir}/mysqltest \
     ${bindir}/ndb_delete_all \
-- 
2.7.4


