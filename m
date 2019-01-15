Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8EB7C085
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 09:40:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z10so1009976pgp.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F3RB33vJbwyDutDQFA2uGx4VCuOjgRwst4sKRhY8OTs=;
	b=p2UA0UyDohzO/LdGkv95ERp7+5i8HyPnFnjd/ly+ANSKYM9AQ+h1JjbxAe3H/y6/So
	oHUQBSSPM+8F1abLOXyxk5I3KDyxTRSVJBkB8gXEIVynQ6+HQsnZ75WT1vr6k3ZGSOZk
	6IvSe62hcFxySxWc/x+gydS26jkM2lIPrgZ3aW6lRz2YFbZ0VM0/oVNduc550t/hi9Hc
	kh6tb40e07ImB4YYnSCCTPFlWd0MPXs+1qFY9WkiSMGMJdZKM/hFobvnBDZsVJnjaMKm
	x/kTcWcRQyLV+5zE0LGIPbOMZzaMLaHBJxKgk6n5ri1DYNvNuwAg0z5zD3gcRYCB2K7V
	wUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F3RB33vJbwyDutDQFA2uGx4VCuOjgRwst4sKRhY8OTs=;
	b=iKtqxMIN48ZuMa00MFOBX/yN9js0l3PdC5fNxUfnQzYx+ezsFWD7z0SgxwkcDFYKDh
	hmzQQg7H/qBDmIB4IbGPlpQ5BfCDHcPjUE6V4IaIVgGW+Z8HU+7COnMNdww/k7DFmGFt
	Grhi1tfXSPFfL21WiSAGmIJ/MFgUsLmEHHfYF+TYH4CndPkJkBwYQstRfQCJK44kC7SF
	zpPNY3C06lXtoRuZ8iCsRCyS5/0tF8s3mNJs/SUXVvLQbR6phB0kLc1wD25Voeo3Xx7h
	cXejdP3K4WJt9uTMP6VRLcpnlFskrJBNLN07pndshW3JAmfBDupQDLsma2+j4wtAraFX
	yKDQ==
X-Gm-Message-State: AJcUukcKfLcWzitPJG9CKfy0OrE97+EOklPgd6qCDblRIRwPAhdr/kQg
	mSscwCfyPaXOxLQctwfrXFhi80DA8gM=
X-Google-Smtp-Source: ALg8bN4tnreMsnP+PTElYEF8pRVL03aLIOcKv2r9OlMHsS+pZwiPCFWwklHYxYzrb5MP1jQ1cl57Ig==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr3061201pfm.71.1547545225868;
	Tue, 15 Jan 2019 01:40:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	b10sm3451262pfj.183.2019.01.15.01.40.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 01:40:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jan 2019 01:40:16 -0800
Message-Id: <20190115094016.33349-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH] mozjs: Avoid use of X11 from host when X11 is disabled
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
X-List-Received-Date: Tue, 15 Jan 2019 09:40:25 -0000
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio@ossystems.com.br>

The mozjs build system makes use of host headers and libraries if not
passed an invalid path for `--x-includes` and `--x-libraries`. This
fixes host contamination while building in a development host.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 0dfe2f848..440a25b74 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -49,7 +49,7 @@ EXTRA_OECONF = " \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},,virtual/libx11"
+PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--x-includes=no --x-libraries=no,virtual/libx11"
 
 EXTRA_OEMAKE_task-compile += "OS_LDFLAGS='-Wl,-latomic ${LDFLAGS}'"
 EXTRA_OEMAKE_task-install += "STATIC_LIBRARY_NAME=js_static"
-- 
2.20.1


