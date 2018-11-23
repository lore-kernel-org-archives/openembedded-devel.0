Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 585046BF36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:43:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so10173807qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 03:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=tRF+wugaqAK+MRnkNV70ycOP7FOSXLApVjYxXILEkTg=;
	b=EIPAizcxS/QGePSxtru0d+xHSiLpasTE62IoVrLwolShCkzQXCoJkd8C8tyFWHXY/R
	bwFVe5y9rtTAcghRfoRj5Dm7yTMRTECbQg9Re8s3t6bNRMrDcpqAZZSV7NH5hMobBsq2
	0aqzdwkYw96WnvIpt6mmLUsHcW4jA/gn791zGIlDCIv036+KemtsdJS96Khi8IptZ8cO
	qMLwbBG7JdstS0J5NqOiAhL/qQKBIH4J2VT8kylU642I5IgYAMYceXgk/sU32qc+XqKx
	WPRhC/43Ik9mb8zEfyHmPzJBOtve4J5ZtsAgZkvIeObyFj6JIdG/fV3ifYhoMYqVJCCV
	hXeQ==
X-Gm-Message-State: AA+aEWbPyhYXG5dR91L0O5zs/+97I1OtTlOueSLDuI6J506RCX1z6FCJ
	r/asImp0LHeL2L149+2WBL2JzC63
X-Google-Smtp-Source: AJdET5e4W3omrZ3KFRDEr9IYcKE8CwiDsFPpbp8Fx21GCcSnf2NCgA9mEoVpStmhbK00HdobAlVyWw==
X-Received: by 2002:ac8:2281:: with SMTP id f1mr13710626qta.197.1542973405941; 
	Fri, 23 Nov 2018 03:43:25 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	f14sm26166426qka.18.2018.11.23.03.43.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 03:43:25 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 23 Nov 2018 09:43:20 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Nov 2018 09:43:19 -0200
Message-Id: <20181123114319.6743-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2] postgresql: Allow successful run of postgresql-setup
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
X-List-Received-Date: Fri, 23 Nov 2018 11:43:25 -0000
Content-Transfer-Encoding: 8bit

The postgresql-setup utility log-in on postgres user to create the
database, however, the shell was set to bash and it wasn't being
installed as runtime dependency.

This rework this expectation to use busybox ash as shell and avoid the
new dependency

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- drop bash use

 .../files/{postgresql-bashprofile => postgresql-profile}  | 0
 meta-oe/recipes-dbs/postgresql/postgresql.inc             | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/files/{postgresql-bashprofile => postgresql-profile} (100%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/postgresql-bashprofile b/meta-oe/recipes-dbs/postgresql/files/postgresql-profile
similarity index 100%
rename from meta-oe/recipes-dbs/postgresql/files/postgresql-bashprofile
rename to meta-oe/recipes-dbs/postgresql/files/postgresql-profile
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 3bf71f02e..dc8522454 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -25,7 +25,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.init \
-    file://postgresql-bashprofile \
+    file://postgresql-profile \
     file://postgresql.pam \
     file://postgresql-setup \
     file://postgresql.service \
@@ -155,7 +155,7 @@ usernum = "28"
 groupnum = "28"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "-M -g postgres -o -r -d ${localstatedir}/lib/${BPN} \
-    -s /bin/bash -c 'PostgreSQL Server' -u ${usernum} postgres"
+    -s /bin/sh -c 'PostgreSQL Server' -u ${usernum} postgres"
 GROUPADD_PARAM_${PN} = "-g ${groupnum} -o -r postgres"
 
 INITSCRIPT_PACKAGES = "${PN}"
@@ -182,7 +182,7 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/${BPN}-setup ${D}${bindir}/${BPN}-setup
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/data
     install -d -m 700 ${D}${localstatedir}/lib/${BPN}/backups
-    install -m 644 ${WORKDIR}/${BPN}-bashprofile ${D}${localstatedir}/lib/${BPN}/.bash_profile
+    install -m 644 ${WORKDIR}/${BPN}-profile ${D}${localstatedir}/lib/${BPN}/.profile
     chown -R postgres:postgres ${D}${localstatedir}/lib/${BPN}
     # multiple server config directory
     install -d -m 700 ${D}${sysconfdir}/default/${BPN}
@@ -222,7 +222,7 @@ RPROVIDES_${PN}-dbg += "libecpg-compat-dbg \
 
 FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
     ${localstatedir}/lib/${BPN}/data ${localstatedir}/lib/${BPN}/backups \
-    ${localstatedir}/lib/${BPN}/.bash_profile ${sysconfdir}/default/${BPN} \
+    ${localstatedir}/lib/${BPN}/.profile ${sysconfdir}/default/${BPN} \
     ${libdir}/${BPN}/dict_snowball.so ${libdir}/${BPN}/plpgsql.so \
     ${libdir}/${BPN}/euc2004_sjis2004.so \
     ${libdir}/${BPN}/libpqwalreceiver.so \
-- 
2.19.1


