Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5282E65CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 17:03:26 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m22-v6so158564pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=FIXEsemG0WDCzY1Lq0vJm886MeV4BZPPXnkzdJdD2KU=;
	b=rShiy5v6uE3G5Yh0BoOaNbPN9ns4YqVZb3K/Tuki8Br5cpzW/9vbGJg5McpEEwp9T4
	yljdnASgYF4MuqMIJ5KYv6ltHKUA6xB9baTO8uyveOwhGW2bIBOgGeYdmZy8p/wxnrqj
	QMYUj3I166pIxgWP4UQHJaW5TPHeq/cNwNfoaH4twwjPePLX1+yskPIHiC9IsAOLjAwG
	P7UVi94btYUlJ1JnxVuZIoA0Btx3rrpXpGQXRozh633RaTGy4K4DBLBt86JnQdA/U/C8
	xgLgzzXRI4LjL8L467klaY9xI3oRLApaTaQ8ZVwnaUhuNtjOmcMvioA6rhl6in0OfkSF
	fTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FIXEsemG0WDCzY1Lq0vJm886MeV4BZPPXnkzdJdD2KU=;
	b=CAe15CYm/CvGRO+ktgYHDD+7pz00zbrrXr4ZNTaWaKtuilJCZ19IwZSzALioZtoQQ2
	6hxzzQuqVYh15Bb2RF+Ns7mPn2FlYW8uVNiPSNkTmhYulRIc5SMqu3Mo+//2unhgFBOF
	zbXEYu85maJW0xXNcup89rlG/dYnzcjFOeLmWoaWOrm4nJLaMcl+YlMGN4hvPJ9fCySA
	wc0ssaVz+R1veABS8qwc7bKd+C7J5lXRIg7c12JWR2UkgBddx9eNKyuyzxckcznQTff5
	CW/GNCuPwQ697GUvRPiNwz84HRp1q/pbSIHgZiZ9pIjlxKmL+MnnFrM2M0OeHuf6/dIu
	dfPA==
X-Gm-Message-State: AElRT7ECKTP9RBZTGxE9wz2TFq7scNswYVcvQcpIDIvaaHGLmDkeTzWI
	4n2gENGSZHHMrJKp+atJSxs=
X-Google-Smtp-Source: AG47ELvgYSBFRFv4cGPVEnHblo9XlyJPUVzAr15G8KLPlYGYYVoxdwP7D0+Va93mf22rN+ZJfgZUqQ==
X-Received: by 2002:a17:902:51ee:: with SMTP id
	y101-v6mr1157989plh.157.1520960608563; 
	Tue, 13 Mar 2018 10:03:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.rightround.com ([67.208.111.18])
	by smtp.gmail.com with ESMTPSA id
	189sm1384201pfu.129.2018.03.13.10.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Mar 2018 10:03:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:03:27 -0700
Message-Id: <1520960607-22392-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] sysdig: don't build for aarch64
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
X-List-Received-Date: Tue, 13 Mar 2018 17:03:27 -0000

this package depends on luajit which is not supported on aarch64

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 67d06dc..4f58281 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -35,3 +35,7 @@ FILES_${PN} += " \
     ${datadir}/zsh/* \
     ${prefix}/src/*  \
 "
+
+# luajit not supported on Aarch64
+COMPATIBLE_HOST = "^(?!aarch64).*"
+
-- 
2.7.4


