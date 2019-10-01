Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 795197E28B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:07:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b9so14513115wrs.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qWpqAbpodMeGhvBKClCD3JKj6dfX3ok0Az6YYQwfWd0=;
	b=Gbt93/7VoxA5uIRpGaD9esgkyj3r8P61Wjk6v+Gomowl+dKoGF4cTcJ6hPW5fAty51
	a2MgEbqX4NGsUjPvYFCTcX0M8uxyBXl63c8fBxXV3XUC7VrFRzssR3QS2FOzrYcIZ1LS
	2HXxfVgYhsEPpLA3jVbCSmLknBTO1cacj5JyKchAoQS5tmJkrHB8jThkMOcQlzlebODX
	7PF+4SlxndUsA6H/S72jhXeJkth3TG89lJ2o75+by90BXqEB50s7tWu5TN8YzOSYKPmj
	4l6Emp5yuWoa6EZuP4ANy91AjDc8H87hgjlz1oe/12ZWl7T7+zA91rTpnz4XDH8q2Bjt
	F+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qWpqAbpodMeGhvBKClCD3JKj6dfX3ok0Az6YYQwfWd0=;
	b=byaAigFSqYaKqfhgxJj+usWKdO+UUSkoMhfJAkDfOHK9JlQUJBl4c9t89qaSv9LM63
	JM5lJFPJmoH4wsK4JemH0VBbd+nVU3ue1dqIQcrqcD9xgRePTekZc7E1I00dc5+CAj/5
	fPIrPqxnD2lMwjyKrVQYr7a6f+YgX8Y/qLCsmcEPL7ysIMSHj6e+FqZpYBPEgyh8hx83
	Vr0a9T2FKwL3IIPnT0mhFr06CsSbfkR/t1oJhjKxbPKc8WCY2GmaVSHPK+2CbEhc5x65
	78vMQgyMM+FOeTVRIaKBh7VpLrSwuGBu3rF3IJZwcbjO4BD6xTg1Y3ywRPUGvKjrpvwa
	tKUg==
X-Gm-Message-State: APjAAAUE0WKP5P2drw/sRL2rnXMQLFUgSIGlemLLJWr6JtSX3d0I2RZV
	hA6y1hJD3klFov6bPyvxzVmqn861N9Y=
X-Google-Smtp-Source: APXvYqzBKQUqXccHv3bgxf731aceOpor18xeNmpUJAOQ/VseA18Vhk5IfZ1HRGyxw26T6+Pb3ifFVw==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr15864683wrm.137.1569920878861;
	Tue, 01 Oct 2019 02:07:58 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	a13sm40630940wrf.73.2019.10.01.02.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Oct 2019 02:07:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2019 09:07:55 +0000
Message-Id: <20191001090756.1168-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCHv2 1/2] spice: ignore all warnings not just address-of-packed-member
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
X-List-Received-Date: Tue, 01 Oct 2019 09:07:58 -0000

* with older native gcc on host this will break spice-native with:
  cc1: error: -Werror=address-of-packed-member: no option -Waddress-of-packed-member
  because older gcc doesn't recognize address-of-packed-member warning
  to work around this ignore them all

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 30e939ac07..5e6fbf6bad 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
-CFLAGS_append = " -Wno-error=address-of-packed-member"
+CFLAGS_append = " -Wno-error"
 
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
-- 
2.17.1


