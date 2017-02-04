Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 661D371996
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Feb 2017 02:35:03 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 204so11383160pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 18:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=dNagTfXzX/zu/TFqEQnl5MEXaQ023s9y2+R1ib3sTvE=;
	b=HJREJDuC5GapcUMpjfmh5rfV8HYYXvtSyBw7IBLrVz1Z6cJ6nWLpkW9f55AcOryZxc
	UpzeZ7YmlAPrEzNlLJG2oUm1ePwjUUwTkjH8d2XC1HXM0HDKcdSrfzooXcDVCjJWhhA5
	gG1sn2OxHt5IlGqRWzMCO113w3VpJlzECWOJ/t7YaH5PSgnin8At7+foXnK8G3XMwnuF
	EaP1AgVHj5bg4GF/ebtaD+sHSjhoYqPBk+o9zWmfjINKoK8D3ULq0BPnI+vyF9U4cS89
	1GxsARSp+08lajjDqX+blrJfXl6ozKqk6Wji0Sor+gP0KWNrUgLd1+i/HXnTrwdyiDty
	eQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dNagTfXzX/zu/TFqEQnl5MEXaQ023s9y2+R1ib3sTvE=;
	b=saxZlqL/hljmzSDhLdBWQqlTH5qT0gUHmkdxLAdt4HnBAvnySGi9XLLuU5viTKBtKs
	q45WZus4mDGQ7jl256qC230ZdmXwTkNSQTvd1xmyrLoNRPgyhja5f/XE6HQDUhumr+Yd
	gXsFVEO+/vkK73b2OcqPLgmIMFHby7jGdtwAEZayirdyk4SpnvHuj9/6WVqdfH5ZckjX
	rwyBvSibZDMGPnl9Qfx22mm0SoCDLSzviQ4sWl0bpLkzuCsXAde0QKvvekBTUSmzi0ei
	r8OBYAKxtdg/5yuOBcJkBYY0//yhHoMxeuJgXOhMgR9TEO732Qwd1p+zi9a4QoXdvKVe
	lEsA==
X-Gm-Message-State: AIkVDXJQu4iukbL9GJqPyDnBP47aJ+vCP18h0KB3CfVu4+C+Mh7fYocoSMOXJDtr0yCgfA==
X-Received: by 10.99.51.76 with SMTP id z73mr202890pgz.137.1486175703634;
	Fri, 03 Feb 2017 18:35:03 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:d531:58a3:5f79:edad])
	by smtp.gmail.com with ESMTPSA id
	i21sm70201153pfi.94.2017.02.03.18.35.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 18:35:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 18:35:02 -0800
Message-Id: <1486175702-32039-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] postgresgl: update to 9.4.10 and build fix
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
X-List-Received-Date: Sat, 04 Feb 2017 02:35:03 -0000

9.4.10 contains:
CVE-2016-5423, CVE-2016-5424
see https://www.postgresql.org/docs/current/static/release-9-4-10.html

and build failure:
 checking for tcl.h... no
| configure: error: header file <tcl.h> is required for Tcl

drop hardcoded PR

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc                  | 3 +--
 .../postgresql/{postgresql_9.4.8.bb => postgresql_9.4.10.bb}       | 7 ++-----
 2 files changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.8.bb => postgresql_9.4.10.bb} (55%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index f720cbc..7164bc0 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -20,7 +20,6 @@ DESCRIPTION = "\
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
-INC_PR = "r0"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -40,7 +39,7 @@ export LDFLAGS_SL = "${LDFLAGS}"
 
 inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
 
-CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
+CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
 SYSTEMD_SERVICE_${PN} = "postgresql.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
similarity index 55%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
index 7dba92c..5498350 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
@@ -2,13 +2,10 @@ require postgresql.inc
 
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a9c1120056a102a8c8c4013cd828dce"
 
-PR = "${INC_PR}.0"
-
 SRC_URI += "\
     file://remove.autoconf.version.check.patch \
     file://not-check-libperl.patch \
 "
 
-SRC_URI[md5sum] = "a1a2e8014b2b4c49fc58fe2e2fe83681"
-SRC_URI[sha256sum] = "4a10640e180e0d9adb587bc25a82dcce6bf507b033637e7fb9d4eeffa33a6b4c"
-
+SRC_URI[md5sum] = "1171df0426fe4da5a29f6cdaf2e8b812"
+SRC_URI[sha256sum] = "7061678bed1981c681ce54c76b98b6ec17743f090a9775104a45e7e1a8826ecf"
-- 
2.7.4


